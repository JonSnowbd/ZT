const gl = @import("gl");
const std = @import("std");
const builtin = @import("builtin");
const zt = @import("../zt.zig");

fn reportErr(msg: []const u8) void {
    if (builtin.mode == .Debug) {
        var err = gl.glGetError();
        while (err != gl.GL_NO_ERROR) {
            switch (err) {
                gl.GL_INVALID_ENUM => {
                    std.debug.print("{s}\nOPENGL ERROR: INVALID ENUM\n", .{msg});
                },
                gl.GL_INVALID_VALUE => {
                    std.debug.print("{s}\nOPENGL ERROR: INVALID VALUE\n", .{msg});
                },
                gl.GL_INVALID_OPERATION => {
                    std.debug.print("{s}\nOPENGL ERROR: INVALID OPERATION\n", .{msg});
                },
                gl.GL_OUT_OF_MEMORY => {
                    std.debug.print("{s}\nOPENGL ERROR: OUT OF MEMORY\n", .{msg});
                },
                else => {
                    std.debug.print("{s}\nOPENGL ERROR: UNKNOWN ERROR\n", .{msg});
                },
            }

            err = gl.glGetError();
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
        pub const VertexLimit = V;
        pub const IndexLimit = V * 6;
        vaoId: c_uint = undefined,
        vboId: c_uint = undefined,
        iboId: c_uint = undefined,

        vertices: [V]T = undefined,
        vertCount: usize = 0,
        // Worst case scenario every single draw is a quad, so * 6.
        indices: [IndexLimit]c_uint = undefined,
        indCount: usize = 0,
        shader: zt.gl.Shader = undefined,

        dirty: bool = true,

        pub fn init(shader: zt.gl.Shader) @This() {
            var self = @This(){};
            self.shader = shader;

            gl.glGenBuffers(1, &self.vboId);
            gl.glGenBuffers(1, &self.iboId);

            // Create VAO
            gl.glGenVertexArrays(1, &self.vaoId);

            gl.glBindVertexArray(self.vaoId);
            gl.glBindBuffer(gl.GL_ARRAY_BUFFER, self.vboId);
            gl.glBindBuffer(gl.GL_ELEMENT_ARRAY_BUFFER, self.iboId);

            var currentOffset: usize = 0;
            var stride: c_int = @intCast(c_int, @sizeOf(T));

            inline for (std.meta.fields(T)) |field, i| {
                switch (field.field_type) {
                    bool => {
                        gl.glVertexAttribPointer(@intCast(c_uint, i), 1, gl.GL_BOOL, gl.GL_FALSE, stride, @intToPtr(*allowzero anyopaque, currentOffset));
                        gl.glEnableVertexAttribArray(@intCast(c_uint, i));
                        currentOffset += @sizeOf(bool);
                    },
                    // TODO: Figure out opengl's api for bytes and shorts in uniforms.
                    // i8 => {
                    //     gl.glVertexAttribPointer(@intCast(c_uint, i), 1, gl.GL_BYTE, gl.GL_FALSE, stride, @intToPtr(*allowzero anyopaque, currentOffset));
                    //     gl.glEnableVertexAttribArray(@intCast(c_uint, i));
                    //     currentOffset += @sizeOf(i8);
                    // },
                    // u8 => {
                    //     gl.glVertexAttribPointer(@intCast(c_uint, i), 1, gl.GL_UNSIGNED_BYTE, gl.GL_FALSE, stride, @intToPtr(*allowzero anyopaque, currentOffset));
                    //     gl.glEnableVertexAttribArray(@intCast(c_uint, i));
                    //     currentOffset += @sizeOf(u8);
                    // },
                    // i16 => {
                    //     gl.glVertexAttribPointer(@intCast(c_uint, i), 1, gl.GL_SHORT, gl.GL_FALSE, stride, @intToPtr(*allowzero anyopaque, currentOffset));
                    //     gl.glEnableVertexAttribArray(@intCast(c_uint, i));
                    //     currentOffset += @sizeOf(i16);
                    // },
                    // u16 => {
                    //     gl.glVertexAttribPointer(@intCast(c_uint, i), 1, gl.GL_UNSIGNED_SHORT, gl.GL_FALSE, stride, @intToPtr(*allowzero anyopaque, currentOffset));
                    //     gl.glEnableVertexAttribArray(@intCast(c_uint, i));
                    //     currentOffset += @sizeOf(u16);
                    // },
                    i32 => {
                        gl.glVertexAttribIPointer(@intCast(c_uint, i), 1, gl.GL_INT, stride, @intToPtr(*allowzero anyopaque, currentOffset));
                        gl.glEnableVertexAttribArray(@intCast(c_uint, i));
                        currentOffset += @sizeOf(i32);
                    },
                    u32 => {
                        gl.glVertexAttribIPointer(@intCast(c_uint, i), 1, gl.GL_UNSIGNED_INT, stride, @intToPtr(*allowzero anyopaque, currentOffset));
                        gl.glEnableVertexAttribArray(@intCast(c_uint, i));
                        currentOffset += @sizeOf(u32);
                    },
                    f32 => {
                        gl.glVertexAttribPointer(@intCast(c_uint, i), 1, gl.GL_FLOAT, gl.GL_FALSE, stride, @intToPtr(*allowzero anyopaque, currentOffset));
                        gl.glEnableVertexAttribArray(@intCast(c_uint, i));
                        currentOffset += 4;
                    },
                    zt.math.Vec2 => {
                        gl.glVertexAttribPointer(@intCast(c_uint, i), 2, gl.GL_FLOAT, gl.GL_FALSE, stride, @intToPtr(*allowzero anyopaque, currentOffset));
                        gl.glEnableVertexAttribArray(@intCast(c_uint, i));
                        currentOffset += 8;
                    },
                    zt.math.Vec3 => {
                        gl.glVertexAttribPointer(@intCast(c_uint, i), 3, gl.GL_FLOAT, gl.GL_FALSE, stride, @intToPtr(*allowzero anyopaque, currentOffset));
                        gl.glEnableVertexAttribArray(@intCast(c_uint, i));
                        currentOffset += 12;
                    },
                    zt.math.Vec4 => {
                        gl.glVertexAttribPointer(@intCast(c_uint, i), 4, gl.GL_FLOAT, gl.GL_FALSE, stride, @intToPtr(*allowzero anyopaque, currentOffset));
                        gl.glEnableVertexAttribArray(@intCast(c_uint, i));
                        currentOffset += 16;
                    },
                    else => {
                        @compileError("Vertex Struct had types incompatible with automatic buffers:" ++ @typeName(field.field_type));
                    },
                }
            }

            gl.glBindVertexArray(0);
            return self;
        }
        pub fn deinit(self: *@This()) void {
            gl.glDeleteVertexArrays(1, &self.vaoId);
            gl.glDeleteBuffers(1, &self.vboId);
            gl.glDeleteBuffers(1, &self.iboId);
            reportErr("Deleting the buffers:");
        }
        pub fn bind(self: *@This()) void {
            gl.glBindVertexArray(self.vaoId);
            self.shader.bind();
            gl.glBindBuffer(gl.GL_ARRAY_BUFFER, self.vboId);
            gl.glBindBuffer(gl.GL_ELEMENT_ARRAY_BUFFER, self.iboId);
            reportErr("Binding the buffers:");
        }
        pub fn unbind(self: *@This()) void {
            _ = self;
            gl.glBindVertexArray(0);
            self.shader.unbind();
            gl.glBindBuffer(gl.GL_ARRAY_BUFFER, 0);
            gl.glBindBuffer(gl.GL_ELEMENT_ARRAY_BUFFER, 0);
            reportErr("Unbinding the buffers:");
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
        /// Commits to opengl.gl with the currently added sprites in a static memory location. Use this if you are going
        /// to very rarely push again. You can still flush as many times as needed.
        pub fn pushStatic(self: *@This()) void {
            if (!self.dirty) {
                return;
            }
            self.bind();
            var vertSize: c_longlong = @intCast(c_longlong, @sizeOf(T) * self.vertCount);
            var indSize: c_longlong = @intCast(c_longlong, @sizeOf(c_uint) * self.indCount);
            gl.glBufferData(gl.GL_ARRAY_BUFFER, vertSize, &self.vertices, gl.GL_STATIC_DRAW);
            gl.glBufferData(gl.GL_ELEMENT_ARRAY_BUFFER, indSize, &self.indices, gl.GL_STATIC_DRAW);
            self.unbind();
            self.dirty = false;
        }
        /// Commits to opengl.gl with the currently added sprites in a dynamic memory location. Use this if you are pushing
        /// and flushing once a frame.
        pub fn pushDynamic(self: *@This()) void {
            if (!self.dirty) {
                return;
            }
            self.bind();
            var vertSize: c_longlong = @intCast(c_longlong, @sizeOf(T) * self.vertCount);
            var indSize: c_longlong = @intCast(c_longlong, @sizeOf(c_uint) * self.indCount);
            gl.glBufferData(gl.GL_ARRAY_BUFFER, vertSize, &self.vertices, gl.GL_DYNAMIC_DRAW);
            gl.glBufferData(gl.GL_ELEMENT_ARRAY_BUFFER, indSize, &self.indices, gl.GL_DYNAMIC_DRAW);
            self.unbind();
            self.dirty = false;
        }
        /// Commits to opengl.gl with the currently added sprites in a streaming memory location. Use this if you are going
        /// to be pushing and flushing multiple times per frame.
        pub fn pushStream(self: *@This()) void {
            if (!self.dirty) {
                return;
            }
            self.bind();
            var vertSize = @intCast(c_longlong, @sizeOf(T) * self.vertCount);
            var indSize = @intCast(c_longlong, @sizeOf(c_uint) * self.indCount);
            gl.glBufferData(gl.GL_ARRAY_BUFFER, vertSize, &self.vertices, gl.GL_STREAM_DRAW);
            gl.glBufferData(gl.GL_ELEMENT_ARRAY_BUFFER, indSize, &self.indices, gl.GL_STREAM_DRAW);
            self.unbind();
            self.dirty = false;
            reportErr("Pushing the buffers:");
        }

        /// Draws the currently pushed data to the screen. Note the data is not cleared, leaving you the option to maintain
        /// the current vertices every frame if so desired.
        pub fn flush(self: *@This()) void {
            self.bind();
            gl.glDrawElements(gl.GL_TRIANGLES, @intCast(c_int, self.indCount), gl.GL_UNSIGNED_INT, null);
            self.unbind();
            reportErr("Flushing the buffers:");
        }

        pub fn setUniform(self: *@This(), comptime uniName: []const u8, uniform: anytype) void {
            _ = self;
            var loc: c_int = gl.glGetUniformLocation(self.shader.id, uniName.ptr);
            self.shader.bind();
            if (loc != -1) {
                switch (@TypeOf(uniform)) {
                    bool => {
                        gl.glUniform1i(loc, if (uniform) 1 else 0);
                        reportErr("Setting a uniform bool(i32):");
                    },
                    i32 => {
                        gl.glUniform1i(loc, uniform);
                        reportErr("Setting a uniform i32:");
                    },
                    u32 => {
                        gl.glUniform1ui(loc, uniform);
                        reportErr("Setting a uniform u32:");
                    },
                    f32 => {
                        gl.glUniform1f(loc, uniform);
                        reportErr("Setting a uniform f32:");
                    },
                    zt.math.Vec2 => {
                        gl.glUniform2f(loc, uniform.x, uniform.y);
                        reportErr("Setting a uniform vec2:");
                    },
                    zt.math.Vec3 => {
                        gl.glUniform3f(loc, uniform.x, uniform.y, uniform.z);
                        reportErr("Setting a uniform vec3:");
                    },
                    zt.math.Vec4 => {
                        gl.glUniform4f(loc, uniform.x, uniform.y, uniform.z, uniform.w);
                        reportErr("Setting a uniform vec4:");
                    },
                    zt.math.Mat4 => {
                        gl.glUniformMatrix4fv(loc, 1, 0, &uniform.inlined());
                        reportErr("Setting a uniform mat4:");
                    },
                    else => {
                        @compileError("You cannot use that type in a genbuffer's uniform.");
                    },
                }
            }
            self.shader.unbind();
            reportErr("Setting a uniform (location not found):");
        }
    };
}
