const std = @import("std");
const stb = @import("stb_image");
const ImGuiImplementation = @import("imguiImplementation.zig");
const TimeManager = @import("timeManager.zig");

const zt = @import("../zt.zig");
const gl = @import("gl");
const glfw = @import("glfw");
const ig = @import("imgui");

const input_init_fn = @import("input.zig").init_input;
const input_update_fn = @import("input.zig").process_update;

var initialized: bool = false;

/// Default GLFW error handling callback
fn errorCallback(error_code: c_int, description: [*c]const u8) callconv(.C) void {
    std.log.err("glfw: {}: {s}\n", .{ error_code, description });
}

pub const InputEvent = union(enum) {
    keyboard: struct {
        key: c_int,
        scan: c_int,
        action: c_int,
        mods: c_int,
    },
    mouseWheel: struct {
        x: f64,
        y: f64,
    },
    mouseButton: struct {
        key: c_int,
        action: c_int,
        mods: c_int,
    },
    mousePosition: struct {
        x: f64,
        y: f64,
    },
    character: struct {
        value: c_uint,
    },
};
pub const Settings = struct {
    energySaving: bool = true,
    imguiActive: bool = true,
    /// Do not edit, this simply tells you whether or not the vsync is on. To modify this state
    /// use `context.setVsync(true)`
    vsync: bool = true,
};
pub const Context = struct {
    _updateSeconds: f32 = -1.0,
    allocator: std.mem.Allocator = undefined,
    settings: Settings = .{},
    window: ?*glfw.GLFWwindow = undefined,
    input: std.ArrayList(InputEvent) = undefined,
    time: TimeManager = undefined,
    open: bool = false,

    pub fn deinit(self: *Context) void {
        self.input.deinit();
        ImGuiImplementation.Shutdown();
        glfw.glfwTerminate();
        self.allocator.destroy(self);
    }

    /// Ticks forward timer, clears OpenGL, enqueues events, and dictates to imgui
    /// that we are starting a new frame.
    pub fn beginFrame(self: *Context) void {
        self.open = glfw.glfwWindowShouldClose(self.window) != glfw.GLFW_TRUE;
        self.time.tick();

        glfw.glfwPollEvents();
        input_update_fn(self);

        gl.glClear(gl.GL_COLOR_BUFFER_BIT);
        ig.igNewFrame();
    }
    /// Draws all the imgui commands, and flips the buffer to display the drawn image
    pub fn endFrame(self: *Context) void {
        const io = ig.igGetIO();
        // Render
        if (self.settings.imguiActive) {
            ig.igRender();
            const dd = ig.igGetDrawData();
            ImGuiImplementation.RenderDrawData(dd);
        } else {
            ig.igEndFrame();
        }

        self.input.items.len = 0;

        glfw.glfwSwapBuffers(self.window);
        io.DeltaTime = self.time.dt;
        if (self.settings.energySaving) {
            if (self._updateSeconds > 0.0) {
                self._updateSeconds -= self.time.dt;
            } else {
                glfw.glfwWaitEvents();
            }
        }
    }
    /// Changes the context window's position. In some operating systems I believe this is
    /// a no-op
    pub fn setWindowPosition(self: *Context, x: c_int, y: c_int) void {
        glfw.glfwSetWindowPos(self.window, x, y);
    }
    /// Changes the context window's size
    pub fn setWindowSize(self: *Context, width: c_int, height: c_int) void {
        glfw.glfwSetWindowSize(self.window, width, height);
    }
    /// Changes the context window's title(the text on the window's title bar, typically)
    pub fn setWindowTitle(self: *Context, string: [*:0]const u8) void {
        glfw.glfwSetWindowTitle(self.window, string);
    }
    /// If true, buffer swaps will happen each possible frame in line with your monitor hz,
    /// but if false, will buffer swap as fast as it can.
    pub fn setVsync(self: *Context, on: bool) void {
        if (on) {
            glfw.glfwSwapInterval(1);
        } else {
            glfw.glfwSwapInterval(0);
        }
        self.settings.vsync = on;
    }
    /// Give a path to a .png for the window icon. Note this does not affect the
    /// binary icon, and you would rather want to use post builds specific to
    /// each platform.
    pub fn setWindowIcon(self: *Context, path: []const u8) void {
        stb.stbi_set_flip_vertically_on_load(0);
        var image = glfw.GLFWimage{ .width = 0, .height = 0, .pixels = null };
        image.pixels = stb.stbi_load(path.ptr, &image.width, &image.height, 0, 4);
        if (image.width > 0 and image.height > 0) {
            glfw.glfwSetWindowIcon(self.window, 1, &image);
            stb.stbi_image_free(image.pixels);
        } else {
            std.debug.print("Failed to load icon {s}", .{path});
        }
    }
    /// Tells ZT to close the window
    pub fn close(self: *Context) void {
        self.window.?.setShouldClose(true);
        self.open = false;
    }
    /// If you have an animation that needs to play you can queue an amount of seconds that will ignore energy saving mode
    pub fn setAnimationFrames(self: *Context, seconds: f32) void {
        self._updateSeconds = seconds;
    }
    /// If you are using multithreading or anything that will require the UI to update from outside, this can force a redraw,
    /// only if you are using energy saving mode
    pub fn forceUpdate(self: *Context) void {
        _ = self;
        glfw.glfwPostEmptyEvent();
    }
    pub fn addFont(self: *Context, path: []const u8, pxSize: f32) *ig.ImFont {
        const io = ig.igGetIO();

        const cfg = ig.ImFontConfig_ImFontConfig();
        cfg.*.SizePixels = pxSize;
        cfg.*.OversampleH = 3;
        cfg.*.OversampleV = 3;
        const newFont: *ig.ImFont = ig.ImFontAtlas_AddFontFromFileTTF(io.Fonts, path.ptr, pxSize, cfg, ig.ImFontAtlas_GetGlyphRangesDefault(io.Fonts));
        self.rebuildFont();
        return newFont;
    }
    /// This will destroy and rebuild the font texture used for imgui.
    /// This is also called for you when you add and remove fonts
    pub fn rebuildFont(self: *Context) void {
        _ = self;
        const io = ig.igGetIO();
        // Delete the old texture
        const texId = @as(c_uint, @intCast(@intFromPtr(io.Fonts.*.TexID)));
        gl.glDeleteTextures(1, &texId);

        // Generate new texture
        var newTexId: c_uint = 0;
        var pixels: [*c]u8 = undefined;
        var fontTexWidth: i32 = undefined;
        var fontTexHeight: i32 = undefined;
        ig.ImFontAtlas_GetTexDataAsRGBA32(io.Fonts, &pixels, &fontTexWidth, &fontTexHeight, null);

        // Upload texture to graphics system
        gl.glGenTextures(1, &newTexId);
        gl.glBindTexture(gl.GL_TEXTURE_2D, newTexId);
        gl.glTexParameteri(gl.GL_TEXTURE_2D, gl.GL_TEXTURE_MIN_FILTER, gl.GL_LINEAR);
        gl.glTexParameteri(gl.GL_TEXTURE_2D, gl.GL_TEXTURE_MAG_FILTER, gl.GL_LINEAR);
        if (@hasDecl(gl, "GL_UNPACK_ROW_LENGTH"))
            gl.glPixelStorei(gl.GL_UNPACK_ROW_LENGTH, 0);
        gl.glTexImage2D(gl.GL_TEXTURE_2D, 0, gl.GL_RGBA, fontTexWidth, fontTexHeight, 0, gl.GL_RGBA, gl.GL_UNSIGNED_BYTE, pixels);
        // Store our identifier
        io.Fonts.*.TexID = @as(*anyopaque, @ptrFromInt(newTexId));
        ImGuiImplementation.g_FontTexture = newTexId;
    }
};

