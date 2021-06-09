const std = @import("std");
const Texture = @import("texture.zig").Texture;
usingnamespace @import("gl");

var currentRt: c_uint = 0;

/// A collection of an FBO and its relevant texture that gets drawn to.
/// Calling bind will direct all subsequent opengl rendering into this target, and unbind
/// to resume drawing to directly to the screen buffer.
pub const RenderTarget = struct {
    target: Texture = undefined,
    bufferId: c_uint = undefined,

    /// Do not modify, this is handled internally to restore previous viewports.
    _previous_viewport: [4]c_int = undefined,

    pub fn init(width: c_int, height: c_int) @This() {
        var self: @This() = .{};

        // FBO
        glGenFramebuffers(1, &self.bufferId);
        glBindFramebuffer(GL_FRAMEBUFFER, self.bufferId);

        // TEX
        self.target = Texture.initBlank(width,height);
        glFramebufferTexture2D(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_TEXTURE_2D, self.target.id, 0); 

        return self;
    }
    pub fn deinit(self: *@This()) void {
        self.target.deinit();
    }

    pub fn bind(self: *@This()) void {
        if(currentRt == self.bufferId) { return; }
        glBindFramebuffer(GL_FRAMEBUFFER, self.bufferId);
        currentRt = self.bufferId;
        glGetIntegerv(GL_VIEWPORT, &self._previous_viewport);
    }
    pub fn unbind(self: *@This()) void {
        glBindFramebuffer(GL_FRAMEBUFFER, 0);
        currentRt = 0;

        glViewport(self._previous_viewport[0],self._previous_viewport[1],self._previous_viewport[2],self._previous_viewport[3]);
    }
};