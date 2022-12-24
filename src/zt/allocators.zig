const std = @import("std");
const mem = std.mem;

pub fn RingBufferGenerate(comptime size: usize) type {
    return struct {
        buffer: [size]u8 = undefined,
        const Self = @This();
        var allocator: mem.Allocator = mem.Allocator{
            .allocFn = alloc,
            .resizeFn = mem.Allocator.noResize,
        };
        var end_index: usize = 0;
        pub fn getAllocator(self: *Self) mem.Allocator {
            return mem.Allocator{ .ptr = self, .vtable = &mem.Allocator.VTable{ .alloc = alloc, .resize = mem.Allocator.noResize, .free = mem.Allocator.noFree } };
        }
        fn alloc(ctx: *anyopaque, len: usize, ptr_align: u8, ret_addr: usize) ?[*]u8 {
            _ = ret_addr;
            var a: *Self = @ptrCast(*Self, ctx);
            const addr = @ptrToInt(&a.buffer) + end_index;
            const adjusted_addr = if (ptr_align > 0) mem.alignForward(addr, @intCast(usize, ptr_align)) else addr;
            const adjusted_index = end_index + (adjusted_addr - addr);
            const new_end_index = adjusted_index + len;

            if (new_end_index > a.buffer.len) {
                if (len > a.buffer.len) {
                    std.debug.panic("tmp allocated more than is in our temp allocator.", .{});
                    unreachable;
                }
                end_index = len;
                return @ptrCast([*]u8, a.buffer[0..len]);
            }
            end_index = new_end_index;

            return @ptrCast([*]u8, a.buffer[adjusted_index..new_end_index]);
        }
    };
}

var internal = RingBufferGenerate(1024 * 1024 * 3){};
/// You can use this to allocate temp memory that you never have to free.
var internalBuffer: mem.Allocator = internal.getAllocator();

/// Returns a ring buffer that uses a page allocator in a loop of memory.
/// Do not use this for permanent memory, but instead for throw away memory, no need
/// to free anything that you use this to allocate.
pub fn ring() mem.Allocator {
    return internalBuffer;
}
