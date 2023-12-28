const std = @import("std");
const glfw = @import("glfw");

const Self = @This();

_previous: f64 = 0.0,
lifetime: f32 = 0.0,
/// Do not use this for calculations! It is for display, as it is smoothed for easy viewing.
fps: f32 = 0.0,
dt: f32 = 0.0,

pub fn init() @This() {
    return .{
        ._previous = glfw.getTime(),
    };
}
pub fn tick(self: *Self) void {
    const lap = glfw.getTime();

    // No need to worry about overflow, unless a frame intends to last for over a month.
    self.dt = @as(f32, @floatCast(lap - self._previous));
    self.lifetime += self.dt;

    // Smoothly introduce new fps measurements.
    const smoothing: f32 = 0.99;
    const newFps = 1.0 / self.dt;
    self.fps = (self.fps * smoothing) + (newFps * (1.0 - smoothing));

    self._previous = lap;
}
