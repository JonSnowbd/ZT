const std = @import("std");
const glfw = @import("glfw");
const Texture = @import("texture.zig").Texture;
const Shader = @import("shaderprog.zig").Shader;
const gl = @import("gl");
usingnamespace gl;
usingnamespace @import("imgui");

// OpenGL Data
var g_GlVersion: GLuint = 0; // Extracted at runtime using GL_MAJOR_VERSION, GL_MINOR_VERSION queries.
var g_GlslVersionStringMem: [32]u8 = undefined; // Specified by user or detected based on compile time GL settings.
var g_GlslVersionString: []u8 = &g_GlslVersionStringMem; // slice of g_GlslVersionStringMem
var g_FontTexture: c_uint = 0;
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
    var ctx = igCreateContext(null);
    igSetCurrentContext(ctx);
    // Query for GL version
    var major: GLint = undefined;
    var minor: GLint = undefined;
    glGetIntegerv(GL_MAJOR_VERSION, &major);
    glGetIntegerv(GL_MINOR_VERSION, &minor);
    g_GlVersion = @intCast(GLuint, major * 1000 + minor);

    // Setup back-end capabilities flags
    var io = igGetIO();
    io.*.BackendRendererName = "imgui_impl_opengl3";
    io.*.IniFilename = "workspace";
    // Sensible memory-friendly initial mouse position.
    io.*.MousePos = .{.x=0,.y=0};

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
    var current_texture: GLint = undefined;
    glGetIntegerv(GL_TEXTURE_BINDING_2D, &current_texture);

    CreateDeviceObjects();

    io.*.KeyMap[ImGuiKey_Tab] = glfw.GLFW_KEY_TAB;
    io.*.KeyMap[ImGuiKey_Home] = glfw.GLFW_KEY_HOME;
    io.*.KeyMap[ImGuiKey_Insert] = glfw.GLFW_KEY_INSERT;
    io.*.KeyMap[ImGuiKey_KeyPadEnter] = glfw.GLFW_KEY_KP_ENTER;
    io.*.KeyMap[ImGuiKey_Escape] = glfw.GLFW_KEY_ESCAPE;
    io.*.KeyMap[ImGuiKey_Backspace] = glfw.GLFW_KEY_BACKSPACE;
    io.*.KeyMap[ImGuiKey_End] = glfw.GLFW_KEY_END;
    io.*.KeyMap[ImGuiKey_Enter] = glfw.GLFW_KEY_ENTER;

    io.*.KeyMap[ImGuiKey_LeftArrow] = glfw.GLFW_KEY_LEFT;
    io.*.KeyMap[ImGuiKey_RightArrow] = glfw.GLFW_KEY_RIGHT;
    io.*.KeyMap[ImGuiKey_UpArrow] = glfw.GLFW_KEY_UP;
    io.*.KeyMap[ImGuiKey_DownArrow] = glfw.GLFW_KEY_DOWN;

    io.*.KeyMap[ImGuiKey_PageUp] = glfw.GLFW_KEY_PAGE_UP;
    io.*.KeyMap[ImGuiKey_PageDown] = glfw.GLFW_KEY_PAGE_DOWN;
    io.*.KeyMap[ImGuiKey_Space] = glfw.GLFW_KEY_SPACE;
    io.*.KeyMap[ImGuiKey_V] = glfw.GLFW_KEY_V;
    io.*.KeyMap[ImGuiKey_X] = glfw.GLFW_KEY_X;
    io.*.KeyMap[ImGuiKey_Z] = glfw.GLFW_KEY_Z;
    io.*.KeyMap[ImGuiKey_A] = glfw.GLFW_KEY_A;
    io.*.KeyMap[ImGuiKey_C] = glfw.GLFW_KEY_C;
}

pub fn Shutdown() void {
    DestroyDeviceObjects();
}

