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
    var ctx = try SampleApplication.begin(std.heap.c_allocator);
    // Set up state
    ctx.settings.energySaving = false; // Some examples are games, and will benefit from this.
    ctx.data.render = zt.Renderer.init();
    ctx.data.sheet = try zt.Texture.init(zt.path("texture/sheet.png"));
    ctx.data.sheet.setNearestFilter(); // Pixel art looks better with nearest filters.
    ctx.data.pixel = ctx.createWhitePixel();

    ctx.setWindowSize(1280, 720);
    ctx.setWindowTitle("ZT Demo");
    ctx.setWindowIcon(zt.path("texture/ico.png"));

    // You control your own main loop, all you got to do is call begin and end frame,
    // and zt will handle the rest.
    while (ctx.open) {
        ctx.beginFrame();

        // Update render size first, like this:
        ctx.data.render.updateRenderSize(ctx.info.windowSize);
        // then update camera sets the view matrix like a 2d camera.
        // You can also directly modify .viewMatrix, .projectionMatrix, .inverseViewMatrix
        // with a matrix of your own choosing.
        ctx.data.render.updateCamera(.{}, 1.0, 0.0);

        // The zt.Renderer has many useful methods you can explore.
        var mousePos = ctx.data.render.screenToWorld(ctx.info.mousePos);

        ctx.data.render.rectangleHollow(ctx.data.pixel, null, zt.math.Rect.new(-100,-100,200,200), 0, 2, zt.math.Vec4.white);
        ctx.data.render.circle(ctx.data.pixel, null, mousePos, 15.0, 0.0, zt.math.Vec4.white);
        ctx.data.render.line(ctx.data.pixel, null, .{}, mousePos, 0.0, 3.0, zt.math.Vec4.new(0.9, 0.4, 0.3, 1.0), zt.math.Vec4.white);

        // Always flush, even if you think it might be empty.
        ctx.data.render.flush();

        ctx.endFrame();
    }

    ctx.data.sheet.deinit();
    ctx.data.render.deinit();
    ctx.deinit();
}