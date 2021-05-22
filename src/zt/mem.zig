const std = @import("std");
const mem = std.mem;

// Credit to prime31's various zig projects, very useful allocator

const ScratchAllocator = struct {
    allocator: mem.Allocator,
    backup_allocator: *mem.Allocator,
    end_index: usize,
    buffer: []u8,

    pub fn init(a: *mem.Allocator) ScratchAllocator {
        const scratch_buffer = a.alloc(u8, 8 * 1024 * 1024) catch unreachable;

        return ScratchAllocator{
            .allocator = mem.Allocator{
                .allocFn = alloc,
                .resizeFn = mem.Allocator.noResize,
            },
            .backup_allocator = a,
            .buffer = scratch_buffer,
            .end_index = 0,
        };
    }

    fn alloc(a: *mem.Allocator, n: usize, ptr_align: u29, len_align: u29, ret_addr: usize) ![]u8 {
        const self = @fieldParentPtr(ScratchAllocator, "allocator", a);
        const addr = @ptrToInt(self.buffer.ptr) + self.end_index;
        const adjusted_addr = mem.alignForward(addr, ptr_align);
        const adjusted_index = self.end_index + (adjusted_addr - addr);
        const new_end_index = adjusted_index + n;

        if (new_end_index > self.buffer.len) {
            // if more memory is requested then we have in our buffer leak like a sieve!
            if (n > self.buffer.len) {
                std.debug.warn("\n---------\nwarning: tmp allocated more than is in our temp allocator. This memory WILL leak!\n--------\n", .{});
                return self.allocator.allocFn(a, n, ptr_align, len_align, ret_addr);
            }

            const result = self.buffer[0..n];
            self.end_index = n;
            return result;
        }
        const result = self.buffer[adjusted_index..new_end_index];
        self.end_index = new_end_index;

        return result;
    }
};

/// This is a ring buffer so memory doesnt need to be freed.
var ringBuffer: *mem.Allocator = undefined;
var _allocInstance: ScratchAllocator = undefined;


var initialized: bool = false;
fn init(allocator: *std.mem.Allocator) void {
    _allocInstance = ScratchAllocator.init(allocator);
    ringBuffer = &_allocInstance.allocator;
}

/// Returns a ring buffer that uses a page allocator in a loop of memory.
/// Do not use this for permanent memory, but instead for throw away memory.
pub fn ring() *mem.Allocator {
    if(!initialized) {
        init(std.heap.page_allocator);
        initialized = true;
    }
    return ringBuffer;
}