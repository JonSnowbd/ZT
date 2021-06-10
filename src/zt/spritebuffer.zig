const std = @import("std");
const buf = @import("genbuf.zig");
const mat = @import("zlm/zlm.zig");
const shd = @import("shaderprog.zig");
const tex = @import("texture.zig");

const VertShaderSource = @embedFile("shaders/spriteVert.glsl");
const FragShaderSource = @embedFile("shaders/spriteFrag.glsl");

pub const SpriteBuffer = struct {
    pub const SpriteVertex = struct { pos: mat.Vec3, col: mat.Vec4, tex: mat.Vec2 };
    internal: buf.Buffer(SpriteVertex) = undefined,
    allocator: *std.mem.Allocator = undefined,
    matrix: mat.Mat4 = mat.Mat4.identity,
    shader: shd.Shader = undefined,

    pub fn init(allocator: *std.mem.Allocator) @This() {
        return .{
            .allocator = allocator,
            .internal = buf.Buffer(SpriteVertex).init(allocator),
            .matrix = mat.Mat4.createOrthogonal(0, 1280, 0, 720, 0, 1000),
            .shader = shd.Shader.init(VertShaderSource, FragShaderSource),
        };
    }
    pub fn deinit(self: *SpriteBuffer) void {
        self.shader.deinit();
    }

    pub fn setTexture(self: *SpriteBuffer, texture: tex.Texture) void {
        texture.bind();
    }

    /// The sprites pushed through this are not modified by a matrix. 
    pub fn spriteManual(self: *SpriteBuffer, tl: SpriteVertex, tr: SpriteVertex, bl: SpriteVertex, br: SpriteVertex) void {
        self.internal.addQuad(bl, tl, tr, br) catch unreachable;
    }
    pub inline fn sprite(self: *SpriteBuffer, x: f32, y: f32, z: f32, w: f32, h: f32, col: mat.Vec4) void {
        self.spriteEx(x, y, z, w, h, 0, 0, 1, 1, col, col, col, col);
    }
    pub fn spriteEx(self: *SpriteBuffer, x: f32, y: f32, z: f32, w: f32, h: f32, sx: f32, sy: f32, sw: f32, sh: f32, colTl: mat.Vec4, colTr: mat.Vec4, colBl: mat.Vec4, colBr: mat.Vec4) void {
        var start: mat.Vec4 = mat.vec4(x, y, z, 1.0).transform(self.matrix);
        var end: mat.Vec4 = mat.vec4(x + w, y + h, z, 1.0).transform(self.matrix);

        var tl = SpriteVertex{
            .pos = .{ .x = start.x, .y = end.y, .z = start.z },
            .col = colTl,
            .tex = .{ .x = 0, .y = 1 },
        };
        var tr = SpriteVertex{
            .pos = .{ .x = end.x, .y = end.y, .z = start.z },
            .col = colTr,
            .tex = .{ .x = 1, .y = 1 },
        };
        var bl = SpriteVertex{
            .pos = .{ .x = start.x, .y = start.y, .z = start.z },
            .col = colBl,
            .tex = .{ .x = 0, .y = 0 },
        };
        var br = SpriteVertex{
            .pos = .{ .x = end.x, .y = start.y, .z = start.z },
            .col = colBr,
            .tex = .{ .x = 1, .y = 0 },
        };

        self.internal.addQuad(bl, tl, tr, br) catch unreachable;
    }

    pub fn clear(self: *SpriteBuffer) void {
        self.internal.clear();
    }
    pub fn flushStatic(self: *SpriteBuffer, texture: *tex.Texture) void {
        self.internal.pushStatic();
        self.shader.bind();
        texture.bind();
        self.internal.flush();
    }
    pub fn flushDynamic(self: *SpriteBuffer, texture: *tex.Texture) void {
        self.internal.pushDynamic();
        self.shader.bind();
        texture.bind();
        self.internal.flush();
    }
    pub fn flushStream(self: *SpriteBuffer, texture: *tex.Texture) void {
        self.internal.pushStream();
        self.shader.bind();
        texture.bind();
        self.internal.flush();
    }
};
