const std = @import("std");

const Self = @This();

_startupInit: bool = false,
_internalTimer: std.time.Timer = undefined,
_fpsLogTick: f32 = 0.0,
lifetime: f32 = 0.0,
fps: f32 = 0.0,
dt: f32 = 0.0,
logFps: bool = false,
logInterval: f32 = 1.0,

pub fn init() @This() {
    return .{
        ._internalTimer = std.time.Timer.start() catch unreachable,
    };
}
pub fn tick(self: *Self) void {
    var lap = self._internalTimer.lap();
    self.dt = @floatCast(f32, @intToFloat(f64, lap) / 1000000000.0);
    self.lifetime += self.dt;
    self.fps = 1.0 / self.dt;

    if (self._startupInit == false) {
        self._startupInit = true;
        if (self.logFps) {
            std.debug.print("STARTUP: {d:.3}s\n", .{self.dt});
        }
    }
    if (self.logFps) {
        self._fpsLogTick += self.dt;
        if (self._fpsLogTick >= self.logInterval) {
            std.debug.print("FPS: {d:>8.3}\n", .{1.0 / self.dt});
            self._fpsLogTick -= self.logInterval;
        }
    }
}