/// If you need glfw to init before starting, use this to init glfw and
/// other libraries without actually spinning up the context
pub fn preInit() !void {
    if (!initialized) {
        _ = glfw.glfwSetErrorCallback(errorCallback);

        if (glfw.glfwInit() == glfw.GLFW_FALSE) {
            std.log.err("failed to initialize GLFW", .{});
            std.process.exit(1);
        }
        glfw.glfwWindowHint(glfw.GLFW_CONTEXT_VERSION_MAJOR, 3);
        glfw.glfwWindowHint(glfw.GLFW_CONTEXT_VERSION_MINOR, 3);
        glfw.glfwWindowHint(glfw.GLFW_OPENGL_PROFILE, glfw.GLFW_OPENGL_CORE_PROFILE);
        input_init_fn();
        initialized = true;
    }
}

/// Starts the entire application! Returns errors if anything along the pipeline fails.
pub fn begin(applicationAllocator: std.mem.Allocator) !*Context {
    var self: *Context = try applicationAllocator.create(Context);
    self.* = .{};
    self.allocator = applicationAllocator;
    self.input = std.ArrayList(InputEvent).init(applicationAllocator);
    try preInit();
    self.window = glfw.glfwCreateWindow(800, 600, "Hello ZT!", null, null);

    self.open = true;
    glfw.glfwMakeContextCurrent(self.window);

    if (gl.gladLoadGL() < 0) {
        return error.GladLoadError;
    }

    ImGuiImplementation.init("#version 330");

    glfw.glfwSetWindowUserPointer(self.window, self);
    _ = glfw.glfwSetFramebufferSizeCallback(self.window, windowSizeChanged);
    _ = glfw.glfwSetKeyCallback(self.window, inputCallback);
    _ = glfw.glfwSetCharCallback(self.window, charCallback);
    _ = glfw.glfwSetMouseButtonCallback(self.window, mousebuttonCallback);
    _ = glfw.glfwSetCursorPosCallback(self.window, cursorCallback);
    _ = glfw.glfwSetScrollCallback(self.window, mouseWheelCallback);
    _ = glfw.glfwSetWindowMaximizeCallback(self.window, windowMaximizeChanged);

    gl.glClearColor(0.1, 0.1, 0.12, 1.0);

    var x_size: c_int = 0;
    var y_size: c_int = 0;
    glfw.glfwGetWindowSize(self.window, &x_size, &y_size);
    gl.glViewport(0, 0, x_size, y_size);
    const io = ig.igGetIO();
    io.ConfigFlags |= ig.ImGuiConfigFlags_DockingEnable;
    io.DisplaySize = .{ .x = @as(f32, @floatFromInt(x_size)), .y = @as(f32, @floatFromInt(y_size)) };
    self.time = TimeManager.init();
    if (self.settings.vsync) {
        glfw.glfwSwapInterval(1);
    }
    return self;
}

