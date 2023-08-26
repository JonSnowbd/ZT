const zt = @import("zt");
const main = @import("../main.zig");
const ig = @import("imgui");
const zg = zt.custom_components;

var rotation: f32 = 0.0;
var scale: f32 = 1.0;

var lineStart: zt.math.Vec2 = .{ .x = -200, .y = 200 };
var lineEnd: zt.math.Vec2 = .{ .x = 200, .y = 200 };
var startColor: zt.math.Vec4 = zt.math.Vec4.white;
var endColor: zt.math.Vec4 = zt.math.Vec4.white;
var thickness: f32 = 2;

var radius: f32 = 10;

pub fn update(ctx: *main.SampleApplication.Context) void {
    control(ctx);

    var render = ctx.data.render;
    var io = ig.igGetIO();

    // It's important to set the render size, then the camera. This applies the matrices used to display all the sprites.
    render.updateRenderSize(io.*.DisplaySize);
    render.updateCamera(.{}, scale, rotation);

    var y: i32 = -4;
    var x: i32 = -4;
    while (y <= 4) : (y += 1) {
        while (x <= 4) : (x += 1) {
            const pos = zt.math.vec2(32 * @as(f32, @floatFromInt(x)), 32 * @as(f32, @floatFromInt(y)));
            render.sprite(ctx.data.sheet, pos, 0, zt.math.vec2(32, 32), zt.math.Vec4.white, zt.math.vec2(0.5, 0.5), zt.math.rect(16, 0, 16, 16));
        }
        x = -4;
    }

    render.sprite(ctx.data.inlined, .{}, 0, zt.math.vec2(32, 32), zt.math.Vec4.white, null, null);

    // Text in the renderer is very rudimentary and not really intended for ingame use in world space.
    // All renderer does is add text to imgui's background drawlist. As such you should transform world to screenspace.
    const message =
        \\Sadly, text is forwarded by imgui and not affected by matrices.
        \\Note this also means nothing but imgui itself can be infront of this text.
        \\But fear not! It wouldn't be difficult to implement your own text if needed.
    ;
    render.text(render.worldToScreen(.{ .x = -128 - 16, .y = -190 }), message, zt.math.Vec4.white);

    // You can also draw lines. In this example I want a solid white line, so the source rect is somewhere on the sheet
    // that is pure white.
    render.line(ctx.data.sheet, zt.math.rect(131, 84, 2, 2), lineStart, lineEnd, 0, thickness, startColor, endColor);

    // Surround the grid with a hollow rect.
    render.rectangleHollow(ctx.data.sheet, zt.math.rect(131, 84, 2, 2), zt.math.rect(-128, -128, 256, 256), 0, 2.0, zt.math.vec4(0.0, 1.0, 0.0, 1.0));

    // Surround the grid with a hollow rect.
    render.circle(ctx.data.sheet, zt.math.rect(131, 84, 2, 2), zt.math.vec2(0, 200), radius, 0, zt.math.vec4(0.0, 1.0, 0.0, 1.0));

    // Renderer also has no clue when a frame ends, so you must manually flush at the end of every render cycle.
    // It is not required to do this between texture changes, as this is handled internally.
    render.flush();
}

fn control(ctx: *main.SampleApplication.Context) void {
    var io = ig.igGetIO();
    ig.igSetNextWindowPos(io.*.DisplaySize, ig.ImGuiCond_Appearing, .{ .x = 1, .y = 1 });
    if (ig.igBegin("Renderer Demo Settings", null, ig.ImGuiWindowFlags_None)) {
        ig.igPushItemWidth(ig.igGetWindowWidth() * 0.5);
        _ = ig.igDragFloat("Camera Rotation", &rotation, 0.02, zt.math.toRadians(-360.0), zt.math.toRadians(360.0), "%.3f", ig.ImGuiSliderFlags_None);
        _ = ig.igDragFloat("Camera Zoom", &scale, 0.02, 0.1, 16, "%.3f", ig.ImGuiSliderFlags_None);
        ig.igSeparator();
        _ = zg.editDrag("Line Start", 0.1, &lineStart);
        _ = zg.editDrag("Line End", 0.1, &lineEnd);
        _ = zg.editDrag("Line Thickness", 0.1, &thickness);
        _ = zg.editDrag("Line Start color", 0.1, &startColor);
        _ = zg.editDrag("Line End color", 0.1, &endColor);
        ig.igSeparator();
        _ = zg.editDrag("Circle Radius", 0.1, &radius);
        _ = zg.editDrag("Circle Resolution", 0.1, &ctx.data.render.resolution);
        ig.igPopItemWidth();
    }
    ig.igEnd();
}
