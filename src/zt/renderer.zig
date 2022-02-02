const std = @import("std");
const zt = @import("../zt.zig");
const gl = @import("gl");

const Self = @This();
pub const VertShaderSource = @embedFile("shader/renderer.vertex");
pub const FragShaderSource = @embedFile("shader/renderer.fragment");

pub const Vertex = extern struct { pos: zt.math.Vec3, col: zt.math.Vec4, tex: zt.math.Vec2 };
internal: zt.GenerateBuffer(Vertex, 4086) = undefined,
viewMatrix: zt.math.Mat4 = zt.math.Mat4.identity,
inverseViewMatrix: zt.math.Mat4 = zt.math.Mat4.identity,
projectionMatrix: zt.math.Mat4 = zt.math.Mat4.identity,
currentTexture: ?zt.Texture = null,
defaultShader: zt.Shader = undefined,
/// Internal render size, do not edit. Is set by `updateRenderSize`.
buildSize: zt.math.Vec2 = .{},
resolution: i32 = 2,

pub fn createShader(fragment: [*:0]const u8) zt.Shader {
    return zt.Shader.init(VertShaderSource, fragment);
}

pub fn init() @This() {
    var renderer = Self{
        .defaultShader = zt.Shader.init(VertShaderSource, FragShaderSource),
        .projectionMatrix = zt.math.Mat4.createOrthogonal(0, 1280, 720, 0, -128, 128),
        .viewMatrix = zt.math.Mat4.identity,
    };
    renderer.internal = zt.GenerateBuffer(Vertex, 4086).init(renderer.defaultShader);
    return renderer;
}
pub fn deinit(self: *Self) void {
    self.internal.deinit();
}
/// Sets the render size, perfect to modify if you need to render into a differently sized frame buffer. Otherwise call
/// this every frame to your `zt.App.width, height`
pub fn updateRenderSize(self: *Self, size: zt.math.Vec2) void {
    self.projectionMatrix = zt.math.Mat4.createOrthogonal(0, size.x, size.y, 0, -128, 128);
    self.buildSize = size;
}
/// Given a position, zoom, and rotation, this function emulates a traditional 2d camera by directly modifying
/// the view matrix.
pub fn updateCamera(self: *Self, position: zt.math.Vec2, zoom: f32, rotation: f32) void {
    self.viewMatrix = zt.math.Mat4.batchMul(&.{
        zt.math.Mat4.createTranslationXYZ(position.x, position.y, 0), // translate
        zt.math.Mat4.createZRotation(rotation), // Rotation
        zt.math.Mat4.createScale(zoom, zoom, 1.0), // Scale
        zt.math.Mat4.createTranslationXYZ(self.buildSize.x * 0.5, self.buildSize.y * 0.5, 0), // center
    });
    self.inverseViewMatrix = self.viewMatrix.invert().?;
}
/// Resets the camera back to screenspace.
pub fn updateCameraScreenSpace(self: *Self) void {
    self.viewMatrix = zt.math.Mat4.identity;
    self.inverseViewMatrix = self.viewMatrix.invert().?;
}

/// Sets the shader used by the internal buffer. Pass in null to revert to the default shader.
pub fn updateShader(self: *Self, shader: ?*zt.Shader) void {
    self.flush();
    if (shader) |realShader| {
        self.internal.shader = realShader.*;
    } else {
        self.internal.shader = self.defaultShader;
    }
}

