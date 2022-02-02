<p align="center">
  <img width="200" height="100" src="/example/assets/texture/logo.png">
</p>

A Litened version of ZT, strips away imgui and optimizes namespaces and convention
to be more efficient for lite projects that need an immediate lib for OpenGL+GLFW
graphics, now with a lean 700kb binary.

# Lite

To work with ZT Lite You will need:

- Zig 0.10.* Main branch build
- Ubuntu: `sudo apt install build-essential xorg-dev`

### Why

This Lite branch is intended for use with lean projects that need only the basics when it comes
to bare metal opengl.

# Getting Started

First you'll want to clone this into your zig project's folder, and `const ztBuild = @import("path/to/ZT/build.zig")` 
in your own `build.zig` to import this framework's build.zig, and that will expose some important functions
to link ZT into your project.

- `ztBuild.link(exe)` will add ZT's packages to your exe and link the source files for GLFW/GL
- (optional) `ztBuild.addBinaryContent("path/to/binContent")` adds binary content to your zig-out folder output, basically the folder structure
ends up being as if `path/to/binContent` was the root folder containing your executable. This is smart and will skip older assets.

So with `ztBuild` imported you just `ztBuild.link(exe)` and you can start importing and using
ZT, or if you so choose, completely ignore ZT and use raw opengl/glfw.

Then getting started is as easy as this:

```Zig
const std = @import("std");
const zt = @import("zt");

/// SampleData will be available through the context anywhere.
const SampleData = struct {
    yourData: i32 = 0,
};

const SampleApplication = zt.App(SampleData);

fn main() !void {
    var context = SampleApplication.begin(std.heap.c_allocator);
    // Config here,
    while(context.open) {
        context.beginFrame();
        // Application code here!
        context.data.yourData += 1;
        context.endFrame();
    }
    // Unload here
    context.deinit();
}
```

## Gotcha:

- ZT.App.begin sets its own GLFW user pointer! Its important too, so use something else for your storage, or if you really want the functionality,
let me know and I'll see how I can enable your usecase within ZT.
- By linking ZT the following packages are available to your app on both windows and ubuntu: `zt`, `gl`, `glfw`, `stb_image`
- Need input? Your context will house an array of inputs that have been pumped since the last event pop.