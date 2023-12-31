const zt = @import("zt");

ptr: *anyopaque,
NameFn: *const fn (*anyopaque) []const u8 = undefined,
UpdateFn: *const fn (*anyopaque) void = undefined,
SideFn: *const fn (*anyopaque) void = undefined,

pub fn GetName(self: @This()) []const u8 {
    return self.NameFn(self.ptr);
}
pub fn ImGuiSidePanel(self: @This()) void {
    self.SideFn(self.ptr);
}
pub fn Update(self: @This()) void {
    self.UpdateFn(self.ptr);
}

pub const DemoContext = struct {
    context: *zt.App.Context,
    sheet: zt.Texture,
    camera_position: zt.math.Vec2,
    camera_zoom: f32,
    camera_rotation: f32,
};