fn SetupRenderState(draw_data: *ImDrawData, fb_width: c_int, fb_height: c_int, vertex_array_object: GLuint) void {
    // Setup render state: alpha-blending enabled, no face culling, no depth testing, scissor enabled, polygon fill
    glEnable(GL_BLEND);
    glBlendEquation(GL_FUNC_ADD);
    glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
    glDisable(GL_CULL_FACE);
    glDisable(GL_DEPTH_TEST);
    glEnable(GL_SCISSOR_TEST);
    if (@hasDecl(gl, "glPolygonMode")) {
        glPolygonMode(GL_FRONT_AND_BACK, GL_FILL);
    }

    // Setup viewport, orthographic projection matrix
    // Our visible imgui space lies from draw_data.DisplayPos (top left) to draw_data.DisplayPos+data_data.DisplaySize (bottom right). DisplayPos is (0,0) for single viewport apps.
    glViewport(0, 0, @intCast(GLsizei, fb_width), @intCast(GLsizei, fb_height));
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
    var shader = Shader.from(g_ShaderHandle);
    shader.bind();
    glUniform1i(g_AttribLocationTex, 0);
    glUniformMatrix4fv(g_AttribLocationProjMtx, 1, GL_FALSE, &ortho_projection[0][0]);
    if (@hasDecl(gl, "glBindSampler")) {
        glBindSampler(0, 0);
    }

    glBindVertexArray(vertex_array_object);
    glBindBuffer(GL_ARRAY_BUFFER, g_VboHandle);
    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, g_ElementsHandle);
    glEnableVertexAttribArray(@intCast(c_uint, g_AttribLocationVtxPos));
    glEnableVertexAttribArray(@intCast(c_uint, g_AttribLocationVtxUV));
    glEnableVertexAttribArray(@intCast(c_uint, g_AttribLocationVtxColor));
    glVertexAttribPointer(
        @intCast(c_uint, g_AttribLocationVtxPos),
        2,
        GL_FLOAT,
        GL_FALSE,
        @sizeOf(ImDrawVert),
        @intToPtr(?*c_void, @offsetOf(ImDrawVert, "pos")),
    );
    glVertexAttribPointer(
        @intCast(c_uint, g_AttribLocationVtxUV),
        2,
        GL_FLOAT,
        GL_FALSE,
        @sizeOf(ImDrawVert),
        @intToPtr(?*c_void, @offsetOf(ImDrawVert, "uv")),
    );
    glVertexAttribPointer(
        @intCast(c_uint, g_AttribLocationVtxColor),
        4,
        GL_UNSIGNED_BYTE,
        GL_TRUE,
        @sizeOf(ImDrawVert),
        @intToPtr(?*c_void, @offsetOf(ImDrawVert, "col")),
    );
}

fn getGLInt(name: GLenum) GLint {
    var value: GLint = undefined;
    glGetIntegerv(name, &value);
    return value;
}
fn getGLInts(name: GLenum, comptime N: comptime_int) [N]GLint {
    var value: [N]GLint = undefined;
    glGetIntegerv(name, &value);
    return value;
}

pub fn RenderDrawData(draw_data: *ImDrawData) void {
    // Avoid rendering when minimized, scale coordinates for retina displays (screen coordinates != framebuffer coordinates)
    var fb_width = @floatToInt(c_int, draw_data.DisplaySize.x * draw_data.FramebufferScale.x);
    var fb_height = @floatToInt(c_int, draw_data.DisplaySize.y * draw_data.FramebufferScale.y);
    if (fb_width <= 0 or fb_height <= 0)
        return;

    var vertex_array_object: GLuint = 0;
    glGenVertexArrays(1, &vertex_array_object);
    SetupRenderState(draw_data, fb_width, fb_height, vertex_array_object);

    var clip_off = draw_data.DisplayPos; // (0,0) unless using multi-viewports
    var clip_scale = draw_data.FramebufferScale; // (1,1) unless using retina display which are often (2,2)

    if (draw_data.CmdListsCount > 0) {
        for (draw_data.CmdLists.?[0..@intCast(usize, draw_data.CmdListsCount)]) |cmd_list| {
            // Upload vertex/index buffers
            glBufferData(GL_ARRAY_BUFFER, @intCast(GLsizeiptr, cmd_list.*.VtxBuffer.Size * @sizeOf(ImDrawVert)), cmd_list.*.VtxBuffer.Data, GL_STREAM_DRAW);
            glBufferData(GL_ELEMENT_ARRAY_BUFFER, @intCast(GLsizeiptr, cmd_list.*.IdxBuffer.Size * @sizeOf(ImDrawIdx)), cmd_list.*.IdxBuffer.Data, GL_STREAM_DRAW);

            for (cmd_list.*.CmdBuffer.Data[0..@intCast(usize, cmd_list.*.CmdBuffer.Size)]) |pcmd| {
                if (pcmd.UserCallback) |fnPtr| {
                    fnPtr(cmd_list, &pcmd);
                } else {
                    // Project scissor/clipping rectangles into framebuffer space
                    var clip_rect = ImVec4{
                        .x = (pcmd.ClipRect.x - clip_off.x) * clip_scale.x,
                        .y = (pcmd.ClipRect.y - clip_off.y) * clip_scale.y,
                        .z = (pcmd.ClipRect.z - clip_off.x) * clip_scale.x,
                        .w = (pcmd.ClipRect.w - clip_off.y) * clip_scale.y,
                    };

                    if (clip_rect.x < @intToFloat(f32, fb_width) and clip_rect.y < @intToFloat(f32, fb_height) and clip_rect.z >= 0.0 and clip_rect.w >= 0.0) {
                        glScissor(@floatToInt(c_int, clip_rect.x), fb_height - @floatToInt(c_int, clip_rect.w), @floatToInt(c_int, clip_rect.z - clip_rect.x), @floatToInt(c_int, clip_rect.w - clip_rect.y));

                        // Bind texture, Draw
                        var texture = Texture.from(@intCast(GLuint, @ptrToInt(pcmd.TextureId)));
                        texture.bind();
                        if (g_GlVersion >= 3200) {
                            glDrawElementsBaseVertex(
                                GL_TRIANGLES,
                                @intCast(GLsizei, pcmd.ElemCount),
                                if (@sizeOf(ImDrawIdx) == 2) GL_UNSIGNED_SHORT else GL_UNSIGNED_INT,
                                @intToPtr(?*const c_void, pcmd.IdxOffset * @sizeOf(ImDrawIdx)),
                                @intCast(GLint, pcmd.VtxOffset),
                            );
                        } else {
                            glDrawElements(
                                GL_TRIANGLES,
                                @intCast(GLsizei, pcmd.ElemCount),
                                if (@sizeOf(ImDrawIdx) == 2) GL_UNSIGNED_SHORT else GL_UNSIGNED_INT,
                                @intToPtr(?*const c_void, pcmd.IdxOffset * @sizeOf(ImDrawIdx)),
                            );
                        }
                    }
                }
            }
        }
    }

    // Destroy the temporary VAO
    glDeleteVertexArrays(1, &vertex_array_object);
    glScissor(0, 0, fb_width, fb_height);
}

