const std = @import("std");
const glfw = @import("glfw");
const zt = @import("../zt.zig");
const gl = @import("gl");
const ig = @import("imgui");


// OpenGL Data
var g_GlVersion: gl.GLuint = 0; // Extracted at runtime using gl.GL_MAJOR_VERSION, gl.GL_MINOR_VERSION queries.
var g_GlslVersionStringMem: [32]u8 = undefined; // Specified by user or detected based on compile time GL settings.
var g_GlslVersionString: []u8 = &g_GlslVersionStringMem; // slice of g_GlslVersionStringMem
pub var g_FontTexture: c_uint = 0;
var g_ShaderHandle: c_uint = 0;
var g_VertHandle: c_uint = 0;
var g_FragHandle: c_uint = 0;
var g_AttribLocationTex: i32 = 0;
var g_AttribLocationProjMtx: i32 = 0; // Uniforms location
var g_AttribLocationVtxPos: i32 = 0;
var g_AttribLocationVtxUV: i32 = 0;
var g_AttribLocationVtxColor: i32 = 0; // Vertex attributes location
var g_VboHandle: c_uint = 0;
var g_ElementsHandle: c_uint = 0;

// Functions
pub fn init(glsl_version_opt: ?[:0]const u8) void {
    var ctx = ig.igCreateContext(null);
    ig.igSetCurrentContext(ctx);
    // Query for GL version
    var major: gl.GLint = undefined;
    var minor: gl.GLint = undefined;
    gl.glGetIntegerv(gl.GL_MAJOR_VERSION, &major);
    gl.glGetIntegerv(gl.GL_MINOR_VERSION, &minor);
    g_GlVersion = @intCast(gl.GLuint, major * 1000 + minor);

    // Setup back-end capabilities flags
    var io = ig.igGetIO();
    io.*.BackendRendererName = "imgui_impl_opengl3";
    io.*.IniFilename = "workspace";
    // Sensible memory-friendly initial mouse position.
    io.*.MousePos = .{ .x = 0, .y = 0 };

    // Store GLSL version string so we can refer to it later in case we recreate shaders.
    // Note: GLSL version is NOT the same as GL version. Leave this to NULL if unsure.
    var glsl_version: [:0]const u8 = undefined;
    if (glsl_version_opt) |value| {
        glsl_version = value;
    } else {
        glsl_version = "#version 130";
    }

    std.debug.assert(glsl_version.len + 2 < g_GlslVersionStringMem.len);
    std.mem.copy(u8, g_GlslVersionStringMem[0..glsl_version.len], glsl_version);
    g_GlslVersionStringMem[glsl_version.len] = '\n';
    g_GlslVersionStringMem[glsl_version.len + 1] = 0;
    g_GlslVersionString = g_GlslVersionStringMem[0..glsl_version.len];

    // Make a dummy GL call (we don't actually need the result)
    // IF YOU GET A CRASH HERE: it probably means that you haven't initialized the OpenGL function loader used by this code.
    // Desktop OpenGL 3/4 need a function loader. See the IMGUI_IMPL_OPENGL_LOADER_xxx explanation above.
    var current_texture: gl.GLint = undefined;
    gl.glGetIntegerv(gl.GL_TEXTURE_BINDING_2D, &current_texture);

    CreateDeviceObjects();

    io.*.KeyMap[ig.ImGuiKey_Tab] = glfw.GLFW_KEY_TAB;
    io.*.KeyMap[ig.ImGuiKey_Home] = glfw.GLFW_KEY_HOME;
    io.*.KeyMap[ig.ImGuiKey_Insert] = glfw.GLFW_KEY_INSERT;
    io.*.KeyMap[ig.ImGuiKey_KeyPadEnter] = glfw.GLFW_KEY_KP_ENTER;
    io.*.KeyMap[ig.ImGuiKey_Escape] = glfw.GLFW_KEY_ESCAPE;
    io.*.KeyMap[ig.ImGuiKey_Backspace] = glfw.GLFW_KEY_BACKSPACE;
    io.*.KeyMap[ig.ImGuiKey_End] = glfw.GLFW_KEY_END;
    io.*.KeyMap[ig.ImGuiKey_Enter] = glfw.GLFW_KEY_ENTER;

    io.*.KeyMap[ig.ImGuiKey_LeftArrow] = glfw.GLFW_KEY_LEFT;
    io.*.KeyMap[ig.ImGuiKey_RightArrow] = glfw.GLFW_KEY_RIGHT;
    io.*.KeyMap[ig.ImGuiKey_UpArrow] = glfw.GLFW_KEY_UP;
    io.*.KeyMap[ig.ImGuiKey_DownArrow] = glfw.GLFW_KEY_DOWN;

    io.*.KeyMap[ig.ImGuiKey_PageUp] = glfw.GLFW_KEY_PAGE_UP;
    io.*.KeyMap[ig.ImGuiKey_PageDown] = glfw.GLFW_KEY_PAGE_DOWN;
    io.*.KeyMap[ig.ImGuiKey_Space] = glfw.GLFW_KEY_SPACE;
    io.*.KeyMap[ig.ImGuiKey_V] = glfw.GLFW_KEY_V;
    io.*.KeyMap[ig.ImGuiKey_X] = glfw.GLFW_KEY_X;
    io.*.KeyMap[ig.ImGuiKey_Z] = glfw.GLFW_KEY_Z;
    io.*.KeyMap[ig.ImGuiKey_A] = glfw.GLFW_KEY_A;
    io.*.KeyMap[ig.ImGuiKey_C] = glfw.GLFW_KEY_C;
}

