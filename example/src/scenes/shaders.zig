const zt = @import("zt");
const main = @import("../main.zig");
usingnamespace @import("imgui");
usingnamespace zt.custom_components;

var rotation: f32 = 0.0;
var scale: f32 = 1.0;

var shaderActive: bool = true;

pub fn update(ctx: *main.SampleApplication.Context) void {
    control();

    var render = ctx.data.render;
    var io = igGetIO();
    render.updateRenderSize(io.*.DisplaySize);
    render.updateCamera(.{}, scale, rotation);

    // Without a shader:
    render.sprite(ctx.data.sheet, zt.math.vec2(-30,0), 0, zt.math.vec2(32, 32), zt.math.Vec4.white, zt.math.vec2(0.5, 0.5), zt.math.rect(16, 0, 16, 16));

    if(shaderActive) {
        // Pushing and popping shaders is a one-stack deal, I don't see the need to have nested shaders.
        render.updateShader(&ctx.data.redShader);
        render.sprite(ctx.data.sheet, zt.math.vec2(30,0), 0, zt.math.vec2(32, 32), zt.math.Vec4.white, zt.math.vec2(0.5, 0.5), zt.math.rect(16, 0, 16, 16));
        render.updateShader(null);

        // and because of this, you can push as many times as you want, and pop once to get back to default.
    } else {
        render.sprite(ctx.data.sheet, zt.math.vec2(30,0), 0, zt.math.vec2(32, 32), zt.math.Vec4.white, zt.math.vec2(0.5, 0.5), zt.math.rect(16, 0, 16, 16));
    }

    render.flush();
}

fn control() void {
    var io = igGetIO();
    igSetNextWindowPos(io.*.DisplaySize, ImGuiCond_Appearing, .{ .x = 1, .y = 1 });
    if (igBegin("Renderer Demo Settings", null, ImGuiWindowFlags_None)) {
        igPushItemWidth(igGetWindowWidth() * 0.5);
        _ = igDragFloat("Camera Rotation", &rotation, 0.02, zt.math.toRadians(-360.0), zt.math.toRadians(360.0), "%.3f", ImGuiSliderFlags_None);
        _ = igDragFloat("Camera Zoom", &scale, 0.02, 0.1, 16, "%.3f", ImGuiSliderFlags_None);
        _ = ztEdit("Shader On", &shaderActive);
        igPopItemWidth();
    }
    igEnd();
}