fn CreateFontsTexture() bool {
    // Build texture atlas
    const io = igGetIO();
    var pixels: [*c]u8 = undefined;
    var width: i32 = undefined;
    var height: i32 = undefined;
    ImFontAtlas_GetTexDataAsRGBA32(io.*.Fonts, &pixels, &width, &height, null); // Load as RGBA 32-bit (75% of the memory is wasted, but default font is so small) because it is more likely to be compatible with user's existing shaders. If your ImTextureId represent a higher-level concept than just a GL texture id, consider calling GetTexDataAsAlpha8() instead to save on GPU memory.

    // Upload texture to graphics system
    glGenTextures(1, &g_FontTexture);
    glBindTexture(GL_TEXTURE_2D, g_FontTexture);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    if (@hasDecl(gl, "GL_UNPACK_ROW_LENGTH"))
        glPixelStorei(GL_UNPACK_ROW_LENGTH, 0);
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, width, height, 0, GL_RGBA, GL_UNSIGNED_BYTE, pixels);

    // Store our identifier
    io.*.Fonts.*.TexID = @intToPtr(*c_void, g_FontTexture);

    return true;
}

fn DestroyFontsTexture() void {
    if (g_FontTexture != 0) {
        const io = igGetIO();
        glDeleteTextures(1, &g_FontTexture);
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
    } else |err| {
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

    const fragment_shader_glsl_120 = "#ifdef GL_ES\n" ++
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
    g_VertHandle = glCreateShader(GL_VERTEX_SHADER);
    glShaderSource(g_VertHandle, 2, &vertex_shader_with_version, null);
    glCompileShader(g_VertHandle);

    const fragment_shader_with_version = [_][*]const u8{ &g_GlslVersionStringMem, fragment_shader };
    g_FragHandle = glCreateShader(GL_FRAGMENT_SHADER);
    glShaderSource(g_FragHandle, 2, &fragment_shader_with_version, null);
    glCompileShader(g_FragHandle);

    g_ShaderHandle = glCreateProgram();
    glAttachShader(g_ShaderHandle, g_VertHandle);
    glAttachShader(g_ShaderHandle, g_FragHandle);
    glLinkProgram(g_ShaderHandle);

    g_AttribLocationTex = glGetUniformLocation(g_ShaderHandle, "Texture");
    g_AttribLocationProjMtx = glGetUniformLocation(g_ShaderHandle, "ProjMtx");
    g_AttribLocationVtxPos = glGetAttribLocation(g_ShaderHandle, "Position");
    g_AttribLocationVtxUV = glGetAttribLocation(g_ShaderHandle, "UV");
    g_AttribLocationVtxColor = glGetAttribLocation(g_ShaderHandle, "Color");

    // Create buffers
    glGenBuffers(1, &g_VboHandle);
    glGenBuffers(1, &g_ElementsHandle);

    _ = CreateFontsTexture();
}

fn DestroyDeviceObjects() void {
    if (g_VboHandle != 0) {
        glDeleteBuffers(1, &g_VboHandle);
        g_VboHandle = 0;
    }
    if (g_ElementsHandle != 0) {
        glDeleteBuffers(1, &g_ElementsHandle);
        g_ElementsHandle = 0;
    }
    if (g_ShaderHandle != 0 and g_VertHandle != 0) {
        glDetachShader(g_ShaderHandle, g_VertHandle);
    }
    if (g_ShaderHandle != 0 and g_FragHandle != 0) {
        glDetachShader(g_ShaderHandle, g_FragHandle);
    }
    if (g_VertHandle != 0) {
        glDeleteShader(g_VertHandle);
        g_VertHandle = 0;
    }
    if (g_FragHandle != 0) {
        glDeleteShader(g_FragHandle);
        g_FragHandle = 0;
    }
    if (g_ShaderHandle != 0) {
        glDeleteProgram(g_ShaderHandle);
        g_ShaderHandle = 0;
    }

    DestroyFontsTexture();
}
