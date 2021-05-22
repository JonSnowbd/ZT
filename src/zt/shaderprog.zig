usingnamespace @import("gl");

pub var currentShader: c_uint = 0;
pub const Shader = struct {

    id: c_uint = 0,
    dead: bool = true,

    pub fn from(shaderID:c_uint) @This() {
        return .{
            .id=shaderID,
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

        glUseProgram(currentShader);

        self.dead = false;

        return self;
    }
    pub fn deinit(self:*Shader) void {
        glDeleteProgram(self.id);
        self.dead = true;
    }

    pub fn bind(self: *Shader) void {
        if(currentShader == self.id) {return;}
        glUseProgram(self.id);
        currentShader = self.id;
    }
    pub fn unbind(self:*Shader) void {
        currentShader = 0;
        glUseProgram(0);
    }
};