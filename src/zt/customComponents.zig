const std = @import("std");
const zt = @import("../zt.zig");
usingnamespace @import("imgui");

/// This is a simple viewport, it lays on the back of the window and lets other windows dock into it.
/// You can't remove the background from this, but you can make it invisible with
/// style.Colors.
pub inline fn ztViewPort(left: f32, top: f32, right: f32, bottom: f32) void {
    ztViewPortPro(.{ .x = left, .y = top, .z = right, .w = bottom });
}
/// Paddings order: L,T,R,B
/// You can't remove the background from this, but you can make it invisible with
/// style.Colors.
pub fn ztViewPortPro(paddings: ImVec4) void {
    const dockNodeFlags = ImGuiDockNodeFlags_None;
    const windowFlags =
        ImGuiWindowFlags_NoCollapse |
        ImGuiWindowFlags_NoDecoration |
        ImGuiWindowFlags_NoDocking |
        ImGuiWindowFlags_NoMove |
        ImGuiWindowFlags_NoResize |
        ImGuiWindowFlags_NoScrollbar |
        ImGuiWindowFlags_NoTitleBar |
        ImGuiWindowFlags_NoNavFocus |
        ImGuiWindowFlags_NoBackground |
        ImGuiWindowFlags_NoFocusOnAppearing |
        ImGuiWindowFlags_NoBringToFrontOnFocus;

    var mainView = igGetMainViewport();

    var pos: ImVec2 = .{ .x = mainView.*.Pos.x + paddings.x, .y = mainView.*.Pos.y + paddings.y };
    var size: ImVec2 = .{ .x = mainView.*.Size.x - paddings.x - paddings.z, .y = mainView.*.Size.y - paddings.y - paddings.w };
    igSetNextWindowPos(pos, ImGuiCond_Always, .{});
    igSetNextWindowSize(size, ImGuiCond_Always);

    igPushStyleVar_Vec2(ImGuiStyleVar_WindowPadding, .{});
    _ = igBegin("###DockSpace", null, windowFlags);
    var id = igGetID_Str("DefaultDockingViewport");
    _ = igDockSpace(id, .{}, dockNodeFlags, ImGuiWindowClass_ImGuiWindowClass());

    igEnd();
    igPopStyleVar(1);
}
/// If you ever need to format a string for use inside imgui, this will work the same as any format function.
pub inline fn fmtTextForImgui(comptime fmt: []const u8, args: anytype) []const u8 {
    var alloc = zt.Allocators.ring();
    return alloc.dupeZ(u8, std.fmt.allocPrint(alloc, fmt, args) catch unreachable) catch unreachable;
}
/// Uses a ring allocator to spit out imgui text using zig's formatting library.
pub fn ztText(comptime fmt: []const u8, args: anytype) void {
    var text = fmtTextForImgui(fmt, args);
    igText(text.ptr);
}
/// Uses a ring allocator to spit out imgui text using zig's formatting library, wrapping if needed.
pub fn ztTextWrap(comptime fmt: []const u8, args: anytype) void {
    var text = fmtTextForImgui(fmt, args);
    igTextWrapped(text.ptr);
}
/// Uses a ring allocator to spit out imgui text using zig's formatting library, in the disabled color.
pub fn ztTextDisabled(comptime fmt: []const u8, args: anytype) void {
    var text = fmtTextForImgui(fmt, args);
    igTextDisabled(text.ptr);
}
/// Uses a ring allocator to spit out imgui text using zig's formatting library with a custom color.
pub fn ztTextColor(comptime fmt: []const u8, color: ImVec4, args: anytype) void {
    var text = fmtTextForImgui(fmt, args);
    igTextColored(color, text.ptr);
}

