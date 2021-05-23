# ZT

ZT is a zig-contained library that automatically compiles+links ImGui, OpenGL, and GLFW into typed packages.

By zig contained I mean that ZT is intended to eventually be entirely contained and built by Zig and its built in
LibC and clang compiler without any external building or dependencies. Just git submodule, link, and build for windows
and linux.

## Requirements

Ubuntu: `sudo apt install build-essential xorg-dev`

## Where

Right now working on both windows and ubuntu(and anything that compatible with x11)

## How

See [the example](/example/src/main.zig) that displays a few features of ZT.

## Why

ZT is intended for an extremely broad group of developers in realtime graphics, as it does not railroad you into
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