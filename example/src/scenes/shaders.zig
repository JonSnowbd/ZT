const zt = @import("zt");
const main = @import("../main.zig");
const ig = @import("imgui");
const zg = zt.custom_components;

var rotation: f32 = 0.0;
var scale: f32 = 1.0;

var shaderActive: bool = true;

pub fn update(ctx: *main.SampleApplication.Context) void {
    control();

    var render = ctx.data.render;
    const io = ig.igGetIO();
    render.updateRenderSize(io.*.DisplaySize);
    render.updateCamera(.{}, scale, rotation);

    // Without a shader:
    render.sprite(ctx.data.sheet, zt.math.vec2(-30, 0), 0, zt.math.vec2(32, 32), zt.math.Vec4.white, zt.math.vec2(0.5, 0.5), zt.math.rect(16, 0, 16, 16));

    if (shaderActive) {
        // Pushing and popping shaders is a one-stack deal, I don't see the need to have nested shaders.
        render.updateShader(&ctx.data.redShader);
        render.sprite(ctx.data.sheet, zt.math.vec2(30, 0), 0, zt.math.vec2(32, 32), zt.math.Vec4.white, zt.math.vec2(0.5, 0.5), zt.math.rect(16, 0, 16, 16));
        render.updateShader(null);

        // and because of this, you can push as many times as you want, and pop once to get back to default.
    } else {
        render.sprite(ctx.data.sheet, zt.math.vec2(30, 0), 0, zt.math.vec2(32, 32), zt.math.Vec4.white, zt.math.vec2(0.5, 0.5), zt.math.rect(16, 0, 16, 16));
    }

    render.flush();
}

fn control() void {
    const io = ig.igGetIO();
    ig.igSetNextWindowPos(io.*.DisplaySize, ig.ImGuiCond_Appearing, .{ .x = 1, .y = 1 });
    if (ig.igBegin("Renderer Demo Settings", null, ig.ImGuiWindowFlags_None)) {
        ig.igPushItemWidth(ig.igGetWindowWidth() * 0.5);
        _ = ig.igDragFloat("Camera Rotation", &rotation, 0.02, zt.math.toRadians(-360.0), zt.math.toRadians(360.0), "%.3f", ig.ImGuiSliderFlags_None);
        _ = ig.igDragFloat("Camera Zoom", &scale, 0.02, 0.1, 16, "%.3f", ig.ImGuiSliderFlags_None);
        _ = zg.edit("Shader On", &shaderActive);
        ig.igPopItemWidth();
    }
    ig.igEnd();
}
