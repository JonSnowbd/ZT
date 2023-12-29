const std = @import("std");
const ig = @import("imgui");
const zt = @import("../zt.zig");
const math = zt.math;

/// Sets imgui style to be compact, does not affect colors. Recommended to follow this up
/// with your own custom colors, or one from this file `styleColor*()`
pub fn styleSizeCompact() void {
    const style = ig.igGetStyle();

    // Paddings
    style.*.WindowPadding = .{ .x = 4, .y = 4 };
    style.*.FramePadding = .{ .x = 2, .y = 2 };
    style.*.CellPadding = .{ .x = 4, .y = 2 };
    style.*.ItemSpacing = .{ .x = 10, .y = 2 };
    style.*.ItemInnerSpacing = .{ .x = 2, .y = 2 };
    style.*.IndentSpacing = 12;
    style.*.ScrollbarSize = 4;

    // Borders
    style.*.TabBorderSize = 0;
    style.*.ChildBorderSize = 0;
    style.*.FrameBorderSize = 0;
    style.*.PopupBorderSize = 0;
    style.*.WindowBorderSize = 0;

    // Rounding
    style.*.TabRounding = 2;
    style.*.GrabRounding = 0;
    style.*.ChildRounding = 0;
    style.*.FrameRounding = 2;
    style.*.PopupRounding = 0;
    style.*.WindowRounding = 2;
    style.*.ScrollbarRounding = 0;

    // Align
    style.*.WindowTitleAlign = .{ .x = 0.5, .y = 0.5 };
    style.*.WindowMenuButtonPosition = ig.ImGuiDir_None;
}

