const std = @import("std");
const stb = @import("stb_image");
const ImGuiImplementation = @import("imguiImplementation.zig");
const TimeManager = @import("timeManager.zig");

const zt = @import("../zt.zig");
const gl = @import("gl");
usingnamespace @import("glfw");
usingnamespace @import("gl");
usingnamespace @import("imgui");

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
            allocator: *std.mem.Allocator = undefined,
            data: Data = .{},
            settings: Settings = .{},
            window: ?*GLFWwindow = undefined,
            input: std.ArrayList(InputEvent) = undefined,
            time: TimeManager = undefined,
            open: bool = false,

            pub fn deinit(self: *Context) void {
                self.input.deinit();
                ImGuiImplementation.Shutdown();
                glfwTerminate();
                self.allocator.destroy(self);
            }

            pub fn beginFrame(self: *Context) void {
                _ = self;
                glClear(GL_COLOR_BUFFER_BIT);
                igNewFrame();
            }
            pub fn endFrame(self: *Context) void {
                var io = igGetIO();
                // Render
                if (self.settings.imguiActive) {
                    igRender();
                    var dd = igGetDrawData();
                    ImGuiImplementation.RenderDrawData(dd);
                } else {
                    igEndFrame();
                }
                self.input.items.len = 0;

                glfwSwapBuffers(self.window);
                glfwPollEvents();

                self.time.tick();
                io.*.DeltaTime = self.time.dt;
                if (self.settings.energySaving) {
                    if (self._updateSeconds > 0.0) {
                        self._updateSeconds -= self.time.dt;
                    } else {
                        glfwWaitEvents();
                    }
                }

                self.open = glfwWindowShouldClose(self.window) == 0;
            }
            pub fn setWindowSize(self: *Context, width: c_int, height: c_int) void {
                glfwSetWindowSize(self.window, width, height);
            }
            pub fn setWindowTitle(self: *Context, string: []const u8) void {
                glfwSetWindowTitle(self.window, string.ptr);
            }
            pub fn setVsync(self:*Context, on:bool) void {
                if (on) {
                    glfwSwapInterval(1);
                } else {
                    glfwSwapInterval(0);
                }
                self.settings.vsync = on;
            }
            pub fn setWindowIcon(self: *Context, path: []const u8) void {
                stb.stbi_set_flip_vertically_on_load(0);
                var image = GLFWimage{ .width = 0, .height = 0, .pixels = null };
                image.pixels = stb.stbi_load(path.ptr, &image.width, &image.height, 0, 4);
                if (image.width > 0 and image.height > 0) {
                    glfwSetWindowIcon(self.window, 1, &image);
                    stb.stbi_image_free(image.pixels);
                } else {
                    std.debug.print("Failed to load icon {s}", .{path});
                }
            }
            /// If you have an animation that needs to play you can queue an amount of seconds that will ignore energy saving.
            pub fn setAnimationFrames(self: *Context, seconds: f32) void {
                self._updateSeconds = seconds;
            }
            /// If you are using multithreading or anything that will require the UI to update from outside, this can force a redraw,
            /// if you are using energy saving mode.
            pub fn forceUpdate(self: *Context) void {
                _ = self;
                glfwPostEmptyEvent();
            }
            pub fn addFont(self: *Context, path: []const u8, pxSize: f32) *ImFont {
                var io = igGetIO();
                var newFont: *ImFont = ImFontAtlas_AddFontFromFileTTF(io.*.Fonts, path.ptr, pxSize, null, ImFontAtlas_GetGlyphRangesDefault(io.*.Fonts));
                self.rebuildFont();
                return newFont;
            }
            /// This will destroy and rebuild the font texture used for imgui.
            /// This is also called for you when you add and remove fonts.
            pub fn rebuildFont(self: *Context) void {
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
                ImGuiImplementation.g_FontTexture = newTexId;
            }
        };

        pub fn begin(applicationAllocator: *std.mem.Allocator) *Context {
            var self: *Context = applicationAllocator.create(Context) catch unreachable;
            self.* = .{};
            self.allocator = applicationAllocator;
            self.input = std.ArrayList(InputEvent).init(applicationAllocator);
            self.time = TimeManager.init();
            if (glfwInit() < 0) {
                std.debug.panic("Failed to init GLFW", .{});
            }

            glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
            glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 3);
            glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);

            self.window = glfwCreateWindow(800, 600, "ZT Application", null, null).?;
            glfwMakeContextCurrent(self.window);
            self.open = true;

            if (gladLoadGL() < 0) {
                std.debug.panic("Failed to init Glad GL Loader", .{});
            }
            ImGuiImplementation.init("#version 330");

            glfwSetWindowUserPointer(self.window, self);
            _ = glfwSetFramebufferSizeCallback(self.window, windowSizeChanged);
            _ = glfwSetKeyCallback(self.window, inputCallback);
            _ = glfwSetCharCallback(self.window, charCallback);
            _ = glfwSetMouseButtonCallback(self.window, mousebuttonCallback);
            _ = glfwSetCursorPosCallback(self.window, cursorCallback);
            _ = glfwSetScrollCallback(self.window, mouseWheelCallback);

            glClearColor(0.1, 0.1, 0.12, 1.0);

            windowSizeChanged(self.window, 800, 600);

            return self;
        }

        // Callbacks
        fn windowSizeChanged(win: ?*GLFWwindow, newWidth: c_int, newHeight: c_int) callconv(.C) void {
            _ = win;
            glViewport(0, 0, newWidth, newHeight);
            var io = igGetIO();
            io.*.DisplaySize = .{ .x = @intToFloat(f32, newWidth), .y = @intToFloat(f32, newHeight) };
        }
        fn inputCallback(win: ?*GLFWwindow, key: c_int, scan: c_int, action: c_int, mods: c_int) callconv(.C) void {
            var context: *Context = @ptrCast(*Context, @alignCast(@alignOf(*Context), glfwGetWindowUserPointer(win).?));
            var io = igGetIO();
            io.*.KeysDown[@intCast(usize, key)] = if (action == GLFW_PRESS) true else false;
            io.*.KeyShift = io.*.KeysDown[@intCast(usize, GLFW_KEY_LEFT_SHIFT)] or io.*.KeysDown[@intCast(usize, GLFW_KEY_RIGHT_SHIFT)];
            io.*.KeyCtrl = io.*.KeysDown[@intCast(usize, GLFW_KEY_LEFT_CONTROL)] or io.*.KeysDown[@intCast(usize, GLFW_KEY_RIGHT_CONTROL)];
            io.*.KeyAlt = io.*.KeysDown[@intCast(usize, GLFW_KEY_LEFT_ALT)] or io.*.KeysDown[@intCast(usize, GLFW_KEY_RIGHT_ALT)];
            context.input.append(.{ .keyboard = .{
                .key = key,
                .scan = scan,
                .action = action,
                .mods = mods,
            } }) catch unreachable;
        }
        fn mouseWheelCallback(win: ?*GLFWwindow, x: f64, y: f64) callconv(.C) void {
            var context: *Context = @ptrCast(*Context, @alignCast(@alignOf(*Context), glfwGetWindowUserPointer(win).?));
            var io = igGetIO();
            io.*.MouseWheel = @floatCast(f32, y);
            io.*.MouseWheelH = @floatCast(f32, x);
            context.input.append(.{ .mouseWheel = .{
                .x = x,
                .y = y,
            } }) catch unreachable;
        }
        fn mousebuttonCallback(win: ?*GLFWwindow, key: c_int, action: c_int, mods: c_int) callconv(.C) void {
            var context: *Context = @ptrCast(*Context, @alignCast(@alignOf(*Context), glfwGetWindowUserPointer(win).?));
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
            context.input.append(.{ .mouseButton = .{
                .key = key,
                .action = action,
                .mods = mods,
            } }) catch unreachable;
        }
        fn cursorCallback(win: ?*GLFWwindow, x: f64, y: f64) callconv(.C) void {
            var context: *Context = @ptrCast(*Context, @alignCast(@alignOf(*Context), glfwGetWindowUserPointer(win).?));
            var io = igGetIO();
            io.*.MousePos = .{ .x = @floatCast(f32, x), .y = @floatCast(f32, y) };
            context.input.append(.{ .mousePosition = .{
                .x = x,
                .y = y,
            } }) catch unreachable;
        }
        fn charCallback(win: ?*GLFWwindow, char: c_uint) callconv(.C) void {
            var context: *Context = @ptrCast(*Context, @alignCast(@alignOf(*Context), glfwGetWindowUserPointer(win).?));
            var io = igGetIO();
            ImGuiIO_AddInputCharacter(io, char);
            context.input.append(.{ .character = .{
                .value = char,
            } }) catch unreachable;
        }
    };
}