pub fn Shutdown() void {
    DestroyDeviceObjects();
}

fn SetupRenderState(draw_data: *ig.ImDrawData, fb_width: c_int, fb_height: c_int, vertex_array_object: gl.GLuint) void {
    // Setup render state: alpha-blending enabled, no face culling, no depth testing, scissor enabled, polygon fill
    gl.glEnable(gl.GL_BLEND);
    gl.glBlendEquation(gl.GL_FUNC_ADD);
    gl.glBlendFunc(gl.GL_SRC_ALPHA, gl.GL_ONE_MINUS_SRC_ALPHA);
    gl.glDisable(gl.GL_CULL_FACE);
    gl.glDisable(gl.GL_DEPTH_TEST);
    gl.glEnable(gl.GL_SCISSOR_TEST);
    if (@hasDecl(gl, "glPolygonMode")) {
        gl.glPolygonMode(gl.GL_FRONT_AND_BACK, gl.GL_FILL);
    }

    // Setup viewport, orthographic projection matrix
    // Our visible imgui space lies from draw_data.DisplayPos (top left) to draw_data.DisplayPos+data_data.DisplaySize (bottom right). DisplayPos is (0,0) for single viewport apps.
    gl.glViewport(0, 0, @intCast(gl.GLsizei, fb_width), @intCast(gl.GLsizei, fb_height));
    var L = draw_data.DisplayPos.x;
    var R = draw_data.DisplayPos.x + draw_data.DisplaySize.x;
    var T = draw_data.DisplayPos.y;
    var B = draw_data.DisplayPos.y + draw_data.DisplaySize.y;
    const ortho_projection = [4][4]f32{
        [4]f32{ 2.0 / (R - L), 0.0, 0.0, 0.0 },
        [4]f32{ 0.0, 2.0 / (T - B), 0.0, 0.0 },
        [4]f32{ 0.0, 0.0, -1.0, 0.0 },
        [4]f32{ (R + L) / (L - R), (T + B) / (B - T), 0.0, 1.0 },
    };
    var shader = zt.gl.Shader.from(g_ShaderHandle);
    shader.bind();
    gl.glUniform1i(g_AttribLocationTex, 0);
    gl.glUniformMatrix4fv(g_AttribLocationProjMtx, 1, gl.GL_FALSE, &ortho_projection[0][0]);
    if (@hasDecl(gl, "glBindSampler")) {
        gl.glBindSampler(0, 0);
    }

    gl.glBindVertexArray(vertex_array_object);
    gl.glBindBuffer(gl.GL_ARRAY_BUFFER, g_VboHandle);
    gl.glBindBuffer(gl.GL_ELEMENT_ARRAY_BUFFER, g_ElementsHandle);
    gl.glEnableVertexAttribArray(@intCast(c_uint, g_AttribLocationVtxPos));
    gl.glEnableVertexAttribArray(@intCast(c_uint, g_AttribLocationVtxUV));
    gl.glEnableVertexAttribArray(@intCast(c_uint, g_AttribLocationVtxColor));
    gl.glVertexAttribPointer(
        @intCast(c_uint, g_AttribLocationVtxPos),
        2,
        gl.GL_FLOAT,
        gl.GL_FALSE,
        @sizeOf(ig.ImDrawVert),
        @intToPtr(?*c_void, @offsetOf(ig.ImDrawVert, "pos")),
    );
    gl.glVertexAttribPointer(
        @intCast(c_uint, g_AttribLocationVtxUV),
        2,
        gl.GL_FLOAT,
        gl.GL_FALSE,
        @sizeOf(ig.ImDrawVert),
        @intToPtr(?*c_void, @offsetOf(ig.ImDrawVert, "uv")),
    );
    gl.glVertexAttribPointer(
        @intCast(c_uint, g_AttribLocationVtxColor),
        4,
        gl.GL_UNSIGNED_BYTE,
        gl.GL_TRUE,
        @sizeOf(ig.ImDrawVert),
        @intToPtr(?*c_void, @offsetOf(ig.ImDrawVert, "col")),
    );
}

