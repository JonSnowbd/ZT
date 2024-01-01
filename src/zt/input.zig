const std = @import("std");
const ig = @import("imgui");
const zt = @import("../zt.zig");
const glfw = @import("glfw");
const math = zt.math;

pub const InputDataType = union(enum) {
    button: bool,
    axis: f32,
    stick: zt.math.Vec2,

    pub fn active(self: InputDataType) bool {
        switch (self) {
            .button => |btn| {
                return btn;
            },
            .axis => |axs| {
                return axs > Axis.epsilon or axs < -Axis.epsilon;
            },
            .stick => |stck| {
                return (stck.x > Stick.epsilon or stck.x < -Stick.epsilon) or (stck.y > Stick.epsilon or stck.y < -Stick.epsilon);
            },
        }
    }
};
pub const InputData = struct {
    value: InputDataType,
    active_time: f32,
};

pub const UniversalInput = union(enum) {
    button: Button,
    axis: Axis,
    stick: Stick,
};

pub const GLFWKeys = [_]i32{
    glfw.GLFW_KEY_A,
    glfw.GLFW_KEY_B,
    glfw.GLFW_KEY_C,
    glfw.GLFW_KEY_D,
    glfw.GLFW_KEY_E,
    glfw.GLFW_KEY_F,
    glfw.GLFW_KEY_G,
    glfw.GLFW_KEY_H,
    glfw.GLFW_KEY_I,
    glfw.GLFW_KEY_J,
    glfw.GLFW_KEY_K,
    glfw.GLFW_KEY_L,
    glfw.GLFW_KEY_M,
    glfw.GLFW_KEY_N,
    glfw.GLFW_KEY_O,
    glfw.GLFW_KEY_P,
    glfw.GLFW_KEY_Q,
    glfw.GLFW_KEY_R,
    glfw.GLFW_KEY_S,
    glfw.GLFW_KEY_T,
    glfw.GLFW_KEY_U,
    glfw.GLFW_KEY_V,
    glfw.GLFW_KEY_W,
    glfw.GLFW_KEY_X,
    glfw.GLFW_KEY_Y,
    glfw.GLFW_KEY_Z,
    glfw.GLFW_KEY_1,
    glfw.GLFW_KEY_2,
    glfw.GLFW_KEY_3,
    glfw.GLFW_KEY_4,
    glfw.GLFW_KEY_5,
    glfw.GLFW_KEY_6,
    glfw.GLFW_KEY_7,
    glfw.GLFW_KEY_8,
    glfw.GLFW_KEY_9,
    glfw.GLFW_KEY_0,
    glfw.GLFW_KEY_F1,
    glfw.GLFW_KEY_F2,
    glfw.GLFW_KEY_F3,
    glfw.GLFW_KEY_F4,
    glfw.GLFW_KEY_F5,
    glfw.GLFW_KEY_F6,
    glfw.GLFW_KEY_F7,
    glfw.GLFW_KEY_F8,
    glfw.GLFW_KEY_F9,
    glfw.GLFW_KEY_F10,
    glfw.GLFW_KEY_F11,
    glfw.GLFW_KEY_F12,
    glfw.GLFW_KEY_F13,
    glfw.GLFW_KEY_F14,
    glfw.GLFW_KEY_F15,
    glfw.GLFW_KEY_F16,
    glfw.GLFW_KEY_F17,
    glfw.GLFW_KEY_F18,
    glfw.GLFW_KEY_F19,
    glfw.GLFW_KEY_F20,
    glfw.GLFW_KEY_F21,
    glfw.GLFW_KEY_F22,
    glfw.GLFW_KEY_F23,
    glfw.GLFW_KEY_F24,
    glfw.GLFW_KEY_F25,
    glfw.GLFW_KEY_ENTER,
    glfw.GLFW_KEY_SPACE,
    glfw.GLFW_KEY_APOSTROPHE,
    glfw.GLFW_KEY_COMMA,
    glfw.GLFW_KEY_MINUS,
    glfw.GLFW_KEY_PERIOD,
    glfw.GLFW_KEY_SLASH,
    glfw.GLFW_KEY_SEMICOLON,
    glfw.GLFW_KEY_EQUAL,
    glfw.GLFW_KEY_LEFT_BRACKET,
    glfw.GLFW_KEY_BACKSLASH,
    glfw.GLFW_KEY_RIGHT_BRACKET,
    glfw.GLFW_KEY_GRAVE_ACCENT,
    glfw.GLFW_KEY_WORLD_1,
    glfw.GLFW_KEY_WORLD_2,
    glfw.GLFW_KEY_ESCAPE,
    glfw.GLFW_KEY_TAB,
    glfw.GLFW_KEY_BACKSPACE,
    glfw.GLFW_KEY_INSERT,
    glfw.GLFW_KEY_DELETE,
    glfw.GLFW_KEY_RIGHT,
    glfw.GLFW_KEY_LEFT,
    glfw.GLFW_KEY_DOWN,
    glfw.GLFW_KEY_UP,
    glfw.GLFW_KEY_PAGE_UP,
    glfw.GLFW_KEY_PAGE_DOWN,
    glfw.GLFW_KEY_HOME,
    glfw.GLFW_KEY_END,
    glfw.GLFW_KEY_CAPS_LOCK,
    glfw.GLFW_KEY_SCROLL_LOCK,
    glfw.GLFW_KEY_NUM_LOCK,
    glfw.GLFW_KEY_PRINT_SCREEN,
    glfw.GLFW_KEY_PAUSE,
    glfw.GLFW_KEY_KP_0,
    glfw.GLFW_KEY_KP_1,
    glfw.GLFW_KEY_KP_2,
    glfw.GLFW_KEY_KP_3,
    glfw.GLFW_KEY_KP_4,
    glfw.GLFW_KEY_KP_5,
    glfw.GLFW_KEY_KP_6,
    glfw.GLFW_KEY_KP_7,
    glfw.GLFW_KEY_KP_8,
    glfw.GLFW_KEY_KP_9,
    glfw.GLFW_KEY_KP_DECIMAL,
    glfw.GLFW_KEY_KP_DIVIDE,
    glfw.GLFW_KEY_KP_MULTIPLY,
    glfw.GLFW_KEY_KP_SUBTRACT,
    glfw.GLFW_KEY_KP_ADD,
    glfw.GLFW_KEY_KP_ENTER,
    glfw.GLFW_KEY_KP_EQUAL,
    glfw.GLFW_KEY_LEFT_SHIFT,
    glfw.GLFW_KEY_LEFT_CONTROL,
    glfw.GLFW_KEY_LEFT_ALT,
    glfw.GLFW_KEY_LEFT_SUPER,
    glfw.GLFW_KEY_RIGHT_SHIFT,
    glfw.GLFW_KEY_RIGHT_CONTROL,
    glfw.GLFW_KEY_RIGHT_ALT,
    glfw.GLFW_KEY_RIGHT_SUPER,
    glfw.GLFW_KEY_MENU,
};

