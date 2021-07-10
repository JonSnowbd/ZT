const zt = @import("zt");
const main = @import("../main.zig");
usingnamespace @import("imgui");
usingnamespace zt.custom_components;

var rotation: f32 = 0.0;
var zoom: f32 = 1.0;

// We're just going to lazy init it when the example loads this scene.
var rt: ?zt.gl.RenderTarget = null;
fn ensure() void {
    if (rt == null) {
        rt = zt.gl.RenderTarget.init(200, 200);
    }
}

pub fn update(ctx: *main.SampleApplication.Context) void {
    var io = igGetIO();
    ensure();
    control(ctx);
    var render = ctx.data.render;
    render.updateRenderSize(io.*.DisplaySize);
    render.updateCamera(.{}, zoom, rotation);
    render.sprite(ctx.data.sheet, .{}, 0, zt.math.vec2(32, 32), zt.math.Vec4.white, zt.math.vec2(0.5, 0.5), zt.math.rect(16, 0, 16, 16));
    var pos = render.worldToScreen(.{}); // Cache where the rt is focused
    render.flush();

    // And this is a screenspace transform!
    // This part wont be affected by position/zoom/rotation. Make sure you flush between the changes.
    render.updateCameraScreenSpace();
    render.rectangleHollow(ctx.data.sheet, zt.math.rect(131, 84, 2, 2), zt.math.rect(pos.x - 100, pos.y - 100, 200, 200), 0, 3, zt.math.vec4(1.0, 1.0, 0.0, 1.0));
    render.flush();
}

fn control(ctx: *main.SampleApplication.Context) void {
    var io = igGetIO();
    igSetNextWindowPos(io.*.DisplaySize, ImGuiCond_Appearing, .{ .x = 1, .y = 1 });
    if (igBegin("RenderTarget Demo Settings", null, ImGuiWindowFlags_None)) {
        igPushItemWidth(igGetWindowWidth() * 0.5);
        _ = igDragFloat("Camera Rotation", &rotation, 0.02, zt.math.toRadians(-360.0), zt.math.toRadians(360.0), "%.3f", ImGuiSliderFlags_None);
        _ = igDragFloat("Camera Zoom", &zoom, 0.02, 0.1, 16, "%.3f", ImGuiSliderFlags_None);
        igPopItemWidth();
    }
    igEnd();

    // Display the rendertarget
    igSetNextWindowPos(zt.math.vec2(io.*.DisplaySize.x, 0), ImGuiCond_Appearing, .{ .x = 1, .y = 0 });
    if (igBegin("RenderTarget Demo Viewer", null, ImGuiWindowFlags_NoScrollbar)) {
        var contentSpace: zt.math.Vec2 = .{};
        igGetContentRegionAvail(&contentSpace);
        var ratio = contentSpace.x / rt.?.target.width;

        // With opengl and imgui, you need to flip the y source vectors.
        var uv1 = zt.math.vec2(0, 1);
        var uv2 = zt.math.vec2(1, 0);
        var size = zt.math.vec2(contentSpace.x, rt.?.target.height * ratio);
        igImage(rt.?.target.imguiId(), size, uv1, uv2, zt.math.Vec4.white, zt.math.Vec4.white);

        if (igButton("Update RT", .{})) {
            drawIntoRT(ctx);
        }
        igSameLine(0, 2);
        if (igButton("Nearest", .{})) {
            rt.?.target.setNearestFilter();
        }
        igSameLine(0, 2);
        if (igButton("Linear", .{})) {
            rt.?.target.setLinearFilter();
        }
    }
    igEnd();
}

fn drawIntoRT(ctx: *main.SampleApplication.Context) void {
    const gl = @import("gl");

    var render = ctx.data.render;
    rt.?.bind();
    // We need to manually clear the buffer:
    gl.glClear(gl.GL_COLOR_BUFFER_BIT);
    render.updateRenderSize(zt.math.vec2(rt.?.target.width, rt.?.target.height));
    render.updateCamera(.{}, zoom, rotation);
    render.sprite(ctx.data.sheet, .{}, 0, zt.math.vec2(32, 32), zt.math.Vec4.white, zt.math.vec2(0.5, 0.5), zt.math.rect(16, 0, 16, 16));
    render.flush();
    rt.?.unbind();
}
