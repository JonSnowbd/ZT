usingnamespace @import("imgui");
const std = @import("std");
const allocators = @import("mem.zig");
const Texture = @import("texture.zig");
const app = @import("app.zig");

pub fn ztText(comptime fmt:[]const u8, args: anytype) void {
    var alloc = allocators.ring();
    var text:[]const u8 = alloc.dupeZ(u8,std.fmt.allocPrint(alloc, fmt, args) catch unreachable) catch unreachable;
    igText(text.ptr);
}
