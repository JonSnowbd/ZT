const std = @import("std");
const zt = @import("zt");
const main = @import("../main.zig");
const ig = @import("imgui");
const zg = zt.custom_components;

const Hash = zt.game.SpatialHash.Generate(usize, .{ .bucketSize = 80 });
var rng: std.rand.Random = undefined;
const blip = struct {
    aabb: zt.math.Rect = .{},
    color: zt.math.Vec4 = .{},
    pub fn generate(within: zt.math.Rect) blip {
        // This is slow, but I'm lazy and this is just a demo, soooooo...
        var self: blip = .{};
        self.aabb.size.x = std.math.clamp(rng.float(f32) * 100.0, 5.0, within.size.x);
        self.aabb.size.y = std.math.clamp(rng.float(f32) * 100.0, 5.0, within.size.y);
        self.aabb.position.x = std.math.clamp(rng.float(f32) * within.size.x, 0, within.size.x - self.aabb.size.x) + within.position.x;
        self.aabb.position.y = std.math.clamp(rng.float(f32) * within.size.y, 0, within.size.y - self.aabb.size.y) + within.position.y;

        // Little bit of transparency! Incase they overlap.
        self.color = zt.math.vec4(rng.float(f32), rng.float(f32), rng.float(f32), 0.33);
        return self;
    }
};

var rotation: f32 = 0.0;
var scale: f32 = 1.0;
var pos: zt.math.Vec2 = .{};

// I'm avoiding allocations here, in your application you probably want an `std.ArrayList(blip)`
var array: std.ArrayList(blip) = undefined;
var hash: Hash = undefined;
var bounds: zt.math.Rect = zt.math.rect(-400, -400, 800, 800);
var inited = false;
var spawned: i32 = 0;

// This is the storage for when the user is querying with a rectangle.
var rect_Q: zt.math.Rect = .{};
// This is the storage for when the user is querying with a line.
var line_Q: zt.math.Vec2 = .{};

const queryStyle = enum { point, line, rect };

var currentStyle: queryStyle = .point;

pub fn update(ctx: *main.SampleApplication.Context) void {
    // Basic scene initialization:
    var io = ig.igGetIO();
    sceneSetup(ctx);

    var render = ctx.data.render;

    render.updateRenderSize(io.*.DisplaySize);
    render.updateCamera(pos, scale, rotation);

    for (array.items) |*b| {
        render.sprite(ctx.data.sheet, b.aabb.position, 0.0, b.aabb.size, b.color, null, zt.math.rect(131, 84, 2, 2));
    }

    // Generate the query based on the user input!
    switch (currentStyle) {
        // For a point, we just use the mouse position.
        .point => {
            var mouse = render.screenToWorld(io.*.MousePos);
            render.sprite(ctx.data.sheet, mouse.sub(zt.math.vec2(-1, 1)), 0.0, zt.math.vec2(2, 2), zt.math.Vec4.white, null, zt.math.rect(131, 84, 2, 2));
            var query = hash.queryPoint(mouse);
            for (query) |i| {
                var b: blip = array.items[i];

                if (zt.game.Physics.isPointInRect(mouse, b.aabb)) {
                    render.sprite(ctx.data.sheet, b.aabb.position, 0.0, b.aabb.size, zt.math.vec4(0.0, 1.0, 0.0, 0.5), null, zt.math.rect(131, 84, 2, 2));
                } else {
                    render.sprite(ctx.data.sheet, b.aabb.position, 0.0, b.aabb.size, zt.math.vec4(1.0, 1.0, 0.0, 0.5), null, zt.math.rect(131, 84, 2, 2));
                }
            }
        },
        // We simulate a line drawing by not dragging the start node when holding lmb, and querying the 2.
        .line => {
            const lineCol = zt.math.vec4(0.0, 0.0, 0.0, 1.0);
            var mouse = render.screenToWorld(io.*.MousePos);
            if (!io.*.MouseDown[ig.ImGuiMouseButton_Left]) {
                line_Q = mouse;
            } else {}
            var query = hash.queryLine(line_Q, mouse);
            for (query) |i| {
                var b: blip = array.items[i];

                if (zt.game.Physics.isLineInRect(line_Q, mouse, b.aabb.position, b.aabb.size)) {
                    render.sprite(ctx.data.sheet, b.aabb.position, 0.0, b.aabb.size, zt.math.vec4(0.0, 1.0, 0.0, 0.5), null, zt.math.rect(131, 84, 2, 2));
                } else {
                    render.sprite(ctx.data.sheet, b.aabb.position, 0.0, b.aabb.size, zt.math.vec4(1.0, 1.0, 0.0, 0.5), null, zt.math.rect(131, 84, 2, 2));
                }
            }
            render.line(ctx.data.sheet, zt.math.rect(131, 84, 2, 2), line_Q, mouse, 0, 5.0, lineCol, lineCol);
        },
        .rect => {
            const lineCol = zt.math.vec4(0.0, 0.0, 0.0, 1.0);
            var mouse = render.screenToWorld(io.*.MousePos);
            if (!io.*.MouseDown[ig.ImGuiMouseButton_Left]) {
                rect_Q.position = mouse;
            } else {
                rect_Q.size = mouse.sub(rect_Q.position);
            }
            var query = hash.queryAABB(rect_Q.position, rect_Q.size);
            for (query) |i| {
                var b: blip = array.items[i];

                if (zt.game.Physics.isRectInRect(rect_Q.position, rect_Q.size, b.aabb.position, b.aabb.size)) {
                    render.sprite(ctx.data.sheet, b.aabb.position, 0.0, b.aabb.size, zt.math.vec4(0.0, 1.0, 0.0, 0.5), null, zt.math.rect(131, 84, 2, 2));
                } else {
                    render.sprite(ctx.data.sheet, b.aabb.position, 0.0, b.aabb.size, zt.math.vec4(1.0, 1.0, 0.0, 0.5), null, zt.math.rect(131, 84, 2, 2));
                }
            }
            render.rectangleHollow(ctx.data.sheet, zt.math.rect(131, 84, 2, 2), rect_Q, 0, 2.0, lineCol);
        },
    }

    render.rectangleHollow(ctx.data.sheet, zt.math.rect(131, 84, 2, 2), bounds, 0, 2.0, zt.math.vec4(0.2, 1.0, 0.2, 0.8));
    render.flush();
}

