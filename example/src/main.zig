const std = @import("std");
const zt = @import("zt");
usingnamespace @import("imgui");
// ZT includes several custom components to draw/use native types such as
// zig fmt in text and math types.
usingnamespace zt.custom_components;
usingnamespace @import("gl");

var config: zt.App.Config = .{
    .init = init,
    .update = update,
    .deinit = deinit,
};

var spriteBuffer: zt.SpriteBuffer = undefined;
var offScreen: zt.RenderTarget = undefined;
var testSprite: zt.Texture = undefined;
var logoSprite: zt.Texture = undefined;
var customFont: *ImFont = undefined;
var customFontThick: *ImFont = undefined;

fn init(context: *zt.App) void {
    // Doing this means the application will update at any given oppurtunity within reason (listening to vsync, etc)
    // You want to leave this on true if your application doesnt make use of many animations.
    context.energySaving = false;
    // Get the sprite's location from the basepath, and load a Texture with it, as well as setting the window icon.
    var fontLocation = zt.App.path("PublicSans-Regular.ttf");

    var spriteLocation = zt.App.path("test.png");
    testSprite = zt.Texture.init(spriteLocation) catch unreachable;
    testSprite.setNearestFilter();

    var logoLocation = zt.App.path("logo.png");
    logoSprite = zt.Texture.init(logoLocation) catch unreachable;

    // Init is your last chance to change config.icon.
    config.icon = spriteLocation;

    // ZT offers a simple sprite buffer to draw batched sprites efficiently and easily.
    spriteBuffer = zt.SpriteBuffer.init(std.heap.page_allocator);
    // Creating an fbo is interesting, you simply create a specifically sized render target, bind it,
    // and any glClear/glDrawElements/glDrawTriangles will automatically output to the buffer rather than the screen.
    offScreen = zt.RenderTarget.init(300, 200);

    // Enable docking.
    var io = igGetIO();
    io.*.ConfigFlags |= ImGuiConfigFlags_DockingEnable;

    customFont = context.addImguiFont(fontLocation, 17, null);
    io.*.FontDefault = customFont;

    // Lets get crazy with a view transformation
    spriteBuffer.updateRenderSize(zt.math.Vec2.new(context.width, context.height));

    // The ztViewPort covers the screen with a window, this makes the background of it completely transparent
    // to see the opengl rendering underneath.
    var style = igGetStyle();
    style.*.Colors[ImGuiCol_DockingEmptyBg] = .{ .x = 0.0, .y = 0.0, .z = 0.0, .w = 0.0 };
}
fn update(context: *zt.App) void {
    // This creates a background for docking everything onto, perfect for applications.
    ztViewPort(0, 0, 0, 0);

    offScreen.bind(); // Binding a rendertarget makes any subsequent flushes empty into it rather than the screen.
    glClear(GL_COLOR_BUFFER_BIT);
    spriteBuffer.updateRenderSize(zt.math.Vec2.new(offScreen.target.width, offScreen.target.height));
    spriteBuffer.updateCamera(.{}, 1.0, 0.0);
    spriteBuffer.sprite(testSprite, -100, -50, 0.5, 100, 100, zt.math.Vec4.white);
    spriteBuffer.sprite(testSprite, 0, -50, 0.5, 100, 100, zt.math.Vec4.white);
    spriteBuffer.flush(); // If there is no sprites to flush, nothing bad happens, so always do it at the end of every render run!
    offScreen.unbind();

    // You can use updateCamera to have full control over the underlying view matrix (or you can set it yourself!)
    spriteBuffer.updateRenderSize(zt.math.Vec2.new(context.width, context.height));
    spriteBuffer.updateCamera(.{}, 1.0, @sin(context.timer.lifetime) * 0.5);
    spriteBuffer.sprite(logoSprite, -200, -50, 0.5, 200, 100, zt.math.Vec4.white);
    spriteBuffer.sprite(testSprite, 0, -100, 0.5, 200, 200, zt.math.Vec4.white);
    spriteBuffer.sprite(testSprite, 200, -100, 0.5, 200, 200, zt.math.Vec4.white);
    spriteBuffer.flush();

    // These will be too quick to read, but provide a good idea of how the inputs are used/examined.
    if(igBegin("Input Window", null, ImGuiWindowFlags_None)) {
        for(context.inputQueue.items) |item| {
            switch(item) {
                .keyboard => |data| {
                    ztText("Event KB: {any}", .{data.key});
                },
                .mouseWheel => |data| {
                    ztText("Event MW: {d:.1}", .{data.y});
                },
                .mouseButton => |data| {
                    ztText("MouseButton: {any}", .{data.key});
                },
                .mousePosition => |data| {
                    ztText("Moved Mouse to: {d:.1}x{d:.1}", .{data.x,data.y});
                },
                .character => |data| {
                    var byte = @intCast(u8, data.value);
                    ztText("Pressed '{c}'", .{byte});
                }
            }
        } 
    }
    igEnd();
    
    // You can just use imgui functions wherever you want in update and it'll just work.
    if (igBegin("Testing Window", null, ImGuiWindowFlags_None)) {
        ztText("{s}", .{"You can use zig's built in formatting"});
        ztTextDisabled("{s} This text is disabled!", .{"Hello!"});
        ztTextColor("And it can be colored", .{ .x = 1.0, .w = 1.0 }, .{});
        ztText("Sprite Buffer has made {any} draw calls.", .{spriteBuffer.drawCalls});
        spriteBuffer.drawCalls = 0; // Since there is no defined universal way of detecting frame end in every usecase, its required to just 0 this out yourself.

        igSeparator();
        igText("Below is the OpenGL rendertarget shown in an igImage!");
        // Its a bit awkward, but render targets are upside down thanks to opengl. It's a simple matter of flipping
        // the y source vectors.
        igImage(offScreen.target.imguiId(), .{ .x = offScreen.target.width, .y = offScreen.target.height }, .{ .x = 0, .y = 1 }, .{ .x = 1, .y = 0 }, ImVec4.white, ImVec4.white);
    }
    igEnd();

    // Add imgui to the hot code path to expose any imgui bugs.
    igShowDemoWindow(null);
}
fn deinit(context: *zt.App) void {
    _ = context;
    testSprite.deinit();
    logoSprite.deinit();
    spriteBuffer.deinit();
    offScreen.deinit();
}

pub fn main() void {
    zt.App.start(config);
}