/// The simplest sprite method. Passing null to normalized origin will draw top-left based. Passing null to source will
/// draw the whole texture. Note; normalized origin is multiplicative. 1,1 will draw the texture from bottom right, providing
/// beyond 0 and 1 is supported if the anchor needs to be 
pub inline fn sprite(self: *Self, texture: zt.Texture, pos: zt.math.Vec2, z: f32, size: zt.math.Vec2, color: zt.math.Vec4, normOrigin: ?zt.math.Vec2, src: ?zt.math.Rect) void {
    var offset: zt.math.Vec2 = if (normOrigin) |no| .{ .x = -(size.x * no.x), .y = -(size.y * no.y) } else .{};
    const source: zt.math.Rect =
        if (src) |s|
        zt.math.rect(s.position.x / texture.width, s.position.y / texture.height, s.size.x / texture.width, s.size.y / texture.height)
    else
        zt.math.rect(0, 0, 1, 1);

    if (size.x < 0.0) {
        offset.x -= size.x;
    }

    self.spriteEx(texture, pos.x + offset.x, pos.y + offset.y, z, size.x, size.y, source.position.x, source.position.y, source.size.x, source.size.y, color, color, color, color);
}
/// If you want to submit the vertices yourself, this is the way to do it. Submit them in order: Top Left, Top Right,
/// Bottom Left, Bottom Right.
pub fn spriteManual(self: *Self, texture: zt.Texture, tl: Vertex, tr: Vertex, bl: Vertex, br: Vertex) void {
    if (self.currentTexture == null) {
        self.currentTexture = texture;
    } else if (self.currentTexture.?.id != texture.id) {
        self.flush();
        self.currentTexture = texture;
    }
    self.internal.addQuad(bl, tl, tr, br) catch |err| {
        if (err == error.NeedsFlush) {
            self.flush();
            self.internal.addQuad(bl, tl, tr, br) catch unreachable;
            return;
        }
        std.debug.panic("Rendering error: {s}", .{@errorName(err)});
    };
}
/// Use this method if you want to avoid using zt math types such as Vec2, and would prefer to just input raw floats.
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
        .pos = .{ .x = start.x, .y = start.y, .z = start.z },
        .col = colTl,
        .tex = .{ .x = sx, .y = sy },
    };
    var tr = Vertex{
        .pos = .{ .x = end.x, .y = start.y, .z = start.z },
        .col = colTr,
        .tex = .{ .x = sx + sw, .y = sy },
    };
    var bl = Vertex{
        .pos = .{ .x = start.x, .y = end.y, .z = start.z },
        .col = colBl,
        .tex = .{ .x = sx, .y = sy + sh },
    };
    var br = Vertex{
        .pos = .{ .x = end.x, .y = end.y, .z = start.z },
        .col = colBr,
        .tex = .{ .x = sx + sw, .y = sy + sh },
    };

    self.internal.addQuad(bl, tl, tr, br) catch |err| {
        if (err == error.NeedsFlush) {
            self.flush();
            self.internal.addQuad(bl, tl, tr, br) catch unreachable;
            return;
        }
        std.debug.panic("Rendering error: {s}", .{@errorName(err)});
    };
}

/// For expected blank line behaviour, sourceRect should point to a spot on the sheet that is pure white.
/// Otherwise you can point wherever you want for a textured line.
pub fn line(self: *Self, texture: zt.Texture, sourceRect: ?zt.math.Rect, start: zt.math.Vec2, end: zt.math.Vec2, z: f32, width: f32, colStarT: zt.math.Vec4, colEnd: zt.math.Vec4) void {
    if (self.currentTexture == null) {
        self.currentTexture = texture;
    } else if (self.currentTexture.?.id != texture.id) {
        self.flush();
        self.currentTexture = texture;
    }
    const source: zt.math.Rect =
        if (sourceRect) |s|
        zt.math.rect(s.position.x / texture.width, s.position.y / texture.height, s.size.x / texture.width, s.size.y / texture.height)
    else
        zt.math.rect(0, 0, 1, 1);

    const direction: zt.math.Vec2 = end.sub(start).normalize();
    var leftOffset: zt.math.Vec3 = zt.math.vec3(direction.y, -direction.x, 0).scale(width * 0.5);
    var rightOffset: zt.math.Vec3 = leftOffset.scale(-1);

    var tl = Vertex{
        .pos = zt.math.vec3(start.x, start.y, z).add(leftOffset),
        .col = colStarT,
        .tex = .{ .x = source.position.x, .y = source.position.y },
    };
    var tr = Vertex{
        .pos = zt.math.vec3(start.x, start.y, z).add(rightOffset),
        .col = colStarT,
        .tex = .{ .x = source.position.x + source.size.x, .y = source.position.y },
    };
    var bl = Vertex{
        .pos = zt.math.vec3(end.x, end.y, z).add(leftOffset),
        .col = colEnd,
        .tex = .{ .x = source.position.x, .y = source.position.y + source.size.y },
    };
    var br = Vertex{
        .pos = zt.math.vec3(end.x, end.y, z).add(rightOffset),
        .col = colEnd,
        .tex = .{ .x = source.position.x + source.size.x, .y = source.position.y + source.size.y },
    };

    self.internal.addQuad(bl, tl, tr, br) catch |err| {
        if (err == error.NeedsFlush) {
            self.flush();
            self.internal.addQuad(bl, tl, tr, br) catch unreachable;
            return;
        }
        std.debug.panic("Rendering error: {s}", .{@errorName(err)});
    };
}

