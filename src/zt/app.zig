const std = @import("std");
const stb = @import("stb_image");
const ImGuiImplementation = @import("imguiImplementation.zig");
const TimeManager = @import("timeManager.zig");

const zt = @import("../zt.zig");
const gl = @import("gl");
usingnamespace @import("glfw");
usingnamespace @import("gl");
usingnamespace @import("imgui");

// fn inputCallback(win: ?*GLFWwindow, key: c_int, scan: c_int, action: c_int, mods: c_int) callconv(.C) void {
// fn mouseWheelCallback(win: ?*GLFWwindow, x: f64, y: f64) callconv(.C) void {
// fn mousebuttonCallback(win: ?*GLFWwindow, key: c_int, action: c_int, mods: c_int) callconv(.C) void {
// fn cursorCallback(win: ?*GLFWwindow, x: f64, y: f64) callconv(.C) void {
// fn charCallback(win: ?*GLFWwindow, char: c_uint) callconv(.C) void {

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

const Self = @This();

window: *GLFWwindow = undefined,
width: f32 = 0,
height: f32 = 0,
timer: TimeManager = undefined,
updateSeconds: f32 = 0,
imguiVisible: bool = true,
/// If enabled, the application will not update if it is not receiving
/// events from GLFW. Recommended for applications.
energySaving: bool = true,
config: Config = undefined,
inputQueue: std.ArrayList(InputEvent) = undefined,

pub const Config = struct {
    icon: ?[]const u8 = null,
    title: []const u8 = "ZT Application",
    init: ?fn (*Self) void = null,
    update: ?fn (*Self) void = null,
    deinit: ?fn (*Self) void = null,
    windowSizeChanged: ?fn (*Self) void = null,
    /// The initial size of the window.
    size: [2]c_int = .{ 1280, 720 },
};

/// If you have an animation that needs to play you can queue an amount of seconds that will ignore energy saving.
pub fn queueAnimationFrames(self: *Self, seconds: f32) void {
    self.updateSeconds = seconds;
}
/// If you are using multithreading or anything that will force an update, this can force a redraw.
pub fn forceUpdate(self: *Self) void {
    _ = self;
    glfwPostEmptyEvent();
}

/// Adds in an imgui font via a file path. The font atlas is rebuilt automatically and youre free to use the 
/// ImFont immediately.
pub fn addImguiFont(self: *Self, fontPath: []const u8, size: f32, config: [*c]const ImFontConfig) *ImFont {
    var io = igGetIO();
    var newFont: *ImFont = ImFontAtlas_AddFontFromFileTTF(io.*.Fonts, fontPath.ptr, size, config, ImFontAtlas_GetGlyphRangesDefault(io.*.Fonts));
    self.rebuildImguiFont();
    return newFont;
}
/// This function is called for you when you add an imgui font, but if you manage the font atlas yourself, this
/// will automatically delete and rebuild the font atlas for imgui.
pub fn rebuildImguiFont(self: *Self) void {
    _ = self;
    var io = igGetIO();
    // Delete the old texture
    var texId = @intCast(c_uint, @ptrToInt(io.*.Fonts.*.TexID));
    glDeleteTextures(1, &texId);

    // Generate new texture
    var newTexId: c_uint = 0;
    var pixels: [*c]u8 = undefined;
    var fontTexWidth: i32 = undefined;
    var fontTexHeight: i32 = undefined;
    ImFontAtlas_GetTexDataAsRGBA32(io.*.Fonts, &pixels, &fontTexWidth, &fontTexHeight, null);

    // Upload texture to graphics system
    glGenTextures(1, &newTexId);
    glBindTexture(GL_TEXTURE_2D, newTexId);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    if (@hasDecl(gl, "GL_UNPACK_ROW_LENGTH"))
        glPixelStorei(GL_UNPACK_ROW_LENGTH, 0);
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, fontTexWidth, fontTexHeight, 0, GL_RGBA, GL_UNSIGNED_BYTE, pixels);

    // Store our identifier
    io.*.Fonts.*.TexID = @intToPtr(*c_void, newTexId);
}

