const std = @import("std");

// zig 11 vs nightly compatibility
fn openIterableDirAbsolute(path_: []const u8) !if (@hasDecl(std.fs, "openIterableDirAbsolute")) std.fs.IterableDir else std.fs.Dir {
    const path = if (std.fs.path.isAbsolute(path_)) path_ else @panic("path is not absolute! Use: Build.pathFromRoot()");
    if (@hasDecl(std.fs, "openIterableDirAbsolute")) {
        return std.fs.openIterableDirAbsolute(path, .{});
    } else return std.fs.openDirAbsolute(path, .{ .iterate = true });
}

fn getRelativePath() []const u8 {
    comptime {
        const src: std.builtin.SourceLocation = @src();
        const dirname = std.fs.path.dirname(src.file).?;
        return dirname ++ std.fs.path.sep_str;
    }
}

fn thisDir() []const u8 {
    return std.fs.path.dirname(@src().file) orelse ".";
}

// Build here only exists to build the example. to use ZT you'll want to import this file and use the link function in
// your build.zig
pub fn build(b: *std.build.Builder) !void {
    // Standard target options allows the person running `zig build` to choose
    // what target to build for. Here we do not override the defaults, which
    // means any target is allowed, and the default is native. Other options
    // for restricting supported target set are available.
    const target = b.standardTargetOptions(.{});

    // Standard optimization options allow the person running `zig build` to select
    // between Debug, ReleaseSafe, ReleaseFast, and ReleaseSmall. Here we do not
    // set a preferred release mode, allowing the user to decide how to optimize.
    const optimize = b.standardOptimizeOption(.{});

    const exe = b.addExecutable(.{
        .name = "example",
        // In this case the main source file is merely a path, however, in more
        // complicated build scripts, this could be a generated file.
        .root_source_file = .{ .path = "example/src/main.zig" },
        .target = target,
        .optimize = optimize,
    });

    try link(b, exe);

    b.installArtifact(exe);

    addBinaryContent(b.pathFromRoot("example/assets")) catch unreachable;

    // This *creates* a Run step in the build graph, to be executed when another
    // step is evaluated that depends on it. The next line below will establish
    // such a dependency.
    const run_cmd = b.addRunArtifact(exe);

    // By making the run step depend on the install step, it will be run from the
    // installation directory rather than directly from within the cache directory.
    // This is not necessary, however, if the application depends on other installed
    // files, this ensures they will be present and in the expected location.
    run_cmd.step.dependOn(b.getInstallStep());

    // This allows the user to pass arguments to the application in the build
    // command itself, like this: `zig build run -- arg1 arg2 etc`
    if (b.args) |args| {
        run_cmd.addArgs(args);
    }

    // This creates a build step. It will be visible in the `zig build --help` menu,
    // and can be selected like this: `zig build run`
    // This will evaluate the `run` step rather than the default, which is "install".
    const run_step = b.step("run", "Run the app");
    run_step.dependOn(&run_cmd.step);

    // Creates a step for unit testing. This only builds the test executable
    // but does not run it.
    const unit_tests = b.addTest(.{
        .root_source_file = .{ .path = "src/main.zig" },
        .target = target,
        .optimize = optimize,
    });

    const run_unit_tests = b.addRunArtifact(unit_tests);

    // Similar to creating the run step earlier, this exposes a `test` step to
    // the `zig build --help` menu, providing a way for the user to request
    // running the unit tests.
    const test_step = b.step("test", "Run unit tests");
    test_step.dependOn(&run_unit_tests.step);
}

