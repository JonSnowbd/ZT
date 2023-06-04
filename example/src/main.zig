const std = @import("std");
const zt = @import("zt");
const ig = @import("imgui");
const zg = zt.custom_components;

const scenes_n = [_][]const u8{
    "2D Rendering",
    "2D Shaders",
    "2D Render Targets",
    "2D Spatial Hash (Squares)",
    "2D Collider Support",
    "ImGui Demo",
};
const scenes = [_]*const fn (*SampleApplication.Context) void{
    @import("scenes/renderer.zig").update,
    @import("scenes/shaders.zig").update,
    @import("scenes/rendertarget.zig").update,
    @import("scenes/spatialhash_squares.zig").update,
    @import("scenes/colliders.zig").update,
    @import("scenes/imgui.zig").update,
};

pub const embeddedImage: []const u8 = @embedFile("inline.png");

/// SampleData will be available through the application's context.
pub const SampleData = struct {
    currentScene: usize = 0,
    render: zt.game.Renderer = undefined,
    inlined: zt.gl.Texture = undefined,
    sheet: zt.gl.Texture = undefined,
    redShader: zt.gl.Shader = undefined,
    consoleOpen: bool = true,
};
pub const SampleApplication = zt.App(SampleData);

pub fn main() !void {
    var context = try SampleApplication.begin(std.heap.c_allocator);

    // Lets customize!
    var io = ig.igGetIO();
    var font = context.addFont(zt.path("public-sans.ttf"), 14.0);
    io.*.FontDefault = font;

    // Set up state
    context.settings.energySaving = false; // Some examples are games, and will benefit from this.
    context.data.render = zt.game.Renderer.init();
    context.data.sheet = try zt.gl.Texture.init(zt.path("texture/sheet.png"));
    context.data.sheet.setNearestFilter(); // Pixel art looks better with nearest filters.
    // Creating a shader from `zt.game.Renderer` only needs a fragment shader's source as the vertex shader
    // will be provided by `zt.game.Renderer`. If you need more flexibility than this you'll want to
    // edit ZT itself, or create your own buffer type.
    context.data.redShader = zt.game.Renderer.createShader(@embedFile("scenes/shader/red.fragment"));
    context.data.inlined = try zt.gl.Texture.initMemory(embeddedImage);

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

    // Basic toggle
    const glfw = @import("glfw");
    var io = ig.igGetIO();
    if (io.*.KeysData[@enumToInt(glfw.Key.grave_accent)].DownDuration == 0.0) {
        ctx.data.consoleOpen = !ctx.data.consoleOpen;
    }
    if (!ctx.data.consoleOpen) return;

    const flags =
        ig.ImGuiWindowFlags_NoMove |
        ig.ImGuiWindowFlags_NoTitleBar |
        ig.ImGuiWindowFlags_NoResize;

    ig.igSetNextWindowPos(zt.math.vec2(8, 8), ig.ImGuiCond_Always, .{});
    ig.igSetNextWindowSize(zt.math.vec2(300, io.*.DisplaySize.y - 16), ig.ImGuiCond_Always);
    if (ig.igBegin("Context Inspection", null, flags)) {
        ig.igText("Data Settings");
        // zg.edit("Current Scene", &ctx.data.currentScene);
        if (ig.igBeginListBox("##Listbox pog", .{})) {
            var i: usize = 0;
            while (i < scenes.len) : (i += 1) {
                if (ig.igSelectable_Bool(scenes_n[i].ptr, i == ctx.data.currentScene, ig.ImGuiSelectableFlags_SpanAvailWidth, .{})) {
                    ctx.data.currentScene = i;
                }
            }
            ig.igEndListBox();
        }
        ig.igSeparator();

        ig.igText("Settings");
        _ = zg.edit("Energy Saving", &ctx.settings.energySaving);
        if (ig.igCheckbox("V Sync", &ctx.settings.vsync)) {
            // The vsync setting is only a getter, setting it does nothing.
            // So on change, we follow through with the real call that changes it.
            ctx.setVsync(ctx.settings.vsync);
        }
        _ = zg.edit("ig.ImGui Active (Warning!!)", &ctx.settings.imguiActive);
        ig.igSeparator();

        ig.igText("Information");
        zg.text("{d:.1}fps", .{ctx.time.fps});
    }
    ig.igEnd();
}
