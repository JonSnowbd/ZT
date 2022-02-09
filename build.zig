const std = @import("std");

fn getRelativePath() []const u8 {
    comptime var src: std.builtin.SourceLocation = @src();
    return std.fs.path.dirname(src.file).? ++ std.fs.path.sep_str;
}

pub const stbPkg = std.build.Pkg{
    .name = "stb_image",
    .path = std.build.FileSource{ .path = getRelativePath() ++ "src/pkg/stb_image.zig" },
};
pub const glPkg = std.build.Pkg{
    .name = "gl",
    .path = std.build.FileSource{ .path = getRelativePath() ++ "src/pkg/gl.zig" },
};
pub const imguiPkg = std.build.Pkg{ .name = "imgui", .path = std.build.FileSource{ .path = getRelativePath() ++ "src/pkg/imgui.zig" } };
pub const glfwPkg = std.build.Pkg{ .name = "glfw", .path = std.build.FileSource{ .path = getRelativePath() ++ "src/pkg/glfw.zig" } };
pub const ztPkg = std.build.Pkg{ .name = "zt", .path = std.build.FileSource{ .path = getRelativePath() ++ "src/zt.zig" }, .dependencies = &[_]std.build.Pkg{
    glfwPkg,
    glPkg,
    imguiPkg,
    stbPkg,
} };

// Build here only exists to build the example. to use ZT you'll want to import this file and use the link function in
// your build.zig
pub fn build(b: *std.build.Builder) void {
    const target = b.standardTargetOptions(.{});
    const mode = b.standardReleaseOptions();

    const exe = b.addExecutable("example", "example/src/main.zig");
    link(exe);
    exe.setTarget(target);
    exe.setBuildMode(mode);
    exe.install();

    addBinaryContent("example/assets") catch unreachable;

    // Run cmd
    const run_cmd = exe.run();
    run_cmd.step.dependOn(b.getInstallStep());
    if (b.args) |args| {
        run_cmd.addArgs(args);
    }
    const run_step = b.step("run", "Run the app");
    run_step.dependOn(&run_cmd.step);
}

pub fn link(exe: *std.build.LibExeObjStep) void {
    // Link step
    exe.linkLibrary(imguiLibrary(exe));
    exe.linkLibrary(glfwLibrary(exe));
    exe.linkLibrary(glLibrary(exe));
    exe.linkLibrary(stbLibrary(exe));

    exe.addPackage(glfwPkg);
    exe.addPackage(glPkg);
    exe.addPackage(stbPkg);
    exe.addPackage(imguiPkg);
    exe.addPackage(ztPkg);
}