pub fn link(b: *std.build.Builder, exe: *std.build.CompileStep) !void {
    // Link step
    exe.linkLibrary(imguiLibrary(b, exe));
    exe.linkLibrary(glLibrary(b, exe));
    exe.linkLibrary(stbLibrary(b, exe));

    const glfw_dep = b.dependency("mach_glfw", .{
        .target = exe.target,
        .optimize = exe.optimize,
    });
    const glfwModule = glfw_dep.module("mach-glfw");
    exe.addModule("mach-glfw", glfwModule);
    const glfw = @import("mach_glfw");

    const gl = b.addTranslateC(.{ .target = exe.target, .optimize = exe.optimize, .source_file = .{ .path = comptime thisDir() ++ "/src/dep/gl/glad/include/glad/glad.h" } }).addModule("glad");
    const stb_image = b.addTranslateC(.{ .target = exe.target, .optimize = exe.optimize, .source_file = .{ .path = comptime thisDir() ++ "/src/dep/stb/stb_image.h" } }).addModule("stb_image");
    const imgui = b.createModule(.{ .source_file = .{ .path = comptime thisDir() ++ "/src/pkg/imgui.zig" } });
    const zt = b.createModule(.{ .source_file = .{ .path = comptime thisDir() ++ "/src/zt.zig" }, .dependencies = &.{
        .{ .name = "glfw", .module = glfwModule },
        .{ .name = "gl", .module = gl },
        .{ .name = "stb_image", .module = stb_image },
        .{ .name = "imgui", .module = imgui },
    } });

    exe.addModule("glfw", glfwModule);
    exe.addModule("gl", gl);
    exe.addModule("stb_image", stb_image);
    exe.addModule("imgui", imgui);
    exe.addModule("zt", zt);

    try glfw.link(b, exe);
}

// STB
pub fn stbLibrary(b: *std.build.Builder, exe: *std.build.CompileStep) *std.build.CompileStep {
    const path = comptime thisDir();

    var stb = b.addStaticLibrary(.{ .name = "stb", .target = exe.target, .optimize = exe.optimize });
    stb.linkLibC();

    var flagContainer = std.ArrayList([]const u8).init(std.heap.page_allocator);
    if (exe.optimize != .Debug) flagContainer.append("-Os") catch unreachable;

    stb.addCSourceFile(.{ .file = .{ .path = path ++ "/src/dep/stb/stb_image_wrapper.c" }, .flags = flagContainer.items });

    return stb;
}
// OpenGL
pub fn glLibrary(b: *std.build.Builder, exe: *std.build.CompileStep) *std.build.CompileStep {
    const path = comptime getRelativePath();

    var target = exe.target;
    var gl = b.addStaticLibrary(.{ .name = "gl", .target = exe.target, .optimize = exe.optimize });
    gl.linkLibC();

    // Generate flags.
    var flagContainer = std.ArrayList([]const u8).init(std.heap.page_allocator);
    if (exe.optimize != .Debug) flagContainer.append("-Os") catch unreachable;

    // Link libraries.
    if (target.isWindows()) {
        gl.linkSystemLibrary("opengl32");
    }
    if (target.isLinux()) {
        gl.linkSystemLibrary("GL");
    }
    if (target.isDarwin()) {
        gl.linkFramework("OpenGL");
        // !! Mac TODO
        // Here we need to add the include the system libs needed for mac opengl
        // Maybe also
    }

    // Include dirs.
    gl.addIncludePath(.{ .path = path ++ "/src/dep/gl/glad/include" });

    // Add c.
    gl.addCSourceFile(.{ .file = .{ .path = path ++ "/src/dep/gl/glad/src/glad.c" }, .flags = flagContainer.items });

    return gl;
}
// ImGui
pub fn imguiLibrary(b: *std.build.Builder, exe: *std.build.CompileStep) *std.build.CompileStep {
    const path = comptime getRelativePath();
    var target = exe.target;
    var imgui = b.addStaticLibrary(.{ .name = "imgui", .target = exe.target, .optimize = exe.optimize });
    imgui.linkLibC();
    imgui.linkSystemLibrary("c++");

    // Generate flags.
    var flagContainer = std.ArrayList([]const u8).init(std.heap.page_allocator);
    if (exe.optimize != .Debug) flagContainer.append("-Os") catch unreachable;
    flagContainer.append("-Wno-return-type-c-linkage") catch unreachable;
    flagContainer.append("-fno-sanitize=undefined") catch unreachable;

    // Link libraries.
    if (target.isWindows()) {
        imgui.linkSystemLibrary("winmm");
        imgui.linkSystemLibrary("user32");
        imgui.linkSystemLibrary("imm32");
        imgui.linkSystemLibrary("gdi32");
    }

    if (target.isDarwin()) {
        // !! Mac TODO
        // Here we need to add the include the system libs needed for mac imgui
    }

    // Include dirs.
    imgui.addIncludePath(.{ .path = path ++ "/src/dep/cimgui/imgui" });
    imgui.addIncludePath(.{ .path = path ++ "/src/dep/cimgui" });

    // Add C
    imgui.addCSourceFile(.{ .file = .{ .path = path ++ "/src/dep/cimgui/imgui/imgui.cpp" }, .flags = flagContainer.items });
    imgui.addCSourceFile(.{ .file = .{ .path = path ++ "/src/dep/cimgui/imgui/imgui_demo.cpp" }, .flags = flagContainer.items });
    imgui.addCSourceFile(.{ .file = .{ .path = path ++ "/src/dep/cimgui/imgui/imgui_draw.cpp" }, .flags = flagContainer.items });
    imgui.addCSourceFile(.{ .file = .{ .path = path ++ "/src/dep/cimgui/imgui/imgui_tables.cpp" }, .flags = flagContainer.items });
    imgui.addCSourceFile(.{ .file = .{ .path = path ++ "/src/dep/cimgui/imgui/imgui_widgets.cpp" }, .flags = flagContainer.items });
    imgui.addCSourceFile(.{ .file = .{ .path = path ++ "/src/dep/cimgui/cimgui.cpp" }, .flags = flagContainer.items });

    return imgui;
}

