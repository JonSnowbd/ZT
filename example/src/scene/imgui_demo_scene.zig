const std = @import("std");
const zt = @import("zt");
const zg = zt.custom_components;
const ig = @import("imgui");

const SceneInterface = @import("scene_interface.zig");

const State = struct {
    demo: *SceneInterface.DemoContext = undefined,
    open: bool = true,
};

pub fn init(context: *SceneInterface.DemoContext) SceneInterface {
    const instance = std.heap.c_allocator.create(State) catch unreachable;
    instance.open = true;
    instance.demo = context;
    return SceneInterface{
        .ptr = instance,
        .NameFn = name,
        .SideFn = side,
        .UpdateFn = update,
    };
}

fn name(ptr: *anyopaque) []const u8 {
    _ = ptr;
    return "ImGui Demo";
}
fn update(ptr: *anyopaque) void {
    const self: *State = @ptrCast(@alignCast(ptr));
    if (self.open) {
        ig.igShowDemoWindow(null);
    }
}
fn side(ptr: *anyopaque) void {
    const self: *State = @ptrCast(@alignCast(ptr));
    _ = zg.edit("Open Demo", &self.open, .{});
}
