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

    const debugFlags = &[_][]const u8 {
        "-Wno-return-type-c-linkage",
    };
    const releaseFlags = &[_][]const u8 {
        "-Wno-return-type-c-linkage",
        "-Os"
    };
    const flags = if(std.builtin.mode == std.builtin.Mode.Debug) debugFlags else releaseFlags;
    
    exe.addCSourceFile(prefix_path ++ "cimgui/imgui/imgui.cpp", flags);
    exe.addCSourceFile(prefix_path ++ "cimgui/imgui/imgui_demo.cpp", flags);
    exe.addCSourceFile(prefix_path ++ "cimgui/imgui/imgui_draw.cpp", flags);
    exe.addCSourceFile(prefix_path ++ "cimgui/imgui/imgui_tables.cpp", flags);
    exe.addCSourceFile(prefix_path ++ "cimgui/imgui/imgui_widgets.cpp", flags);
    exe.addCSourceFile(prefix_path ++ "cimgui/cimgui.cpp", flags);
}
