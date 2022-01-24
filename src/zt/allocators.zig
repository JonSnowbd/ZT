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
        pub fn getAllocator(self:*Self) mem.Allocator {
            return mem.Allocator.init(self, alloc, mem.Allocator.NoResize(Self).noResize, mem.Allocator.NoOpFree(Self).noOpFree);
        }
        fn alloc(a: *Self, n: usize, ptr_align: u29, len_align: u29, ret_addr: usize) std.mem.Allocator.Error![]u8 {
            _ = ret_addr;
            _ = len_align;
            const addr = @ptrToInt(&a.buffer) + end_index;
            const adjusted_addr = mem.alignForward(addr, ptr_align);
            const adjusted_index = end_index + (adjusted_addr - addr);
            const new_end_index = adjusted_index + n;

            if (new_end_index > a.buffer.len) {
                if (n > a.buffer.len) {
                    std.debug.print("tmp allocated more than is in our temp allocator.", .{});
                    return std.mem.Allocator.Error.OutOfMemory;
                }
                const result = a.buffer[0..n];
                end_index = n;
                return result;
            }
            const result = a.buffer[adjusted_index..new_end_index];
            end_index = new_end_index;

            return result;
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