// STB
pub fn stbLibrary(exe: *std.build.LibExeObjStep) *std.build.LibExeObjStep {
    comptime var path = getRelativePath();

    var b = exe.builder;
    var stb = b.addStaticLibrary("stb", null);
    stb.linkLibC();

    var flagContainer = std.ArrayList([]const u8).init(std.heap.page_allocator);
    if (b.is_release) flagContainer.append("-Os") catch unreachable;

    stb.addCSourceFile(path ++ "src/dep/stb/stb_image_wrapper.c", flagContainer.items);

    return stb;
}
// OpenGL
pub fn glLibrary(exe: *std.build.LibExeObjStep) *std.build.LibExeObjStep {
    comptime var path = getRelativePath();

    var b = exe.builder;
    var target = exe.target;
    var gl = b.addStaticLibrary("gl", null);
    gl.linkLibC();

    // Generate flags.
    var flagContainer = std.ArrayList([]const u8).init(std.heap.page_allocator);
    if (b.is_release) flagContainer.append("-Os") catch unreachable;

    // Link libraries.
    if (target.isWindows()) {
        gl.linkSystemLibrary("opengl32");
    }
    if (target.isLinux()) {
        gl.linkSystemLibrary("gl");
    }
    if(target.isDarwin()) {
        // !! Mac TODO
        // Here we need to add the include the system libs needed for mac opengl
        // Maybe also 
    }

    // Include dirs.
    gl.addIncludeDir(path ++ "src/dep/gl/glad/include");

    // Add c.
    gl.addCSourceFile(path ++ "src/dep/gl/glad/src/glad.c", flagContainer.items);

    return gl;
}
// ImGui
pub fn imguiLibrary(exe: *std.build.LibExeObjStep) *std.build.LibExeObjStep {
    comptime var path = getRelativePath();
    var b = exe.builder;
    var target = exe.target;
    var imgui = b.addStaticLibrary("imgui", null);
    imgui.linkLibC();
    imgui.linkSystemLibrary("c++");

    // Generate flags.
    var flagContainer = std.ArrayList([]const u8).init(std.heap.page_allocator);
    if (b.is_release) flagContainer.append("-Os") catch unreachable;
    flagContainer.append("-Wno-return-type-c-linkage") catch unreachable;
    flagContainer.append("-fno-sanitize=undefined") catch unreachable;

    // Link libraries.
    if (target.isWindows()) {
        imgui.linkSystemLibrary("winmm");
        imgui.linkSystemLibrary("user32");
        imgui.linkSystemLibrary("imm32");
        imgui.linkSystemLibrary("gdi32");
    }

    if(target.isDarwin()) {
        // !! Mac TODO
        // Here we need to add the include the system libs needed for mac imgui
    }

    // Include dirs.
    imgui.addIncludeDir(path ++ "src/dep/cimgui/imgui");
    imgui.addIncludeDir(path ++ "src/dep/cimgui");

    // Add C
    imgui.addCSourceFiles(&.{ path ++ "src/dep/cimgui/imgui/imgui.cpp", path ++ "src/dep/cimgui/imgui/imgui_demo.cpp", path ++ "src/dep/cimgui/imgui/imgui_draw.cpp", path ++ "src/dep/cimgui/imgui/imgui_tables.cpp", path ++ "src/dep/cimgui/imgui/imgui_widgets.cpp", path ++ "src/dep/cimgui/cimgui.cpp" }, flagContainer.items);

    return imgui;
}
// GLFW
pub fn glfwLibrary(exe: *std.build.LibExeObjStep) *std.build.LibExeObjStep {
    comptime var path = getRelativePath();
    var b = exe.builder;
    var target = exe.target;
    var glfw = b.addStaticLibrary("glfw", null);
    glfw.linkLibC();
    var flagContainer: std.ArrayList([]const u8) = std.ArrayList([]const u8).init(std.heap.page_allocator);
    if (b.is_release) flagContainer.append("-Os") catch unreachable;

    // Include dirs.
    glfw.addIncludeDir(path ++ "src/dep/glfw/deps");
    glfw.addIncludeDir(path ++ "src/dep/glfw/include");

    // For windows targets, link/add c.
    if (target.isWindows()) {
        if (b.is_release) {
            exe.subsystem = .Windows; // Hide the Console on release.
            exe.want_lto = false; // TODO: When _tls_index is no longer lost on lto, undo this.
        }
        flagContainer.append("-D_GLFW_WIN32") catch unreachable;
        glfw.linkSystemLibrary("gdi32");
        glfw.addCSourceFiles(&.{
            path ++ "src/dep/glfw/src/win32_init.c",
            path ++ "src/dep/glfw/src/win32_joystick.c",
            path ++ "src/dep/glfw/src/win32_monitor.c",
            path ++ "src/dep/glfw/src/win32_time.c",
            path ++ "src/dep/glfw/src/win32_thread.c",
            path ++ "src/dep/glfw/src/win32_window.c",
            path ++ "src/dep/glfw/src/wgl_context.c",
            path ++ "src/dep/glfw/src/egl_context.c",
            path ++ "src/dep/glfw/src/osmesa_context.c",
        }, flagContainer.items);
    }

    // For linux targets, link/add c.
    if (target.isLinux()) {
        glfw.subsystem = .Posix;
        // Linux is a little too itchy to sanitize some glfw code that works but can hit UB
        flagContainer.append("-fno-sanitize=undefined") catch unreachable;
        flagContainer.append("-D_GLFW_X11") catch unreachable;
        glfw.addSystemIncludeDir("/usr/include/");
        glfw.linkSystemLibrary("rt");
        glfw.linkSystemLibrary("m");
        glfw.linkSystemLibrary("x11");

        glfw.addCSourceFiles(&.{
            path ++ "src/dep/glfw/src/x11_init.c",
            path ++ "src/dep/glfw/src/x11_monitor.c",
            path ++ "src/dep/glfw/src/x11_window.c",
            path ++ "src/dep/glfw/src/xkb_unicode.c",
            path ++ "src/dep/glfw/src/posix_time.c",
            path ++ "src/dep/glfw/src/posix_thread.c",
            path ++ "src/dep/glfw/src/glx_context.c",
            path ++ "src/dep/glfw/src/egl_context.c",
            path ++ "src/dep/glfw/src/osmesa_context.c",
            path ++ "src/dep/glfw/src/linux_joystick.c",
        }, flagContainer.items);
    }

    if (target.isDarwin()) {
        // !! Mac TODO
        // Here we need to add the include dirs and c files that glfw
        // depends on for specifically the mac platform.
    }

    // Shared C.
    glfw.addCSourceFiles(&.{
        path ++ "src/dep/glfw/src/context.c",
        path ++ "src/dep/glfw/src/init.c",
        path ++ "src/dep/glfw/src/input.c",
        path ++ "src/dep/glfw/src/monitor.c",
        path ++ "src/dep/glfw/src/vulkan.c",
        path ++ "src/dep/glfw/src/window.c",
    }, flagContainer.items);

    return glfw;
}