/// Takes a relative path from the executable's cwd, and returns an absolute path to the resource. Great for making
/// sure your application gets the right resources no matter where its launched from.
pub inline fn path(subpath: []const u8) []const u8 {
    return pathEx(zt.Allocators.ring(), subpath);
}
pub fn pathEx(allocator: *std.mem.Allocator, subpath: []const u8) []const u8 {
    var executablePath = zt.known_folders.getPath(allocator, .executable_dir) catch unreachable;
    return std.fs.path.joinZ(allocator, &[_][]const u8{ executablePath.?, subpath }) catch unreachable;
}

/// Takes in an application config and begins the main loop. This will block until the application closes, so make
/// sure you're using the config's parameters to set an update function.
/// Note: If you're in need of input functions, its recommended to use imgui's own input layer with igGetIO() instead of
/// overwriting the given input callbacks.
pub fn start(app: Config) void {
    var context: Self = .{};
    context.inputQueue = std.ArrayList(InputEvent).init(std.heap.c_allocator);
    context.config = app;
    context.timer = TimeManager.init();
    context.window = undefined;
    if (glfwInit() < 0) {
        std.debug.print("Failed to init GLFW", .{});
        return;
    }

    glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
    glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 3);
    glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);

    context.window = glfwCreateWindow(app.size[0], app.size[1], app.title.ptr, null, null).?;
    glfwMakeContextCurrent(context.window);

    if (gladLoadGL() < 0) {
        std.debug.print("Failed to init Glad GL Loader", .{});
        return;
    }
    ImGuiImplementation.init("#version 330");

    glfwSetWindowUserPointer(context.window, &context);
    _ = glfwSetFramebufferSizeCallback(context.window, windowSizeChanged);
    _ = glfwSetKeyCallback(context.window, inputCallback);
    _ = glfwSetCharCallback(context.window, charCallback);
    _ = glfwSetMouseButtonCallback(context.window, mousebuttonCallback);
    _ = glfwSetCursorPosCallback(context.window, cursorCallback);
    _ = glfwSetScrollCallback(context.window, mouseWheelCallback);

    // Initial viewport set
    windowSizeChanged(context.window, app.size[0], app.size[1]);

    glClearColor(0.1, 0.1, 0.12, 1.0);

    if (app.init != null) {
        app.init.?(&context);
    }

    // Load Icon
    if (app.icon != null) {
        stb.stbi_set_flip_vertically_on_load(0);
        var image = GLFWimage{ .width = 0, .height = 0, .pixels = null };
        image.pixels = stb.stbi_load(app.icon.?.ptr, &image.width, &image.height, 0, 4);
        if (image.width > 0 and image.height > 0) {
            glfwSetWindowIcon(context.window, 1, &image);
            stb.stbi_image_free(image.pixels);
        } else {
            std.debug.print("Failed to load icon {s}", .{app.icon.?});
        }
    }
    var io = igGetIO();
    while (glfwWindowShouldClose(context.window) == 0) {
        glClear(GL_COLOR_BUFFER_BIT);

        // Application update/draw
        igNewFrame();
        if (app.update != null) {
            app.update.?(&context);
        }
        if (context.imguiVisible) {
            igRender();
            var dd = igGetDrawData();
            ImGuiImplementation.RenderDrawData(dd);
        } else {
            igEndFrame();
        }
        context.inputQueue.items.len = 0;
        glfwSwapBuffers(context.window);
        glfwPollEvents();

        // Timing Management.
        context.timer.tick();
        io.*.DeltaTime = context.timer.dt;
        if (context.energySaving) {
            if (context.updateSeconds > 0.0) {
                context.updateSeconds -= context.timer.dt;
            } else {
                glfwWaitEvents();
            }
        }
    }

    // Shutdown
    if (app.deinit != null) {
        app.deinit.?(&context);
    }
    ImGuiImplementation.Shutdown();

    glfwTerminate();
}