/// Provide 4 colors, contrast, and if it is a light theme, and reroute will automatically
/// style each of your imgui colors. If you're changing this and re-building often, prefer to use
/// styleColorEditor() to toy with this in real time.
pub fn styleColorCustom(background: ig.ImVec4, foreground: ig.ImVec4, highlight: ig.ImVec4, special: ig.ImVec4, contrast: f32, isLightTheme: bool) void {
    const bg0 = if (isLightTheme) background.brighten(contrast) else background.brighten(-contrast);
    const bg1 = background;
    const bg2 = if (isLightTheme) background.brighten(-contrast) else background.brighten(contrast);

    const fg0 = if (isLightTheme) foreground.brighten(contrast) else foreground.brighten(-contrast);
    const fg1 = foreground;
    const fg2 = if (isLightTheme) foreground.brighten(-contrast) else foreground.brighten(contrast);

    const hl0 = if (isLightTheme) highlight.brighten(contrast) else highlight.brighten(-contrast);
    const hl1 = highlight;
    const hl2 = if (isLightTheme) highlight.brighten(-contrast) else highlight.brighten(contrast);

    const sp0 = if (isLightTheme) special.brighten(contrast) else special.brighten(-contrast);
    const sp1 = special;
    const sp2 = if (isLightTheme) special.brighten(-contrast) else special.brighten(contrast);

    const style = ig.igGetStyle();
    style.*.Colors[ig.ImGuiCol_Text] = fg1;
    style.*.Colors[ig.ImGuiCol_TextDisabled] = fg0;
    style.*.Colors[ig.ImGuiCol_WindowBg] = bg0;
    style.*.Colors[ig.ImGuiCol_ChildBg] = bg0;
    style.*.Colors[ig.ImGuiCol_PopupBg] = bg0;
    style.*.Colors[ig.ImGuiCol_Border] = bg0.brighten(-0.5);
    style.*.Colors[ig.ImGuiCol_BorderShadow] = bg0.brighten(-0.5);
    style.*.Colors[ig.ImGuiCol_FrameBg] = if (isLightTheme) bg1.brighten(-0.33) else bg1.brighten(0.33);
    style.*.Colors[ig.ImGuiCol_FrameBgHovered] = bg2;
    style.*.Colors[ig.ImGuiCol_FrameBgActive] = bg2.brighten(0.7);
    style.*.Colors[ig.ImGuiCol_TitleBg] = hl0;
    style.*.Colors[ig.ImGuiCol_TitleBgActive] = hl1;
    style.*.Colors[ig.ImGuiCol_TitleBgCollapsed] = hl0;
    style.*.Colors[ig.ImGuiCol_MenuBarBg] = bg0.brighten(-0.1);
    style.*.Colors[ig.ImGuiCol_ScrollbarBg] = bg0;
    style.*.Colors[ig.ImGuiCol_ScrollbarGrab] = fg0;
    style.*.Colors[ig.ImGuiCol_ScrollbarGrabHovered] = fg1;
    style.*.Colors[ig.ImGuiCol_ScrollbarGrabActive] = fg2;
    style.*.Colors[ig.ImGuiCol_CheckMark] = hl0;
    style.*.Colors[ig.ImGuiCol_SliderGrab] = hl0;
    style.*.Colors[ig.ImGuiCol_SliderGrabActive] = hl2;
    style.*.Colors[ig.ImGuiCol_Button] = hl0;
    style.*.Colors[ig.ImGuiCol_ButtonHovered] = hl1;
    style.*.Colors[ig.ImGuiCol_ButtonActive] = hl2;
    style.*.Colors[ig.ImGuiCol_Header] = bg1;
    style.*.Colors[ig.ImGuiCol_HeaderHovered] = bg1;
    style.*.Colors[ig.ImGuiCol_HeaderActive] = bg2;
    style.*.Colors[ig.ImGuiCol_Separator] = bg2;
    style.*.Colors[ig.ImGuiCol_SeparatorHovered] = sp0;
    style.*.Colors[ig.ImGuiCol_SeparatorActive] = sp1;
    style.*.Colors[ig.ImGuiCol_ResizeGrip] = sp0;
    style.*.Colors[ig.ImGuiCol_ResizeGripHovered] = sp1;
    style.*.Colors[ig.ImGuiCol_ResizeGripActive] = sp2;
    style.*.Colors[ig.ImGuiCol_Tab] = bg2;
    style.*.Colors[ig.ImGuiCol_TabHovered] = bg2;
    style.*.Colors[ig.ImGuiCol_TabActive] = bg2.brighten(0.3);
    style.*.Colors[ig.ImGuiCol_TabUnfocused] = bg1;
    style.*.Colors[ig.ImGuiCol_TabUnfocusedActive] = bg2;
    style.*.Colors[ig.ImGuiCol_DockingPreview] = hl1;
    style.*.Colors[ig.ImGuiCol_DockingEmptyBg] = hl0;
    style.*.Colors[ig.ImGuiCol_PlotLines] = ig.ImVec4{ .x = 0.61, .y = 0.61, .z = 0.61, .w = 1.00 };
    style.*.Colors[ig.ImGuiCol_PlotLinesHovered] = ig.ImVec4{ .x = 1.00, .y = 0.43, .z = 0.35, .w = 1.00 };
    style.*.Colors[ig.ImGuiCol_PlotHistogram] = ig.ImVec4{ .x = 0.90, .y = 0.70, .z = 0.00, .w = 1.00 };
    style.*.Colors[ig.ImGuiCol_PlotHistogramHovered] = ig.ImVec4{ .x = 1.00, .y = 0.60, .z = 0.00, .w = 1.00 };
    style.*.Colors[ig.ImGuiCol_TableHeaderBg] = ig.ImVec4{ .x = 0.19, .y = 0.19, .z = 0.20, .w = 1.00 };
    style.*.Colors[ig.ImGuiCol_TableBorderStrong] = ig.ImVec4{ .x = 0.31, .y = 0.31, .z = 0.35, .w = 1.00 };
    style.*.Colors[ig.ImGuiCol_TableBorderLight] = ig.ImVec4{ .x = 0.23, .y = 0.23, .z = 0.25, .w = 1.00 };
    style.*.Colors[ig.ImGuiCol_TableRowBg] = ig.ImVec4{ .x = 0.00, .y = 0.00, .z = 0.00, .w = 0.00 };
    style.*.Colors[ig.ImGuiCol_TableRowBgAlt] = ig.ImVec4{ .x = 1.00, .y = 1.00, .z = 1.00, .w = 0.06 };
    style.*.Colors[ig.ImGuiCol_TextSelectedBg] = ig.ImVec4{ .x = 0.26, .y = 0.59, .z = 0.98, .w = 0.35 };
    style.*.Colors[ig.ImGuiCol_DragDropTarget] = ig.ImVec4{ .x = 1.00, .y = 1.00, .z = 0.00, .w = 0.90 };
    style.*.Colors[ig.ImGuiCol_NavHighlight] = ig.ImVec4{ .x = 0.26, .y = 0.59, .z = 0.98, .w = 1.00 };
    style.*.Colors[ig.ImGuiCol_NavWindowingHighlight] = ig.ImVec4{ .x = 1.00, .y = 1.00, .z = 1.00, .w = 0.70 };
    style.*.Colors[ig.ImGuiCol_NavWindowingDimBg] = ig.ImVec4{ .x = 0.80, .y = 0.80, .z = 0.80, .w = 0.20 };
    style.*.Colors[ig.ImGuiCol_ModalWindowDimBg] = ig.ImVec4{ .x = 0.80, .y = 0.80, .z = 0.80, .w = 0.35 };
}

var edit_bg: math.Vec4 = math.Vec4.new(0.1, 0.1, 0.15, 1.0);
var edit_fg: math.Vec4 = math.Vec4.new(0.89, 0.89, 0.91, 1.0);
var edit_sp: math.Vec4 = math.Vec4.new(0.9, 0.34, 0.2, 1.0);
var edit_hl: math.Vec4 = math.Vec4.new(0.9, 0.34, 0.2, 1.0);
var edit_diff: f32 = 0.2;
var edit_isLight: bool = false;
fn stringVec(vec: math.Vec4) []const u8 {
    return zt.custom_components.fmtTextForImgui("reroute.math.Vec4{{.x={d:.2},.y={d:.2},.z={d:.2},.w={d:.2}}}", .{ vec.x, vec.y, vec.z, vec.w });
}

/// A slate/orange dark theme
pub fn styleColorOrangeSlate() void {
    styleColorCustom(math.Vec4{ .x = 0.16, .y = 0.19, .z = 0.22, .w = 1.00 }, math.Vec4{ .x = 0.89, .y = 0.89, .z = 0.89, .w = 1.00 }, math.Vec4{ .x = 0.90, .y = 0.34, .z = 0.20, .w = 1.00 }, math.Vec4{ .x = 0.00, .y = 0.00, .z = 0.00, .w = 0.36 }, 0.30, false);
}
