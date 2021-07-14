const gl = @import("gl");
const std = @import("std");

const zt = @import("../zt.zig");

usingnamespace gl;

fn glErr(msg: []const u8) void {
    if (std.builtin.mode == .Debug) {
        var err = glGetError();
        while (err != GL_NO_ERROR) {
            switch (err) {
                GL_INVALID_ENUM => {
                    std.debug.print("{s}\nOPENGL ERROR: INVALID ENUM\n", .{msg});
                },
                GL_INVALID_VALUE => {
                    std.debug.print("{s}\nOPENGL ERROR: INVALID VALUE\n", .{msg});
                },
                GL_INVALID_OPERATION => {
                    std.debug.print("{s}\nOPENGL ERROR: INVALID OPERATION\n", .{msg});
                },
                GL_OUT_OF_MEMORY => {
                    std.debug.print("{s}\nOPENGL ERROR: OUT OF MEMORY\n", .{msg});
                },
                else => {
                    std.debug.print("{s}\nOPENGL ERROR: UNKNOWN ERROR\n", .{msg});
                },
            }

            err = glGetError();
        }
    }
}

/// Provide T as a struct to represent a vertex. Compatible types inside of struct are:
/// `f32, zt.math.Vec2, zt.math.Vec3, zt.math.Vec4`
/// and each will be mapped in order to vert shader's layout indices.
/// The resulting buffer can contain many quads and tris together.
/// V is a maximum vertex count before flush is requested by an error on add*() functions.
pub fn GenerateBuffer(comptime T: type, comptime V: usize) type {
    return struct {
        vaoId: c_uint = undefined,
        vboId: c_uint = undefined,
        iboId: c_uint = undefined,

        vertices: [V]T = undefined,
        vertCount: usize = 0,
        // Worst case scenario every single draw is a quad, so * 6.
        indices: [V * 6]c_uint = undefined,
        indCount: usize = 0,
        shader: zt.gl.Shader = undefined,

        dirty: bool = true,

        pub fn init(shader: zt.gl.Shader) @This() {
            var self = @This(){};
            self.shader = shader;

            glGenBuffers(1, &self.vboId);
            glGenBuffers(1, &self.iboId);

            // Create VAO
            glGenVertexArrays(1, &self.vaoId);

            glBindVertexArray(self.vaoId);
            glBindBuffer(GL_ARRAY_BUFFER, self.vboId);
            glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, self.iboId);

            var currentOffset: usize = 0;
            var stride: c_int = @intCast(c_int, @sizeOf(T));

            inline for (std.meta.fields(T)) |field, i| {
                switch (field.field_type) {
                    f32 => {
                        glVertexAttribPointer(@intCast(c_uint, i), 1, GL_FLOAT, GL_FALSE, stride, @intToPtr(*allowzero c_void, currentOffset));
                        glEnableVertexAttribArray(@intCast(c_uint, i));
                        currentOffset += 4;
                    },
                    zt.math.Vec2 => {
                        glVertexAttribPointer(@intCast(c_uint, i), 2, GL_FLOAT, GL_FALSE, stride, @intToPtr(*allowzero c_void, currentOffset));
                        glEnableVertexAttribArray(@intCast(c_uint, i));
                        currentOffset += 8;
                    },
                    zt.math.Vec3 => {
                        glVertexAttribPointer(@intCast(c_uint, i), 3, GL_FLOAT, GL_FALSE, stride, @intToPtr(*allowzero c_void, currentOffset));
                        glEnableVertexAttribArray(@intCast(c_uint, i));
                        currentOffset += 12;
                    },
                    zt.math.Vec4 => {
                        glVertexAttribPointer(@intCast(c_uint, i), 4, GL_FLOAT, GL_FALSE, stride, @intToPtr(*allowzero c_void, currentOffset));
                        glEnableVertexAttribArray(@intCast(c_uint, i));
                        currentOffset += 16;
                    },
                    else => {
                        @compileError("Vertex Struct had types incompatible with automatic buffers.");
                    },
                }
            }

            glBindVertexArray(0);
            return self;
        }
        pub fn deinit(self: *@This()) void {
            glDeleteVertexArrays(1, &self.vaoId);
            glDeleteBuffers(1, &self.vboId);
            glDeleteBuffers(1, &self.iboId);
            glErr("Deleting the buffers:");
        }
        pub fn bind(self: *@This()) void {
            glBindVertexArray(self.vaoId);
            self.shader.bind();
            glBindBuffer(GL_ARRAY_BUFFER, self.vboId);
            glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, self.iboId);
            glErr("Binding the buffers:");
        }
        pub fn unbind(self: *@This()) void {
            _ = self;
            glBindVertexArray(0);
            self.shader.unbind();
            glBindBuffer(GL_ARRAY_BUFFER, 0);
            glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, 0);
            glErr("Unbinding the buffers:");
        }
        pub fn clear(self: *@This()) void {
            self.vertCount = 0;
            self.indCount = 0;
            self.dirty = true;
        }

        pub fn addTri(self: *@This(), v1: T, v2: T, v3: T) !void {
            if (self.vertCount + 3 >= V) {
                return error.NeedsFlush;
            }
            self.vertices[self.vertCount + 0] = v1;
            self.vertices[self.vertCount + 1] = v2;
            self.vertices[self.vertCount + 2] = v3;

            self.indices[self.indCount + 0] = (@intCast(c_uint, self.vertCount + 0));
            self.indices[self.indCount + 1] = (@intCast(c_uint, self.vertCount + 1));
            self.indices[self.indCount + 2] = (@intCast(c_uint, self.vertCount + 2));

            self.indCount += 3;
            self.vertCount += 3;
            self.dirty = true;
        }
        pub fn addQuad(self: *@This(), bl: T, tl: T, tr: T, br: T) !void {
            if (self.vertCount + 4 >= V) {
                return error.NeedsFlush;
            }
            self.vertices[self.vertCount + 0] = bl;
            self.vertices[self.vertCount + 1] = tl;
            self.vertices[self.vertCount + 2] = tr;
            self.vertices[self.vertCount + 3] = br;

            self.indices[self.indCount + 0] = @intCast(c_uint, self.vertCount + 0);
            self.indices[self.indCount + 1] = @intCast(c_uint, self.vertCount + 1);
            self.indices[self.indCount + 2] = @intCast(c_uint, self.vertCount + 3);
            self.indices[self.indCount + 3] = @intCast(c_uint, self.vertCount + 1);
            self.indices[self.indCount + 4] = @intCast(c_uint, self.vertCount + 2);
            self.indices[self.indCount + 5] = @intCast(c_uint, self.vertCount + 3);

            self.vertCount += 4;
            self.indCount += 6;
            self.dirty = true;
        }
        /// Commits to opengl with the currently added sprites in a static memory location. Use this if you are going
        /// to very rarely push again. You can still flush as many times as needed.
        pub fn pushStatic(self: *@This()) void {
            if (!self.dirty) {
                return;
            }
            self.bind();
            var vertSize: c_longlong = @intCast(c_longlong, @sizeOf(T) * self.vertCount);
            var indSize: c_longlong = @intCast(c_longlong, @sizeOf(c_uint) * self.indCount);
            glBufferData(GL_ARRAY_BUFFER, vertSize, &self.vertices, GL_STATIC_DRAW);
            glBufferData(GL_ELEMENT_ARRAY_BUFFER, indSize, &self.indices, GL_STATIC_DRAW);
            self.unbind();
            self.dirty = false;
        }
        /// Commits to opengl with the currently added sprites in a dynamic memory location. Use this if you are pushing
        /// and flushing once a frame.
        pub fn pushDynamic(self: *@This()) void {
            if (!self.dirty) {
                return;
            }
            self.bind();
            var vertSize: c_longlong = @intCast(c_longlong, @sizeOf(T) * self.vertCount);
            var indSize: c_longlong = @intCast(c_longlong, @sizeOf(c_uint) * self.indCount);
            glBufferData(GL_ARRAY_BUFFER, vertSize, self.vertices[0..self.vertCount], GL_DYNAMIC_DRAW);
            glBufferData(GL_ELEMENT_ARRAY_BUFFER, indSize, self.indices[0..self.indCount], GL_DYNAMIC_DRAW);
            self.unbind();
            self.dirty = false;
        }
        /// Commits to opengl with the currently added sprites in a streaming memory location. Use this if you are going
        /// to be pushing and flushing multiple times per frame.
        pub fn pushStream(self: *@This()) void {
            if (!self.dirty) {
                return;
            }
            self.bind();
            var vertSize = @intCast(c_longlong, @sizeOf(T) * self.vertCount);
            var indSize = @intCast(c_longlong, @sizeOf(c_uint) * self.indCount);
            glBufferData(GL_ARRAY_BUFFER, vertSize, &self.vertices, GL_STREAM_DRAW);
            glBufferData(GL_ELEMENT_ARRAY_BUFFER, indSize, &self.indices, GL_STREAM_DRAW);
            self.unbind();
            self.dirty = false;
            glErr("Pushing the buffers:");
        }

        /// Draws the currently pushed data to the screen. Note the data is not cleared, leaving you the option to maintain
        /// the current vertices every frame if so desired.
        pub fn flush(self: *@This()) void {
            self.bind();
            glDrawElements(GL_TRIANGLES, @intCast(c_int, self.indCount), GL_UNSIGNED_INT, null);
            self.unbind();
            glErr("Flushing the buffers:");
        }

        pub fn setUniform(self: *@This(), comptime uniName: []const u8, uniform: anytype) void {
            _ = self;
            var loc: c_int = glGetUniformLocation(self.shader.id, uniName.ptr);
            self.shader.bind();
            if (loc != -1) {
                switch (@TypeOf(uniform)) {
                    bool => {
                        glUniform1i(loc, if(uniform) 1 else 0);
                        glErr("Setting a uniform bool(i32):");
                    },
                    i32 => {
                        glUniform1i(loc, uniform);
                        glErr("Setting a uniform i32:");
                    },
                    u32 => {
                        glUniform1ui(loc, uniform);
                        glErr("Setting a uniform u32:");
                    },
                    f32 => {
                        glUniform1f(loc, uniform);
                        glErr("Setting a uniform f32:");
                    },
                    zt.math.Vec2 => {
                        glUniform2f(loc, uniform.x, uniform.y);
                        glErr("Setting a uniform vec2:");
                    },
                    zt.math.Vec3 => {
                        glUniform3f(loc, uniform.x, uniform.y, uniform.z);
                        glErr("Setting a uniform vec3:");
                    },
                    zt.math.Vec4 => {
                        glUniform4f(loc, uniform.x, uniform.y, uniform.z, uniform.w);
                        glErr("Setting a uniform vec4:");
                    },
                    zt.math.Mat4 => {
                        glUniformMatrix4fv(loc, 1, 0, &uniform.inlined());
                        glErr("Setting a uniform mat4:");
                    },
                    else => {
                        @compileError("You cannot use that type in a genbuffer's uniform.");
                    },
                }
            }
            self.shader.unbind();
            glErr("Setting a uniform (location not found):");
        }
    };
}
