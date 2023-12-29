const std = @import("std");
const zt = @import("../zt.zig");
const ig = @import("imgui");

/// You can't remove the background from this, but you can make it invisible with
/// style.Colors.
pub fn viewPort() ig.ImGuiID {
    const dockNodeFlags = ig.ImGuiDockNodeFlags_PassthruCentralNode;
    const windowFlags =
        ig.ImGuiWindowFlags_NoCollapse |
        ig.ImGuiWindowFlags_NoDecoration |
        ig.ImGuiWindowFlags_NoDocking |
        ig.ImGuiWindowFlags_NoMove |
        ig.ImGuiWindowFlags_NoResize |
        ig.ImGuiWindowFlags_NoScrollbar |
        ig.ImGuiWindowFlags_NoTitleBar |
        ig.ImGuiWindowFlags_NoNavFocus |
        ig.ImGuiWindowFlags_NoBackground |
        ig.ImGuiWindowFlags_NoFocusOnAppearing |
        ig.ImGuiWindowFlags_NoMouseInputs |
        ig.ImGuiWindowFlags_NoInputs |
        ig.ImGuiWindowFlags_NoBringToFrontOnFocus;

    const mainView = ig.igGetMainViewport();

    const pos: ig.ImVec2 = mainView.*.WorkPos;
    const size: ig.ImVec2 = mainView.*.WorkSize;

    ig.igSetNextWindowPos(pos, ig.ImGuiCond_Always, .{});
    ig.igSetNextWindowSize(size, ig.ImGuiCond_Always);

    ig.igPushStyleVar_Vec2(ig.ImGuiStyleVar_WindowPadding, .{});
    _ = ig.igBegin("###DockSpace", null, windowFlags);
    const id = ig.igGetID_Str("DefaultDockingViewport");
    _ = ig.igDockSpace(id, .{}, dockNodeFlags, ig.ImGuiWindowClass_ImGuiWindowClass());

    ig.igEnd();
    ig.igPopStyleVar(1);

    return id;
}

/// If you ever need to format a string for use inside imgui, this will work the same as any format function.
pub inline fn fmtTextForImgui(comptime fmt: []const u8, args: anytype) [:0]const u8 {
    const alloc = zt.Allocators.ring();
    return std.fmt.allocPrintZ(alloc, fmt, args) catch unreachable;
}
/// Uses a ring allocator to spit out imgui text using zig.ig's formatting library.
pub fn text(comptime fmt: []const u8, args: anytype) void {
    const textFormatted = fmtTextForImgui(fmt, args);
    ig.igText("%s", textFormatted.ptr);
}
/// Uses a ring allocator to spit out imgui text using zig's formatting library, wrapping if needed.
pub fn textWrap(comptime fmt: []const u8, args: anytype) void {
    const textFormatted = fmtTextForImgui(fmt, args);
    ig.igTextWrapped("%s", textFormatted.ptr);
}
/// Uses a ring allocator to spit out imgui text using zig's formatting library, in the disabled color.
pub fn textDisabled(comptime fmt: []const u8, args: anytype) void {
    const textFormatted = fmtTextForImgui(fmt, args);
    ig.igTextDisabled("%s", textFormatted.ptr);
}
/// Uses a ring allocator to spit out imgui text using zig's formatting library with a custom color.
pub fn textColor(comptime fmt: []const u8, color: ig.ImVec4, args: anytype) void {
    const textFormatted = fmtTextForImgui(fmt, args);
    ig.igTextColored(color, "%s", textFormatted.ptr);
}

