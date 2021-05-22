const glfw = @import("glfw");
const gl = @import("gl");
const std = @import("std");
const imgImpl = @import("imgui_impl.zig");
const TimeManager = @import("timemanager.zig").TimeManager;
const stb = @import("stb_image");
usingnamespace glfw;
usingnamespace gl;
usingnamespace @import("imgui");

pub var width:  f32 = 0;
pub var height: f32 = 0;
pub var timer: TimeManager = undefined;

var allocator: *std.mem.Allocator = undefined;

pub const ZTLAppConfig = struct {
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

/// If you are using multithreading, this can force a redraw to update state.
pub fn forceUpdate() void {
    glfwPostEmptyEvent();
}

pub fn start(app: ZTLAppConfig) void {
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
    
    windowSizeChanged(win, app.size[0], app.size[1]);

    glClearColor(0.1,0.1,0.12,1.0);

    if(app.init != null) { app.init.?(); }

    // Load Icon
    if(app.icon != null) {
        stb.stbi_set_flip_vertically_on_load(0);
        var images: [1]GLFWimage = .{
            GLFWimage{.width = 0, .height = 0, .pixels = null},
        };
        images[0].pixels = stb.stbi_load(app.icon.?.ptr, &images[0].width, &images[0].height, 0, 4);
        if(images[0].width > 0 and images[0].height > 0) {
            glfwSetWindowIcon(win, 1, &images);
            stb.stbi_image_free(images[0].pixels);
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
            glfwWaitEvents();
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
    switch(key) {
        GLFW_KEY_LEFT_SHIFT,
        GLFW_KEY_RIGHT_SHIFT => {
            io.*.KeyShift = if(action == GLFW_PRESS) true else false;
        },
        else => {}
    }
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