pub const AddContentErrors = error{ PermissionError, WriteError, FileError, FolderError, RecursionError };
const fs = std.fs;

/// Pass in a relative path to a folder, and its content is added to the zig-cache/bin output.
/// TODO: Lookup where zig defines the output folder to make it more bulletproof.
pub fn addBinaryContent(comptime baseContentPath: []const u8) AddContentErrors!void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};

    const zigBin: []const u8 = std.fs.path.join(gpa.allocator(), &[_][]const u8{ "zig-out", "bin" }) catch return error.FolderError;
    defer gpa.allocator().free(zigBin);
    fs.cwd().makePath(zigBin) catch return error.FolderError;

    var sourceFolder: fs.Dir = fs.cwd().openDir(baseContentPath, .{ .iterate = true }) catch return error.FolderError;
    defer sourceFolder.close();
    var iterator: fs.Dir.Iterator = sourceFolder.iterate();
    while (iterator.next() catch return error.FolderError) |target| {
        var x: fs.Dir.Entry = target;
        if (x.kind == .Directory) {
            const source: []const u8 = std.fs.path.join(gpa.allocator(), &[_][]const u8{ baseContentPath, x.name }) catch return error.RecursionError;
            const targetFolder: []const u8 = std.fs.path.join(gpa.allocator(), &[_][]const u8{ zigBin, x.name }) catch return error.RecursionError;
            defer gpa.allocator().free(source);
            defer gpa.allocator().free(targetFolder);
            try innerAddContent(gpa.allocator(), source, targetFolder);
        }
        if (x.kind == .File) {
            try copy(baseContentPath, zigBin, x.name);
        }
    }
}
fn innerAddContent(allocator: std.mem.Allocator, folder: []const u8, dest: []const u8) AddContentErrors!void {
    var sourceFolder: fs.Dir = fs.cwd().openDir(folder, .{ .iterate = true }) catch return error.FolderError;
    defer sourceFolder.close();

    var iterator: fs.Dir.Iterator = sourceFolder.iterate();
    while (iterator.next() catch return error.FolderError) |target| {
        var x: fs.Dir.Entry = target;
        if (x.kind == .Directory) {
            const source: []const u8 = std.fs.path.join(allocator, &[_][]const u8{ folder, x.name }) catch return error.RecursionError;
            const targetFolder: []const u8 = std.fs.path.join(allocator, &[_][]const u8{ dest, x.name }) catch return error.RecursionError;
            defer allocator.free(source);
            defer allocator.free(targetFolder);
            try innerAddContent(allocator, source, targetFolder);
        }
        if (x.kind == .File) {
            try copy(folder, dest, x.name);
        }
    }
}
fn copy(from: []const u8, to: []const u8, filename: []const u8) AddContentErrors!void {
    fs.cwd().makePath(to) catch return error.FolderError;
    var source = fs.cwd().openDir(from, .{}) catch return error.FileError;
    var dest = fs.cwd().openDir(to, .{}) catch return error.FileError;

    var sfile = source.openFile(filename, .{}) catch return error.FileError;
    defer sfile.close();
    var dfile = dest.openFile(filename, .{}) catch {
        source.copyFile(filename, dest, filename, .{}) catch return error.PermissionError;
        std.debug.print("COPY: {s}/{s} to {s}/{s}\n", .{ from, filename, to, filename });
        return;
    };

    var sstat = sfile.stat() catch return error.FileError;
    var dstat = dfile.stat() catch return error.FileError;

    if (sstat.mtime > dstat.mtime) {
        dfile.close();
        dest.deleteFile(filename) catch return error.PermissionError;
        source.copyFile(filename, dest, filename, .{}) catch return error.PermissionError;
        std.debug.print("OVERWRITE: {s}\\{s} to {s}\\{s}\n", .{ from, filename, to, filename });
    } else {
        defer dfile.close();
        std.debug.print("SKIP: {s}\\{s}\n", .{ from, filename });
    }
}