/// Attempts to create a general editor for most structs, including math structs. This isnt always what you want, and in
/// those cases its always better to layout your own editor. This is biased towards creating drag inputs.
pub fn ztEditDrag(label: []const u8, speed:f32, ptr: anytype) bool {
    const fmax = std.math.f32_max;
    switch (@TypeOf(ptr)) {
        *bool => {
            return igCheckbox(label.ptr, ptr);
        },
        *i32 => {
            const imin = std.math.minInt(i32);
            const imax = std.math.maxInt(i32);
            return igDragInt(label.ptr, ptr, speed, @intCast(c_int,imin), @intCast(c_int,imax), "%i", ImGuiSliderFlags_NoRoundToFormat);
        },
        *f32 => {
            return igDragFloat(label.ptr, ptr, speed, -fmax, fmax, "%.2f", ImGuiSliderFlags_NoRoundToFormat);
        },
        *usize => {
            var cast = @intCast(c_int, ptr.*);
            var result = igInputInt(label.ptr, &cast, 1, 5, ImGuiInputTextFlags_None);
            if(result) {
                ptr.* = @intCast(usize, std.math.max(0, cast));
            }
            return result;
        },
        *zt.math.Vec2 => {
            var cast: [2]f32 = .{ ptr.*.x, ptr.*.y };
            var result = igDragFloat2(label.ptr, &cast, speed, -fmax, fmax, "%.2f", ImGuiSliderFlags_NoRoundToFormat);
            if(result) {
                ptr.* = zt.math.vec2(cast[0], cast[1]);
            }
            return result;
        },
        *zt.math.Vec3 => {
            var cast: [3]f32 = .{ ptr.*.x, ptr.*.y, ptr.*.z };
            var result = igDragFloat3(label.ptr, &cast, speed, -fmax, fmax, "%.2f", ImGuiSliderFlags_NoRoundToFormat);
            if(result) {
                ptr.* = zt.math.vec3(cast[0], cast[1], cast[2]);
            }
            return result;
        },
        *zt.math.Vec4 => {
            var cast: [4]f32 = .{ ptr.*.x, ptr.*.y, ptr.*.z, ptr.*.w };
            var result = igColorEdit4(label.ptr, &cast, ImGuiColorEditFlags_Float);
            if(result) {
                ptr.* = zt.math.vec4(cast[0], cast[1], cast[2], cast[3]);
            }
            return result;
        },
        *zt.math.Rect => {
            var cast: [4]f32 = .{ ptr.*.position.x, ptr.*.position.y, ptr.*.size.x, ptr.*.size.y };
            var result = igDragFloat4(label.ptr, &cast, speed, -fmax, fmax, "%.2f", ImGuiSliderFlags_NoRoundToFormat);
            if(result) {
                ptr.* = zt.math.rect(cast[0], cast[1], cast[2], cast[3]);
            }
            return result;
        },
        else => {
            std.debug.warn("No editor found for type {s}\n", .{@typeName(@TypeOf(ptr))});
            return false;
        },
    }
}

pub fn ztEdit(label: []const u8, ptr: anytype) bool {
    switch (@TypeOf(ptr)) {
        *bool => {
            return igCheckbox(label.ptr, ptr);
        },
        *i32 => {
            return igInputInt(label.ptr, ptr, 1, 3, ImGuiInputTextFlags_None);
        },
        *f32 => {
            return igInputFloat(label.ptr, ptr, 1, 3, "%.2f", ImGuiInputTextFlags_None);
        },
        *usize => {
            var cast = @intCast(c_int, ptr.*);
            var result = igInputInt(label.ptr, &cast, 1, 5, ImGuiInputTextFlags_None);
            if(result) {
                ptr.* = @intCast(usize, std.math.max(0, cast));
            }
            return result;
        },
        *zt.math.Vec2 => {
            var cast: [2]f32 = .{ ptr.*.x, ptr.*.y };
            var result = igInputFloat2(label.ptr, &cast, "%.2f", ImGuiInputTextFlags_None);
            if(result) {
                ptr.* = zt.math.vec2(cast[0], cast[1]);
            }
            return result;
        },
        *zt.math.Vec3 => {
            var cast: [3]f32 = .{ ptr.*.x, ptr.*.y, ptr.*.z };
            var result = igInputFloat3(label.ptr, &cast, "%.2f", ImGuiInputTextFlags_None);
            if(result) {
                ptr.* = zt.math.vec3(cast[0], cast[1], cast[2]);
            }
            return result;
        },
        *zt.math.Vec4 => {
            var cast: [4]f32 = .{ ptr.*.x, ptr.*.y, ptr.*.z, ptr.*.w };
            var result = igColorEdit4(label.ptr, &cast, ImGuiColorEditFlags_Float);
            if(result) {
                ptr.* = zt.math.vec4(cast[0], cast[1], cast[2], cast[3]);
            }
            return result;
        },
        *zt.math.Rect => {
            var cast: [4]f32 = .{ ptr.*.position.x, ptr.*.position.y, ptr.*.size.x, ptr.*.size.y };
            var result = igInputFloat4(label.ptr, &cast, "%.2f", ImGuiInputTextFlags_None);
            if(result) {
                ptr.* = zt.math.rect(cast[0], cast[1], cast[2], cast[3]);
            }
            return result;
        },
        else => {
            std.debug.warn("No editor found for type {s}\n", .{@typeName(@TypeOf(ptr))});
            return false;
        },
    }
}