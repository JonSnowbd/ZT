const zt = @import("zt");
const main = @import("../main.zig");
usingnamespace @import("imgui");
usingnamespace zt.custom_components;

pub fn update(ctx: *main.SampleApplication.Context) void {
    _ = ctx;
    igShowDemoWindow(null);
}
