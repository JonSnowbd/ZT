const glfw = @import("glfw");
const gl = @import("gl");
const std = @import("std");
const imgImpl = @import("imgui_impl.zig");
const TimeManager = @import("timemanager.zig").TimeManager;
const stb = @import("stb_image");
const Folders = @import("../known_folders.zig");
usingnamespace glfw;
usingnamespace gl;
usingnamespace @import("imgui");

pub var width:  f32 = 0;
pub var height: f32 = 0;
pub var timer: TimeManager = undefined;

pub var executablePath: []const u8 = "";
var updateSeconds: f32 = 0;

pub const ZTAppConfig = struct {
    icon: ?[]const u8 = null,
    title: []const u8 = "ZT Application",
    init: ?fn() void = null,
    update: ?fn() void = null,
    deinit: ?fn() void = null,
    imguiVisible: bool = true,
    /// The initial size of the window.
    size: [2]c_int = .{1280,720},
    /// If enabled, the application will not update if it is not receiving
    /// events from GLFW. Recommended for applications.
    energySaving: bool = true,
};

/// If you have an animation that needs to play you can queue an amount of seconds that will ignore energy saving.
pub fn queueAnimationFrames(seconds:f32) void {
    updateSeconds = seconds;
}
/// If you are using multithreading or anything that will force an update, this can force a redraw.
pub fn forceUpdate() void {
    glfwPostEmptyEvent();
}

/// Adds in an imgui font via a file path. The font atlas is rebuilt automatically and youre free to use the 
/// ImFont immediately.
pub fn addImguiFont(path: []const u8, size: f32, config: [*c]const ImFontConfig) *ImFont {
    var io = igGetIO();
    var newFont: *ImFont = ImFontAtlas_AddFontFromFileTTF(io.*.Fonts, path.ptr, size, config, ImFontAtlas_GetGlyphRangesDefault(io.*.Fonts));
    rebuildImguiFont();
    return newFont;
}
/// This function is called for you when you add an imgui font, but if you manage the font atlas yourself, this
/// will automatically delete and rebuild the font atlas for imgui.
pub fn rebuildImguiFont() void {
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
pub fn relativePathOf(allocator: *std.mem.Allocator, subpath: []const u8) []const u8 {
    return std.fs.path.joinZ(allocator, &[_][]const u8{executablePath, subpath}) catch unreachable;
}

/// Takes in an application config and begins the main loop. This will block until the application closes, so make
/// sure you're using the config's parameters to set an update function.
/// Note: If you're in need of input functions, its recommended to use imgui's own input layer with igGetIO() instead of
/// overwriting the given input callbacks.
pub fn start(app: ZTAppConfig) void {
    // Use KnownFolders to have a solid reference to the sprite location.
    executablePath = (Folders.getPath(std.heap.page_allocator, Folders.KnownFolder.executable_dir) catch unreachable).?;
    timer = TimeManager.init();
    var win: *GLFWwindow = undefined;
    if(glfwInit() < 0) { std.debug.print("Failed to init GLFW", .{}); return; }

    glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
    glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 3);
    glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);

    win = glfwCreateWindow(app.size[0],app.size[1], app.title.ptr, null, null).?;
    glfwMakeContextCurrent(win);

    if(gladLoadGL() < 0) { std.debug.print("Failed to init Glad GL Loader", .{}); return; }
    imgImpl.init("#version 330");

    _ = glfwSetFramebufferSizeCallback(win, windowSizeChanged);
    _ = glfwSetKeyCallback(win, inputCallback);
    _ = glfwSetCharCallback(win, charCallback);
    _ = glfwSetMouseButtonCallback(win, mousebuttonCallback);
    _ = glfwSetCursorPosCallback(win, cursorCallback);
    _ = glfwSetScrollCallback(win, mouseWheelCallback);
    
    // Initial viewport set
    windowSizeChanged(win, app.size[0], app.size[1]);

    glClearColor(0.1,0.1,0.12,1.0);

    if(app.init != null) { app.init.?(); }

    // Load Icon
    if(app.icon != null) {
        stb.stbi_set_flip_vertically_on_load(0);
        var image = GLFWimage{
            .width = 0, .height = 0, .pixels = null
        };
        image.pixels = stb.stbi_load(app.icon.?.ptr, &image.width, &image.height, 0, 4);
        if(image.width > 0 and image.height > 0) {
            glfwSetWindowIcon(win, 1, &image);
            stb.stbi_image_free(image.pixels);
        } else {
            std.debug.print("Failed to load icon {s}", .{app.icon.?});
        }
    }
    var io = igGetIO();
    while(glfwWindowShouldClose(win) == 0) {
        glClear(GL_COLOR_BUFFER_BIT);
        
        // Application update/draw
        igNewFrame();
        if(app.update != null) { app.update.?(); }
        if(app.imguiVisible) { 
            igRender();
            var dd = igGetDrawData();
            imgImpl.RenderDrawData(dd);
        } else {
            igEndFrame();
        }

        glfwSwapBuffers(win);
        glfwPollEvents();

        // Timing Management.
        timer.tick();
        io.*.DeltaTime = timer.dt;
        if(app.energySaving) {
            if(updateSeconds > 0.0) {
                updateSeconds -= timer.dt;
            } else {
                glfwWaitEvents();
            }
        }
    }

    // Shutdown
    if(app.deinit != null) { app.deinit.?(); }
    imgImpl.Shutdown();
    
    glfwTerminate();
}