pub const Button = enum(u8) {
    var blockOnImGuiConsume: bool = true;

    Unknown,
    A,
    B,
    C,
    D,
    E,
    F,
    G,
    H,
    I,
    J,
    K,
    L,
    M,
    N,
    O,
    P,
    Q,
    R,
    S,
    T,
    U,
    V,
    W,
    X,
    Y,
    Z,
    K1,
    K2,
    K3,
    K4,
    K5,
    K6,
    K7,
    K8,
    K9,
    K0,
    F1,
    F2,
    F3,
    F4,
    F5,
    F6,
    F7,
    F8,
    F9,
    F10,
    F11,
    F12,
    F13,
    F14,
    F15,
    F16,
    F17,
    F18,
    F19,
    F20,
    F21,
    F22,
    F23,
    F24,
    F25,
    Enter,
    LControl,
    LShift,
    LAlt,
    RControl,
    RShift,
    RAlt,
    Tab,
    Space,
    Up,
    Down,
    Left,
    Right,
    Grave,
    CapsLock,
    Backspace,
    Escape,
    Insert,
    Home,
    PageUp,
    PageDown,
    Delete,
    End,
    NPDivide,
    NPMultiply,
    NPSubtract,
    NPAdd,
    NPEnter,
    NPDelete,
    NP1,
    NP2,
    NP3,
    NP4,
    NP5,
    NP6,
    NP7,
    NP8,
    NP9,
    NP0,
    PrintScreen,
    Pause,
    BackSlash,
    ForwardSlash,

    // Mouse
    MouseLeftClick,
    MouseRightClick,
    MouseMiddleClick,
    MouseThumbButton1,
    MouseThumbButton2,
    MouseThumbButton3,

    // Gamepad
    GamepadHatUp,
    GamepadHatDown,
    GamepadHatLeft,
    GamepadHatRight,
    GamepadL1,
    GamepadL2,
    GamepadL3,
    GamepadR1,
    GamepadR2,
    GamepadR3,
    GamepadSouthButton,
    GamepadEastButton,
    GamepadNorthButton,
    GamepadWestButton,
    GamepadStart,
    GamepadSelect,
    GamepadHome,

    pub fn pressed(self: Button) bool {
        return value[@intFromEnum(self)].value.active() == true and prev_value[@intFromEnum(self)].value.active() == false;
    }
    /// Returns true once, on the frame the held duration passes the threshold.
    pub fn pressedForDuration(self: Button, duration: f32) bool {
        _ = self;
        _ = duration;
        return false;
    }
    pub fn released(self: Button) bool {
        return value[@intFromEnum(self)].value.active() == false and prev_value[@intFromEnum(self)].value.active() == true;
    }
    pub fn down(self: Button) bool {
        return value[@intFromEnum(self)].value.active() == true;
    }
    /// Returns true every frame when its been held for longer than duration.
    pub fn downForDuration(self: Button, duration: f32) bool {
        if (down(self) and heldDuration(self) > duration) {
            return true;
        }
        return false;
    }
    /// Returns how long the button has been active, returns -1 if it is not held.
    pub fn heldDuration(self: Button) f32 {
        return value[@intFromEnum(self)].active_time;
    }
    /// Returns true if the button is not being held this frame.
    pub fn up(self: Button) bool {
        return value[@intFromEnum(self)].value.active() == false;
    }
    /// Returns true if the button state has changed. Equal to `(btn.pressed() or btn.released())`
    pub fn changed(self: Button) bool {
        return self.pressed() or self.released();
    }
    /// Pretends negative/positive are an axis. When negative is down, return -1.0, when positive is down, return 1.0.
    /// when both or neither are held, return 0.0.
    pub fn asAxis(negative: Button, positive: Button) f32 {
        var axis: f32 = 0.0;
        if (negative.down()) axis -= 1.0;
        if (positive.down()) axis += 1.0;
        return axis;
    }
    /// Pretends negative/positive are an axis. When negative is pressed, return -1.0, when positive is pressed, return 1.0.
    pub fn asAxisStep(negative: Button, positive: Button) f32 {
        var axis: f32 = 0.0;
        if (negative.pressed()) axis -= 1.0;
        if (positive.pressed()) axis += 1.0;
        return axis;
    }
    /// Simulates a WASD style input, same as asAxis but for a stick value.
    pub fn asStick(y_negative: Button, y_positive: Button, x_negative: Button, x_positive: Button) zt.math.Vec2 {
        var val = zt.math.vec2(0.0, 0.0);
        if (x_positive.down()) val.x += 1;
        if (x_negative.down()) val.x -= 1;
        if (y_positive.down()) val.y += 1;
        if (y_negative.down()) val.y -= 1;
        return val;
    }
    /// Pretends negative/positive are an axis, and outputs magnitude on press, and then repeats
    /// that magnitude at a rate decided by interval, after `initial_wait`. For example holding A when given
    /// `(Button.A, Button.D, 0.5, 0.2)` will output -1 on press, then 0 every time its called until it has
    /// been held for longer than 0.5 seconds, then outputs -1 every 0.2 seconds. Timer resets when the axis is 0.
    ///
    /// Intended for menu scrolling with buttons.
    pub fn asAxisSteppedDown(negative: Button, positive: Button, initial_wait: f32, interval: f32) i32 {
        _ = negative;
        _ = positive;
        _ = initial_wait;
        _ = interval;

        return false;
    }

    /// This specifically only translates keyboard keys
    pub fn fromGlfwKeyboardKey(key: c_int) Button {
        switch (key) {
            glfw.GLFW_KEY_A => {
                return .A;
            },
            glfw.GLFW_KEY_B => {
                return .B;
            },
            glfw.GLFW_KEY_C => {
                return .C;
            },
            glfw.GLFW_KEY_D => {
                return .D;
            },
            glfw.GLFW_KEY_E => {
                return .E;
            },
            glfw.GLFW_KEY_F => {
                return .F;
            },
            glfw.GLFW_KEY_G => {
                return .G;
            },
            glfw.GLFW_KEY_H => {
                return .H;
            },
            glfw.GLFW_KEY_I => {
                return .I;
            },
            glfw.GLFW_KEY_J => {
                return .J;
            },
            glfw.GLFW_KEY_K => {
                return .K;
            },
            glfw.GLFW_KEY_L => {
                return .L;
            },
            glfw.GLFW_KEY_M => {
                return .M;
            },
            glfw.GLFW_KEY_N => {
                return .N;
            },
            glfw.GLFW_KEY_O => {
                return .O;
            },
            glfw.GLFW_KEY_P => {
                return .P;
            },
            glfw.GLFW_KEY_Q => {
                return .Q;
            },
            glfw.GLFW_KEY_R => {
                return .R;
            },
            glfw.GLFW_KEY_S => {
                return .S;
            },
            glfw.GLFW_KEY_T => {
                return .T;
            },
            glfw.GLFW_KEY_U => {
                return .U;
            },
            glfw.GLFW_KEY_V => {
                return .V;
            },
            glfw.GLFW_KEY_W => {
                return .W;
            },
            glfw.GLFW_KEY_X => {
                return .X;
            },
            glfw.GLFW_KEY_Y => {
                return .Y;
            },
            glfw.GLFW_KEY_Z => {
                return .Z;
            },
            glfw.GLFW_KEY_1 => {
                return .K1;
            },
            glfw.GLFW_KEY_2 => {
                return .K2;
            },
            glfw.GLFW_KEY_3 => {
                return .K3;
            },
            glfw.GLFW_KEY_4 => {
                return .K4;
            },
            glfw.GLFW_KEY_5 => {
                return .K5;
            },
            glfw.GLFW_KEY_6 => {
                return .K6;
            },
            glfw.GLFW_KEY_7 => {
                return .K7;
            },
            glfw.GLFW_KEY_8 => {
                return .K8;
            },
            glfw.GLFW_KEY_9 => {
                return .K9;
            },
            glfw.GLFW_KEY_0 => {
                return .K0;
            },
            glfw.GLFW_KEY_F1 => {
                return .F1;
            },
            glfw.GLFW_KEY_F2 => {
                return .F2;
            },
            glfw.GLFW_KEY_F3 => {
                return .F3;
            },
            glfw.GLFW_KEY_F4 => {
                return .F4;
            },
            glfw.GLFW_KEY_F5 => {
                return .F5;
            },
            glfw.GLFW_KEY_F6 => {
                return .F6;
            },
            glfw.GLFW_KEY_F7 => {
                return .F7;
            },
            glfw.GLFW_KEY_F8 => {
                return .F8;
            },
            glfw.GLFW_KEY_F9 => {
                return .F9;
            },
            glfw.GLFW_KEY_F10 => {
                return .F10;
            },
            glfw.GLFW_KEY_F11 => {
                return .F11;
            },
            glfw.GLFW_KEY_F12 => {
                return .F12;
            },
            glfw.GLFW_KEY_F13 => {
                return .F13;
            },
            glfw.GLFW_KEY_F14 => {
                return .F14;
            },
            glfw.GLFW_KEY_F15 => {
                return .F15;
            },
            glfw.GLFW_KEY_F16 => {
                return .F16;
            },
            glfw.GLFW_KEY_F17 => {
                return .F17;
            },
            glfw.GLFW_KEY_F18 => {
                return .F18;
            },
            glfw.GLFW_KEY_F19 => {
                return .F19;
            },
            glfw.GLFW_KEY_F20 => {
                return .F20;
            },
            glfw.GLFW_KEY_F21 => {
                return .F21;
            },
            glfw.GLFW_KEY_F22 => {
                return .F22;
            },
            glfw.GLFW_KEY_F23 => {
                return .F23;
            },
            glfw.GLFW_KEY_F24 => {
                return .F24;
            },
            glfw.GLFW_KEY_F25 => {
                return .F25;
            },
            glfw.GLFW_KEY_ENTER => {
                return .Enter;
            },
            glfw.GLFW_KEY_LEFT_CONTROL => {
                return .LControl;
            },
            glfw.GLFW_KEY_LEFT_SHIFT => {
                return .LShift;
            },
            glfw.GLFW_KEY_LEFT_ALT => {
                return .LAlt;
            },
            glfw.GLFW_KEY_RIGHT_CONTROL => {
                return .RControl;
            },
            glfw.GLFW_KEY_RIGHT_SHIFT => {
                return .RShift;
            },
            glfw.GLFW_KEY_RIGHT_ALT => {
                return .RAlt;
            },
            glfw.GLFW_KEY_TAB => {
                return .Tab;
            },
            glfw.GLFW_KEY_SPACE => {
                return .Space;
            },
            glfw.GLFW_KEY_UP => {
                return .Up;
            },
            glfw.GLFW_KEY_DOWN => {
                return .Down;
            },
            glfw.GLFW_KEY_LEFT => {
                return .Left;
            },
            glfw.GLFW_KEY_RIGHT => {
                return .Right;
            },
            glfw.GLFW_KEY_GRAVE_ACCENT => {
                return .Grave;
            },
            glfw.GLFW_KEY_CAPS_LOCK => {
                return .CapsLock;
            },
            glfw.GLFW_KEY_BACKSPACE => {
                return .Backspace;
            },
            glfw.GLFW_KEY_ESCAPE => {
                return .Escape;
            },
            glfw.GLFW_KEY_INSERT => {
                return .Insert;
            },
            glfw.GLFW_KEY_HOME => {
                return .Home;
            },
            glfw.GLFW_KEY_PAGE_UP => {
                return .PageUp;
            },
            glfw.GLFW_KEY_PAGE_DOWN => {
                return .PageDown;
            },
            glfw.GLFW_KEY_DELETE => {
                return .Delete;
            },
            glfw.GLFW_KEY_END => {
                return .End;
            },
            glfw.GLFW_KEY_KP_DIVIDE => {
                return .NPDivide;
            },
            glfw.GLFW_KEY_KP_MULTIPLY => {
                return .NPMultiply;
            },
            glfw.GLFW_KEY_KP_SUBTRACT => {
                return .NPSubtract;
            },
            glfw.GLFW_KEY_KP_ADD => {
                return .NPAdd;
            },
            glfw.GLFW_KEY_KP_ENTER => {
                return .NPEnter;
            },
            glfw.GLFW_KEY_KP_DECIMAL => {
                return .NPDelete;
            },
            glfw.GLFW_KEY_KP_1 => {
                return .NP1;
            },
            glfw.GLFW_KEY_KP_2 => {
                return .NP2;
            },
            glfw.GLFW_KEY_KP_3 => {
                return .NP3;
            },
            glfw.GLFW_KEY_KP_4 => {
                return .NP4;
            },
            glfw.GLFW_KEY_KP_5 => {
                return .NP5;
            },
            glfw.GLFW_KEY_KP_6 => {
                return .NP6;
            },
            glfw.GLFW_KEY_KP_7 => {
                return .NP7;
            },
            glfw.GLFW_KEY_KP_8 => {
                return .NP8;
            },
            glfw.GLFW_KEY_KP_9 => {
                return .NP9;
            },
            glfw.GLFW_KEY_KP_0 => {
                return .NP0;
            },
            glfw.GLFW_KEY_PRINT_SCREEN => {
                return .PrintScreen;
            },
            glfw.GLFW_KEY_PAUSE => {
                return .Pause;
            },
            glfw.GLFW_KEY_BACKSLASH => {
                return .BackSlash;
            },
            glfw.GLFW_KEY_SLASH => {
                return .ForwardSlash;
            },
            else => {
                return .Unknown;
            },
        }
    }
    pub fn fromGlfwMouseButton(glfw_button: c_int) Button {
        switch (glfw_button) {
            glfw.GLFW_MOUSE_BUTTON_LEFT => {
                return .MouseLeftClick;
            },
            glfw.GLFW_MOUSE_BUTTON_RIGHT => {
                return .MouseRightClick;
            },
            glfw.GLFW_MOUSE_BUTTON_MIDDLE => {
                return .MouseMiddleClick;
            },
            glfw.GLFW_MOUSE_BUTTON_4 => {
                return .MouseThumbButton1;
            },
            glfw.GLFW_MOUSE_BUTTON_5 => {
                return .MouseThumbButton2;
            },
            glfw.GLFW_MOUSE_BUTTON_6 => {
                return .MouseThumbButton3;
            },
            else => {
                return .Unknown;
            },
        }
    }
    pub fn fromGlfwGamepadButton(glfw_button: c_int) Button {
        switch (glfw_button) {
            glfw.GLFW_GAMEPAD_BUTTON_DPAD_UP => {
                return .GamepadHatUp;
            },
            glfw.GLFW_GAMEPAD_BUTTON_DPAD_DOWN => {
                return .GamepadHatDown;
            },
            glfw.GLFW_GAMEPAD_BUTTON_DPAD_LEFT => {
                return .GamepadHatLeft;
            },
            glfw.GLFW_GAMEPAD_BUTTON_DPAD_RIGHT => {
                return .GamepadHatRight;
            },
            glfw.GLFW_GAMEPAD_BUTTON_LEFT_BUMPER => {
                return .GamepadL1;
            },
            glfw.GLFW_GAMEPAD_AXIS_LEFT_TRIGGER => {
                return .GamepadL2;
            },
            glfw.GLFW_GAMEPAD_BUTTON_LEFT_THUMB => {
                return .GamepadL3;
            },
            glfw.GLFW_GAMEPAD_BUTTON_RIGHT_BUMPER => {
                return .GamepadR1;
            },
            glfw.GLFW_GAMEPAD_AXIS_RIGHT_TRIGGER => {
                return .GamepadR2;
            },
            glfw.GLFW_GAMEPAD_BUTTON_RIGHT_THUMB => {
                return .GamepadR3;
            },
            glfw.GLFW_GAMEPAD_BUTTON_A => {
                return .GamepadSouthButton;
            },
            glfw.GLFW_GAMEPAD_BUTTON_B => {
                return .GamepadEastButton;
            },
            glfw.GLFW_GAMEPAD_BUTTON_Y => {
                return .GamepadNorthButton;
            },
            glfw.GLFW_GAMEPAD_BUTTON_X => {
                return .GamepadWestButton;
            },
            glfw.GLFW_GAMEPAD_BUTTON_START => {
                return .GamepadStart;
            },
            glfw.GLFW_GAMEPAD_BUTTON_GUIDE => {
                return .GamepadSelect;
            },
            else => {
                return .Unknown;
            },
        }
    }
    pub fn toGlfwKey(self: Button) c_int {
        switch (self) {
            .Unknown => {
                return glfw.GLFW_KEY_UNKNOWN;
            },
            .A => {
                return glfw.GLFW_KEY_A;
            },
            .B => {
                return glfw.GLFW_KEY_B;
            },
            .C => {
                return glfw.GLFW_KEY_C;
            },
            .D => {
                return glfw.GLFW_KEY_D;
            },
            .E => {
                return glfw.GLFW_KEY_E;
            },
            .F => {
                return glfw.GLFW_KEY_F;
            },
            .G => {
                return glfw.GLFW_KEY_G;
            },
            .H => {
                return glfw.GLFW_KEY_H;
            },
            .I => {
                return glfw.GLFW_KEY_I;
            },
            .J => {
                return glfw.GLFW_KEY_J;
            },
            .K => {
                return glfw.GLFW_KEY_K;
            },
            .L => {
                return glfw.GLFW_KEY_L;
            },
            .M => {
                return glfw.GLFW_KEY_M;
            },
            .N => {
                return glfw.GLFW_KEY_N;
            },
            .O => {
                return glfw.GLFW_KEY_O;
            },
            .P => {
                return glfw.GLFW_KEY_P;
            },
            .Q => {
                return glfw.GLFW_KEY_Q;
            },
            .R => {
                return glfw.GLFW_KEY_R;
            },
            .S => {
                return glfw.GLFW_KEY_S;
            },
            .T => {
                return glfw.GLFW_KEY_T;
            },
            .U => {
                return glfw.GLFW_KEY_U;
            },
            .V => {
                return glfw.GLFW_KEY_V;
            },
            .W => {
                return glfw.GLFW_KEY_W;
            },
            .X => {
                return glfw.GLFW_KEY_X;
            },
            .Y => {
                return glfw.GLFW_KEY_Y;
            },
            .Z => {
                return glfw.GLFW_KEY_Z;
            },
            .K1 => {
                return glfw.GLFW_KEY_1;
            },
            .K2 => {
                return glfw.GLFW_KEY_2;
            },
            .K3 => {
                return glfw.GLFW_KEY_3;
            },
            .K4 => {
                return glfw.GLFW_KEY_4;
            },
            .K5 => {
                return glfw.GLFW_KEY_5;
            },
            .K6 => {
                return glfw.GLFW_KEY_6;
            },
            .K7 => {
                return glfw.GLFW_KEY_7;
            },
            .K8 => {
                return glfw.GLFW_KEY_8;
            },
            .K9 => {
                return glfw.GLFW_KEY_9;
            },
            .K0 => {
                return glfw.GLFW_KEY_0;
            },
            .F1 => {
                return glfw.GLFW_KEY_F1;
            },
            .F2 => {
                return glfw.GLFW_KEY_F2;
            },
            .F3 => {
                return glfw.GLFW_KEY_F3;
            },
            .F4 => {
                return glfw.GLFW_KEY_F4;
            },
            .F5 => {
                return glfw.GLFW_KEY_F5;
            },
            .F6 => {
                return glfw.GLFW_KEY_F6;
            },
            .F7 => {
                return glfw.GLFW_KEY_F7;
            },
            .F8 => {
                return glfw.GLFW_KEY_F8;
            },
            .F9 => {
                return glfw.GLFW_KEY_F9;
            },
            .F10 => {
                return glfw.GLFW_KEY_F10;
            },
            .F11 => {
                return glfw.GLFW_KEY_F11;
            },
            .F12 => {
                return glfw.GLFW_KEY_F12;
            },
            .F13 => {
                return glfw.GLFW_KEY_F13;
            },
            .F14 => {
                return glfw.GLFW_KEY_F14;
            },
            .F15 => {
                return glfw.GLFW_KEY_F15;
            },
            .F16 => {
                return glfw.GLFW_KEY_F16;
            },
            .F17 => {
                return glfw.GLFW_KEY_F17;
            },
            .F18 => {
                return glfw.GLFW_KEY_F18;
            },
            .F19 => {
                return glfw.GLFW_KEY_F19;
            },
            .F20 => {
                return glfw.GLFW_KEY_F20;
            },
            .F21 => {
                return glfw.GLFW_KEY_F21;
            },
            .F22 => {
                return glfw.GLFW_KEY_F22;
            },
            .F23 => {
                return glfw.GLFW_KEY_F23;
            },
            .F24 => {
                return glfw.GLFW_KEY_F24;
            },
            .F25 => {
                return glfw.GLFW_KEY_F25;
            },
            .Enter => {
                return glfw.GLFW_KEY_ENTER;
            },
            .LControl => {
                return glfw.GLFW_KEY_LEFT_CONTROL;
            },
            .LShift => {
                return glfw.GLFW_KEY_LEFT_SHIFT;
            },
            .LAlt => {
                return glfw.GLFW_KEY_LEFT_ALT;
            },
            .RControl => {
                return glfw.GLFW_KEY_RIGHT_CONTROL;
            },
            .RShift => {
                return glfw.GLFW_KEY_RIGHT_SHIFT;
            },
            .RAlt => {
                return glfw.GLFW_KEY_RIGHT_ALT;
            },
            .Tab => {
                return glfw.GLFW_KEY_TAB;
            },
            .Space => {
                return glfw.GLFW_KEY_SPACE;
            },
            .Up => {
                return glfw.GLFW_KEY_UP;
            },
            .Down => {
                return glfw.GLFW_KEY_DOWN;
            },
            .Left => {
                return glfw.GLFW_KEY_LEFT;
            },
            .Right => {
                return glfw.GLFW_KEY_RIGHT;
            },
            .Grave => {
                return glfw.GLFW_KEY_GRAVE_ACCENT;
            },
            .CapsLock => {
                return glfw.GLFW_KEY_CAPS_LOCK;
            },
            .Backspace => {
                return glfw.GLFW_KEY_BACKSPACE;
            },
            .Escape => {
                return glfw.GLFW_KEY_ESCAPE;
            },
            .Insert => {
                return glfw.GLFW_KEY_INSERT;
            },
            .Home => {
                return glfw.GLFW_KEY_HOME;
            },
            .PageUp => {
                return glfw.GLFW_KEY_PAGE_UP;
            },
            .PageDown => {
                return glfw.GLFW_KEY_PAGE_DOWN;
            },
            .Delete => {
                return glfw.GLFW_KEY_DELETE;
            },
            .End => {
                return glfw.GLFW_KEY_END;
            },
            .NPDivide => {
                return glfw.GLFW_KEY_KP_DIVIDE;
            },
            .NPMultiply => {
                return glfw.GLFW_KEY_KP_MULTIPLY;
            },
            .NPSubtract => {
                return glfw.GLFW_KEY_KP_SUBTRACT;
            },
            .NPAdd => {
                return glfw.GLFW_KEY_KP_ADD;
            },
            .NPEnter => {
                return glfw.GLFW_KEY_KP_ENTER;
            },
            .NPDelete => {
                return glfw.GLFW_KEY_KP_DECIMAL;
            },
            .NP1 => {
                return glfw.GLFW_KEY_KP_1;
            },
            .NP2 => {
                return glfw.GLFW_KEY_KP_2;
            },
            .NP3 => {
                return glfw.GLFW_KEY_KP_3;
            },
            .NP4 => {
                return glfw.GLFW_KEY_KP_4;
            },
            .NP5 => {
                return glfw.GLFW_KEY_KP_5;
            },
            .NP6 => {
                return glfw.GLFW_KEY_KP_6;
            },
            .NP7 => {
                return glfw.GLFW_KEY_KP_7;
            },
            .NP8 => {
                return glfw.GLFW_KEY_KP_8;
            },
            .NP9 => {
                return glfw.GLFW_KEY_KP_9;
            },
            .NP0 => {
                return glfw.GLFW_KEY_KP_0;
            },
            .PrintScreen => {
                return glfw.GLFW_KEY_PRINT_SCREEN;
            },
            .Pause => {
                return glfw.GLFW_KEY_PAUSE;
            },
            .BackSlash => {
                return glfw.GLFW_KEY_BACKSLASH;
            },
            .ForwardSlash => {
                return glfw.GLFW_KEY_SLASH;
            },
            .MouseLeftClick => {
                return glfw.GLFW_MOUSE_BUTTON_LEFT;
            },
            .MouseRightClick => {
                return glfw.GLFW_MOUSE_BUTTON_RIGHT;
            },
            .MouseMiddleClick => {
                return glfw.GLFW_MOUSE_BUTTON_MIDDLE;
            },
            .MouseThumbButton1 => {
                return glfw.GLFW_MOUSE_BUTTON_4;
            },
            .MouseThumbButton2 => {
                return glfw.GLFW_MOUSE_BUTTON_5;
            },
            .MouseThumbButton3 => {
                return glfw.GLFW_MOUSE_BUTTON_6;
            },
            .GamepadHatUp => {
                return glfw.GLFW_GAMEPAD_BUTTON_DPAD_UP;
            },
            .GamepadHatDown => {
                return glfw.GLFW_GAMEPAD_BUTTON_DPAD_DOWN;
            },
            .GamepadHatLeft => {
                return glfw.GLFW_GAMEPAD_BUTTON_DPAD_LEFT;
            },
            .GamepadHatRight => {
                return glfw.GLFW_GAMEPAD_BUTTON_DPAD_RIGHT;
            },
            .GamepadL1 => {
                return glfw.GLFW_GAMEPAD_BUTTON_LEFT_BUMPER;
            },
            .GamepadL2 => {
                return glfw.GLFW_GAMEPAD_AXIS_LEFT_TRIGGER;
            },
            .GamepadL3 => {
                return glfw.GLFW_GAMEPAD_BUTTON_LEFT_THUMB;
            },
            .GamepadR1 => {
                return glfw.GLFW_GAMEPAD_BUTTON_RIGHT_BUMPER;
            },
            .GamepadR2 => {
                return glfw.GLFW_GAMEPAD_AXIS_RIGHT_TRIGGER;
            },
            .GamepadR3 => {
                return glfw.GLFW_GAMEPAD_BUTTON_RIGHT_THUMB;
            },
            .GamepadSouthButton => {
                return glfw.GLFW_GAMEPAD_BUTTON_A;
            },
            .GamepadEastButton => {
                return glfw.GLFW_GAMEPAD_BUTTON_B;
            },
            .GamepadNorthButton => {
                return glfw.GLFW_GAMEPAD_BUTTON_Y;
            },
            .GamepadWestButton => {
                return glfw.GLFW_GAMEPAD_BUTTON_X;
            },
            .GamepadStart => {
                return glfw.GLFW_GAMEPAD_BUTTON_START;
            },
            .GamepadSelect => {
                return glfw.GLFW_GAMEPAD_BUTTON_BACK;
            },
            .GamepadHome => {
                return glfw.GLFW_GAMEPAD_BUTTON_GUIDE;
            },
        }
    }
};

