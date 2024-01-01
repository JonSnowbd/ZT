const std = @import("std");
const zt = @import("../zt.zig");
const ig = @import("imgui");

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

pub const EditSettings = struct {
    drag: bool = false,
    dragSpeed: f32 = 1.0,
};

pub fn pushFullWidth() void {
    var s = zt.math.Vec2.zero;
    ig.igGetContentRegionAvail(&s);
    ig.igPushItemWidth(s.x);
}
pub fn popFullWidth() void {
    ig.igPopItemWidth();
}

pub fn edit(label: []const u8, ptr: anytype, settings: EditSettings) bool {
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
            if (settings.drag) {
                const imin = std.math.minInt(i32);
                const imax = std.math.maxInt(i32);
                return ig.igDragInt(label.ptr, ptr, settings.dragSpeed, @intCast(imin), @intCast(imax), "%i", ig.ImGuiSliderFlags_NoRoundToFormat);
            } else {
                return ig.igInputInt(label.ptr, ptr, 1, 3, ig.ImGuiInputTextFlags_None);
            }
        },
        *f32 => {
            if (settings.drag) {
                return ig.igDragFloat(label.ptr, ptr, settings.dragSpeed, -fmax, fmax, "%.2f", ig.ImGuiSliderFlags_NoRoundToFormat);
            } else {
                return ig.igInputFloat(label.ptr, ptr, 1, 3, "%.2f", ig.ImGuiInputTextFlags_None);
            }
        },
        *usize => {
            if (settings.drag) {
                const cast = @as(c_int, @intCast(ptr.*));
                const result = ig.igInputInt(label.ptr, &cast, 1, 5, ig.ImGuiInputTextFlags_None);
                if (result) {
                    ptr.* = @intCast(std.math.max(0, cast));
                }
                return result;
            } else {
                const cast = @as(c_int, @intCast(ptr.*));
                const result = ig.igInputInt(label.ptr, &cast, 1, 5, ig.ImGuiInputTextFlags_None);
                if (result) {
                    ptr.* = @intCast(std.math.max(0, cast));
                }
                return result;
            }
        },
        *zt.math.Vec2 => {
            if (settings.drag) {
                var cast: [2]f32 = .{ ptr.*.x, ptr.*.y };
                const result = ig.igDragFloat2(label.ptr, &cast, settings.dragSpeed, -fmax, fmax, "%.2f", ig.ImGuiSliderFlags_NoRoundToFormat);
                if (result) {
                    ptr.* = zt.math.vec2(cast[0], cast[1]);
                }
                return result;
            } else {
                var cast: [2]f32 = .{ ptr.*.x, ptr.*.y };
                const result = ig.igInputFloat2(label.ptr, @ptrCast(&cast), "%.2f", ig.ImGuiInputTextFlags_None);
                if (result) {
                    ptr.* = zt.math.vec2(cast[0], cast[1]);
                }
                return result;
            }
        },
        *zt.math.Vec3 => {
            if (settings.drag) {
                var cast: [3]f32 = .{ ptr.*.x, ptr.*.y, ptr.*.z };
                const result = ig.igDragFloat3(label.ptr, &cast, settings.dragSpeed, -fmax, fmax, "%.2f", ig.ImGuiSliderFlags_NoRoundToFormat);
                if (result) {
                    ptr.* = zt.math.vec3(cast[0], cast[1], cast[2]);
                }
                return result;
            } else {
                const cast: [3]f32 = .{ ptr.*.x, ptr.*.y, ptr.*.z };
                const result = ig.igInputFloat3(label.ptr, &cast, "%.2f", ig.ImGuiInputTextFlags_None);
                if (result) {
                    ptr.* = zt.math.vec3(cast[0], cast[1], cast[2]);
                }
                return result;
            }
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
            if (settings.drag) {
                var cast: [4]f32 = .{ ptr.*.position.x, ptr.*.position.y, ptr.*.size.x, ptr.*.size.y };
                const result = ig.igDragFloat4(label.ptr, &cast, settings.dragSpeed, -fmax, fmax, "%.2f", ig.ImGuiSliderFlags_NoRoundToFormat);
                if (result) {
                    ptr.* = zt.math.rect(cast[0], cast[1], cast[2], cast[3]);
                }
                return result;
            } else {
                const cast: [4]f32 = .{ ptr.*.position.x, ptr.*.position.y, ptr.*.size.x, ptr.*.size.y };
                const result = ig.igInputFloat4(label.ptr, &cast, "%.2f", ig.ImGuiInputTextFlags_None);
                if (result) {
                    ptr.* = zt.math.rect(cast[0], cast[1], cast[2], cast[3]);
                }
                return result;
            }
        },
        else => {
            std.debug.print("No editor found for type {s}\n", .{@typeName(@TypeOf(ptr))});
            return false;
        },
    }
}