fn windowSizeChanged(win: ?*GLFWwindow, newWidth: c_int, newHeight: c_int) callconv(.C) void {
    glViewport(0,0,newWidth,newHeight);
    var io = igGetIO();
    width = @intToFloat(f32, newWidth);
    height = @intToFloat(f32, newHeight);
    io.*.DisplaySize = .{.x=width,.y=height};
}
fn inputCallback(win: ?*GLFWwindow, key: c_int, scan: c_int, action: c_int, mods: c_int) callconv(.C) void {
    var io = igGetIO();
    io.*.KeysDown[@intCast(usize, key)] = if(action == GLFW_PRESS) true else false;

    io.*.KeyShift = io.*.KeysDown[@intCast(usize, GLFW_KEY_LEFT_SHIFT)] or io.*.KeysDown[@intCast(usize, GLFW_KEY_RIGHT_SHIFT)];
    io.*.KeyCtrl = io.*.KeysDown[@intCast(usize, GLFW_KEY_LEFT_CONTROL)] or io.*.KeysDown[@intCast(usize, GLFW_KEY_RIGHT_CONTROL)];
    io.*.KeyAlt = io.*.KeysDown[@intCast(usize, GLFW_KEY_LEFT_ALT)] or io.*.KeysDown[@intCast(usize, GLFW_KEY_RIGHT_ALT)];
}
fn mouseWheelCallback(win: ?*GLFWwindow, x: f64, y: f64) callconv(.C) void {
    var io = igGetIO();
    io.*.MouseWheel = @floatCast(f32, y);
    io.*.MouseWheelH = @floatCast(f32, x);
}
fn mousebuttonCallback(win: ?*GLFWwindow, key: c_int, action: c_int, mods: c_int) callconv(.C) void {
    var io = igGetIO();
    switch(key) {
        GLFW_MOUSE_BUTTON_LEFT => {
            io.*.MouseDown[ImGuiMouseButton_Left] = if(action == GLFW_PRESS) true else false;
        },
        GLFW_MOUSE_BUTTON_MIDDLE => {
            io.*.MouseDown[ImGuiMouseButton_Middle] = if(action == GLFW_PRESS) true else false;
        },
        GLFW_MOUSE_BUTTON_RIGHT => {
            io.*.MouseDown[ImGuiMouseButton_Right] = if(action == GLFW_PRESS) true else false;
        },
        else => {},
    }
}
fn cursorCallback(win: ?*GLFWwindow, x: f64, y: f64) callconv(.C) void {
    var io = igGetIO();
    io.*.MousePos = .{.x=@floatCast(f32, x), .y=@floatCast(f32, y)};
}
fn charCallback(win: ?*GLFWwindow, char: c_uint) callconv(.C) void {
    var io = igGetIO();
    ImGuiIO_AddInputCharacter(io, char);
}