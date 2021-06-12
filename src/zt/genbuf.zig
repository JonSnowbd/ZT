const gl = @import("gl");
const std = @import("std");

const math = @import("zlm/zlm.zig");

usingnamespace gl;

/// Provide T as a struct to represent a vertex. Compatible types inside of struct are:
/// `f32, math.Vec2, math.Vec3, math.Vec4`
/// and each will be mapped in order to vert shader's layout indices.
/// The resulting buffer can contain many quads and tris together, 
/// TODO: Matrices in generic buffers.
pub fn Buffer(comptime T: type) type {
    return struct {
        allocator: *std.mem.Allocator = undefined,

        vaoId: c_uint = undefined,
        vboId: c_uint = undefined,
        iboId: c_uint = undefined,

        vertices: std.ArrayList(T) = undefined,
        indices: std.ArrayList(c_uint) = undefined,
        indCount: c_int = 0,

        dirty: bool = true,

        pub fn init(allocator: *std.mem.Allocator) @This() {
            var self = @This(){};
            self.allocator = allocator;

            self.vertices = std.ArrayList(T).init(self.allocator);
            self.indices = std.ArrayList(c_uint).init(self.allocator);

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
                    math.Vec2 => {
                        glVertexAttribPointer(@intCast(c_uint, i), 2, GL_FLOAT, GL_FALSE, stride, @intToPtr(*allowzero c_void, currentOffset));
                        glEnableVertexAttribArray(@intCast(c_uint, i));
                        currentOffset += 8;
                    },
                    math.Vec3 => {
                        glVertexAttribPointer(@intCast(c_uint, i), 3, GL_FLOAT, GL_FALSE, stride, @intToPtr(*allowzero c_void, currentOffset));
                        glEnableVertexAttribArray(@intCast(c_uint, i));
                        currentOffset += 12;
                    },
                    math.Vec4 => {
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
            glDeleteVertexArrays(1, self.vaoId);
            glDeleteBuffers(GL_ARRAY_BUFFER, self.vboId);
            glDeleteBuffers(GL_ELEMENT_ARRAY_BUFFER, self.iboId);
            self.vertices.deinit();
            self.indices.deinit();
        }
        pub fn bind(self: *@This()) void {
            glBindVertexArray(self.vaoId);
            glBindBuffer(GL_ARRAY_BUFFER, self.vboId);
            glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, self.iboId);
        }
        pub fn unbind(self: *@This()) void {
            glBindVertexArray(0);
            glBindBuffer(GL_ARRAY_BUFFER, 0);
            glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, 0);
        }
        pub fn clear(self: *@This()) void {
            self.vertices.items.len = 0;
            self.indices.items.len = 0;
            self.indCount = 0;
            self.dirty = true;
        }

        pub fn addTri(self: *@This(), v1: T, v2: T, v3: T) !void {
            var count = self.vertices.items.len;
            try self.vertices.append(v1);
            try self.vertices.append(v2);
            try self.vertices.append(v3);

            try self.indices.append(@intCast(c_uint, count + 0));
            try self.indices.append(@intCast(c_uint, count + 1));
            try self.indices.append(@intCast(c_uint, count + 2));

            self.indCount += 3;
            self.dirty = true;
        }
        pub fn addQuad(self: *@This(), bl: T, tl: T, tr: T, br: T) !void {
            var count = self.vertices.items.len;
            try self.vertices.append(bl);
            try self.vertices.append(tl);
            try self.vertices.append(tr);
            try self.vertices.append(br);

            try self.indices.append(@intCast(c_uint, count + 0));
            try self.indices.append(@intCast(c_uint, count + 1));
            try self.indices.append(@intCast(c_uint, count + 3));
            try self.indices.append(@intCast(c_uint, count + 1));
            try self.indices.append(@intCast(c_uint, count + 2));
            try self.indices.append(@intCast(c_uint, count + 3));
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
            var vertSize: c_longlong = @intCast(c_longlong, @sizeOf(T) * self.vertices.items.len);
            var indSize: c_longlong = @intCast(c_longlong, @sizeOf(f32) * self.indCount);
            glBufferData(GL_ARRAY_BUFFER, vertSize, self.vertices.items.ptr, GL_STATIC_DRAW);
            glBufferData(GL_ELEMENT_ARRAY_BUFFER, indSize, self.indices.items.ptr, GL_STATIC_DRAW);
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
            var vertSize: c_longlong = @intCast(c_longlong, @sizeOf(T) * self.vertices.items.len);
            var indSize: c_longlong = @intCast(c_longlong, @sizeOf(f32) * self.indCount);
            glBufferData(GL_ARRAY_BUFFER, vertSize, self.vertices.items.ptr, GL_DYNAMIC_DRAW);
            glBufferData(GL_ELEMENT_ARRAY_BUFFER, indSize, self.indices.items.ptr, GL_DYNAMIC_DRAW);
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
            var vertSize: c_longlong = @intCast(c_longlong, @sizeOf(T) * self.vertices.items.len);
            var indSize: c_longlong = @intCast(c_longlong, @sizeOf(f32) * self.indCount);
            glBufferData(GL_ARRAY_BUFFER, vertSize, self.vertices.items.ptr, GL_STREAM_DRAW);
            glBufferData(GL_ELEMENT_ARRAY_BUFFER, indSize, self.indices.items.ptr, GL_STREAM_DRAW);
            self.unbind();
            self.dirty = false;
        }

        /// Draws the currently pushed data to the screen.
        pub fn flush(self: *@This()) void {
            self.bind();
            glDrawElements(GL_TRIANGLES, self.indCount, GL_UNSIGNED_INT, null);
            self.unbind();
        }
    };
}
