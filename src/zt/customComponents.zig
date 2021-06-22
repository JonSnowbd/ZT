const std = @import("std");
const zt = @import("../zt.zig");
usingnamespace @import("imgui");

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

pub inline fn fmtTextForImgui(comptime fmt: []const u8, args: anytype) []const u8 {
    var alloc = zt.Allocators.ring();
    return alloc.dupeZ(u8, std.fmt.allocPrint(alloc, fmt, args) catch unreachable) catch unreachable;
}
/// Uses a ring allocator to spit out imgui text using zig's formatting library.
pub fn ztText(comptime fmt: []const u8, args: anytype) void {
    var text = fmtTextForImgui(fmt, args);
    igText(text.ptr);
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