fn windowSizeChanged(win: ?*GLFWwindow, newWidth: c_int, newHeight: c_int) callconv(.C) void {
    var context: *Self = @ptrCast(*Self, @alignCast(@alignOf(*Self), glfwGetWindowUserPointer(win).?));
    glViewport(0, 0, newWidth, newHeight);
    var io = igGetIO();
    context.width = @intToFloat(f32, newWidth);
    context.height = @intToFloat(f32, newHeight);
    io.*.DisplaySize = .{ .x = context.width, .y = context.height };

    if (context.config.windowSizeChanged) |func| {
        func(context);
    }
}
fn inputCallback(win: ?*GLFWwindow, key: c_int, scan: c_int, action: c_int, mods: c_int) callconv(.C) void {
    var context: *Self = @ptrCast(*Self, @alignCast(@alignOf(*Self), glfwGetWindowUserPointer(win).?));
    var io = igGetIO();
    io.*.KeysDown[@intCast(usize, key)] = if (action == GLFW_PRESS) true else false;
    io.*.KeyShift = io.*.KeysDown[@intCast(usize, GLFW_KEY_LEFT_SHIFT)] or io.*.KeysDown[@intCast(usize, GLFW_KEY_RIGHT_SHIFT)];
    io.*.KeyCtrl = io.*.KeysDown[@intCast(usize, GLFW_KEY_LEFT_CONTROL)] or io.*.KeysDown[@intCast(usize, GLFW_KEY_RIGHT_CONTROL)];
    io.*.KeyAlt = io.*.KeysDown[@intCast(usize, GLFW_KEY_LEFT_ALT)] or io.*.KeysDown[@intCast(usize, GLFW_KEY_RIGHT_ALT)];
    context.inputQueue.append(.{ .keyboard = .{
        .key = key,
        .scan = scan,
        .action = action,
        .mods = mods,
    } }) catch unreachable;
}
fn mouseWheelCallback(win: ?*GLFWwindow, x: f64, y: f64) callconv(.C) void {
    var context: *Self = @ptrCast(*Self, @alignCast(@alignOf(*Self), glfwGetWindowUserPointer(win).?));
    var io = igGetIO();
    io.*.MouseWheel = @floatCast(f32, y);
    io.*.MouseWheelH = @floatCast(f32, x);
    context.inputQueue.append(.{ .mouseWheel = .{
        .x = x,
        .y = y,
    } }) catch unreachable;
}
fn mousebuttonCallback(win: ?*GLFWwindow, key: c_int, action: c_int, mods: c_int) callconv(.C) void {
    var context: *Self = @ptrCast(*Self, @alignCast(@alignOf(*Self), glfwGetWindowUserPointer(win).?));
    var io = igGetIO();
    switch (key) {
        GLFW_MOUSE_BUTTON_LEFT => {
            io.*.MouseDown[ImGuiMouseButton_Left] = if (action == GLFW_PRESS) true else false;
        },
        GLFW_MOUSE_BUTTON_MIDDLE => {
            io.*.MouseDown[ImGuiMouseButton_Middle] = if (action == GLFW_PRESS) true else false;
        },
        GLFW_MOUSE_BUTTON_RIGHT => {
            io.*.MouseDown[ImGuiMouseButton_Right] = if (action == GLFW_PRESS) true else false;
        },
        else => {},
    }
    context.inputQueue.append(.{ .mouseButton = .{
        .key = key,
        .action = action,
        .mods = mods,
    } }) catch unreachable;
}
fn cursorCallback(win: ?*GLFWwindow, x: f64, y: f64) callconv(.C) void {
    var context: *Self = @ptrCast(*Self, @alignCast(@alignOf(*Self), glfwGetWindowUserPointer(win).?));
    var io = igGetIO();
    io.*.MousePos = .{ .x = @floatCast(f32, x), .y = @floatCast(f32, y) };
    context.inputQueue.append(.{ .mousePosition = .{
        .x = x,
        .y = y,
    } }) catch unreachable;
}
fn charCallback(win: ?*GLFWwindow, char: c_uint) callconv(.C) void {
    var context: *Self = @ptrCast(*Self, @alignCast(@alignOf(*Self), glfwGetWindowUserPointer(win).?));
    var io = igGetIO();
    ImGuiIO_AddInputCharacter(io, char);
    context.inputQueue.append(.{ .character = .{
        .value = char,
    } }) catch unreachable;
}