fn getGLInt(name: gl.GLenum) gl.GLint {
    var value: gl.GLint = undefined;
    gl.glGetIntegerv(name, &value);
    return value;
}
fn getGLInts(name: gl.GLenum, comptime N: comptime_int) [N]gl.GLint {
    var value: [N]gl.GLint = undefined;
    gl.glGetIntegerv(name, &value);
    return value;
}

pub fn RenderDrawData(draw_data: *ig.ImDrawData) void {
    // Avoid rendering when minimized, scale coordinates for retina displays (screen coordinates != framebuffer coordinates)
    var fb_width = @floatToInt(c_int, draw_data.DisplaySize.x * draw_data.FramebufferScale.x);
    var fb_height = @floatToInt(c_int, draw_data.DisplaySize.y * draw_data.FramebufferScale.y);
    if (fb_width <= 0 or fb_height <= 0)
        return;

    var vertex_array_object: gl.GLuint = 0;
    gl.glGenVertexArrays(1, &vertex_array_object);
    SetupRenderState(draw_data, fb_width, fb_height, vertex_array_object);

    var clip_off = draw_data.DisplayPos; // (0,0) unless using multi-viewports
    var clip_scale = draw_data.FramebufferScale; // (1,1) unless using retina display which are often (2,2)

    if (draw_data.CmdListsCount > 0) {
        for (draw_data.CmdLists.?[0..@intCast(usize, draw_data.CmdListsCount)]) |cmd_list| {
            // Upload vertex/index buffers
            gl.glBufferData(gl.GL_ARRAY_BUFFER, @intCast(gl.GLsizeiptr, cmd_list.*.VtxBuffer.Size * @sizeOf(ig.ImDrawVert)), cmd_list.*.VtxBuffer.Data, gl.GL_STREAM_DRAW);
            gl.glBufferData(gl.GL_ELEMENT_ARRAY_BUFFER, @intCast(gl.GLsizeiptr, cmd_list.*.IdxBuffer.Size * @sizeOf(ig.ImDrawIdx)), cmd_list.*.IdxBuffer.Data, gl.GL_STREAM_DRAW);

            for (cmd_list.*.CmdBuffer.Data[0..@intCast(usize, cmd_list.*.CmdBuffer.Size)]) |pcmd| {
                if (pcmd.UserCallback) |fnPtr| {
                    fnPtr(cmd_list, &pcmd);
                } else {
                    // Project scissor/clipping rectangles into framebuffer space
                    var clip_rect = ig.ImVec4{
                        .x = (pcmd.ClipRect.x - clip_off.x) * clip_scale.x,
                        .y = (pcmd.ClipRect.y - clip_off.y) * clip_scale.y,
                        .z = (pcmd.ClipRect.z - clip_off.x) * clip_scale.x,
                        .w = (pcmd.ClipRect.w - clip_off.y) * clip_scale.y,
                    };

                    if (clip_rect.x < @intToFloat(f32, fb_width) and clip_rect.y < @intToFloat(f32, fb_height) and clip_rect.z >= 0.0 and clip_rect.w >= 0.0) {
                        gl.glScissor(@floatToInt(c_int, clip_rect.x), fb_height - @floatToInt(c_int, clip_rect.w), @floatToInt(c_int, clip_rect.z - clip_rect.x), @floatToInt(c_int, clip_rect.w - clip_rect.y));

                        // Bind texture, Draw
                        var texture = zt.gl.Texture.from(@intCast(gl.GLuint, @ptrToInt(pcmd.TextureId)), false);
                        texture.bind();
                        if (g_GlVersion >= 3200) {
                            gl.glDrawElementsBaseVertex(
                                gl.GL_TRIANGLES,
                                @intCast(gl.GLsizei, pcmd.ElemCount),
                                if (@sizeOf(ig.ImDrawIdx) == 2) gl.GL_UNSIGNED_SHORT else gl.GL_UNSIGNED_INT,
                                @intToPtr(?*const c_void, pcmd.IdxOffset * @sizeOf(ig.ImDrawIdx)),
                                @intCast(gl.GLint, pcmd.VtxOffset),
                            );
                        } else {
                            gl.glDrawElements(
                                gl.GL_TRIANGLES,
                                @intCast(gl.GLsizei, pcmd.ElemCount),
                                if (@sizeOf(ig.ImDrawIdx) == 2) gl.GL_UNSIGNED_SHORT else gl.GL_UNSIGNED_INT,
                                @intToPtr(?*const c_void, pcmd.IdxOffset * @sizeOf(ig.ImDrawIdx)),
                            );
                        }
                    }
                }
            }
        }
    }

    // Destroy the temporary VAO
    gl.glDeleteVertexArrays(1, &vertex_array_object);
    gl.glScissor(0, 0, fb_width, fb_height);
}

