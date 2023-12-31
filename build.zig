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

pub fn build(b: *std.build.Builder) !void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const exe = b.addExecutable(.{
        .name = "example",
        .root_source_file = .{ .path = "example/src/main.zig" },
        .target = target,
        .optimize = optimize,
    });

    link(b, exe);

    b.installArtifact(exe);

    addBinaryContent(b.pathFromRoot("example/assets")) catch unreachable;
    const run_cmd = b.addRunArtifact(exe);
    run_cmd.step.dependOn(b.getInstallStep());
    if (b.args) |args| {
        run_cmd.addArgs(args);
    }

    const run_step = b.step("run", "Run the app");
    run_step.dependOn(&run_cmd.step);

    const unit_tests = b.addTest(.{
        .root_source_file = .{ .path = "src/main.zig" },
        .target = target,
        .optimize = optimize,
    });

    const run_unit_tests = b.addRunArtifact(unit_tests);

    const test_step = b.step("test", "Run unit tests");
    test_step.dependOn(&run_unit_tests.step);
}

/// Adds GLFW to the build step, returns the module created if you want to add it to other
/// builds also.
/// - Once this is used in your build.zig you can use `const glfw = @import("glfw");` in your zig
/// code.
/// - Compiles GLFW from source, and uses a curated zig file as a module.
pub fn linkGlfw(b: *std.build.Builder, exe: *std.build.CompileStep) *std.Build.Module {
    exe.linkLibrary(glfwLibrary(b, exe));
    const glfw = b.createModule(.{
        .source_file = .{
            .path = comptime thisDir() ++ "/src/pkg/glfw.zig",
        },
    });

    exe.addModule("glfw", glfw);

    return glfw;
}
/// Adds OpenGL 3.3 Core via GLAD to the build step, returns the module created if you want
/// to add it to other builds also.
/// - Once this is used in your build.zig you can use `const gl = @import("gl");` in your zig
/// code.
/// - Uses a curated zig file as a module.
pub fn linkGl(b: *std.build.Builder, exe: *std.build.CompileStep) *std.Build.Module {
    exe.linkLibrary(glLibrary(b, exe));
    const gl = b.createModule(.{
        .source_file = .{
            .path = comptime thisDir() ++ "/src/pkg/gl.zig",
        },
    });

    exe.addModule("gl", gl);

    return gl;
}
/// Adds ImGui 1.90 to the build step, returns the module created if you want
/// to add it to other builds also.
/// - Once this is used in your build.zig you can use `const ig = @import("imgui");` in your zig
/// code.
/// - Compiles cimgui from source code, and uses a curated zig file as a module.
pub fn linkImGui(b: *std.build.Builder, exe: *std.build.CompileStep) *std.Build.Module {
    exe.linkLibrary(imguiLibrary(b, exe));
    const imgui = b.createModule(.{
        .source_file = .{
            .path = comptime thisDir() ++ "/src/pkg/imgui.zig",
        },
    });

    exe.addModule("imgui", imgui);

    return imgui;
}
/// Adds STB Image to the build step, returns the module created if you want
/// to add it to other builds also.
/// - Once this is used in your build.zig you can use `const ig = @import("imgui");` in your zig
/// code.
/// - Compiles cimgui from source code, and uses a curated zig file as a module.
pub fn linkSTBImage(b: *std.build.Builder, exe: *std.build.CompileStep) *std.Build.Module {
    exe.linkLibrary(stbLibrary(b, exe));
    const stb = b.createModule(.{
        .source_file = .{
            .path = comptime thisDir() ++ "/src/pkg/stb_image.zig",
        },
    });

    exe.addModule("stb_image", stb);

    return stb;
}

