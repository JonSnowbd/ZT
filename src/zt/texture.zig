const std = @import("std");
const stb = @import("stb_image");
usingnamespace @import("gl");

const Self = @This();

id: c_uint = undefined,
width: f32 = undefined,
height: f32 = undefined,
dead: bool = true,

/// Loads an already existing opengl texture from a c_uint
/// inDepth optionally inspects the opengl texture to fill in texture width/height information.
pub fn from(id: c_uint, inDepth: bool) @This() {
    var self: @This() = .{ .id = id, .dead = false };
    if (inDepth) {
        self.updateInformation();
    }
    return self;
}
/// Takes a file path and loads it into opengl using stb_image.
pub fn init(filePath: []const u8) !@This() {
    var w: c_int = 0;
    var h: c_int = 0;
    var numChannels: c_int = 0;
    stb.stbi_set_flip_vertically_on_load(1);
    var data = stb.stbi_load(filePath.ptr, &w, &h, &numChannels, 0);
    var self = @This(){};

    self.width = @intToFloat(f32, w);
    self.height = @intToFloat(f32, h);

    glGenTextures(1, &self.id);
    glBindTexture(GL_TEXTURE_2D, self.id);

    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    switch (numChannels) {
        3 => {
            glTexImage2D(GL_TEXTURE_2D, 0, GL_RGB, w, h, 0, GL_RGB, GL_UNSIGNED_BYTE, data);
        },
        4 => {
            glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, w, h, 0, GL_RGBA, GL_UNSIGNED_BYTE, data);
        },
        else => {
            std.debug.print("ERROR! Failed to compile texture {s} with {any} channels.\n", .{ filePath, numChannels });
            glBindTexture(GL_TEXTURE_2D, 0);
            return error.FailedToInit;
        },
    }
    glGenerateMipmap(GL_TEXTURE_2D);
    stb.stbi_image_free(data);
    self.dead = false;

    glBindTexture(GL_TEXTURE_2D, 0); // Init isnt an explicit bind, so reset.

    return self;
}
pub fn initBlank(width: c_int, height: c_int) @This() {
    var self = @This(){};
    self.width = @intToFloat(f32, width);
    self.height = @intToFloat(f32, height);
    glGenTextures(1, &self.id);
    glBindTexture(GL_TEXTURE_2D, self.id);
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, width, height, 0, GL_RGBA, GL_UNSIGNED_BYTE, null);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    glBindTexture(GL_TEXTURE_2D, 0);

    return self;
}
pub fn deinit(self: *Self) void {
    glDeleteTextures(1, &self.id);
    self.dead = true;
}
/// using Texture.from(c_uint) is a naive cast that wont query size to generate information.
fn updateInformation(self: *Self) void {
    self.bind();
    var w: c_int = 0;
    var h: c_int = 0;
    glGetTexLevelParameteriv(GL_TEXTURE_2D, 0, GL_TEXTURE_WIDTH, &w);
    glGetTexLevelParameteriv(GL_TEXTURE_2D, 0, GL_TEXTURE_HEIGHT, &h);
    self.width = @intToFloat(f32, w);
    self.height = @intToFloat(f32, h);
}
pub fn bind(self: *Self) void {
    glActiveTexture(GL_TEXTURE0);
    glBindTexture(GL_TEXTURE_2D, self.id);
}
pub fn unbind(self: *Self) void {
    glBindTexture(GL_TEXTURE_2D, 0);
}
pub fn setNearestFilter(self: *Self) void {
    glBindTexture(GL_TEXTURE_2D, self.id);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
    glBindTexture(GL_TEXTURE_2D, 0); // Clear
}
pub fn setLinearFilter(self: *Self) void {
    glBindTexture(GL_TEXTURE_2D, self.id);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    glBindTexture(GL_TEXTURE_2D, 0); // Clear
}
/// Use this to get the correct Texture ID for use in imgui.
pub fn imguiId(self: *Self) *c_void {
    return @intToPtr(*c_void, self.id);
}
