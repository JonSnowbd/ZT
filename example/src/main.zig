const std = @import("std");
const zt = @import("zt");

/// SampleData will be available through the application's context.
pub const SampleData = struct {
    render: zt.Renderer = undefined,
    sheet: zt.Texture = undefined,
    pixel: zt.Texture = undefined,
};
pub const SampleApplication = zt.App(SampleData);

pub fn main() !void {
    var context = try SampleApplication.begin(std.heap.c_allocator);
    // Set up state
    context.settings.energySaving = false; // Some examples are games, and will benefit from this.
    context.data.render = zt.Renderer.init();
    context.data.sheet = try zt.Texture.init(zt.path("texture/sheet.png"));
    context.data.sheet.setNearestFilter(); // Pixel art looks better with nearest filters.
    context.data.pixel = context.createWhitePixel();

    context.setWindowSize(1280, 720);
    context.setWindowTitle("ZT Demo");
    context.setWindowIcon(zt.path("texture/ico.png"));

    // You control your own main loop, all you got to do is call begin and end frame,
    // and zt will handle the rest.
    while (context.open) {
        context.beginFrame();

        // Update camera sets the view matrix like a 2d camera.
        context.data.render.updateCamera(.{}, 1.0, 0.0);
        context.data.render.circle(context.data.pixel, null, context.info.mousePos, 15.0, 0.0, zt.math.Vec4.white);
        // Always flush, even if you think it might be empty.
        context.data.render.flush();

        context.endFrame();
    }

    context.data.sheet.deinit();
    context.data.render.deinit();
    context.deinit();
}