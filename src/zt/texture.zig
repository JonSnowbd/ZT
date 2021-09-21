const std = @import("std");
const stb = @import("stb_image");
const gl = @import("gl");
const Self = @This();

id: c_uint = undefined,
width: f32 = undefined,
height: f32 = undefined,
dead: bool = true,

/// Loads an already existing opengl texture from a c_uint
/// inDepth optionally inspects the opengl texture to fill in texture width/height information.
pub fn from(id: c_uint, inDepth: bool) Self {
    var self: Self = .{ .id = id, .dead = false };
    if (inDepth) {
        self.updateInformation();
    }
    return self;
}
/// Takes a file path and loads it into opengl using stb_image.
pub fn init(filePath: []const u8) !Self {
    var ownedFp: [:0]const u8 = try std.heap.c_allocator.dupeZ(u8, filePath);
    defer std.heap.c_allocator.free(ownedFp);
    var w: c_int = 0;
    var h: c_int = 0;
    var numChannels: c_int = 0;
    var data = stb.stbi_load(ownedFp.ptr, &w, &h, &numChannels, 0);
    var self = Self{};

    self.width = @intToFloat(f32, w);
    self.height = @intToFloat(f32, h);

    gl.glGenTextures(1, &self.id);
    gl.glBindTexture(gl.GL_TEXTURE_2D, self.id);

    gl.glTexParameteri(gl.GL_TEXTURE_2D, gl.GL_TEXTURE_WRAP_S, gl.GL_REPEAT);
    gl.glTexParameteri(gl.GL_TEXTURE_2D, gl.GL_TEXTURE_WRAP_T, gl.GL_REPEAT);
    gl.glTexParameteri(gl.GL_TEXTURE_2D, gl.GL_TEXTURE_MIN_FILTER, gl.GL_LINEAR);
    gl.glTexParameteri(gl.GL_TEXTURE_2D, gl.GL_TEXTURE_MAG_FILTER, gl.GL_LINEAR);
    switch (numChannels) {
        3 => {
            gl.glTexImage2D(gl.GL_TEXTURE_2D, 0, gl.GL_RGB, w, h, 0, gl.GL_RGB, gl.GL_UNSIGNED_BYTE, data);
        },
        4 => {
            gl.glTexImage2D(gl.GL_TEXTURE_2D, 0, gl.GL_RGBA, w, h, 0, gl.GL_RGBA, gl.GL_UNSIGNED_BYTE, data);
        },
        else => {
            std.debug.print("ERROR! Failed to compile texture {s} with {any} channels.\n", .{ filePath, numChannels });
            gl.glBindTexture(gl.GL_TEXTURE_2D, 0);
            return error.FailedToInit;
        },
    }
    gl.glGenerateMipmap(gl.GL_TEXTURE_2D);
    stb.stbi_image_free(data);
    self.dead = false;

    gl.glBindTexture(gl.GL_TEXTURE_2D, 0); // Init isnt an explicit bind, so reset.

    return self;
}
pub fn initBlank(width: c_int, height: c_int) Self {
    var self = Self{};
    self.width = @intToFloat(f32, width);
    self.height = @intToFloat(f32, height);
    gl.glGenTextures(1, &self.id);
    gl.glBindTexture(gl.GL_TEXTURE_2D, self.id);
    gl.glTexImage2D(gl.GL_TEXTURE_2D, 0, gl.GL_RGBA, width, height, 0, gl.GL_RGBA, gl.GL_UNSIGNED_BYTE, null);
    gl.glTexParameteri(gl.GL_TEXTURE_2D, gl.GL_TEXTURE_MIN_FILTER, gl.GL_LINEAR);
    gl.glTexParameteri(gl.GL_TEXTURE_2D, gl.GL_TEXTURE_MAG_FILTER, gl.GL_LINEAR);
    gl.glBindTexture(gl.GL_TEXTURE_2D, 0);

    return self;
}
pub fn deinit(self: *Self) void {
    gl.glDeleteTextures(1, &self.id);
    self.dead = true;
}
/// using Texture.from(c_uint) is a naive cast that wont query size to generate information.
fn updateInformation(self: *Self) void {
    self.bind();
    var w: c_int = 0;
    var h: c_int = 0;
    gl.glGetTexLevelParameteriv(gl.GL_TEXTURE_2D, 0, gl.GL_TEXTURE_WIDTH, &w);
    gl.glGetTexLevelParameteriv(gl.GL_TEXTURE_2D, 0, gl.GL_TEXTURE_HEIGHT, &h);
    self.width = @intToFloat(f32, w);
    self.height = @intToFloat(f32, h);
}
pub fn bind(self: *Self) void {
    gl.glActiveTexture(gl.GL_TEXTURE0);
    gl.glBindTexture(gl.GL_TEXTURE_2D, self.id);
}
pub fn unbind(self: *Self) void {
    _ = self;
    gl.glBindTexture(gl.GL_TEXTURE_2D, 0);
}
pub fn setNearestFilter(self: *Self) void {
    gl.glBindTexture(gl.GL_TEXTURE_2D, self.id);
    gl.glTexParameteri(gl.GL_TEXTURE_2D, gl.GL_TEXTURE_MIN_FILTER, gl.GL_NEAREST);
    gl.glTexParameteri(gl.GL_TEXTURE_2D, gl.GL_TEXTURE_MAG_FILTER, gl.GL_NEAREST);
    gl.glBindTexture(gl.GL_TEXTURE_2D, 0); // Clear
}
pub fn setLinearFilter(self: *Self) void {
    gl.glBindTexture(gl.GL_TEXTURE_2D, self.id);
    gl.glTexParameteri(gl.GL_TEXTURE_2D, gl.GL_TEXTURE_MIN_FILTER, gl.GL_LINEAR);
    gl.glTexParameteri(gl.GL_TEXTURE_2D, gl.GL_TEXTURE_MAG_FILTER, gl.GL_LINEAR);
    gl.glBindTexture(gl.GL_TEXTURE_2D, 0); // Clear
}
/// Use this to get the correct Texture ID for use in imgui.
pub fn imguiId(self: *Self) *c_void {
    return @intToPtr(*c_void, self.id);
}