// Callbacks
fn windowSizeChanged(win: ?*glfw.GLFWwindow, newWidth: c_int, newHeight: c_int) callconv(.C) void {
    _ = win;
    gl.glViewport(0, 0, newWidth, newHeight);
    const io = ig.igGetIO();
    io.DisplaySize = .{ .x = @as(f32, @floatFromInt(newWidth)), .y = @as(f32, @floatFromInt(newHeight)) };
}
fn windowMaximizeChanged(win: ?*glfw.GLFWwindow, maximized: c_int) callconv(.C) void {
    _ = maximized;
    var width: c_int = 0;
    var height: c_int = 0;
    glfw.glfwGetWindowSize(win, &width, &height);
    gl.glViewport(0, 0, width, height);

    const io = ig.igGetIO();
    io.DisplaySize = .{ .x = @as(f32, @floatFromInt(width)), .y = @as(f32, @floatFromInt(height)) };
}
fn ensureMods(window: ?*glfw.GLFWwindow) void {
    const io = ig.igGetIO();
    ig.ImGuiIO_AddKeyEvent(io, ig.ImGuiMod_Shift, glfw.glfwGetKey(window, glfw.GLFW_KEY_LEFT_SHIFT) == glfw.GLFW_PRESS or glfw.glfwGetKey(window, glfw.GLFW_KEY_RIGHT_SHIFT) == glfw.GLFW_PRESS);
    ig.ImGuiIO_AddKeyEvent(io, ig.ImGuiMod_Ctrl, glfw.glfwGetKey(window, glfw.GLFW_KEY_LEFT_CONTROL) == glfw.GLFW_PRESS or glfw.glfwGetKey(window, glfw.GLFW_KEY_RIGHT_CONTROL) == glfw.GLFW_PRESS);
    ig.ImGuiIO_AddKeyEvent(io, ig.ImGuiMod_Alt, glfw.glfwGetKey(window, glfw.GLFW_KEY_LEFT_ALT) == glfw.GLFW_PRESS or glfw.glfwGetKey(window, glfw.GLFW_KEY_RIGHT_ALT) == glfw.GLFW_PRESS);
}
fn inputCallback(win: ?*glfw.GLFWwindow, key: c_int, scan: c_int, action: c_int, mods: c_int) callconv(.C) void {
    const context: *Context = @ptrCast(@alignCast(glfw.glfwGetWindowUserPointer(win).?));
    const io = ig.igGetIO();
    var pressed = false;
    if (action == glfw.GLFW_PRESS or action == glfw.GLFW_REPEAT) {
        pressed = true;
    }

    ensureMods(context.window);
    ig.ImGuiIO_AddKeyEvent(io, ImGuiImplementation.toImguiKey(key), pressed);
    context.input.append(.{
        .keyboard = .{
            .key = key,
            .scan = scan,
            .action = action,
            .mods = mods,
        },
    }) catch unreachable;
}
fn mouseWheelCallback(win: ?*glfw.GLFWwindow, x: f64, y: f64) callconv(.C) void {
    const context: *Context = @ptrCast(@alignCast(glfw.glfwGetWindowUserPointer(win).?));
    const io = ig.igGetIO();
    ig.ImGuiIO_AddMouseWheelEvent(io, @floatCast(x), @floatCast(y));
    context.input.append(.{
        .mouseWheel = .{
            .x = x,
            .y = y,
        },
    }) catch unreachable;
}
fn mousebuttonCallback(win: ?*glfw.GLFWwindow, key: c_int, action: c_int, mods: c_int) callconv(.C) void {
    const context: *Context = @ptrCast(@alignCast(glfw.glfwGetWindowUserPointer(win).?));
    const io = ig.igGetIO();
    var pressed = false;
    if (action == glfw.GLFW_PRESS or action == glfw.GLFW_REPEAT) {
        pressed = true;
    }
    if (key >= 0 and key < ig.ImGuiMouseButton_COUNT) {
        ig.ImGuiIO_AddMouseButtonEvent(io, key, pressed);
        context.input.append(.{
            .mouseButton = .{
                .key = key,
                .action = action,
                .mods = mods,
            },
        }) catch unreachable;
    }
}
fn cursorCallback(win: ?*glfw.GLFWwindow, x: f64, y: f64) callconv(.C) void {
    const context: *Context = @ptrCast(@alignCast(glfw.glfwGetWindowUserPointer(win).?));
    const io = ig.igGetIO();
    ig.ImGuiIO_AddMousePosEvent(io, @floatCast(x), @floatCast(y));
    context.input.append(.{
        .mousePosition = .{
            .x = x,
            .y = y,
        },
    }) catch unreachable;
}
fn charCallback(win: ?*glfw.GLFWwindow, char: c_uint) callconv(.C) void {
    const context: *Context = @ptrCast(@alignCast(glfw.glfwGetWindowUserPointer(win).?));
    const io = ig.igGetIO();
    ig.ImGuiIO_AddInputCharacter(io, char);
    context.input.append(.{
        .character = .{
            .value = char,
        },
    }) catch unreachable;
}
