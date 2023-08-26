const std = @import("std");
const zt = @import("../zt.zig");
const gl = @import("gl");

const Self = @This();

target: zt.gl.Texture = undefined,
bufferId: c_uint = undefined,

/// Do not modify, this is handled internally to restore previous viewports.
_previous_viewport: [4]c_int = undefined,
/// Do not modify, this is handled internally to know when to resize.
_current_size: [2]c_int = .{ 0, 0 },

pub fn init(width: c_int, height: c_int) Self {
    var self: Self = .{};

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
pub fn deinit(self: *Self) void {
    self.target.deinit();
}

pub fn bind(self: *Self) void {
    gl.glBindFramebuffer(gl.GL_FRAMEBUFFER, self.bufferId);
    gl.glGetIntegerv(gl.GL_VIEWPORT, &self._previous_viewport);
    gl.glViewport(0, 0, @intFromFloat(self.target.width), @intFromFloat(self.target.height));
}
pub fn unbind(self: *Self) void {
    gl.glBindFramebuffer(gl.GL_FRAMEBUFFER, 0);
    gl.glViewport(self._previous_viewport[0], self._previous_viewport[1], self._previous_viewport[2], self._previous_viewport[3]);
}
pub fn resize(self: *Self, x: c_int, y: c_int) void {
    if (x != self._current_size[0] or y != self._current_size[1]) {
        self.target.bind();
        gl.glTexImage2D(gl.GL_TEXTURE_2D, 0, gl.GL_RGBA, x, y, 0, gl.GL_RGBA, gl.GL_UNSIGNED_BYTE, null);
        self.target.width = @floatFromInt(x);
        self.target.height = @floatFromInt(y);
        self._current_size[0] = x;
        self._current_size[1] = y;
    }
}