pub const Axis = enum(u8) {
    var blockOnImGuiConsume: bool = true;
    /// A deadzone for active/inactive/value.
    pub var epsilon: f32 = 0.05;

    MouseX = @intFromEnum(Button.GamepadSelect) + 1,
    MouseY,
    MouseDeltaX,
    MouseDeltaY,
    MouseWheel,
    GamepadLeftStickX,
    GamepadLeftStickY,
    GamepadRightStickX,
    GamepadRightStickY,
    GamepadL2,
    GamepadR2,

    pub fn read(self: Axis) f32 {
        switch (self) {
            else => {
                return value[@intFromEnum(self)].value.axis;
            },
        }
        return 0.0;
    }
    /// returns true if the axis is positive.
    pub fn positive(self: Axis) bool {
        _ = self;
        return false;
    }
    /// returns true if the axis is negative.
    pub fn negative(self: Axis) bool {
        _ = self;
        return false;
    }
    /// returns true if not 0.0
    pub fn active(self: Axis) bool {
        _ = self;
        return false;
    }
    /// Returns true if close enough to 0.0
    pub fn inactive(self: Axis) bool {
        _ = self;
        return false;
    }
    /// Returns true if the axis was changed between now and the previous frame
    pub fn changed(self: Axis) bool {
        _ = self;
        return false;
    }
    /// Is true on initial press, then repeats true while held every `interval`, after the `initial_wait`
    /// period.
    pub fn steppedHold(self: Axis, initial_wait: f32, interval: f32) bool {
        _ = self;
        _ = initial_wait;
        _ = interval;
        return false;
    }
};