fn control() void {
    var io = ig.igGetIO();
    ig.igSetNextWindowPos(io.*.DisplaySize, ig.ImGuiCond_Appearing, .{ .x = 1, .y = 1 });
    if (ig.igBegin("Spatial Hash Demo", null, ig.ImGuiWindowFlags_None)) {
        ig.igPushItemWidth(ig.igGetWindowWidth() * 0.5);
        _ = ig.igDragFloat("Camera Rotation", &rotation, 0.02, zt.math.toRadians(-360.0), zt.math.toRadians(360.0), "%.3f", ig.ImGuiSliderFlags_None);
        _ = ig.igDragFloat("Camera Zoom", &scale, 0.02, 0.1, 16, "%.3f", ig.ImGuiSliderFlags_None);
        ig.igSeparator();
        _ = zg.ztEditDrag("Within Bounds", 2, &bounds);

        var generation: ?usize = null;
        if (ig.igButton("Spawn 10 items", .{})) {
            generation = 10;
        }
        if (ig.igButton("Spawn 100 items", .{})) {
            generation = 100;
        }
        if (ig.igButton("Spawn 1000 items", .{})) {
            generation = 1000;
        }

        if (generation) |len| {
            var i: usize = 0;
            while (i < len) : (i += 1) {
                var new = blip.generate(bounds);

                var index = array.items.len;
                array.append(new) catch unreachable;

                hash.addAABB(index, array.items[index].aabb.position, array.items[index].aabb.size);
            }
            spawned += @intCast(i32, len);
        }
        if (ig.igBeginListBox("## INPUT STYLE", .{})) {
            if (ig.igSelectable_Bool("Point", currentStyle == .point, ig.ImGuiSelectableFlags_SpanAvailWidth, .{})) {
                currentStyle = .point;
            }
            if (ig.igSelectable_Bool("Line", currentStyle == .line, ig.ImGuiSelectableFlags_SpanAvailWidth, .{})) {
                currentStyle = .line;
            }
            if (ig.igSelectable_Bool("Rect", currentStyle == .rect, ig.ImGuiSelectableFlags_SpanAvailWidth, .{})) {
                currentStyle = .rect;
            }
            ig.igEndListBox();
        }
        zg.ztTextWrap("You've spawned {any} squares.", .{spawned});
        ig.igTextWrapped("Use middle mouse to scroll, and mousewheel to zoom");
        ig.igPopItemWidth();
    }
    ig.igEnd();
}

fn sceneSetup(ctx: *main.SampleApplication.Context) void {
    var io = ig.igGetIO();
    if (!inited) {
        var prng = std.rand.DefaultPrng.init(blk: {
            var seed: u64 = undefined;
            std.os.getrandom(std.mem.asBytes(&seed)) catch {
                std.debug.print("OS getRandom failed.", .{});
                std.process.exit(1);
            };
            break :blk seed;
        });
        rng = prng.random();
        array = std.ArrayList(blip).init(ctx.allocator);
        hash = Hash.init(ctx.allocator);
        inited = true;
    }
    // Mouse Controls for this scene, pretty convenient considering the aabb size.
    if (io.*.MouseDown[ig.ImGuiMouseButton_Middle]) {
        pos = pos.add(io.*.MouseDelta.scaleDiv(scale));
    }
    if (io.*.MouseWheel != 0) {
        scale = std.math.clamp(scale + (io.*.MouseWheel * 0.5), 0.5, 16);
    }
    control();
}