fn CreateFontsTexture() bool {
    // Build texture atlas
    const io = ig.igGetIO();
    var pixels: [*c]u8 = undefined;
    var width: i32 = undefined;
    var height: i32 = undefined;
    ig.ImFontAtlas_GetTexDataAsRGBA32(io.*.Fonts, &pixels, &width, &height, null); // Load as RGBA 32-bit (75% of the memory is wasted, but default font is so small) because it is more likely to be compatible with user's existing shaders. If your ImTextureId represent a hig.igher-level concept than just a GL texture id, consider calling GetTexDataAsAlpha8() instead to save on GPU memory.

    // Upload texture to graphics system
    gl.glGenTextures(1, &g_FontTexture);
    gl.glBindTexture(gl.GL_TEXTURE_2D, g_FontTexture);
    gl.glTexParameteri(gl.GL_TEXTURE_2D, gl.GL_TEXTURE_MIN_FILTER, gl.GL_LINEAR);
    gl.glTexParameteri(gl.GL_TEXTURE_2D, gl.GL_TEXTURE_MAG_FILTER, gl.GL_LINEAR);
    if (@hasDecl(gl, "gl.GL_UNPACK_ROW_LENGTH"))
        gl.glPixelStorei(gl.GL_UNPACK_ROW_LENGTH, 0);
    gl.glTexImage2D(gl.GL_TEXTURE_2D, 0, gl.GL_RGBA, width, height, 0, gl.GL_RGBA, gl.GL_UNSIGNED_BYTE, pixels);

    // Store our identifier
    io.*.Fonts.*.TexID = @intToPtr(*c_void, g_FontTexture);

    return true;
}

fn DestroyFontsTexture() void {
    if (g_FontTexture != 0) {
        const io = ig.igGetIO();
        gl.glDeleteTextures(1, &g_FontTexture);
        io.*.Fonts.*.TexID = null;
        g_FontTexture = 0;
    }
}