pub const Stick = enum(u8) {
    var blockOnImGuiConsume: bool = true;
    /// A deadzone for active/inactive/value
    pub var epsilon: f32 = 0.05;

    MouseDelta = @intFromEnum(Axis.GamepadR2) + 1,
    MousePosition,
    GamepadLeftStick,
    GamepadRightStick,

    pub fn active(self: Stick) bool {
        _ = self;
        return false;
    }

    pub fn read(self: Stick) zt.math.Vec2 {
        switch (self) {
            .MouseDelta => {
                return current_mouse.sub(previous_mouse);
            },
            .MousePosition => {
                return current_mouse;
            },
            else => {
                return value[@intFromEnum(self)].value.stick;
            },
        }
        return zt.math.Vec2.zero;
    }
    pub fn readDeadzone(self: Stick, deadzone: f32) zt.math.Vec2 {
        switch (self) {
            .MouseDelta => {
                return current_mouse.sub(previous_mouse);
            },
            .MousePosition => {
                return current_mouse;
            },
            else => {
                const val = value[@intFromEnum(self)].value.stick;
                if (val.length() < deadzone) {
                    return zt.math.Vec2.zero;
                }
                return val;
            },
        }
        return zt.math.Vec2.zero;
    }
};

// State.
var stop_mouse: bool = false;
var stop_kb: bool = false;

