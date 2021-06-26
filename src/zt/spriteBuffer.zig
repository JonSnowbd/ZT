const std = @import("std");
const zt = @import("../zt.zig");

const Self = @This();
pub const VertShaderSource = @embedFile("shaders/spriteVert.glsl");
pub const FragShaderSource = @embedFile("shaders/spriteFrag.glsl");

pub const Vertex = struct { pos: zt.math.Vec3, col: zt.math.Vec4, tex: zt.math.Vec2 };
internal: zt.GenerateBuffer(Vertex) = undefined,
allocator: *std.mem.Allocator = undefined,
viewMatrix: zt.math.Mat4 = zt.math.Mat4.identity,
projectionMatrix: zt.math.Mat4 = zt.math.Mat4.identity,
shader: zt.Shader = undefined,
currentTexture: ?zt.Texture = null,
drawCalls: i32 = 0,
buildSize: zt.math.Vec2 = .{},

pub fn init(allocator: *std.mem.Allocator) @This() {
    return .{
        .allocator = allocator,
        .internal = zt.GenerateBuffer(Vertex).init(allocator),
        .projectionMatrix = zt.math.Mat4.createOrthogonal(0, 1280, 720, 0, -128, 128),
        .viewMatrix = zt.math.Mat4.identity,
        .shader = zt.Shader.init(VertShaderSource, FragShaderSource),
    };
}
pub fn deinit(self: *Self) void {
    self.shader.deinit();
}

pub fn updateRenderSize(self: *Self, size: zt.math.Vec2) void {
    self.projectionMatrix = zt.math.Mat4.createOrthogonal(0, size.x, size.y, 0, -128, 128);
    self.buildSize = size;
}

pub fn updateCamera(self: *Self, position: zt.math.Vec2, zoom: f32, rotation: f32) void {
    self.viewMatrix = zt.math.Mat4.batchMul(&.{
        zt.math.Mat4.createTranslationXYZ(position.x, position.y, 0), // translate
        zt.math.Mat4.createZRotation(rotation), // Rotation
        zt.math.Mat4.createScale(zoom, zoom, 1.0), // Scale
        zt.math.Mat4.createTranslationXYZ(self.buildSize.x * 0.5, self.buildSize.y * 0.5, 0), // center
    });
}

pub inline fn sprite(self: *Self, texture: zt.Texture, x: f32, y: f32, z: f32, w: f32, h: f32, col: zt.math.Vec4) void {
    self.spriteEx(texture, x, y, z, w, h, 0, 0, 1, 1, col, col, col, col);
}
pub fn spriteManual(self: *Self, texture: zt.Texture, tl: Vertex, tr: Vertex, bl: Vertex, br: Vertex) void {
    if (self.currentTexture == null) {
        self.currentTexture = texture;
    } else if (self.currentTexture.?.id != texture.id) {
        self.flush();
        self.currentTexture = texture;
    }
    self.internal.addQuad(bl, tl, tr, br) catch unreachable;
}
pub fn spriteEx(self: *Self, texture: zt.Texture, x: f32, y: f32, z: f32, w: f32, h: f32, sx: f32, sy: f32, sw: f32, sh: f32, colTl: zt.math.Vec4, colTr: zt.math.Vec4, colBl: zt.math.Vec4, colBr: zt.math.Vec4) void {
    if (self.currentTexture == null) {
        self.currentTexture = texture;
    } else if (self.currentTexture.?.id != texture.id) {
        self.flush();
        self.currentTexture = texture;
    }
    var start: zt.math.Vec3 = zt.math.Vec3.new(x, y, z);
    var end: zt.math.Vec3 = zt.math.Vec3.new(x + w, y + h, z);

    var tl = Vertex{
        .pos = .{ .x = start.x, .y = end.y, .z = start.z },
        .col = colTl,
        .tex = .{ .x = sx, .y = sy },
    };
    var tr = Vertex{
        .pos = .{ .x = end.x, .y = end.y, .z = start.z },
        .col = colTr,
        .tex = .{ .x = sx + sw, .y = sy },
    };
    var bl = Vertex{
        .pos = .{ .x = start.x, .y = start.y, .z = start.z },
        .col = colBl,
        .tex = .{ .x = sx, .y = sy + sh },
    };
    var br = Vertex{
        .pos = .{ .x = end.x, .y = start.y, .z = start.z },
        .col = colBr,
        .tex = .{ .x = sx + sw, .y = sy + sh },
    };

    self.internal.addQuad(bl, tl, tr, br) catch unreachable;
}

pub fn clear(self: *Self) void {
    self.internal.clear();
}

pub fn flush(self: *Self) void {
    if (self.currentTexture == null or self.internal.indices.items.len == 0) {
        return;
    }
    self.drawCalls += 1;
    self.shader.bind();
    self.internal.setUniform("View", &self.shader, self.viewMatrix);
    self.internal.setUniform("Projection", &self.shader, self.projectionMatrix);
    self.internal.pushStream();
    self.currentTexture.?.bind();
    self.internal.flush();
    self.internal.clear();
}
