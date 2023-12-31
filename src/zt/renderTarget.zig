const std = @import("std");
const zt = @import("../zt.zig");
const gl = @import("gl");

const Self = @This();

target: zt.Texture = undefined,
bufferId: c_uint = undefined,

pub fn init(width: c_int, height: c_int) Self {
    var self: Self = .{};

    // FBO
    gl.glGenFramebuffers(1, &self.bufferId);
    gl.glBindFramebuffer(gl.GL_FRAMEBUFFER, self.bufferId);

    // TEX
    self.target = zt.Texture.initBlank(width, height);
    gl.glFramebufferTexture2D(gl.GL_FRAMEBUFFER, gl.GL_COLOR_ATTACHMENT0, gl.GL_TEXTURE_2D, self.target.id, 0);

    gl.glBindFramebuffer(gl.GL_FRAMEBUFFER, 0);
    return self;
}
pub fn deinit(self: *Self) void {
    self.target.deinit();
}

pub fn bind(self: *Self) void {
    gl.glBindFramebuffer(gl.GL_FRAMEBUFFER, self.bufferId);
    gl.glViewport(0, 0, @intFromFloat(self.target.width), @intFromFloat(self.target.height));
}
pub fn unbind(self: *Self) void {
    _ = self;
    gl.glBindFramebuffer(gl.GL_FRAMEBUFFER, 0);
}
pub fn resize(self: *Self, x: c_int, y: c_int) void {
    self.target.bind();
    gl.glTexImage2D(gl.GL_TEXTURE_2D, 0, gl.GL_RGBA, x, y, 0, gl.GL_RGBA, gl.GL_UNSIGNED_BYTE, null);
    self.target.width = @floatFromInt(x);
    self.target.height = @floatFromInt(y);
}