fn CreateDeviceObjects() void {
    // Parse GLSL version string
    var glsl_version: u32 = 130;

    const numberPart = g_GlslVersionStringMem["#version ".len..g_GlslVersionString.len];

    if (std.fmt.parseInt(u32, numberPart, 10)) |value| {
        glsl_version = value;
    } else |_| {
        std.debug.warn("Couldn't parse glsl version from '{any}', '{any}'\n", .{ g_GlslVersionString, numberPart });
    }

    const vertex_shader_glsl_120 = "uniform mat4 ProjMtx;\n" ++
        "attribute vec2 Position;\n" ++
        "attribute vec2 UV;\n" ++
        "attribute vec4 Color;\n" ++
        "varying vec2 Frag_UV;\n" ++
        "varying vec4 Frag_Color;\n" ++
        "void main()\n" ++
        "{\n" ++
        "    Frag_UV = UV;\n" ++
        "    Frag_Color = Color;\n" ++
        "    gl_Position = ProjMtx * vec4(Position.xy,0,1);\n" ++
        "}\n";

    const vertex_shader_glsl_130 = "uniform mat4 ProjMtx;\n" ++
        "in vec2 Position;\n" ++
        "in vec2 UV;\n" ++
        "in vec4 Color;\n" ++
        "out vec2 Frag_UV;\n" ++
        "out vec4 Frag_Color;\n" ++
        "void main()\n" ++
        "{\n" ++
        "    Frag_UV = UV;\n" ++
        "    Frag_Color = Color;\n" ++
        "    gl_Position = ProjMtx * vec4(Position.xy,0,1);\n" ++
        "}\n";

    const vertex_shader_glsl_300_es = "precision mediump float;\n" ++
        "layout (location = 0) in vec2 Position;\n" ++
        "layout (location = 1) in vec2 UV;\n" ++
        "layout (location = 2) in vec4 Color;\n" ++
        "uniform mat4 ProjMtx;\n" ++
        "out vec2 Frag_UV;\n" ++
        "out vec4 Frag_Color;\n" ++
        "void main()\n" ++
        "{\n" ++
        "    Frag_UV = UV;\n" ++
        "    Frag_Color = Color;\n" ++
        "    gl_Position = ProjMtx * vec4(Position.xy,0,1);\n" ++
        "}\n";

    const vertex_shader_glsl_410_core = "layout (location = 0) in vec2 Position;\n" ++
        "layout (location = 1) in vec2 UV;\n" ++
        "layout (location = 2) in vec4 Color;\n" ++
        "uniform mat4 ProjMtx;\n" ++
        "out vec2 Frag_UV;\n" ++
        "out vec4 Frag_Color;\n" ++
        "void main()\n" ++
        "{\n" ++
        "    Frag_UV = UV;\n" ++
        "    Frag_Color = Color;\n" ++
        "    gl_Position = ProjMtx * vec4(Position.xy,0,1);\n" ++
        "}\n";

    const fragment_shader_glsl_120 = "#ifdef gl.GL_ES\n" ++
        "    precision mediump float;\n" ++
        "#endif\n" ++
        "uniform sampler2D Texture;\n" ++
        "varying vec2 Frag_UV;\n" ++
        "varying vec4 Frag_Color;\n" ++
        "void main()\n" ++
        "{\n" ++
        "    gl_FragColor = Frag_Color * texture2D(Texture, Frag_UV.st);\n" ++
        "}\n";

    const fragment_shader_glsl_130 = "uniform sampler2D Texture;\n" ++
        "in vec2 Frag_UV;\n" ++
        "in vec4 Frag_Color;\n" ++
        "out vec4 Out_Color;\n" ++
        "void main()\n" ++
        "{\n" ++
        "    Out_Color = Frag_Color * texture(Texture, Frag_UV.st);\n" ++
        "}\n";

    const fragment_shader_glsl_300_es = "precision mediump float;\n" ++
        "uniform sampler2D Texture;\n" ++
        "in vec2 Frag_UV;\n" ++
        "in vec4 Frag_Color;\n" ++
        "layout (location = 0) out vec4 Out_Color;\n" ++
        "void main()\n" ++
        "{\n" ++
        "    Out_Color = Frag_Color * texture(Texture, Frag_UV.st);\n" ++
        "}\n";

    const fragment_shader_glsl_410_core = "in vec2 Frag_UV;\n" ++
        "in vec4 Frag_Color;\n" ++
        "uniform sampler2D Texture;\n" ++
        "layout (location = 0) out vec4 Out_Color;\n" ++
        "void main()\n" ++
        "{\n" ++
        "    Out_Color = Frag_Color * texture(Texture, Frag_UV.st);\n" ++
        "}\n";

    // Select shaders matching our GLSL versions
    var vertex_shader: [*]const u8 = undefined;
    var fragment_shader: [*]const u8 = undefined;
    if (glsl_version < 130) {
        vertex_shader = vertex_shader_glsl_120;
        fragment_shader = fragment_shader_glsl_120;
    } else if (glsl_version >= 410) {
        vertex_shader = vertex_shader_glsl_410_core;
        fragment_shader = fragment_shader_glsl_410_core;
    } else if (glsl_version == 300) {
        vertex_shader = vertex_shader_glsl_300_es;
        fragment_shader = fragment_shader_glsl_300_es;
    } else {
        vertex_shader = vertex_shader_glsl_130;
        fragment_shader = fragment_shader_glsl_130;
    }

    // Create shaders
    const vertex_shader_with_version = [_][*]const u8{ &g_GlslVersionStringMem, vertex_shader };
    g_VertHandle = gl.glCreateShader(gl.GL_VERTEX_SHADER);
    gl.glShaderSource(g_VertHandle, 2, &vertex_shader_with_version, null);
    gl.glCompileShader(g_VertHandle);

    const fragment_shader_with_version = [_][*]const u8{ &g_GlslVersionStringMem, fragment_shader };
    g_FragHandle = gl.glCreateShader(gl.GL_FRAGMENT_SHADER);
    gl.glShaderSource(g_FragHandle, 2, &fragment_shader_with_version, null);
    gl.glCompileShader(g_FragHandle);

    g_ShaderHandle = gl.glCreateProgram();
    gl.glAttachShader(g_ShaderHandle, g_VertHandle);
    gl.glAttachShader(g_ShaderHandle, g_FragHandle);
    gl.glLinkProgram(g_ShaderHandle);

    g_AttribLocationTex = gl.glGetUniformLocation(g_ShaderHandle, "Texture");
    g_AttribLocationProjMtx = gl.glGetUniformLocation(g_ShaderHandle, "ProjMtx");
    g_AttribLocationVtxPos = gl.glGetAttribLocation(g_ShaderHandle, "Position");
    g_AttribLocationVtxUV = gl.glGetAttribLocation(g_ShaderHandle, "UV");
    g_AttribLocationVtxColor = gl.glGetAttribLocation(g_ShaderHandle, "Color");

    // Create buffers
    gl.glGenBuffers(1, &g_VboHandle);
    gl.glGenBuffers(1, &g_ElementsHandle);

    _ = CreateFontsTexture();
}

fn DestroyDeviceObjects() void {
    if (g_VboHandle != 0) {
        gl.glDeleteBuffers(1, &g_VboHandle);
        g_VboHandle = 0;
    }
    if (g_ElementsHandle != 0) {
        gl.glDeleteBuffers(1, &g_ElementsHandle);
        g_ElementsHandle = 0;
    }
    if (g_ShaderHandle != 0 and g_VertHandle != 0) {
        gl.glDetachShader(g_ShaderHandle, g_VertHandle);
    }
    if (g_ShaderHandle != 0 and g_FragHandle != 0) {
        gl.glDetachShader(g_ShaderHandle, g_FragHandle);
    }
    if (g_VertHandle != 0) {
        gl.glDeleteShader(g_VertHandle);
        g_VertHandle = 0;
    }
    if (g_FragHandle != 0) {
        gl.glDeleteShader(g_FragHandle);
        g_FragHandle = 0;
    }
    if (g_ShaderHandle != 0) {
        gl.glDeleteProgram(g_ShaderHandle);
        g_ShaderHandle = 0;
    }

    DestroyFontsTexture();
}
