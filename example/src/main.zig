const std = @import("std");
const zt = @import("zt");
const ig = @import("imgui");
const zg = zt.custom_components;

pub const embeddedImage: []const u8 = @embedFile("inline.png");

pub var open_console: bool = false;
pub var currentScene: usize = 0;
pub var render: zt.Renderer = undefined;
pub var inlined: zt.Texture = undefined;
pub var sheet: zt.Texture = undefined;
pub var redShader: zt.Shader = undefined;
pub var consoleOpen: bool = true;

pub fn main() !void {
    var context = try zt.App.begin(std.heap.c_allocator);

    // Lets customize!
    const io = ig.igGetIO();
    const font = context.addFont(zt.path("public-sans.ttf"), 14.0);
    io.FontDefault = font;

    // Set up state
    context.settings.energySaving = false; // Some examples are games, and will benefit from this.

    // Loading textures
    sheet = try zt.Texture.init(zt.path("texture/sheet.png"));
    sheet.setNearestFilter(); // Pixel art looks better with nearest filters.
    inlined = try zt.Texture.initMemory(embeddedImage);

    // Creating a shader for `zt.game.Renderer` only needs a fragment shader's source as the vertex shader
    // will be provided by `zt.game.Renderer`. If you need more flexibility than this you'll want to
    // edit ZT itself, or create your own buffer type.
    render = zt.Renderer.init();
    redShader = zt.Renderer.createShader(@embedFile("scenes/shader/red.fragment"));

    context.setWindowSize(1280, 720);
    context.setWindowTitle("ZT Demo");
    context.setWindowIcon(zt.path("texture/ico.png"));

    // You control your own main loop, all you got to do is call begin and end frame,
    // and zt will handle the rest.
    while (context.open) {
        context.beginFrame();
        inspectContext(context);

        context.endFrame();
    }

    sheet.deinit();
    render.deinit();
    context.deinit();
}

// This is a simple side panel that will display information about the scene, your context, and settings.
fn inspectContext(ctx: *zt.App.Context) void {
    if (zt.Button.Grave.pressed()) {
        consoleOpen = !consoleOpen;
    }
    if (!consoleOpen) return;

    _ = ig.igDockSpaceOverViewport(null, ig.ImGuiDockNodeFlags_PassthruCentralNode, null);

    if (ig.igBegin("Demo Controller", null, 0)) {
        ig.igText("Scenes");
        if (ig.igBeginListBox("##Listbox", .{})) {
            // var i: usize = 0;
            // while (i < scenes.len) : (i += 1) {
            //     if (ig.igSelectable_Bool(scenes_n[i].ptr, i == currentScene, ig.ImGuiSelectableFlags_SpanAvailWidth, .{})) {
            //         currentScene = i;
            //     }
            // }
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
        if (ig.igButton("Stylize", .{})) {
            zt.imgui_style.styleSizeCompact();
            zt.imgui_style.styleColorOrangeSlate();
        }
        ig.igSeparator();

        ig.igText("Information");
        zg.text("{d:.1}fps", .{ctx.time.fps});
    }
    ig.igEnd();
}