/// Automatically links STB/ImGui/GLFW/ZT into your build step. You don't need to link anything
/// but this if your intention is to use `zt.App`
pub fn link(b: *std.build.Builder, exe: *std.build.CompileStep) void {
    // Link step
    const stb_image = linkSTBImage(b, exe);
    const imgui = linkImGui(b, exe);
    const gl = linkGl(b, exe);
    const glfw = linkGlfw(b, exe);

    const zt = b.createModule(.{
        .source_file = .{
            .path = comptime thisDir() ++ "/src/zt.zig",
        },
        .dependencies = &.{
            .{ .name = "glfw", .module = glfw },
            .{ .name = "gl", .module = gl },
            .{ .name = "stb_image", .module = stb_image },
            .{ .name = "imgui", .module = imgui },
        },
    });

    exe.addModule("zt", zt);
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

// glfw
pub fn glfwLibrary(b: *std.build.Builder, exe: *std.build.CompileStep) *std.build.CompileStep {
    const path = comptime getRelativePath();
    var target = exe.target;
    var glfw = b.addStaticLibrary(.{ .name = "glfw", .target = exe.target, .optimize = exe.optimize });
    glfw.linkLibC();

    // Generate flags.
    var flagContainer = std.ArrayList([]const u8).init(std.heap.page_allocator);
    if (exe.optimize != .Debug) flagContainer.append("-Os") catch unreachable;
    flagContainer.append("-Wno-return-type-c-linkage") catch unreachable;
    flagContainer.append("-fno-sanitize=undefined") catch unreachable;

    glfw.addIncludePath(.{ .path = path ++ "/src/dep/glfw/deps" });
    glfw.addIncludePath(.{ .path = path ++ "/src/dep/glfw/include" });

    // Link libraries.
    if (target.isWindows()) {
        flagContainer.append("-D_GLFW_WIN32") catch unreachable;
        glfw.linkSystemLibrary("gdi32");

        glfw.addCSourceFile(.{ .file = .{ .path = path ++ "/src/dep/glfw/src/win32_init.c" }, .flags = flagContainer.items });
        glfw.addCSourceFile(.{ .file = .{ .path = path ++ "/src/dep/glfw/src/win32_joystick.c" }, .flags = flagContainer.items });
        glfw.addCSourceFile(.{ .file = .{ .path = path ++ "/src/dep/glfw/src/win32_monitor.c" }, .flags = flagContainer.items });
        glfw.addCSourceFile(.{ .file = .{ .path = path ++ "/src/dep/glfw/src/win32_time.c" }, .flags = flagContainer.items });
        glfw.addCSourceFile(.{ .file = .{ .path = path ++ "/src/dep/glfw/src/win32_thread.c" }, .flags = flagContainer.items });
        glfw.addCSourceFile(.{ .file = .{ .path = path ++ "/src/dep/glfw/src/win32_window.c" }, .flags = flagContainer.items });
        glfw.addCSourceFile(.{ .file = .{ .path = path ++ "/src/dep/glfw/src/wgl_context.c" }, .flags = flagContainer.items });
        glfw.addCSourceFile(.{ .file = .{ .path = path ++ "/src/dep/glfw/src/egl_context.c" }, .flags = flagContainer.items });
        glfw.addCSourceFile(.{ .file = .{ .path = path ++ "/src/dep/glfw/src/osmesa_context.c" }, .flags = flagContainer.items });
    }

    if (target.isDarwin()) {
        // !! Mac TODO
        // Here we need to add the include the system libs needed for mac glfw
        // However, i do not own a mac to implement this on.
    }

    // Add C
    glfw.addCSourceFile(.{ .file = .{ .path = path ++ "/src/dep/glfw/src/context.c" }, .flags = flagContainer.items });
    glfw.addCSourceFile(.{ .file = .{ .path = path ++ "/src/dep/glfw/src/init.c" }, .flags = flagContainer.items });
    glfw.addCSourceFile(.{ .file = .{ .path = path ++ "/src/dep/glfw/src/input.c" }, .flags = flagContainer.items });
    glfw.addCSourceFile(.{ .file = .{ .path = path ++ "/src/dep/glfw/src/monitor.c" }, .flags = flagContainer.items });
    glfw.addCSourceFile(.{ .file = .{ .path = path ++ "/src/dep/glfw/src/vulkan.c" }, .flags = flagContainer.items });
    glfw.addCSourceFile(.{ .file = .{ .path = path ++ "/src/dep/glfw/src/window.c" }, .flags = flagContainer.items });

    return glfw;
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
