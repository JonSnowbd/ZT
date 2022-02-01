const zt = @import("zt");
const main = @import("../main.zig");
const ig = @import("imgui");
const zg = zt.custom_components;

var rotation: f32 = 0.0;
var scale: f32 = 1.0;

var verts = [_]zt.math.Vec2{ zt.math.vec2(-70, 0), zt.math.vec2(0, -50), zt.math.vec2(-20, 0), zt.math.vec2(0, 50) };

var rect: zt.game.Physics.Shape = zt.game.Physics.Shape.rectangle(.{}, .{ .x = 100, .y = 50 });
var rectPos: zt.math.Vec2 = .{};
var line: zt.game.Physics.Shape = zt.game.Physics.Shape.line(.{}, .{ .x = 100, .y = 100 });
var linePos: zt.math.Vec2 = .{};
var circle: zt.game.Physics.Shape = zt.game.Physics.Shape.circle(20.0);
var circlePos: zt.math.Vec2 = .{};
var point: zt.game.Physics.Shape = zt.game.Physics.Shape.point(.{});
var pointPos: zt.math.Vec2 = .{};
var poly: zt.game.Physics.Shape = zt.game.Physics.Shape{ .Polygon = .{ .vertices = &verts } };
var polyPos: zt.math.Vec2 = .{};

pub fn update(ctx: *main.SampleApplication.Context) void {
    control();

    var render = ctx.data.render;
    var io = ig.igGetIO();

    // It's important to set the render size, then the camera. This applies the matrices used to display all the sprites.
    render.updateRenderSize(io.*.DisplaySize);
    render.updateCamera(.{}, scale, rotation);

    // Line Checks.
    {
        const col = if (line.overlaps(linePos, rect, rectPos) or
            line.overlaps(linePos, circle, circlePos) or
            line.overlaps(linePos, poly, polyPos) or
            line.overlaps(linePos, point, pointPos)) zt.math.Vec4.white else zt.math.vec4(0.0, 0.5, 0.5, 0.7);
        render.line(ctx.data.sheet, zt.math.rect(131, 84, 2, 2), linePos.add(line.Line.start), linePos.add(line.Line.end), 0, 4.0, col, col);
    }
    // Circle Checks.
    {
        const col = if (circle.overlaps(circlePos, rect, rectPos) or
            circle.overlaps(circlePos, line, linePos) or
            circle.overlaps(circlePos, poly, polyPos) or
            circle.overlaps(circlePos, point, pointPos)) zt.math.Vec4.white else zt.math.vec4(0.0, 0.5, 0.5, 0.7);
        render.circle(ctx.data.sheet, zt.math.rect(131, 84, 2, 2), circlePos, circle.Circle.radius, 0, col);
    }
    // Rect Checks.
    {
        const col = if (rect.overlaps(rectPos, line, linePos) or
            rect.overlaps(rectPos, circle, circlePos) or
            rect.overlaps(rectPos, poly, polyPos) or
            rect.overlaps(rectPos, point, pointPos)) zt.math.Vec4.white else zt.math.vec4(0.0, 0.5, 0.5, 0.7);

        var renderPos = rect.Rectangle;
        renderPos.position = renderPos.position.add(rectPos);
        render.rectangleHollow(ctx.data.sheet, zt.math.rect(131, 84, 2, 2), renderPos, 0, 4.0, col);
    }
    // Point Checks.
    {
        const col = if (point.overlaps(pointPos, line, linePos) or
            point.overlaps(pointPos, circle, circlePos) or
            point.overlaps(pointPos, rect, rectPos) or
            point.overlaps(pointPos, poly, polyPos)) zt.math.Vec4.white else zt.math.vec4(0.0, 0.5, 0.5, 0.7);

        var renderPos = zt.math.rect(point.Point.x + pointPos.x - 1, point.Point.y + pointPos.y - 1, 2, 2);
        render.rectangleHollow(ctx.data.sheet, zt.math.rect(131, 84, 2, 2), renderPos, 0, 4.0, col);
    }

    // Poly Checks.
    {
        const col = if (poly.overlaps(polyPos, line, linePos) or
            poly.overlaps(polyPos, circle, circlePos) or
            poly.overlaps(polyPos, point, pointPos) or
            poly.overlaps(polyPos, rect, rectPos)) zt.math.Vec4.white else zt.math.vec4(0.0, 0.5, 0.5, 0.7);

        for (poly.Polygon.vertices) |v, i| {
            var next = if (i + 1 == poly.Polygon.vertices.len) poly.Polygon.vertices[0] else poly.Polygon.vertices[i + 1];
            var pos = v.add(polyPos);
            var nextPos = next.add(polyPos);
            render.line(ctx.data.sheet, zt.math.rect(131, 84, 2, 2), pos, nextPos, 0, 4.0, col, col);
        }
    }

    render.flush();
}

fn control() void {
    var io = ig.igGetIO();
    ig.igSetNextWindowPos(io.*.DisplaySize, ig.ImGuiCond_Appearing, .{ .x = 1, .y = 1 });
    if (ig.igBegin("Renderer Demo Settings", null, ig.ImGuiWindowFlags_None)) {
        ig.igPushItemWidth(ig.igGetWindowWidth() * 0.5);
        _ = ig.igDragFloat("Camera Rotation", &rotation, 0.02, zt.math.toRadians(-360.0), zt.math.toRadians(360.0), "%.3f", ig.ImGuiSliderFlags_None);
        _ = ig.igDragFloat("Camera Zoom", &scale, 0.02, 0.1, 16, "%.3f", ig.ImGuiSliderFlags_None);
        ig.igSeparator();
        _ = zg.editDrag("Line Pos", 0.1, &linePos);
        _ = zg.editDrag("Rect Pos", 0.1, &rectPos);
        _ = zg.editDrag("Circle Pos", 0.1, &circlePos);
        _ = zg.editDrag("Point Pos", 0.1, &pointPos);
        _ = zg.editDrag("Poly Pos", 0.1, &polyPos);
        ig.igPopItemWidth();
    }
    ig.igEnd();
}