var prev_value: []InputData = undefined;
var value: []InputData = undefined;

var previous_mouse: zt.math.Vec2 = zt.math.Vec2.zero;
var current_mouse: zt.math.Vec2 = zt.math.Vec2.zero;

// To be bullet proof to future index changes, we create the associative maps
// dynamically, in an array to be accessed with key values as the index.
// This is a little bit memory inefficient, but nice and fast so I'll take it.
pub fn init_input() void {
    prev_value = std.heap.c_allocator.alloc(InputData, @intFromEnum(Stick.GamepadRightStick) + 1) catch unreachable;
    value = std.heap.c_allocator.alloc(InputData, @intFromEnum(Stick.GamepadRightStick) + 1) catch unreachable;
    for (0..@intFromEnum(Button.GamepadHome) + 1) |i| {
        const button: Button = @enumFromInt(i);
        std.log.info("Putting together info for button #{any} named {s}", .{ i, @tagName(button) });
        value[i] = InputData{
            .value = InputDataType{ .button = false },
            .active_time = -1.0,
        };
    }

    for (@intFromEnum(Axis.MouseX)..@intFromEnum(Axis.GamepadR2) + 1) |i| {
        const axis: Axis = @enumFromInt(i);
        std.log.info("Putting together info for axis #{any} named {s}", .{ i, @tagName(axis) });
        value[i] = InputData{
            .value = InputDataType{ .axis = 0.0 },
            .active_time = -1.0,
        };
    }

    for (@intFromEnum(Stick.MouseDelta)..@intFromEnum(Stick.GamepadRightStick) + 1) |i| {
        const stick: Stick = @enumFromInt(i);
        std.log.info("Putting together info for stick #{any} named {s}", .{ i, @tagName(stick) });
        value[i] = InputData{
            .value = InputDataType{ .stick = zt.math.vec2(0.0, 0.0) },
            .active_time = -1.0,
        };
    }
}
pub fn process_update(app: *zt.App.Context) void {
    std.mem.copyForwards(InputData, prev_value, value);
    previous_mouse = current_mouse;

    // Manually reset mouse wheel per frame.
    value[@intFromEnum(Axis.MouseWheel)].value = InputDataType{ .axis = 0.0 };

    manualGamepad();

    for (app.input.items) |item| {
        switch (item) {
            .keyboard => |kb| {
                if (kb.action == glfw.GLFW_PRESS or kb.action == glfw.GLFW_RELEASE) {
                    const btn = Button.fromGlfwKeyboardKey(kb.key);
                    if (btn != Button.Unknown) {
                        const pressed = kb.action == glfw.GLFW_PRESS;
                        value[@intFromEnum(btn)].value = InputDataType{ .button = pressed };
                    }
                }
            },
            .mouseButton => |mb| {
                if (mb.action == glfw.GLFW_PRESS or mb.action == glfw.GLFW_RELEASE) {
                    const btn = Button.fromGlfwMouseButton(mb.key);
                    if (btn != Button.Unknown) {
                        const pressed = mb.action == glfw.GLFW_PRESS;
                        value[@intFromEnum(btn)].value = InputDataType{ .button = pressed };
                    }
                }
            },
            .mousePosition => |mp| {
                current_mouse = zt.math.vec2(@floatCast(mp.x), @floatCast(mp.y));
            },
            .mouseWheel => |whl| {
                value[@intFromEnum(Axis.MouseWheel)].value = InputDataType{ .axis = @floatCast(whl.y) };
            },
            else => {},
        }
    }
}

