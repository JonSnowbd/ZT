usingnamespace @import("gl");

const Self = @This();

id: c_uint = 0,
dead: bool = true,

pub fn from(shaderID: c_uint) @This() {
    return .{
        .id = shaderID,
    };
}
pub fn init(vert: [*:0]const u8, frag: [*:0]const u8) @This() {
    var self = @This(){};

    var vertId = glCreateShader(GL_VERTEX_SHADER);
    glShaderSource(vertId, 1, &vert, null);
    glCompileShader(vertId);

    var fragId = glCreateShader(GL_FRAGMENT_SHADER);
    glShaderSource(fragId, 1, &frag, null);
    glCompileShader(fragId);

    self.id = glCreateProgram();
    glAttachShader(self.id, vertId);
    glAttachShader(self.id, fragId);
    glLinkProgram(self.id);

    glDeleteShader(vertId);
    glDeleteShader(fragId);

    glUseProgram(0);

    self.dead = false;

    return self;
}
pub fn deinit(self: *Self) void {
    glDeleteProgram(self.id);
    self.dead = true;
}
pub fn bind(self: *Self) void {
    glUseProgram(self.id);
}
pub fn unbind(self: *Self) void {
    _ = self;
    glUseProgram(0);
}
