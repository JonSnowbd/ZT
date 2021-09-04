const zt = @import("zt");
const main = @import("../main.zig");
const ig = @import("imgui");

pub fn update(ctx: *main.SampleApplication.Context) void {
    _ = ctx;
    ig.igShowDemoWindow(null);
}
