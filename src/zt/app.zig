const std = @import("std");
const stb = @import("stb_image");
const ImGuiImplementation = @import("imguiImplementation.zig");
const TimeManager = @import("timeManager.zig");

const zt = @import("../zt.zig");
const gl = @import("gl");
const glfw = @import("glfw");
const ig = @import("imgui");

var initialized: bool = false;

pub fn App(comptime Data: type) type {
    return struct {
        const Self = @This();
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
            data: Data = undefined,
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
            /// that we are starting a new frame. Basically 
            pub fn beginFrame(self: *Context) void {
                self.open = glfw.glfwWindowShouldClose(self.window) == 0;
                self.time.tick();
                glfw.glfwPollEvents();
                gl.glClear(gl.GL_COLOR_BUFFER_BIT);
                ig.igNewFrame();
            }
            /// Draws all the imgui commands, and flips the buffer to display the drawn image
            pub fn endFrame(self: *Context) void {
                var io = ig.igGetIO();
                // Render
                if (self.settings.imguiActive) {
                    ig.igRender();
                    var dd = ig.igGetDrawData();
                    ImGuiImplementation.RenderDrawData(dd);
                } else {
                    ig.igEndFrame();
                }

                self.input.items.len = 0;

                glfw.glfwSwapBuffers(self.window);
                io.*.DeltaTime = self.time.dt;
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
            pub fn setWindowTitle(self: *Context, string: []const u8) void {
                glfw.glfwSetWindowTitle(self.window, string.ptr);
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
                    std.debug.print("Failed to load icon {s}\n", .{path});
                }
            }
            /// Tells ZT to close the window
            pub fn close(self: *Context) void {
                glfw.glfwSetWindowShouldClose(self.window, 1);
            }
            /// If you have an animation that needs to play you can queue an amount of seconds that will ignore energy saving mode
            pub fn setAnimationFrames(self: *Context, seconds: f32) void {
                self._updateSeconds = seconds;
            }
            /// If you are using multithreading or anything that will require the UI to update from outside, this can force a redraw,
            /// if you are using energy saving mode
            pub fn forceUpdate(self: *Context) void {
                _ = self;
                glfw.glfwPostEmptyEvent();
            }
            pub fn addFont(self: *Context, path: []const u8, pxSize: f32) *ig.ImFont {
                var io = ig.igGetIO();
                var newFont: *ig.ImFont = ig.ImFontAtlas_AddFontFromFileTTF(io.*.Fonts, path.ptr, pxSize, null, ig.ImFontAtlas_GetGlyphRangesDefault(io.*.Fonts));
                self.rebuildFont();
                return newFont;
            }
            /// This will destroy and rebuild the font texture used for imgui.
            /// This is also called for you when you add and remove fonts
            pub fn rebuildFont(self: *Context) void {
                _ = self;
                var io = ig.igGetIO();
                // Delete the old texture
                var texId = @intCast(c_uint, @ptrToInt(io.*.Fonts.*.TexID));
                gl.glDeleteTextures(1, &texId);

                // Generate new texture
                var newTexId: c_uint = 0;
                var pixels: [*c]u8 = undefined;
                var fontTexWidth: i32 = undefined;
                var fontTexHeight: i32 = undefined;
                ig.ImFontAtlas_GetTexDataAsRGBA32(io.*.Fonts, &pixels, &fontTexWidth, &fontTexHeight, null);

                // Upload texture to graphics system
                gl.glGenTextures(1, &newTexId);
                gl.glBindTexture(gl.GL_TEXTURE_2D, newTexId);
                gl.glTexParameteri(gl.GL_TEXTURE_2D, gl.GL_TEXTURE_MIN_FILTER, gl.GL_LINEAR);
                gl.glTexParameteri(gl.GL_TEXTURE_2D, gl.GL_TEXTURE_MAG_FILTER, gl.GL_LINEAR);
                if (@hasDecl(gl, "GL_UNPACK_ROW_LENGTH"))
                    gl.glPixelStorei(gl.GL_UNPACK_ROW_LENGTH, 0);
                gl.glTexImage2D(gl.GL_TEXTURE_2D, 0, gl.GL_RGBA, fontTexWidth, fontTexHeight, 0, gl.GL_RGBA, gl.GL_UNSIGNED_BYTE, pixels);
                // Store our identifier
                io.*.Fonts.*.TexID = @intToPtr(*anyopaque, newTexId);
                ImGuiImplementation.g_FontTexture = newTexId;
            }
        };

        /// If you need glfw to init before starting, use this to init glfw and
        /// other libraries without actually spinning up the context
        pub fn preInit() !void {
            if (!initialized) {
                if (glfw.glfwInit() < 0) {
                    std.debug.panic("Failed to init GLFW", .{});
                }

                glfw.glfwWindowHint(glfw.GLFW_CONTEXT_VERSION_MAJOR, 3);
                glfw.glfwWindowHint(glfw.GLFW_CONTEXT_VERSION_MINOR, 3);
                glfw.glfwWindowHint(glfw.GLFW_OPENGL_PROFILE, glfw.GLFW_OPENGL_CORE_PROFILE);
                initialized = true;
            }
        }

        pub fn begin(applicationAllocator: std.mem.Allocator) !*Context {
            return beginWithData(applicationAllocator, .{});
        }
        /// Starts the entire application! Returns errors if anything along the pipeline fails.
        pub fn beginWithData(applicationAllocator: std.mem.Allocator, data: Data) !*Context {
            var self: *Context = try applicationAllocator.create(Context);
            self.* = .{};
            self.data = data;
            self.allocator = applicationAllocator;
            self.input = std.ArrayList(InputEvent).init(applicationAllocator);
            try preInit();
            self.window = glfw.glfwCreateWindow(800, 600, "ZT Application", null, null).?;
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

            var width: c_int = 0;
            var height: c_int = 0;
            glfw.glfwGetWindowSize(self.window, &width, &height);
            gl.glViewport(0, 0, width, height);
            var io = ig.igGetIO();
            io.*.ConfigFlags |= ig.ImGuiConfigFlags_DockingEnable;
            io.*.DisplaySize = .{ .x = @intToFloat(f32, width), .y = @intToFloat(f32, height) };
            self.time = TimeManager.init();
            return self;
        }

        // Callbacks
        fn windowSizeChanged(win: ?*glfw.GLFWwindow, newWidth: c_int, newHeight: c_int) callconv(.C) void {
            _ = win;
            gl.glViewport(0, 0, newWidth, newHeight);
            var io = ig.igGetIO();
            io.*.DisplaySize = .{ .x = @intToFloat(f32, newWidth), .y = @intToFloat(f32, newHeight) };
        }
        fn windowMaximizeChanged(win: ?*glfw.GLFWwindow, maximized: c_int) callconv(.C) void {
            _ = maximized;
            var width: c_int = 0;
            var height: c_int = 0;
            glfw.glfwGetWindowSize(win, &width, &height);
            gl.glViewport(0, 0, width, height);
            var io = ig.igGetIO();
            io.*.DisplaySize = .{ .x = @intToFloat(f32, width), .y = @intToFloat(f32, height) };
        }
        fn inputCallback(win: ?*glfw.GLFWwindow, key: c_int, scan: c_int, action: c_int, mods: c_int) callconv(.C) void {
            var context: *Context = @ptrCast(*Context, @alignCast(@alignOf(*Context), glfw.glfwGetWindowUserPointer(win).?));
            var io = ig.igGetIO();
            var pressed = false;
            if (action == glfw.GLFW_PRESS or action == glfw.GLFW_REPEAT) {
                pressed = true;
            }
            io.*.KeysDown[@intCast(usize, key)] = pressed;
            io.*.KeyShift = io.*.KeysDown[@intCast(usize, glfw.GLFW_KEY_LEFT_SHIFT)] or io.*.KeysDown[@intCast(usize, glfw.GLFW_KEY_RIGHT_SHIFT)];
            io.*.KeyCtrl = io.*.KeysDown[@intCast(usize, glfw.GLFW_KEY_LEFT_CONTROL)] or io.*.KeysDown[@intCast(usize, glfw.GLFW_KEY_RIGHT_CONTROL)];
            io.*.KeyAlt = io.*.KeysDown[@intCast(usize, glfw.GLFW_KEY_LEFT_ALT)] or io.*.KeysDown[@intCast(usize, glfw.GLFW_KEY_RIGHT_ALT)];
            context.input.append(.{ .keyboard = .{
                .key = key,
                .scan = scan,
                .action = action,
                .mods = mods,
            } }) catch unreachable;
        }
        fn mouseWheelCallback(win: ?*glfw.GLFWwindow, x: f64, y: f64) callconv(.C) void {
            var context: *Context = @ptrCast(*Context, @alignCast(@alignOf(*Context), glfw.glfwGetWindowUserPointer(win).?));
            var io = ig.igGetIO();
            io.*.MouseWheel = @floatCast(f32, y);
            io.*.MouseWheelH = @floatCast(f32, x);
            context.input.append(.{ .mouseWheel = .{
                .x = x,
                .y = y,
            } }) catch unreachable;
        }
        fn mousebuttonCallback(win: ?*glfw.GLFWwindow, key: c_int, action: c_int, mods: c_int) callconv(.C) void {
            var context: *Context = @ptrCast(*Context, @alignCast(@alignOf(*Context), glfw.glfwGetWindowUserPointer(win).?));
            var io = ig.igGetIO();
            var pressed = false;
            if (action == glfw.GLFW_PRESS or action == glfw.GLFW_REPEAT) {
                pressed = true;
            }
            switch (key) {
                glfw.GLFW_MOUSE_BUTTON_LEFT => {
                    io.*.MouseDown[ig.ImGuiMouseButton_Left] = pressed;
                },
                glfw.GLFW_MOUSE_BUTTON_MIDDLE => {
                    io.*.MouseDown[ig.ImGuiMouseButton_Middle] = pressed;
                },
                glfw.GLFW_MOUSE_BUTTON_RIGHT => {
                    io.*.MouseDown[ig.ImGuiMouseButton_Right] = pressed;
                },
                else => {},
            }
            context.input.append(.{ .mouseButton = .{
                .key = key,
                .action = action,
                .mods = mods,
            } }) catch unreachable;
        }
        fn cursorCallback(win: ?*glfw.GLFWwindow, x: f64, y: f64) callconv(.C) void {
            var context: *Context = @ptrCast(*Context, @alignCast(@alignOf(*Context), glfw.glfwGetWindowUserPointer(win).?));
            var io = ig.igGetIO();
            io.*.MousePos = .{ .x = @floatCast(f32, x), .y = @floatCast(f32, y) };
            context.input.append(.{ .mousePosition = .{
                .x = x,
                .y = y,
            } }) catch unreachable;
        }
        fn charCallback(win: ?*glfw.GLFWwindow, char: c_uint) callconv(.C) void {
            var context: *Context = @ptrCast(*Context, @alignCast(@alignOf(*Context), glfw.glfwGetWindowUserPointer(win).?));
            var io = ig.igGetIO();
            ig.ImGuiIO_AddInputCharacter(io, char);
            context.input.append(.{ .character = .{
                .value = char,
            } }) catch unreachable;
        }
    };
}
