const std = @import("std");
const zt = @import("zt");
const ig = @import("imgui");
const zg = zt.custom_components;
const SceneInterface = @import("scene/scene_interface.zig");

var demoContext: SceneInterface.DemoContext = undefined;

// We smooth the zoom, so we need a concrete value to lerp towards.
var target_zoom: f32 = 1.0;
var target_rotation: f32 = 0.0;

var scenes: std.ArrayList(SceneInterface) = undefined;
var currentScene: usize = 0;

pub fn main() !void {
    var context = try zt.App.begin(std.heap.c_allocator);

    // zt.path ensures that we load relative to the binary, rather than cwd.
    // if cwd relative is preferable, simply omit zt.path
    demoContext.sheet = try zt.Texture.init(zt.path("texture/sheet.png"));
    demoContext.sheet.setNearestFilter();
    demoContext.camera_position = zt.math.Vec2.zero;
    demoContext.context = context;

    // I'm rigging these scenes up with a standard zig interface, which is just a fat pointer function table.
    // Want to understand each scene? just pretend the `update` function inside each file is the only part that matters.
    scenes = std.ArrayList(SceneInterface).init(std.heap.c_allocator);
    scenes.append(@import("scene/imgui_demo_scene.zig").init(&demoContext)) catch unreachable;
    scenes.append(@import("scene/renderer_scene.zig").init(&demoContext)) catch unreachable;
    scenes.append(@import("scene/dude_benchmark.zig").init(&demoContext)) catch unreachable;

    // Lets customize!
    const io = ig.igGetIO();
    zt.imgui_style.styleColorOrangeSlate();
    const font = context.addFont(zt.path("public-sans.ttf"), 16.0);
    io.FontDefault = font;

    context.settings.energySaving = false; // this example is a realtime game-style app, so we dont need energy saving.
    context.setWindowSize(1280, 720);
    context.setWindowTitle("ZT Demo");
    context.setWindowIcon(zt.path("texture/ico.png"));

    // You control your own main loop, all you got to do is call begin and end frame,
    // and zt will handle the rest.
    while (context.open) {
        context.beginFrame();

        // ==============================================
        // Camera Movement

        // Scale
        target_zoom = std.math.clamp(target_zoom + (zt.Axis.MouseWheel.read() * 0.25), 0.25, 5.0);
        demoContext.camera_zoom = zt.math.dampTowards(demoContext.camera_zoom, target_zoom, 8.0, context.time.dt);

        // Position
        // zt.Button.asStick is a treats the buttons provided like a vec2, like WASD
        const cameraMovement = zt.Button
            .asStick(zt.Button.W, zt.Button.S, zt.Button.A, zt.Button.D)
            .normalize()
            .scale(600.0 * context.time.dt);

        var dragCameraMovement = zt.math.Vec2.zero;
        if (zt.Button.MouseRightClick.down()) {
            dragCameraMovement = zt.Stick.MouseDelta.read().scaleDiv(demoContext.camera_zoom);
        }
        demoContext.camera_position = demoContext.camera_position.sub(cameraMovement).add(dragCameraMovement);

        // Rotation
        target_rotation = std.math.clamp(target_rotation + (zt.Button.asAxisStep(zt.Button.Q, zt.Button.E) * 0.785398), -6.28319, 6.28319);
        demoContext.camera_rotation = zt.math.dampTowards(demoContext.camera_rotation, target_rotation, 13.0, context.time.dt);

        // ==============================================
        // ImGui Stuff

        // Docking is on by default, this is a great imgui utility to let windows dock onto glfw itself.
        _ = ig.igDockSpaceOverViewport(null, ig.ImGuiDockNodeFlags_PassthruCentralNode, null);
        inspector(context);

        // ==============================================
        // Scene update and end frame

        scenes.items[currentScene].Update();
        context.endFrame();
    }
    context.deinit();
}

// This is a simple side panel that will display information about the scene, your context, and settings.
fn inspector(ctx: *zt.App.Context) void {
    if (ig.igBegin("Demo Controller", null, 0)) {
        ig.igText("Scenes");
        if (ig.igBeginListBox("##Listbox", .{})) {
            var i: usize = 0;
            while (i < scenes.items.len) : (i += 1) {
                const name = scenes.items[i].GetName();
                if (ig.igSelectable_Bool(name.ptr, i == currentScene, ig.ImGuiSelectableFlags_SpanAvailWidth, .{})) {
                    currentScene = i;
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
        ig.igSeparator();

        ig.igText("Information");
        zg.text("{d:.1}fps", .{ctx.time.fps});

        ig.igSeparator();

        scenes.items[currentScene].ImGuiSidePanel();
    }
    ig.igEnd();
}