/// Attempts to create a general editor for most structs, including math structs. This isnt always what you want, and in
/// those cases its always better to layout your own editor. This is biased towards creating drag inputs.
pub fn editDrag(label: []const u8, speed: f32, ptr: anytype) bool {
    // Array buffers are weird. Lets sort them out first.
    const ti: std.builtin.Type = @typeInfo(@TypeOf(ptr.*));
    if (ti == .Array) {
        if (ti.Array.child == u8) {
            return ig.igInputText(label.ptr, ptr, @intCast(ti.Array.len), ig.ImGuiInputTextFlags_None, null, null);
        }
    }
    const fmax = std.math.floatMax(f32);
    switch (@TypeOf(ptr)) {
        *bool => {
            return ig.igCheckbox(label.ptr, ptr);
        },
        *i32 => {
            const imin = std.math.minInt(i32);
            const imax = std.math.maxInt(i32);
            return ig.igDragInt(label.ptr, ptr, speed, @intCast(imin), @intCast(imax), "%i", ig.ImGuiSliderFlags_NoRoundToFormat);
        },
        *f32 => {
            return ig.igDragFloat(label.ptr, ptr, speed, -fmax, fmax, "%.2f", ig.ImGuiSliderFlags_NoRoundToFormat);
        },
        *usize => {
            const cast = @as(c_int, @intCast(ptr.*));
            const result = ig.igInputInt(label.ptr, &cast, 1, 5, ig.ImGuiInputTextFlags_None);
            if (result) {
                ptr.* = @intCast(std.math.max(0, cast));
            }
            return result;
        },
        *zt.math.Vec2 => {
            var cast: [2]f32 = .{ ptr.*.x, ptr.*.y };
            const result = ig.igDragFloat2(label.ptr, &cast, speed, -fmax, fmax, "%.2f", ig.ImGuiSliderFlags_NoRoundToFormat);
            if (result) {
                ptr.* = zt.math.vec2(cast[0], cast[1]);
            }
            return result;
        },
        *zt.math.Vec3 => {
            var cast: [3]f32 = .{ ptr.*.x, ptr.*.y, ptr.*.z };
            const result = ig.igDragFloat3(label.ptr, &cast, speed, -fmax, fmax, "%.2f", ig.ImGuiSliderFlags_NoRoundToFormat);
            if (result) {
                ptr.* = zt.math.vec3(cast[0], cast[1], cast[2]);
            }
            return result;
        },
        *zt.math.Vec4 => {
            var cast: [4]f32 = .{ ptr.*.x, ptr.*.y, ptr.*.z, ptr.*.w };
            const result = ig.igColorEdit4(label.ptr, &cast, ig.ImGuiColorEditFlags_Float);
            if (result) {
                ptr.* = zt.math.vec4(cast[0], cast[1], cast[2], cast[3]);
            }
            return result;
        },
        *zt.math.Rect => {
            var cast: [4]f32 = .{ ptr.*.position.x, ptr.*.position.y, ptr.*.size.x, ptr.*.size.y };
            const result = ig.igDragFloat4(label.ptr, &cast, speed, -fmax, fmax, "%.2f", ig.ImGuiSliderFlags_NoRoundToFormat);
            if (result) {
                ptr.* = zt.math.rect(cast[0], cast[1], cast[2], cast[3]);
            }
            return result;
        },
        else => {
            std.debug.print("No editor found for type {s}\n", .{@typeName(@TypeOf(ptr))});
            return false;
        },
    }
}

pub fn edit(label: []const u8, ptr: anytype) bool {
    // Array buffers are weird. Lets sort them out first.
    const ti: std.builtin.Type = @typeInfo(@TypeOf(ptr.*));
    if (ti == .Array) {
        if (ti.Array.child == u8) {
            return ig.igInputText(label.ptr, ptr, @intCast(ti.Array.len), ig.ImGuiInputTextFlags_None, null, null);
        }
    }
    switch (@TypeOf(ptr)) {
        *bool => {
            return ig.igCheckbox(label.ptr, ptr);
        },
        *i32 => {
            return ig.igInputInt(label.ptr, ptr, 1, 3, ig.ImGuiInputTextFlags_None);
        },
        *f32 => {
            return ig.igInputFloat(label.ptr, ptr, 1, 3, "%.2f", ig.ImGuiInputTextFlags_None);
        },
        *usize => {
            const cast = @as(c_int, @intCast(ptr.*));
            const result = ig.igInputInt(label.ptr, &cast, 1, 5, ig.ImGuiInputTextFlags_None);
            if (result) {
                ptr.* = @intCast(std.math.max(0, cast));
            }
            return result;
        },
        *zt.math.Vec2 => {
            const cast: [2]f32 = .{ ptr.*.x, ptr.*.y };
            const result = ig.igInputFloat2(label.ptr, &cast, "%.2f", ig.ImGuiInputTextFlags_None);
            if (result) {
                ptr.* = zt.math.vec2(cast[0], cast[1]);
            }
            return result;
        },
        *zt.math.Vec3 => {
            const cast: [3]f32 = .{ ptr.*.x, ptr.*.y, ptr.*.z };
            const result = ig.igInputFloat3(label.ptr, &cast, "%.2f", ig.ImGuiInputTextFlags_None);
            if (result) {
                ptr.* = zt.math.vec3(cast[0], cast[1], cast[2]);
            }
            return result;
        },
        *zt.math.Vec4 => {
            const cast: [4]f32 = .{ ptr.*.x, ptr.*.y, ptr.*.z, ptr.*.w };
            const result = ig.igColorEdit4(label.ptr, &cast, ig.ImGuiColorEditFlags_Float);
            if (result) {
                ptr.* = zt.math.vec4(cast[0], cast[1], cast[2], cast[3]);
            }
            return result;
        },
        *zt.math.Rect => {
            const cast: [4]f32 = .{ ptr.*.position.x, ptr.*.position.y, ptr.*.size.x, ptr.*.size.y };
            const result = ig.igInputFloat4(label.ptr, &cast, "%.2f", ig.ImGuiInputTextFlags_None);
            if (result) {
                ptr.* = zt.math.rect(cast[0], cast[1], cast[2], cast[3]);
            }
            return result;
        },
        else => {
            std.debug.print("No editor found for type {s}\n", .{@typeName(@TypeOf(ptr))});
            return false;
        },
    }
}
