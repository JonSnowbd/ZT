const std = @import("std");
const zt = @import("../zt.zig");
const gl = @import("gl");

target: zt.gl.Texture = undefined,
bufferId: c_uint = undefined,

/// Do not modify, this is handled internally to restore previous viewports.
_previous_viewport: [4]c_int = undefined,
/// Do not modify, this is handled internally to know when to resize.
_current_size: [2]c_int = .{ 0, 0 },

pub fn init(width: c_int, height: c_int) @This() {
    var self: @This() = .{};

    // FBO
    gl.glGenFramebuffers(1, &self.bufferId);
    gl.glBindFramebuffer(gl.GL_FRAMEBUFFER, self.bufferId);

    // TEX
    self.target = zt.gl.Texture.initBlank(width, height);
    gl.glFramebufferTexture2D(gl.GL_FRAMEBUFFER, gl.GL_COLOR_ATTACHMENT0, gl.GL_TEXTURE_2D, self.target.id, 0);
    self._current_size[0] = width;
    self._current_size[1] = height;

    gl.glBindFramebuffer(gl.GL_FRAMEBUFFER, 0);
    return self;
}
pub fn deinit(self: *@This()) void {
    self.target.deinit();
}

pub fn bind(self: *@This()) void {
    gl.glBindFramebuffer(gl.GL_FRAMEBUFFER, self.bufferId);
    gl.glGetIntegerv(gl.GL_VIEWPORT, &self._previous_viewport);
    gl.glViewport(0, 0, @floatToInt(c_int, self.target.width), @floatToInt(c_int, self.target.height));
}
pub fn unbind(self: *@This()) void {
    gl.glBindFramebuffer(gl.GL_FRAMEBUFFER, 0);
    gl.glViewport(self._previous_viewport[0], self._previous_viewport[1], self._previous_viewport[2], self._previous_viewport[3]);
}
pub fn resize(self: *@This(), x: c_int, y: c_int) void {
    if (x != self._current_size[0] or y != self._current_size[1]) {
        self.target.bind();
        gl.glTexImage2D(gl.GL_TEXTURE_2D, 0, gl.GL_RGBA, x, y, 0, gl.GL_RGBA, gl.GL_UNSIGNED_BYTE, null);
        self.target.width = @intToFloat(f32, x);
        self.target.height = @intToFloat(f32, y);
        self._current_size[0] = x;
        self._current_size[1] = y;
    }
}