// GLFW doesnt have a callback like keyboard event for gamepad, so filling it in
// will be our job.
fn manualGamepad() void {
    var state: glfw.GLFWgamepadstate = undefined;
    const success = glfw.glfwGetGamepadState(glfw.GLFW_JOYSTICK_1, &state);
    if (success == glfw.GLFW_FALSE) {
        return;
    }
    value[@intFromEnum(Button.GamepadHatUp)].value = InputDataType{ .button = state.buttons[glfw.GLFW_GAMEPAD_BUTTON_DPAD_UP] == glfw.GLFW_PRESS };
    value[@intFromEnum(Button.GamepadHatDown)].value = InputDataType{ .button = state.buttons[glfw.GLFW_GAMEPAD_BUTTON_DPAD_DOWN] == glfw.GLFW_PRESS };
    value[@intFromEnum(Button.GamepadHatLeft)].value = InputDataType{ .button = state.buttons[glfw.GLFW_GAMEPAD_BUTTON_DPAD_LEFT] == glfw.GLFW_PRESS };
    value[@intFromEnum(Button.GamepadHatRight)].value = InputDataType{ .button = state.buttons[glfw.GLFW_GAMEPAD_BUTTON_DPAD_RIGHT] == glfw.GLFW_PRESS };

    value[@intFromEnum(Button.GamepadNorthButton)].value = InputDataType{ .button = state.buttons[glfw.GLFW_GAMEPAD_BUTTON_TRIANGLE] == glfw.GLFW_PRESS };
    value[@intFromEnum(Button.GamepadEastButton)].value = InputDataType{ .button = state.buttons[glfw.GLFW_GAMEPAD_BUTTON_CIRCLE] == glfw.GLFW_PRESS };
    value[@intFromEnum(Button.GamepadSouthButton)].value = InputDataType{ .button = state.buttons[glfw.GLFW_GAMEPAD_BUTTON_CROSS] == glfw.GLFW_PRESS };
    value[@intFromEnum(Button.GamepadWestButton)].value = InputDataType{ .button = state.buttons[glfw.GLFW_GAMEPAD_BUTTON_SQUARE] == glfw.GLFW_PRESS };

    value[@intFromEnum(Button.GamepadL1)].value = InputDataType{ .button = state.buttons[glfw.GLFW_GAMEPAD_BUTTON_LEFT_BUMPER] == glfw.GLFW_PRESS };
    value[@intFromEnum(Button.GamepadL3)].value = InputDataType{ .button = state.buttons[glfw.GLFW_GAMEPAD_BUTTON_LEFT_THUMB] == glfw.GLFW_PRESS };
    value[@intFromEnum(Button.GamepadR1)].value = InputDataType{ .button = state.buttons[glfw.GLFW_GAMEPAD_BUTTON_RIGHT_BUMPER] == glfw.GLFW_PRESS };
    value[@intFromEnum(Button.GamepadR3)].value = InputDataType{ .button = state.buttons[glfw.GLFW_GAMEPAD_BUTTON_RIGHT_THUMB] == glfw.GLFW_PRESS };

    value[@intFromEnum(Button.GamepadStart)].value = InputDataType{ .button = state.buttons[glfw.GLFW_GAMEPAD_BUTTON_START] == glfw.GLFW_PRESS };
    value[@intFromEnum(Button.GamepadSelect)].value = InputDataType{ .button = state.buttons[glfw.GLFW_GAMEPAD_BUTTON_BACK] == glfw.GLFW_PRESS };
    value[@intFromEnum(Button.GamepadHome)].value = InputDataType{ .button = state.buttons[glfw.GLFW_GAMEPAD_BUTTON_GUIDE] == glfw.GLFW_PRESS };

    value[@intFromEnum(Axis.GamepadL2)].value = InputDataType{ .axis = state.axes[glfw.GLFW_GAMEPAD_AXIS_LEFT_TRIGGER] };
    value[@intFromEnum(Axis.GamepadR2)].value = InputDataType{ .axis = state.axes[glfw.GLFW_GAMEPAD_AXIS_RIGHT_TRIGGER] };

    value[@intFromEnum(Axis.GamepadLeftStickX)].value = InputDataType{ .axis = state.axes[glfw.GLFW_GAMEPAD_AXIS_LEFT_X] };
    value[@intFromEnum(Axis.GamepadLeftStickY)].value = InputDataType{ .axis = state.axes[glfw.GLFW_GAMEPAD_AXIS_LEFT_Y] };
    value[@intFromEnum(Axis.GamepadRightStickX)].value = InputDataType{ .axis = state.axes[glfw.GLFW_GAMEPAD_AXIS_RIGHT_X] };
    value[@intFromEnum(Axis.GamepadRightStickY)].value = InputDataType{ .axis = state.axes[glfw.GLFW_GAMEPAD_AXIS_RIGHT_Y] };

    const ls = zt.math.vec2(
        value[@intFromEnum(Axis.GamepadLeftStickX)].value.axis,
        value[@intFromEnum(Axis.GamepadLeftStickY)].value.axis,
    );
    const rs = zt.math.vec2(
        value[@intFromEnum(Axis.GamepadRightStickX)].value.axis,
        value[@intFromEnum(Axis.GamepadRightStickY)].value.axis,
    );

    value[@intFromEnum(Stick.GamepadLeftStick)].value = InputDataType{ .stick = ls };
    value[@intFromEnum(Stick.GamepadRightStick)].value = InputDataType{ .stick = rs };
}
