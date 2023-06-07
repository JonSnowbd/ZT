LEVEL := Debug
TARGET := aarch64-macos-none

ZIG := /usr/local/lib/zig/lib

build:
	zig build -Dtarget=$(TARGET) -Doptimize=$(LEVEL) -freference-trace

release: export LEVEL=ReleaseFast
release: build

clean:
	rm -rf zig-cache
	rm -rf zig-out

.PHONY: debug release clean