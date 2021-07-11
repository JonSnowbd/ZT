const std = @import("std");
const zt = @import("zt");
usingnamespace @import("imgui");
usingnamespace zt.custom_components;

const scenes_n = [_][]const u8{
    "2D Rendering",
    "2D Render Targets",
    "2D Spatial Hash (Squares)",
    "2D Collider Support",
    "ImGui Demo",
};
const scenes = [_]fn (*SampleApplication.Context) void{
    @import("scenes/renderer.zig").update,
    @import("scenes/rendertarget.zig").update,
    @import("scenes/spatialhash_squares.zig").update,
    @import("scenes/colliders.zig").update,
    @import("scenes/imgui.zig").update,
};

/// SampleData will be available through the application's context.
pub const SampleData = struct {
    currentScene: usize = 0,
    render: zt.game.Renderer = undefined,
    sheet: zt.gl.Texture = undefined,
};
pub const SampleApplication = zt.App(SampleData);

pub fn main() !void {
    var context = SampleApplication.begin(std.heap.c_allocator);

    // Lets customize!
    var io = igGetIO();
    var font = context.addFont(zt.path("public-sans.ttf"), 14.0);
    io.*.FontDefault = font;

    // Set up state
    context.settings.energySaving = false; // Some examples are games, and will benefit from this.
    context.data.render = zt.game.Renderer.init();
    context.data.sheet = try zt.gl.Texture.init(zt.path("texture/sheet.png"));
    context.data.sheet.setNearestFilter(); // Pixel art looks better with nearest filters.

    context.setWindowSize(1280, 720);
    context.setWindowTitle("ZT Demo");
    context.setWindowIcon(zt.path("texture/ico.png"));

    // You control your own main loop, all you got to do is call begin and end frame,
    // and zt will handle the rest.
    while (context.open) {
        context.beginFrame();
        inspectContext(context);

        // Call into the selected demo:
        var index = std.math.clamp(context.data.currentScene, 0, scenes.len - 1);
        scenes[index](context);

        context.endFrame();
    }

    context.data.sheet.deinit();
    context.data.render.deinit();
    context.deinit();
}

// This is a simple side panel that will display information about the scene, your context, and settings.
fn inspectContext(ctx: *SampleApplication.Context) void {
    const flags =
        ImGuiWindowFlags_NoMove |
        ImGuiWindowFlags_NoTitleBar |
        ImGuiWindowFlags_NoResize;

    var io = igGetIO();
    igSetNextWindowPos(zt.math.vec2(8, 8), ImGuiCond_Always, .{});
    igSetNextWindowSize(zt.math.vec2(300, io.*.DisplaySize.y - 16), ImGuiCond_Always);
    if (igBegin("Context Inspection", null, flags)) {
        igText("Data Settings");
        // ztEdit("Current Scene", &ctx.data.currentScene);
        if (igBeginListBox("##Listbox pog", .{})) {
            var i: usize = 0;
            while (i < scenes.len) : (i += 1) {
                if (igSelectable_Bool(scenes_n[i].ptr, i == ctx.data.currentScene, ImGuiSelectableFlags_SpanAvailWidth, .{})) {
                    ctx.data.currentScene = i;
                }
            }
            igEndListBox();
        }
        igSeparator();

        igText("Settings");
        _ = ztEdit("Energy Saving", &ctx.settings.energySaving);
        if (igCheckbox("V Sync", &ctx.settings.vsync)) {
            // The vsync setting is only a getter, setting it does nothing.
            // So on change, we follow through with the real call that changes it.
            ctx.setVsync(ctx.settings.vsync);
        }
        _ = ztEdit("ImGui Active (Warning!!)", &ctx.settings.imguiActive);
        igSeparator();

        igText("Information");
        ztText("{d:.1}fps", .{ctx.time.fps});
    }
    igEnd();
}
