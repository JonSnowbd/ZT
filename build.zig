const std = @import("std");
const imgBuild = @import("src/imgui/build.zig");

// Build here only exists to build the example. to use ZT you'll want to import this file and use the link function in
// your build.zig
pub fn build(b: *std.build.Builder) void {
    const target = b.standardTargetOptions(.{
        .default_target = .{ .abi = std.Target.Abi.gnu }, // Lets avoid MSVC on windows :')
    });
    const mode = b.standardReleaseOptions();

    const exe = b.addExecutable("example", "example/src/main.zig");
    exe.setTarget(target);
    exe.setBuildMode(mode);
    if (b.is_release) {
        exe.strip = true;
    }
    link("", b, exe, target);
    exe.install();

    addBinaryContent("example/binAssets") catch unreachable;

    // Run cmd
    const run_cmd = exe.run();
    run_cmd.step.dependOn(b.getInstallStep());
    if (b.args) |args| {
        run_cmd.addArgs(args);
    }
    const run_step = b.step("run", "Run the app");
    run_step.dependOn(&run_cmd.step);
}

pub fn link(comptime path: []const u8, b: *std.build.Builder, exe: *std.build.LibExeObjStep, target: std.build.Target) void {
    linkGlfw(path, b, exe, target);
    linkGl(path, b, exe, target);
    imgBuild.link(b, exe, target, path ++ "src/imgui/");

    var stbImageWrapperFlags = [_][]const u8{"-Os"};
    exe.addCSourceFile(path ++ "src/stb/stb_image_wrapper.c", &stbImageWrapperFlags);
    
    if(std.meta.fieldInfo(std.build.Pkg, .path).field_type == std.build.FileSource) {
        var imgPkg: std.build.Pkg = .{ .name = "imgui", .path = std.build.FileSource{.path = path ++ "src/imgui.zig"}};
        var glfwPkg: std.build.Pkg = .{ .name = "glfw", .path = std.build.FileSource{.path = path ++ "src/glfw.zig"} };
        var glPkg: std.build.Pkg = .{ .name = "gl", .path = std.build.FileSource{.path = path ++ "src/gl.zig"} };
        var stbPkg: std.build.Pkg = .{ .name = "stb_image", .path = std.build.FileSource{.path = path ++ "src/stb_image.zig"} };
        var ztPkg: std.build.Pkg = .{ .name = "zt", .path = std.build.FileSource{.path = path ++ "src/zt.zig"}, .dependencies = &[_]std.build.Pkg{ glfwPkg, glPkg, imgPkg, stbPkg } };
        exe.addPackage(glfwPkg);
        exe.addPackage(glPkg);
        exe.addPackage(stbPkg);
        exe.addPackage(imgPkg);
        exe.addPackage(ztPkg);
    } else {
        var imgPkg: std.build.Pkg = .{ .name = "imgui", .path = path ++ "src/imgui.zig"};
        var glfwPkg: std.build.Pkg = .{ .name = "glfw", .path = path ++ "src/glfw.zig" };
        var glPkg: std.build.Pkg = .{ .name = "gl", .path = path ++ "src/gl.zig" };
        var stbPkg: std.build.Pkg = .{ .name = "stb_image", .path = path ++ "src/stb_image.zig" };
        var ztPkg: std.build.Pkg = .{ .name = "zt", .path = path ++ "src/zt.zig", .dependencies = &[_]std.build.Pkg{ glfwPkg, glPkg, imgPkg, stbPkg } };
        exe.addPackage(glfwPkg);
        exe.addPackage(glPkg);
        exe.addPackage(stbPkg);
        exe.addPackage(imgPkg);
        exe.addPackage(ztPkg);
    }

}
fn linkGl(comptime path: []const u8, b: *std.build.Builder, exe: *std.build.LibExeObjStep, target: std.build.Target) void {
    exe.addIncludeDir(path ++ "src/gl/glad/include");
    exe.linkLibC();

    if (target.isWindows()) {
        exe.addCSourceFile(path ++ "src/gl/glad/src/glad.c", &[_][]const u8{"-D_WIN32"});
        exe.linkSystemLibrary("opengl32");
    }
    if (target.isLinux()) {
        exe.addCSourceFile(path ++ "src/gl/glad/src/glad.c", &[_][]const u8{""});
        exe.linkSystemLibrary("gl");
    }
}
fn linkGlfw(comptime path: []const u8, b: *std.build.Builder, exe: *std.build.LibExeObjStep, target: std.build.Target) void {
    exe.addIncludeDir(path ++ "src/glfw/deps");
    exe.addIncludeDir(path ++ "src/glfw/include");
    exe.linkLibC();

    var flagContainer: std.ArrayList([]const u8) = std.ArrayList([]const u8).init(std.heap.page_allocator);
    defer flagContainer.deinit();

    if (b.is_release) {
        flagContainer.append("-Os") catch unreachable;
    }
    if (target.isWindows()) {
        if (b.is_release) {
            exe.subsystem = .Windows; // Hide the Console on release.
        }
        flagContainer.append("-D_GLFW_WIN32") catch unreachable;
    }
    if (target.isLinux()) {
        // exe.subsystem = .Posix;
        // Linux is a little too itchy to sanitize some glfw code that works but can hit UB
        flagContainer.append("-fno-sanitize=undefined") catch unreachable;
        flagContainer.append("-D_GLFW_X11") catch unreachable;
    }

    // General shared sources:
    const flags = flagContainer.items;

    if (target.isWindows()) {
        exe.linkSystemLibrary("gdi32");
        exe.addCSourceFile(path ++ "src/glfw/src/win32_init.c", flags);
        exe.addCSourceFile(path ++ "src/glfw/src/win32_joystick.c", flags);
        exe.addCSourceFile(path ++ "src/glfw/src/win32_monitor.c", flags);
        exe.addCSourceFile(path ++ "src/glfw/src/win32_time.c", flags);
        exe.addCSourceFile(path ++ "src/glfw/src/win32_thread.c", flags);
        exe.addCSourceFile(path ++ "src/glfw/src/win32_window.c", flags);
        exe.addCSourceFile(path ++ "src/glfw/src/wgl_context.c", flags);
        exe.addCSourceFile(path ++ "src/glfw/src/egl_context.c", flags);
        exe.addCSourceFile(path ++ "src/glfw/src/osmesa_context.c", flags);
    }

    if (target.isLinux()) {
        exe.addSystemIncludeDir("/usr/include/");
        exe.linkSystemLibrary("rt");
        exe.linkSystemLibrary("m");
        exe.linkSystemLibrary("x11");

        exe.addCSourceFile(path ++ "src/glfw/src/x11_init.c", flags);
        exe.addCSourceFile(path ++ "src/glfw/src/x11_monitor.c", flags);
        exe.addCSourceFile(path ++ "src/glfw/src/x11_window.c", flags);
        exe.addCSourceFile(path ++ "src/glfw/src/xkb_unicode.c", flags);
        exe.addCSourceFile(path ++ "src/glfw/src/posix_time.c", flags);
        exe.addCSourceFile(path ++ "src/glfw/src/posix_thread.c", flags);
        exe.addCSourceFile(path ++ "src/glfw/src/glx_context.c", flags);
        exe.addCSourceFile(path ++ "src/glfw/src/egl_context.c", flags);
        exe.addCSourceFile(path ++ "src/glfw/src/osmesa_context.c", flags);
        exe.addCSourceFile(path ++ "src/glfw/src/linux_joystick.c", flags);
    }

    exe.addCSourceFile(path ++ "src/glfw/src/context.c", flags);
    exe.addCSourceFile(path ++ "src/glfw/src/init.c", flags);
    exe.addCSourceFile(path ++ "src/glfw/src/input.c", flags);
    exe.addCSourceFile(path ++ "src/glfw/src/monitor.c", flags);
    exe.addCSourceFile(path ++ "src/glfw/src/vulkan.c", flags);
    exe.addCSourceFile(path ++ "src/glfw/src/window.c", flags);
}

