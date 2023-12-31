const gl = @import("gl");

const Self = @This();

id: c_uint = 0,

pub fn from(shaderID: c_uint) Self {
    return .{
        .id = shaderID,
    };
}
pub fn init(vert: [*:0]const u8, frag: [*:0]const u8) Self {
    var self: Self = .{};

    const vertId = gl.glCreateShader(gl.GL_VERTEX_SHADER);
    gl.glShaderSource(vertId, 1, &vert, null);
    gl.glCompileShader(vertId);

    const fragId = gl.glCreateShader(gl.GL_FRAGMENT_SHADER);
    gl.glShaderSource(fragId, 1, &frag, null);
    gl.glCompileShader(fragId);

    self.id = gl.glCreateProgram();
    gl.glAttachShader(self.id, vertId);
    gl.glAttachShader(self.id, fragId);
    gl.glLinkProgram(self.id);

    gl.glDeleteShader(vertId);
    gl.glDeleteShader(fragId);

    gl.glUseProgram(0);

    return self;
}
pub fn deinit(self: *Self) void {
    gl.glDeleteProgram(self.id);
}
pub fn bind(self: *Self) void {
    gl.glUseProgram(self.id);
}
pub fn unbind(self: *Self) void {
    _ = self;
    gl.glUseProgram(0);
}
