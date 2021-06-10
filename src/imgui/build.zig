const std = @import("std");
const Builder = std.build.Builder;

/// prefix_path is used to add package paths. It should be the the same path used to include this build file
pub fn link(b: *Builder, exe: *std.build.LibExeObjStep, target: std.build.Target, comptime prefix_path: []const u8) void {
    if (prefix_path.len > 0 and !std.mem.endsWith(u8, prefix_path, "/")) @panic("prefix-path must end with '/' if it is not empty");

    exe.linkLibC();
    exe.linkSystemLibrary("c++");

    if (target.isWindows()) {
        exe.linkSystemLibrary("winmm");
        exe.linkSystemLibrary("user32");
        exe.linkSystemLibrary("imm32");
        exe.linkSystemLibrary("gdi32");
    }
    // Linux needs no additionals.

    exe.addIncludeDir(prefix_path ++ "cimgui/imgui");
    exe.addIncludeDir(prefix_path ++ "cimgui");

    var flagContainer = std.ArrayList([]const u8).init(std.heap.page_allocator);
    flagContainer.append("-Wno-return-type-c-linkage") catch unreachable;

    if (b.is_release) {
        flagContainer.append("-Os") catch unreachable;
    }

    exe.addCSourceFile(prefix_path ++ "cimgui/imgui/imgui.cpp", flagContainer.items);
    exe.addCSourceFile(prefix_path ++ "cimgui/imgui/imgui_demo.cpp", flagContainer.items);
    exe.addCSourceFile(prefix_path ++ "cimgui/imgui/imgui_draw.cpp", flagContainer.items);
    exe.addCSourceFile(prefix_path ++ "cimgui/imgui/imgui_tables.cpp", flagContainer.items);
    exe.addCSourceFile(prefix_path ++ "cimgui/imgui/imgui_widgets.cpp", flagContainer.items);
    exe.addCSourceFile(prefix_path ++ "cimgui/cimgui.cpp", flagContainer.items);
}
