const std = @import("std");
const stb = @import("stb_image");
usingnamespace @import("gl");

pub var currentTexture: c_uint = 0;
pub const Texture = struct {
    id: c_uint = undefined,
    width: f32 = undefined,
    height: f32 = undefined,
    dead: bool = true,

    /// Loads an already existing texture from a c_uint
    pub fn from(id:c_uint) @This() {return .{.id=id,.dead=false};}
    /// Takes a relative(cwd) path and loads it into 
    pub fn init(filePath:[]const u8) !@This() {
        var w: c_int = 0;
        var h: c_int = 0;
        var numChannels: c_int = 0;
        stb.stbi_set_flip_vertically_on_load(1);
        var data = stb.stbi_load(filePath.ptr, &w, &h, &numChannels, 0);
        var self = @This(){};

        self.width = @intToFloat(f32, w);
        self.height = @intToFloat(f32, h);

        std.debug.print("Loading <{s}> at {any}x{any}\n", .{filePath,w,h});

        glGenTextures(1, &self.id);
        glBindTexture(GL_TEXTURE_2D, self.id);

        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
        switch (numChannels) {
            3 => {glTexImage2D(GL_TEXTURE_2D, 0, GL_RGB, w, h, 0, GL_RGB, GL_UNSIGNED_BYTE, data);},
            4 => {glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, w, h, 0, GL_RGBA, GL_UNSIGNED_BYTE, data);},
            else => {
                std.debug.print("ERROR! Failed to compile texture {s} with {any} channels.\n", .{filePath, numChannels});
                glBindTexture(GL_TEXTURE_2D, currentTexture); // Back to previous
                return error.FailedToInit;
            }
        }
        glGenerateMipmap(GL_TEXTURE_2D);
        stb.stbi_image_free(data);
        self.dead = false;

        glBindTexture(GL_TEXTURE_2D, currentTexture); // Init isnt an explicit bind, so reset to previous.

        return self;
    }
    pub fn initBlank(width:c_int,height:c_int) @This() {
        var self = @This(){};
        self.width = @intToFloat(f32, width);
        self.height = @intToFloat(f32, height);
        glGenTextures(1, &self.id);
        glBindTexture(GL_TEXTURE_2D, self.id);
        glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, width, height, 0, GL_RGBA, GL_UNSIGNED_BYTE, null);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
        glBindTexture(GL_TEXTURE_2D, currentTexture);

        return self;
    }
    pub fn deinit(self:*Texture) void {
        glDeleteTextures(1, &self.id);
        self.dead = true;
    }
    /// using Texture.from(c_uint) is a naive cast that wont query size to generate information.
    pub fn updateInformation(self:*Texture) void {
        self.bind();
        glGetTexLevelParameteriv(GL_TEXTURE_2D, 0, GL_TEXTURE_WIDTH, &self.width);
        glGetTexLevelParameteriv(GL_TEXTURE_2D, 0, GL_TEXTURE_HEIGHT, &self.height);
    }
    pub fn bind(self: *Texture) void {
        if(currentTexture == self.id) {return;}

        glActiveTexture(GL_TEXTURE0);
        glBindTexture(GL_TEXTURE_2D, self.id);
        currentTexture = self.id;
    }
    pub fn unbind(self:*Texture) void {
        glBindTexture(GL_TEXTURE_2D, 0);
        currentTexture = 0;
    }

    pub fn setNearestFilter(self:*Texture) void {
        glBindTexture(GL_TEXTURE_2D, self.id);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
        glBindTexture(GL_TEXTURE_2D, currentTexture); // Jump back
    }
    pub fn setLinearFilter(self:*Texture) void {
        glBindTexture(GL_TEXTURE_2D, self.id);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
        glBindTexture(GL_TEXTURE_2D, currentTexture); // Jump back
    }

    pub fn imguiId(self:*Texture) *c_void {
        return  @intToPtr(*c_void, self.id);
    }
};