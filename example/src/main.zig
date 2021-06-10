const std = @import("std");
const zt = @import("zt");
usingnamespace @import("imgui");
// ZT includes several custom components to draw/use native types such as
// zig fmt in text and math types.
usingnamespace zt.imguiComponents;

var config: zt.app.ZTAppConfig = .{
    .init = init,
    .update = update,
    .deinit = deinit,
};

var spriteBuffer: zt.SpriteBuffer = undefined;
var offScreen: zt.RenderTarget = undefined;
var testSprite: zt.Texture = undefined;
var basePath: []const u8 = "";
var customFont: *ImFont = undefined;
var customFontThick: *ImFont = undefined;

fn init() void {
    // Get the sprite's location from the basepath, and load a Texture with it, as well as setting the window icon.
    var spriteLocation = zt.app.relativePathOf(std.heap.page_allocator, "test.png");
    var fontLocation = zt.app.relativePathOf(std.heap.page_allocator, "PublicSans-Regular.ttf");
    testSprite = zt.Texture.init(spriteLocation) catch unreachable;
    testSprite.setNearestFilter();
    config.icon = spriteLocation;

    // ZT offers a simple sprite buffer to draw batched sprites efficiently.
    spriteBuffer = zt.SpriteBuffer.init(std.heap.page_allocator);
    // We don't specify a texture because you decide that on flush by passing a texture into the flush.
    spriteBuffer.sprite(10, 10, 0.5, 100, 100, zt.math.Vec4.one);
    spriteBuffer.sprite(120, 10, 0.5, 100, 100, zt.math.Vec4.one);

    // Creating a sprite buffer is interesting, you simply create a specifically sized render target, bind it,
    // and any glClear/glDrawElements/glDrawTriangles will automatically output to the buffer rather than the screen.
    offScreen = zt.RenderTarget.init(300, 200);

    // Just flush once, it never changes so we dont need to keep updating the target in the update loop.
    offScreen.bind(); // Binding a rendertarget makes any subsequent flushes empty into it rather than the screen.
    spriteBuffer.flushStatic(&testSprite);
    offScreen.unbind();

    // Enable docking.
    var io = igGetIO();
    io.*.ConfigFlags |= ImGuiConfigFlags_DockingEnable;

    customFont = zt.app.addImguiFont(fontLocation, 17, null);
    io.*.FontDefault = customFont;
}
fn update() void {
    // This creates a background for docking everything onto, perfect for applications.
    ztViewPort(0, 0, 0, 0);

    if (igBegin("Testing Window", null, ImGuiWindowFlags_None)) {
        ztText("{s}", .{"You can use zig's built in formatting"});
        ztTextDisabled("{s} This text is disabled!", .{"Hello!"});
        // For now this seems to error out linux, finding out why soon, leaving it uncommented for git issue,
        // commenting this on your build(on linux) will fix it as long as you avoid functions with signature (4*4 byte struct, [*c]u8).
        ztTextColor("And it can be colored", .{ .x = 1.0, .w = 1.0 }, .{});

        igSeparator();
        // Its a bit awkward, but render targets are upside down thanks to opengl. It's a simple matter of flipping
        // the y source vectors.
        igText("Below is the OpenGL rendertarget shown in an igImage!");
        igImage(offScreen.target.imguiId(), .{ .x = 300, .y = 200 }, .{ .x = 0, .y = 1 }, .{ .x = 1, .y = 0 }, ImVec4.white, ImVec4.white);
    }
    igEnd();
    if (igBegin("Dock Window", null, ImGuiWindowFlags_None)) {
        customDrawing();
        // ztTextColor("You can even do custom drawing easily.", .{ .x = 1.0, .w = 1.0 }, .{});
    }
    igEnd();
}
fn deinit() void {
    testSprite.deinit();
    spriteBuffer.deinit();
}

pub fn main() void {
    zt.app.start(config);
}

pub fn customDrawing() void {
    var draw = igGetWindowDrawList();
    var position: ImVec2 = undefined;
    igGetWindowPos(&position);
    igRenderFrame(position.add(ImVec2.new(20, 70)), position.add(ImVec2.new(100, 100)), 0xffffffff, true, 3.0);
    // igRenderArrow(draw, position, 0xffffffff, ImGuiDir_Right, 3.0);
}
