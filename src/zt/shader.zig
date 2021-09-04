const gl = @import("gl");

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

    var vertId = gl.glCreateShader(gl.GL_VERTEX_SHADER);
    gl.glShaderSource(vertId, 1, &vert, null);
    gl.glCompileShader(vertId);

    var fragId = gl.glCreateShader(gl.GL_FRAGMENT_SHADER);
    gl.glShaderSource(fragId, 1, &frag, null);
    gl.glCompileShader(fragId);

    self.id = gl.glCreateProgram();
    gl.glAttachShader(self.id, vertId);
    gl.glAttachShader(self.id, fragId);
    gl.glLinkProgram(self.id);

    gl.glDeleteShader(vertId);
    gl.glDeleteShader(fragId);

    gl.glUseProgram(0);

    self.dead = false;

    return self;
}
pub fn deinit(self: *Self) void {
    gl.glDeleteProgram(self.id);
    self.dead = true;
}
pub fn bind(self: *Self) void {
    gl.glUseProgram(self.id);
}
pub fn unbind(self: *Self) void {
    _ = self;
    gl.glUseProgram(0);
}