pub const AddContentErrors = error{ PermissionError, WriteError, FileError, FolderError, RecursionError };
const fs = std.fs;

/// Pass in a relative path to a folder, and its content is added to the zig-cache/bin output.
/// TODO: Lookup where zig defines the output folder to make it more bulletproof.
pub fn addBinaryContent(comptime baseContentPath: []const u8) AddContentErrors!void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};

    const zigBin: []const u8 = std.fs.path.join(&gpa.allocator, &[_][]const u8{ "zig-out", "bin" }) catch return error.FolderError;
    defer gpa.allocator.free(zigBin);
    fs.cwd().makePath(zigBin) catch return error.FolderError;

    var sourceFolder: fs.Dir = fs.cwd().openDir(baseContentPath, .{ .iterate = true }) catch return error.FolderError;
    defer sourceFolder.close();
    var iterator: fs.Dir.Iterator = sourceFolder.iterate();
    while (iterator.next() catch return error.FolderError) |target| {
        var x: fs.Dir.Entry = target;
        if (x.kind == .Directory) {
            const source: []const u8 = std.fs.path.join(&gpa.allocator, &[_][]const u8{ baseContentPath, x.name }) catch return error.RecursionError;
            const targetFolder: []const u8 = std.fs.path.join(&gpa.allocator, &[_][]const u8{ zigBin, x.name }) catch return error.RecursionError;
            defer gpa.allocator.free(source);
            defer gpa.allocator.free(targetFolder);
            try innerAddContent(&gpa.allocator, source, targetFolder);
        }
        if (x.kind == .File) {
            try copy(&gpa.allocator, baseContentPath, zigBin, x.name);
        }
    }
}
fn innerAddContent(allocator: *std.mem.Allocator, folder: []const u8, dest: []const u8) AddContentErrors!void {
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
            try copy(allocator, folder, dest, x.name);
        }
    }
}
fn copy(allocator: *std.mem.Allocator, from: []const u8, to: []const u8, filename: []const u8) AddContentErrors!void {
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
