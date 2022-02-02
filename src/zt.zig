const std = @import("std");

pub const App = @import("zt/app.zig").App;
pub const Allocators = @import("zt/allocators.zig");
/// Forwarding known_folders.zig, a popular zig framework for finding predetermined folders cross platform.
pub const known_folders = @import("pkg/known_folders.zig");
pub const math = @import("pkg/zlm.zig");

/// A simple and very fast spatial hash with customizable entry type and bucket size.
pub const SpatialHash = @import("zt/spatialHash.zig");
/// Lots of functions for overlap testing shapes of different kinds.
pub const Physics = @import("zt/physics.zig");
/// A renderer made with `GenerateBuffer`, contains everything you need for a fast and simple graphic renderer.
pub const Renderer = @import("zt/renderer.zig");
/// Creates an FBO and texture, allows for binding and unbinding to toggle what you're rendering to with opengl.
pub const RenderTarget = @import("zt/renderTarget.zig");
/// Creates a Shader Program in opengl from @embedFile or other bytes.
pub const Shader = @import("zt/shader.zig");
/// Uses stb_image to load textures into opengl, with wrapper struct for basic information.
pub const Texture = @import("zt/texture.zig");
/// Generates a basic opengl buffer automatically, based on a vertex struct.
pub const GenerateBuffer = @import("zt/generateBuffer.zig").GenerateBuffer;

/// Finds the folder of the binary, and sets the operating system's working directory
/// to it. Useful to keep relative file loading working properly(especially using `zig build run`)
/// when ran from any location.
pub fn makeCwd() !void {
    var folder = (try known_folders.getPath(std.heap.c_allocator, known_folders.KnownFolder.executable_dir)).?;
    try std.os.chdir(folder);
}

/// Takes a relative path from the executable's cwd, and returns an absolute path to the resource. Great for making
/// sure your application gets the right resources no matter where its launched from.
pub inline fn path(subpath: []const u8) []const u8 {
    return pathEx(Allocators.ring(), subpath);
}
/// Same as path, but you own the memory.
pub fn pathEx(allocator: std.mem.Allocator, subpath: []const u8) []const u8 {
    var executablePath = known_folders.getPath(allocator, .executable_dir) catch unreachable;
    defer allocator.free(executablePath.?);
    return std.fs.path.joinZ(allocator, &[_][]const u8{ executablePath.?, subpath }) catch unreachable;
}