pub fn circle(self: *Self, texture: zt.Texture, sourceRect: ?zt.math.Rect, target: zt.math.Vec2, radius: f32, z: f32, col: zt.math.Vec4) void {
    if (self.currentTexture == null) {
        self.currentTexture = texture;
    } else if (self.currentTexture.?.id != texture.id) {
        self.flush();
        self.currentTexture = texture;
    }
    const twoPi: f32 = 2.0 * std.math.pi;
    const sin = std.math.sin;
    const cos = std.math.cos;

    const addition: i32 = std.math.clamp(@floatToInt(i32, std.math.round(radius / 100.0)) * 10, 0, 20);
    const triCount: i32 = (@floatToInt(i32, twoPi) * self.resolution) + addition;
    var i: i32 = 0;

    const source: zt.math.Rect =
        if (sourceRect) |s|
        zt.math.rect(s.position.x / texture.width, s.position.y / texture.height, s.size.x / texture.width, s.size.y / texture.height)
    else
        zt.math.rect(0, 0, 1, 1);

    while (i < triCount) : (i += 1) {
        var c = Vertex{
            .pos = zt.math.vec3(target.x, target.y, z),
            .col = col,
            .tex = .{ .x = source.position.x, .y = source.position.y },
        };
        var l = Vertex{
            .pos = zt.math.vec3(target.x + (radius * cos(@intToFloat(f32, i) * twoPi / @intToFloat(f32, triCount))), target.y + (radius * sin(@intToFloat(f32, i) * twoPi / @intToFloat(f32, triCount))), z),
            .col = col,
            .tex = .{ .x = source.position.x + source.size.x, .y = source.position.y },
        };
        var r = Vertex{
            .pos = zt.math.vec3(target.x + (radius * cos(@intToFloat(f32, i + 1) * twoPi / @intToFloat(f32, triCount))), target.y + (radius * sin(@intToFloat(f32, i + 1) * twoPi / @intToFloat(f32, triCount))), z),
            .col = col,
            .tex = .{ .x = source.position.x, .y = source.position.y + source.size.y },
        };
        self.internal.addTri(c, l, r) catch {
            self.flush();
            self.internal.addTri(c, l, r) catch unreachable;
        };
    }
}

/// For expected blank line behaviour, sourceRect should point to a spot on the sheet that is pure white.
/// It is not recommended to use this textured.
pub fn rectangleHollow(self: *Self, texture: zt.Texture, sourceRect: ?zt.math.Rect, target: zt.math.Rect, z: f32, thickness: f32, col: zt.math.Vec4) void {
    var tl = target.position;
    var tr = target.position.add(.{ .x = target.size.x });
    var bl = target.position.add(.{ .y = target.size.y });
    var br = target.position.add(target.size);
    self.line(texture, sourceRect, tl, tr.add(.{ .x = thickness * 0.5 }), z, thickness, col, col);
    self.line(texture, sourceRect, tr, br.add(.{ .y = thickness * 0.5 }), z, thickness, col, col);
    self.line(texture, sourceRect, br, bl.add(.{ .x = -thickness * 0.5 }), z, thickness, col, col);
    self.line(texture, sourceRect, bl, tl.add(.{ .y = -thickness * 0.5 }), z, thickness, col, col);
}
pub fn clear(self: *Self) void {
    self.internal.clear();
}
/// If there is nothing to draw, nothing will happen, so make sure to call this at the end of every render phase that might
/// have dangling sprites to blit!
pub fn flush(self: *Self) void {
    if (self.currentTexture == null or self.internal.indCount == 0) {
        return;
    }
    gl.glEnable(gl.GL_BLEND);
    gl.glBlendFunc(gl.GL_SRC_ALPHA, gl.GL_ONE_MINUS_SRC_ALPHA);
    self.internal.setUniform("View", self.viewMatrix);
    self.internal.setUniform("Projection", self.projectionMatrix);
    self.internal.pushDynamic();
    self.currentTexture.?.bind();
    self.internal.flush();
    self.internal.clear();
    self.currentTexture.?.unbind();
}

pub fn worldToScreen(self: *Self, point: zt.math.Vec2) zt.math.Vec2 {
    return point.transform4(self.viewMatrix);
}

pub fn screenToWorld(self: *Self, point: zt.math.Vec2) zt.math.Vec2 {
    return point.transform4(self.inverseViewMatrix);
}
