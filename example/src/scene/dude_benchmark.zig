const std = @import("std");
const zt = @import("zt");
const zg = zt.custom_components;
const ig = @import("imgui");

const SceneInterface = @import("scene_interface.zig");

var rng = std.rand.DefaultPrng{
    .s = [_]u64{ 303184, 34718734, 109413457, 2647317 },
};
var random = rng.random();

const Dude = struct {
    position: zt.math.Vec2,
    velocity: zt.math.Vec2,
    color: zt.math.Vec4,
};

const State = struct {
    demo: *SceneInterface.DemoContext = undefined,
    renderer: zt.Renderer,
    gravity: f32,
    upBounce: f32,
    dudeSize: f32,
    bounds: f32,
    dudes: std.ArrayList(Dude),
};

pub fn init(context: *SceneInterface.DemoContext) SceneInterface {
    const instance = std.heap.c_allocator.create(State) catch unreachable;
    instance.demo = context;
    instance.renderer = zt.Renderer.init();
    instance.gravity = 981.0;
    instance.upBounce = 850.0;
    instance.dudeSize = 32.0;
    instance.bounds = 500.0;
    instance.dudes = std.ArrayList(Dude).init(std.heap.c_allocator);
    return SceneInterface{
        .ptr = instance,
        .NameFn = name,
        .SideFn = side,
        .UpdateFn = update,
    };
}

fn name(ptr: *anyopaque) []const u8 {
    _ = ptr;
    return "Dude Benchmark";
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

    const io = ig.igGetIO();

    if (!io.WantCaptureMouse and zt.Button.MouseLeftClick.down()) {
        for (0..5) |_| {
            const d = Dude{
                .color = zt.math.vec4(random.float(f32), random.float(f32), random.float(f32), 1.0),
                .position = zt.math.vec2(std.math.sin(self.demo.context.time.lifetime) * (self.bounds * 0.5), -200.0),
                .velocity = zt.math.vec2(random.float(f32) * 300.0, 0.0),
            };
            self.dudes.append(d) catch unreachable;
        }
    }

    // Lets update and draw all the dudes
    const gravity = zt.math.vec2(0.0, self.gravity).scale(self.demo.context.time.dt);
    const source = zt.math.rect(384, 0, 16, 16);
    const origin = zt.math.vec2(0.5, 0.5);
    const size = zt.math.vec2(self.dudeSize, self.dudeSize);

    const whiteDotSrc = zt.math.rect(38, 22, 2, 2);
    const offset = zt.math.vec2(self.dudeSize * 0.5, self.dudeSize * 0.5);
    self.renderer.line(self.demo.sheet, whiteDotSrc, zt.math.vec2(-self.bounds - offset.x, offset.y), zt.math.vec2(self.bounds + offset.x, offset.y), 0.0, 3.0, zt.math.Vec4.white, zt.math.Vec4.white);
    self.renderer.line(self.demo.sheet, whiteDotSrc, zt.math.vec2(-self.bounds - offset.x, offset.y), zt.math.vec2(-self.bounds - offset.x, -500.0), 0.0, 3.0, zt.math.Vec4.white, zt.math.Vec4.white);
    self.renderer.line(self.demo.sheet, whiteDotSrc, zt.math.vec2(self.bounds + offset.x, offset.y), zt.math.vec2(self.bounds + offset.x, -500.0), 0.0, 3.0, zt.math.Vec4.white, zt.math.Vec4.white);

    for (self.dudes.items) |*dude| {
        dude.velocity = dude.velocity.add(gravity);
        dude.position = dude.position.add(dude.velocity.scale(self.demo.context.time.dt));

        if (dude.position.x > self.bounds or dude.position.x < -self.bounds) {
            dude.velocity.x *= -1.0;
            dude.position.x = std.math.clamp(dude.position.x, -self.bounds, self.bounds);
        }
        if (dude.position.y > 0.0) {
            dude.velocity.y = -self.upBounce;
            dude.position.y = @min(dude.position.y, 0.0);
        }

        self.renderer.sprite(self.demo.sheet, dude.position, 0.0, size, dude.color, origin, source);
    }

    // IMPORTANT! Renderer is not integrated directly into zt so it is not listening for a frame end,
    // so flush it manually when youre done using it.

    self.renderer.flush();
}
fn side(ptr: *anyopaque) void {
    const self: *State = @ptrCast(@alignCast(ptr));
    _ = zg.edit("Gravity", &self.gravity);
    _ = zg.editDrag("Bounds", 1.0, &self.bounds);
    _ = zg.editDrag("Upbounce", 1.0, &self.upBounce);
    _ = zg.editDrag("DudeSize", 1.0, &self.dudeSize);

    zg.text("{any} dudes", .{self.dudes.items.len});
    zg.text("{any} draw calls", .{self.renderer.drawCalls});
}