pub const AddContentErrors = error{ PermissionError, WriteError, FileError, FolderError, RecursionError };
const fs = std.fs;

/// Pass in a relative path to a folder, and its content is added to the zig-cache/bin output.
/// TODO: Lookup where zig defines the output folder to make it more bulletproof.
pub fn addBinaryContent(baseContentPath: []const u8) AddContentErrors!void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};

    const zigBin: []const u8 = std.fs.path.join(gpa.allocator(), &[_][]const u8{ "zig-out", "bin" }) catch return error.FolderError;
    defer gpa.allocator().free(zigBin);
    fs.cwd().makePath(zigBin) catch return error.FolderError;

    var sourceFolder = openIterableDirAbsolute(baseContentPath) catch return error.FolderError;
    defer sourceFolder.close();
    var iterator = sourceFolder.iterate();

    while (iterator.next() catch return error.FolderError) |target| {
        const x = target;
        if (x.kind == .directory) {
            const source: []const u8 = std.fs.path.join(gpa.allocator(), &[_][]const u8{ baseContentPath, x.name }) catch return error.RecursionError;
            const targetFolder: []const u8 = std.fs.path.join(gpa.allocator(), &[_][]const u8{ zigBin, x.name }) catch return error.RecursionError;
            defer gpa.allocator().free(source);
            defer gpa.allocator().free(targetFolder);
            try innerAddContent(gpa.allocator(), source, targetFolder);
        }
        if (x.kind == .file) {
            try copy(baseContentPath, zigBin, x.name);
        }
    }
}
fn innerAddContent(allocator: std.mem.Allocator, folder: []const u8, dest: []const u8) AddContentErrors!void {
    var sourceFolder = openIterableDirAbsolute(folder) catch return error.FolderError;
    defer sourceFolder.close();

    var iterator = sourceFolder.iterate();
    while (iterator.next() catch return error.FolderError) |target| {
        const x = target;
        if (x.kind == .directory) {
            const source: []const u8 = std.fs.path.join(allocator, &[_][]const u8{ folder, x.name }) catch return error.RecursionError;
            const targetFolder: []const u8 = std.fs.path.join(allocator, &[_][]const u8{ dest, x.name }) catch return error.RecursionError;
            defer allocator.free(source);
            defer allocator.free(targetFolder);
            try innerAddContent(allocator, source, targetFolder);
        }
        if (x.kind == .file) {
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

    const sstat = sfile.stat() catch return error.FileError;
    const dstat = dfile.stat() catch return error.FileError;

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
