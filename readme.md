<p align="center">
  <img width="200" height="100" src="/logo.png">
</p>

ZT is a zig-contained library that automatically compiles+links ImGui, OpenGL, and GLFW into typed packages.

By zig contained I mean that ZT is intended to eventually be entirely contained and built by Zig and its built in
LibC and clang compiler without any external building or dependencies. Just git submodule, link, and build for windows
and Linux.

The entirety of ZT's dependencies are inlined into the repo, and as such updates to zig will not disrupt this library by
hardlocking ZT until other packages get updated, or if any dependency later decides to support stable rather than nightly,
etc.

As a result this library will always(when I notice a breakage, I will fix it! I might be late to recognize breaking changes in zig) be
working on its intended platforms with the latest development branch of zig.

## Help!

If you're in need of help with ZT feel free to ping `PySnow#8836` on the [zig discord](https://discord.gg/WQ2HWkuxVJ), or leave an issue here and I will
get back to you as soon as I can.

## Requirements

Zig 0.9.* Main branch build (See [zig-0.8.0 branch](https://github.com/JonSnowbd/ZT/tree/zig-0.8.0) for the last 0.8 compatible build.)

Ubuntu: `sudo apt install build-essential xorg-dev`

## Current Status

Theres not much to be buggy in the general application of this as it just links GLFW+GL+ImGui to your artifact, and as such
using it for this purpose is very stable.

On the `zt.App` side, it is very close to its finalized api, and is being used to develop a non-trivial project to expose
any issues with the project and api. I recommend using it anywhere but productions that require high stability.

Development for ZT is focused on the following items in order of importance:
- Providing an easy to use (and optional) audio api.
- Smoothing out Generic Buffer performance and api
- Utility items such as spatial hashing. (Game oriented, but due to zig's lazy build nature, wont inflate non-gaming oriented binaries.)

See [the example](/example/src/main.zig) that displays a few features of `zt.App`

## Where

Right now working on both windows and ubuntu(and anything thats compatible with x11)

## Why

ZT is intended for an extremely broad group of developers in zig realtime graphics and applications, as it does not railroad you into
using its app+windowing interface to function, and is better viewed as the following goals being accomplished without
any resistance:

- Linear Algebra and Math types
- Cross platform windowing (GLFW) within Zig
- OpenGL binding within Zig
- Completely up to date (c)ImGui Docking branch bindings within Zig
- STB_Image bindings within Zig
- (Optional) barebones wrappers around basic opengl constructs like shaders/textures/buffers

and additionally a ready to go combination of all 3 that lets you just immediately use close to the metal
OpenGL constructs to just work on your application with convenience for use as desktop application code such as
Energy Saving mode.

## Getting started

First you'll want to clone this into your zig project's folder, and `const ztBuild = @import("path/to/ZT/build.zig")` 
in your own `build.zig` to import this framework's build.zig, and that will expose some important functions
to link ZT into your project.

- `ztBuild.link("path/to/ZT/", b, exe, target)` will add ZT's packages to your exe and link the source files for GLFW/GL/ImGui
- (optional) `ztBuild.addBinaryContent("path/to/binContent")` adds binary content to your zig-out folder output, basically the folder structure
ends up being as if `path/to/binContent` was the root folder containing your executable. This is smart and will skip older assets.

So with `ztBuild` imported you just `ztBuild.link("path/to/ZT/", b, exe, target)` and you can start importing and using
ZT, or if you so choose, completely ignore ZT and use raw opengl/glfw/imgui.

Then getting started is as easy as this:

```Zig
const std = @import("std");
const zt = @import("zt");
usingnamespace @import("imgui");
usingnamespace zt.custom_components; // ZT has special components! Check them out, they are prefixed with zt.

var config: zt.App.Config = .{
    .init = init,
    .update = update,
    .deinit = deinit,
};

fn init(context: *zt.App) void {
    // Do your loading here
}
fn deinit(context: *zt.App) void {
    // Unload here
}
fn update(context: *zt.App) void {
    if(igBegin("Hello World", null, ImGuiWindowFlags_None)) {
        ztTextDisabled("{s} This text is disabled!", .{"Hello!"});
        ztTextColor("And text can be colored", .{.x=1.0,.w=1.0}, .{});
        ztText("{s}", .{"You can use zig's built in formatting!"});
    }
    igEnd();
}

pub fn main() void {
    zt.App.start(config);
}
```

Where `zt.App.start` starts a simple statemachine that controls timing and runs the given functions for you, letting
you just get on with the application.

For a more indepth example [see the example file that shows opengl rendering mixed with imgui and more](example/src/main.zig)

Note that anything related to zt.App directly is self contained, and if you so wish you can use all the abstractions without
using the state machine loop for window management, if you just want the packages.

## Gotcha:

- ZT.App sets its own GLFW user pointer! Its important too, so use something else for your storage, or if you really want the functionality,
let me know and I'll see how I can enable your usecase within ZT.
- By linking ZT the following packages are available to your app on both windows and ubuntu: `zt`, `gl`, `glfw`, `imgui`, `stb_image`
- ImVec2 and ImVec4 are both substituted with zlm's Vec2 and Vec4 structs respectively, you can use both interchangeably.
- `zt.App.Config` is initial state, it is not recommended to try and change its variables after starting it(more specifically
after the init function.) expecting the changes to work. For changing icon and window title after init, see glfw and its documentation.
- Disabling power saving mode will let GLFW handle buffer flip timing, so likely will be at vsync fps rather than on every
event.
- Need direct access to the input queue? `ZT.App` contains an ArrayList of a tagged unions that summarizes every input event.
Try to use this instead of overriding GLFW event callbacks.
- In update you are free to do anything you want that you'd do in any opengl/glfw loop, the only things done in the event
loop are as follows:
    - `glClear` to clear current buffer
    - `igNewFrame` to set up imgui frame logic
    - **Your applications update function**
    - if `context.imguiVisible` imgui is rendered, otherwise draw data is discarded and the imgui frame is ended.
    - ZT.App.inputQueue is cleared
    - glfw buffers are swapped and events are polled.
    - Timing management sets the delta time, and if `context.energySaving`, an event is awaited before continuing the loop,
    otherwise it lets glfw handle vsync timing.
- Don't forget when building your application for distribution, if you want it to be lean you can build with `-Drelease-small` and package
it with UPX after building! Small binaries are cool.
- Windows release builds currently do not use LTO as it is currently dropping `_tls_index` for ZT.

## How Do I...

- Show smooth animation in powersaving mode? 

`context.queueAnimationFrames(seconds:f32)` will set a certain amount of seconds for powersaving to be temporarily
disabled. Use this if you have smooth transitions that need to be displayed

- Update the powersaving frame from an external source e.g threads?

`context.forceUpdate()` will force the application to update and redraw by inputting an empty event into glfw.

- Use an opengl texture in imgui?

If youre using the `zt.Texture` abstraction, its as simple as passing in `texture.imguiId()` as the id, otherwise
you can pass in the opengl [texture id converted to a pointer, as done in texture.zig](src/zt/texture.zig)

- Read inputs in zt.app?

Inputs are forwarded into your `zt.App` context fields as `.inputQueue` which is an array list of inputs represented as
a tagged union of all possible input types.

## Where is...

### ImGui
- [ZT Custom ImGui Components](src/zt/customComponents.zig)
- [ImGui Bindings](src/imgui.zig)
- [Demo](https://github.com/ocornut/imgui/blob/master/imgui_demo.cpp)

### ZT
- [Math Source](src/zt/zlm/zlm-generic.zig) `zt.math`
- [RenderTarget Abstraction](src/zt/renderTarget.zig)
- [Shader Abstraction](src/zt/shader.zig) (Takes 2 strings to generate a shader program, easy to use with @embedFile)
- [Texture Abstraction](src/zt/texture.zig) (This lets you load textures from file system and bind into opengl)
- [Buffer Abstraction](src/zt/generateBuffer.zig) (This lets you generate a buffer pair for any given vertex struct that uses only float/vec2/vec3/vec4)
- [Simple Spritebuffer](src/zt/spriteBuffer.zig)

## Credits

- Example Font - https://github.com/uswds/public-sans
- Inspiration and Code Snippets - https://github.com/digitalcreature/ube (Thanks sammy for all the help!)