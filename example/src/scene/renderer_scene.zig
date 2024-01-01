const std = @import("std");
const zt = @import("zt");
const zg = zt.custom_components;
const ig = @import("imgui");

const SceneInterface = @import("scene_interface.zig");

const State = struct {
    demo: *SceneInterface.DemoContext = undefined,
    renderer: zt.Renderer,
    minion_pos: zt.math.Vec2,
};

pub fn init(context: *SceneInterface.DemoContext) SceneInterface {
    const instance = std.heap.c_allocator.create(State) catch unreachable;
    instance.demo = context;
    instance.renderer = zt.Renderer.init();
    instance.minion_pos = zt.math.Vec2.zero;
    return SceneInterface{
        .ptr = instance,
        .NameFn = name,
        .SideFn = side,
        .UpdateFn = update,
    };
}

fn name(ptr: *anyopaque) []const u8 {
    _ = ptr;
    return "ZT Renderer";
}
fn update(ptr: *anyopaque) void {
    const self: *State = @ptrCast(@alignCast(ptr));

    // The renderer is basically just a state machine that auto flushes
    // the vertices to opengl when it needs to. As such its super simple to use
    // and does not require deep integration, and does not prevent you from
    // using opengl before or after it.

    // Every frame you should configure it before using it
    // The renderer will be outputting to the window's frame, so we will tell it to use the contexts size
    self.renderer.updateRenderSize(zt.math.vec2(self.demo.context.width, self.demo.context.height));
    // And we can feed it a camera with simple transforms
    self.renderer.updateCamera(self.demo.camera_position, self.demo.camera_zoom, self.demo.camera_rotation);

    // Lets start by drawing a small tilemap, on z level 0
    var y: i32 = -4;
    var x: i32 = -4;
    const tileSize = 32;
    const source = zt.math.rect(16, 0, 16, 16);
    const size = zt.math.vec2(tileSize, tileSize);
    while (y <= 4) : (y += 1) {
        while (x <= 4) : (x += 1) {
            const pos = zt.math.vec2(tileSize * @as(f32, @floatFromInt(x)), tileSize * @as(f32, @floatFromInt(y)));
            self.renderer.sprite(self.demo.sheet, pos, 0, size, zt.math.Vec4.white, zt.math.vec2(0.5, 0.5), source);
        }
        x = -4;
    }

    // And a lil guy
    const minion_source = zt.math.rect(384, 0, 16, 16);
    self.renderer.sprite(self.demo.sheet, self.minion_pos, 0, zt.math.vec2(tileSize, tileSize), zt.math.vec4(1.0, 0.0, 0.0, 1.0), zt.math.vec2(0.5, 0.5), minion_source);

    // IMPORTANT! Renderer is not integrated directly into zt so it is not listening for a frame end,
    // so flush it manually when youre done using it.
    self.renderer.flush();
}
fn side(ptr: *anyopaque) void {
    const self: *State = @ptrCast(@alignCast(ptr));
    _ = zg.edit("Minion position", &self.minion_pos, .{ .drag = true });
}
