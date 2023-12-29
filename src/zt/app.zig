const std = @import("std");
const stb = @import("stb_image");
const ImGuiImplementation = @import("imguiImplementation.zig");
const TimeManager = @import("timeManager.zig");

const zt = @import("../zt.zig");
const gl = @import("gl");
const glfw = @import("glfw");
const ig = @import("imgui");

var initialized: bool = false;

/// Default GLFW error handling callback
fn errorCallback(error_code: glfw.ErrorCode, description: [:0]const u8) void {
    std.log.err("glfw: {}: {s}\n", .{ error_code, description });
}

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
            window: ?glfw.Window = undefined,
            input: std.ArrayList(InputEvent) = undefined,
            time: TimeManager = undefined,
            open: bool = false,

            pub fn deinit(self: *Context) void {
                self.input.deinit();
                ImGuiImplementation.Shutdown();
                glfw.terminate();
                self.allocator.destroy(self);
            }

            /// Ticks forward timer, clears OpenGL, enqueues events, and dictates to imgui
            /// that we are starting a new frame. Basically
            pub fn beginFrame(self: *Context) void {
                self.open = !self.window.?.shouldClose();
                self.time.tick();

                glfw.pollEvents();
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

                self.window.?.swapBuffers();
                io.*.DeltaTime = self.time.dt;
                if (self.settings.energySaving) {
                    if (self._updateSeconds > 0.0) {
                        self._updateSeconds -= self.time.dt;
                    } else {
                        glfw.waitEvents();
                    }
                }
            }
            /// Changes the context window's position. In some operating systems I believe this is
            /// a no-op
            pub fn setWindowPosition(self: *Context, x: c_int, y: c_int) void {
                self.window.?.setPos(.{ .x = x, .y = y });
            }
            /// Changes the context window's size
            pub fn setWindowSize(self: *Context, width: c_int, height: c_int) void {
                self.window.?.setSize(.{ .width = @intCast(width), .height = @intCast(height) });
            }
            /// Changes the context window's title(the text on the window's title bar, typically)
            pub fn setWindowTitle(self: *Context, string: [*:0]const u8) void {
                self.window.?.setTitle(string);
            }
            /// If true, buffer swaps will happen each possible frame in line with your monitor hz,
            /// but if false, will buffer swap as fast as it can.
            pub fn setVsync(self: *Context, on: bool) void {
                if (on) {
                    glfw.swapInterval(1);
                } else {
                    glfw.swapInterval(0);
                }
                self.settings.vsync = on;
            }
            /// Give a path to a .png for the window icon. Note this does not affect the
            /// binary icon, and you would rather want to use post builds specific to
            /// each platform.
            pub fn setWindowIcon(self: *Context, path: []const u8) void {
                _ = self;
                _ = path;
                std.debug.print("ERROR: Loading icons not implemented\n", .{});
            }
            /// Tells ZT to close the window
            pub fn close(self: *Context) void {
                self.window.?.setShouldClose(true);
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
                const io = ig.igGetIO();
                const newFont: *ig.ImFont = ig.ImFontAtlas_AddFontFromFileTTF(io.*.Fonts, path.ptr, pxSize, null, ig.ImFontAtlas_GetGlyphRangesDefault(io.*.Fonts));
                self.rebuildFont();
                return newFont;
            }
            /// This will destroy and rebuild the font texture used for imgui.
            /// This is also called for you when you add and remove fonts
            pub fn rebuildFont(self: *Context) void {
                _ = self;
                const io = ig.igGetIO();
                // Delete the old texture
                const texId = @as(c_uint, @intCast(@intFromPtr(io.*.Fonts.*.TexID)));
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
                io.*.Fonts.*.TexID = @as(*anyopaque, @ptrFromInt(newTexId));
                ImGuiImplementation.g_FontTexture = newTexId;
            }
        };

        /// If you need glfw to init before starting, use this to init glfw and
        /// other libraries without actually spinning up the context
        pub fn preInit() !void {
            if (!initialized) {
                glfw.setErrorCallback(errorCallback);

                if (!glfw.init(.{})) {
                    std.log.err("failed to initialize GLFW: {?s}", .{glfw.getErrorString()});
                    std.process.exit(1);
                }

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

            // Create our window

            const hints = glfw.Window.Hints{ .context_version_major = 3, .context_version_minor = 3, .opengl_profile = glfw.Window.Hints.OpenGLProfile.opengl_core_profile };

            self.window = glfw.Window.create(800, 600, "Hello, mach-glfw!", null, null, hints) orelse {
                std.log.err("failed to create GLFW window: {?s}", .{glfw.getErrorString()});
                std.process.exit(1);
            };

            self.open = true;
            glfw.makeContextCurrent(self.window);

            if (gl.gladLoadGL() < 0) {
                return error.GladLoadError;
            }

            ImGuiImplementation.init("#version 330");

            self.window.?.setUserPointer(self);
            _ = self.window.?.setFramebufferSizeCallback(windowSizeChanged);
            _ = self.window.?.setKeyCallback(inputCallback);
            _ = self.window.?.setCharCallback(charCallback);
            _ = self.window.?.setMouseButtonCallback(mousebuttonCallback);
            _ = self.window.?.setCursorPosCallback(cursorCallback);
            _ = self.window.?.setScrollCallback(mouseWheelCallback);
            _ = self.window.?.setMaximizeCallback(windowMaximizeChanged);

            gl.glClearColor(0.1, 0.1, 0.12, 1.0);
            const size = self.window.?.getSize();
            gl.glViewport(0, 0, @as(c_int, @intCast(size.width)), @as(c_int, @intCast(size.height)));
            const io = ig.igGetIO();
            io.*.ConfigFlags |= ig.ImGuiConfigFlags_DockingEnable;
            io.*.DisplaySize = .{ .x = @as(f32, @floatFromInt(size.width)), .y = @as(f32, @floatFromInt(size.height)) };
            self.time = TimeManager.init();
            return self;
        }

        // Callbacks
        fn windowSizeChanged(win: glfw.Window, newWidth: u32, newHeight: u32) void {
            _ = win;
            gl.glViewport(0, 0, @as(c_int, @intCast(newWidth)), @as(c_int, @intCast(newHeight)));
            const io = ig.igGetIO();
            io.*.DisplaySize = .{ .x = @as(f32, @floatFromInt(newWidth)), .y = @as(f32, @floatFromInt(newHeight)) };
        }
        fn windowMaximizeChanged(win: glfw.Window, maximized: bool) void {
            _ = maximized;
            const size = win.getSize();
            gl.glViewport(0, 0, @as(c_int, @intCast(size.width)), @as(c_int, @intCast(size.height)));
            const io = ig.igGetIO();
            io.*.DisplaySize = .{ .x = @as(f32, @floatFromInt(size.width)), .y = @as(f32, @floatFromInt(size.height)) };
        }
        fn inputCallback(win: glfw.Window, key: glfw.Key, scan: i32, action: glfw.Action, mods: glfw.Mods) void {
            _ = mods;
            const context: *Context = win.getUserPointer(Context).?;
            const io = ig.igGetIO();
            var pressed = false;
            if (action == glfw.Action.press or action == glfw.Action.repeat) {
                pressed = true;
            }
            io.*.KeysDown[@as(usize, @intCast(@intFromEnum(key)))] = pressed;
            io.*.KeyShift = io.*.KeysDown[@intFromEnum(glfw.Key.left_shift)] or io.*.KeysDown[@intFromEnum(glfw.Key.right_shift)];
            io.*.KeyCtrl = io.*.KeysDown[@intFromEnum(glfw.Key.left_control)] or io.*.KeysDown[@intFromEnum(glfw.Key.right_control)];
            io.*.KeyAlt = io.*.KeysDown[@intFromEnum(glfw.Key.left_alt)] or io.*.KeysDown[@intFromEnum(glfw.Key.right_alt)];
            context.input.append(.{
                .keyboard = .{
                    .key = @intFromEnum(key),
                    .scan = scan,
                    .action = @intFromEnum(action),
                    .mods = 0, // modsToInt(mods)
                },
            }) catch unreachable;
        }
        fn mouseWheelCallback(win: glfw.Window, x: f64, y: f64) void {
            const context: *Context = win.getUserPointer(Context).?;
            const io = ig.igGetIO();
            io.*.MouseWheel = @as(f32, @floatCast(y));
            io.*.MouseWheelH = @as(f32, @floatCast(x));
            context.input.append(.{ .mouseWheel = .{
                .x = x,
                .y = y,
            } }) catch unreachable;
        }
        fn mousebuttonCallback(win: glfw.Window, key: glfw.MouseButton, action: glfw.Action, mods: glfw.Mods) void {
            _ = mods;
            const context: *Context = win.getUserPointer(Context).?;
            const io = ig.igGetIO();
            var pressed = false;
            if (action == glfw.Action.press or action == glfw.Action.repeat) {
                pressed = true;
            }
            switch (key) {
                glfw.MouseButton.left => {
                    io.*.MouseDown[ig.ImGuiMouseButton_Left] = pressed;
                },
                glfw.MouseButton.middle => {
                    io.*.MouseDown[ig.ImGuiMouseButton_Middle] = pressed;
                },
                glfw.MouseButton.right => {
                    io.*.MouseDown[ig.ImGuiMouseButton_Right] = pressed;
                },
                else => {},
            }
            context.input.append(.{
                .mouseButton = .{
                    .key = @intFromEnum(key),
                    .action = @intFromEnum(action),
                    .mods = 0, // modsToInt(mods)
                },
            }) catch unreachable;
        }
        fn cursorCallback(win: glfw.Window, x: f64, y: f64) void {
            const context: *Context = win.getUserPointer(Context).?;
            const io = ig.igGetIO();
            io.*.MousePos = .{ .x = @as(f32, @floatCast(x)), .y = @as(f32, @floatCast(y)) };
            context.input.append(.{ .mousePosition = .{
                .x = x,
                .y = y,
            } }) catch unreachable;
        }
        fn charCallback(win: glfw.Window, char: u21) void {
            const context: *Context = win.getUserPointer(Context).?;
            const io = ig.igGetIO();
            ig.ImGuiIO_AddInputCharacter(io, char);
            context.input.append(.{ .character = .{
                .value = char,
            } }) catch unreachable;
        }
    };
}
