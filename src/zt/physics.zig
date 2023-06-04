const std = @import("std");
const math = @import("imgui").zlm;
const assert = std.debug.assert;

// Fair bit of code duplication here for specialized shape algorithms.
// Much credit goes to this incredible resource:
// http://www.jeffreythompson.org/collision-detection/index.php

pub fn isPointInCircle(point: math.Vec2, circlePos: math.Vec2, circleRad: f32) bool {
    return point.distanceTo(circlePos) <= circleRad;
}
pub fn isPointInRect(point: math.Vec2, rect: math.Rect) bool {
    return rect.containsPoint(point);
}
pub fn isPointInLine(point: math.Vec2, lineStart: math.Vec2, lineEnd: math.Vec2) bool {
    const dist1 = point.distanceTo(lineStart);
    const dist2 = point.distanceTo(lineEnd);

    const len = lineStart.distanceTo(lineEnd);
    const buffer: f32 = 0.1;

    return dist1 + dist2 >= len - buffer and dist1 + dist2 <= len + buffer;
}
pub fn isPointInPoint(point1: math.Vec2, point2: math.Vec2) bool {
    return point1.distanceTo(point2) < 0.1;
}
pub fn isPointInPolygon(point: math.Vec2, polyPoint: math.Vec2, vertices: []math.Vec2) bool {
    var i: usize = 0;
    var j: usize = vertices.len - 1;
    var inside = false;
    while (i < vertices.len) {
        const polyI = polyPoint.add(vertices[i]);
        const polyJ = polyPoint.add(vertices[j]);
        if ((polyI.y > point.y) != (polyJ.y > point.y) and point.x < (polyJ.x - polyI.x) * (point.y - polyI.y) / (polyJ.y - polyI.y) + polyI.x) {
            inside = !inside;
        }
        // Continuation logic
        j = i;
        i += 1;
    }
    return inside;
}
pub fn isCircleInPolygon(circlePos: math.Vec2, radius: f32, polygonPos: math.Vec2, vertices: []math.Vec2) bool {
    for (vertices, 0..) |vert, i| {
        var next = if (i + 1 == vertices.len) polygonPos.add(vertices[0]) else polygonPos.add(vertices[i + 1]);
        if (isLineInCircle(vert.add(polygonPos), next, circlePos, radius)) return true;
    }
    return isPointInPolygon(circlePos, polygonPos, vertices);
}
pub fn isLineInPolygon(lineStart: math.Vec2, lineEnd: math.Vec2, polygonPos: math.Vec2, vertices: []math.Vec2) bool {
    for (vertices, 0..) |vert, i| {
        var next = if (i + 1 == vertices.len) polygonPos.add(vertices[0]) else polygonPos.add(vertices[i + 1]);
        if (isLineInLine(lineStart, lineEnd, vert.add(polygonPos), next)) return true;
    }
    return false;
}
pub fn isPolygonInPolygon(polygonPos: math.Vec2, vertices: []math.Vec2, polygon2Pos: math.Vec2, vertices2: []math.Vec2) bool {
    for (vertices, 0..) |vert, i| {
        var next = if (i + 1 == vertices.len) polygonPos.add(vertices[0]) else polygonPos.add(vertices[i + 1]);
        if (isLineInPolygon(vert.add(polygonPos), next, polygon2Pos, vertices2)) return true;
    }
    return isPointInPolygon(polygonPos, polygon2Pos, vertices2);
}
pub fn isRectInPolygon(rectangle: math.Rect, polygonPos: math.Vec2, vertices: []math.Vec2) bool {
    for (vertices, 0..) |vert, i| {
        var next = if (i + 1 == vertices.len) polygonPos.add(vertices[0]) else polygonPos.add(vertices[i + 1]);
        if (isLineInRect(vert.add(polygonPos), next, rectangle.position, rectangle.size)) return true;
    }
    return isPointInPolygon(rectangle.position, polygonPos, vertices);
}
pub fn isLineInLine(l1Start: math.Vec2, l1End: math.Vec2, l2Start: math.Vec2, l2End: math.Vec2) bool {
    var uA: f32 = ((l2End.x - l2Start.x) * (l1Start.y - l2Start.y) - (l2End.y - l2Start.y) * (l1Start.x - l2Start.x)) / ((l2End.y - l2Start.y) * (l1End.x - l1Start.x) - (l2End.x - l2Start.x) * (l1End.y - l1Start.y));
    var uB: f32 = ((l1End.x - l1Start.x) * (l1Start.y - l2Start.y) - (l1End.y - l1Start.y) * (l1Start.x - l2Start.x)) / ((l2End.y - l2Start.y) * (l1End.x - l1Start.x) - (l2End.x - l2Start.x) * (l1End.y - l1Start.y));
    return (uA >= 0 and uA <= 1 and uB >= 0 and uB <= 1);
}
pub fn isLineInRect(line1: math.Vec2, line2: math.Vec2, aabbPos: math.Vec2, aabbSize: math.Vec2) bool {
    const tl = aabbPos;
    const tr = aabbPos.add(.{ .x = aabbSize.x });
    const br = aabbPos.add(aabbSize);
    const bl = aabbPos.add(.{ .y = aabbSize.y });
    return isLineInLine(line1, line2, tl, tr) or
        isLineInLine(line1, line2, tl, bl) or
        isLineInLine(line1, line2, bl, br) or
        isLineInLine(line1, line2, tr, br);
}
pub fn isRectInRect(rect1Pos: math.Vec2, rect1Size: math.Vec2, rect2Pos: math.Vec2, rect2Size: math.Vec2) bool {
    return math.Rect.intersectsRect(.{ .position = rect1Pos, .size = rect1Size }, .{ .position = rect2Pos, .size = rect2Size });
}
pub fn isCircleInRect(circPos: math.Vec2, radius: f32, rectPos: math.Vec2, rectSize: math.Vec2) bool {
    var testX = circPos.x;
    var testY = circPos.y;

    if (circPos.x < rectPos.x) {
        testX = rectPos.x;
    } else if (circPos.x > rectPos.x + rectSize.x) {
        testX = rectPos.x + rectSize.x;
    }
    if (circPos.y < rectPos.y) {
        testY = rectPos.y;
    } else if (circPos.y > rectPos.y + rectSize.y) {
        testY = rectPos.y + rectSize.y;
    }

    var distX = circPos.x - testX;
    var distY = circPos.y - testY;
    var dist = std.math.sqrt((distX * distX) + (distY * distY));

    return dist <= radius;
}
pub fn isLineInCircle(lineStart: math.Vec2, lineEnd: math.Vec2, circlePos: math.Vec2, radius: f32) bool {
    // Early out
    if (isPointInCircle(lineStart, circlePos, radius)) {
        return true;
    }
    if (isPointInCircle(lineEnd, circlePos, radius)) {
        return true;
    }

    const len: f32 = lineStart.distanceTo(lineEnd);
    const dot = (((circlePos.x - lineStart.x) * (lineEnd.x - lineStart.x)) + ((circlePos.y - lineStart.y) * (lineEnd.y - lineStart.y))) / std.math.pow(f32, len, 2.0);

    const closestX = lineStart.x + (dot * (lineEnd.x - lineStart.x));
    const closestY = lineStart.y + (dot * (lineEnd.y - lineStart.y));

    var onSegment = isPointInLine(.{ .x = closestX, .y = closestY }, lineStart, lineEnd);
    if (!onSegment) return false;

    var closest = math.vec2(closestX - circlePos.x, closestY - circlePos.y);

    return closest.length() <= radius;
}
inline fn pointInCircle(point: Shape, pointPos: math.Vec2, circle: Shape, circlePos: math.Vec2) bool {
    assert(circle == .Circle);
    assert(point == .Point);
    return isPointInCircle(point.Point.add(pointPos), circlePos, circle.Circle.radius);
}
inline fn pointInPoint(
    point: Shape,
    pointPos: math.Vec2,
    point2: Shape,
    point2Pos: math.Vec2,
) bool {
    assert(point2 == .Point);
    assert(point == .Point);

    return isPointInPoint(pointPos.add(point.Point), point2Pos.add(point2.Point));
}
inline fn pointInLine(point: Shape, pointPos: math.Vec2, line: Shape, linePos: math.Vec2) bool {
    assert(line == .Line);
    assert(point == .Point);

    const start = linePos.add(line.Line.start);
    const end = linePos.add(line.Line.end);

    return isPointInLine(pointPos.add(point.Point), start, end);
}
inline fn lineInLine(line: Shape, linePos: math.Vec2, line2: Shape, line2Pos: math.Vec2) bool {
    assert(line == .Line);
    assert(line2 == .Line);

    const start = linePos.add(line.Line.start);
    const end = linePos.add(line.Line.end);
    const start2 = line2Pos.add(line2.Line.start);
    const end2 = line2Pos.add(line2.Line.end);

    return isLineInLine(start, end, start2, end2);
}
inline fn lineInPolygon(line: Shape, linePos: math.Vec2, poly: Shape, polyPos: math.Vec2) bool {
    assert(line == .Line);
    assert(poly == .Polygon);

    const start = linePos.add(line.Line.start);
    const end = linePos.add(line.Line.end);

    return isLineInPolygon(start, end, polyPos, poly.Polygon.vertices);
}
inline fn pointInRect(point: Shape, pointPos: math.Vec2, rectangle: Shape, rectanglePos: math.Vec2) bool {
    assert(rectangle == .Rectangle);
    assert(point == .Point);
    const ppos: math.Vec2 = point.Point.add(pointPos);
    const rect: math.Rect = .{
        .position = rectangle.Rectangle.position.add(rectanglePos),
        .size = rectangle.Rectangle.size,
    };
    return isPointInRect(ppos, rect);
}
inline fn lineInRect(line: Shape, linePos: math.Vec2, rectangle: Shape, rectanglePos: math.Vec2) bool {
    assert(rectangle == .Rectangle);
    assert(line == .Line);
    const lineStart: math.Vec2 = linePos.add(line.Line.start);
    const lineEnd: math.Vec2 = linePos.add(line.Line.end);
    const rect: math.Rect = .{
        .position = rectangle.Rectangle.position.add(rectanglePos),
        .size = rectangle.Rectangle.size,
    };
    return isLineInRect(lineStart, lineEnd, rect.position, rect.size);
}
inline fn pointInPolygon(point: Shape, pointPos: math.Vec2, poly: Shape, polyPos: math.Vec2) bool {
    assert(poly == .Polygon);
    assert(point == .Point);
    return isPointInPolygon(pointPos.add(point.Point), polyPos, poly.Polygon.vertices);
}
inline fn circleInCircle(circle1: Shape, circle1Pos: math.Vec2, circle2: Shape, circle2Pos: math.Vec2) bool {
    assert(circle1 == .Circle);
    assert(circle2 == .Circle);
    return circle1Pos.distanceTo(circle2Pos) - circle1.Circle.radius <= circle2.Circle.radius;
}
inline fn circleInRect(circle: Shape, circlePos: math.Vec2, rectangle: Shape, rectanglePos: math.Vec2) bool {
    assert(circle == .Circle);
    assert(rectangle == .Rectangle);
    var rect = rectangle.Rectangle;
    rect.position = rect.position.add(rectanglePos);
    return isCircleInRect(circlePos, circle.Circle.radius, rect.position, rect.size);
}
inline fn circleInLine(circle: Shape, circlePos: math.Vec2, line: Shape, linePos: math.Vec2) bool {
    assert(circle == .Circle); // here
    assert(line == .Line);
    const lineStart: math.Vec2 = linePos.add(line.Line.start);
    const lineEnd: math.Vec2 = linePos.add(line.Line.end);
    return isLineInCircle(lineStart, lineEnd, circlePos, circle.Circle.radius);
}
inline fn circleInPoly(circle: Shape, circlePos: math.Vec2, poly: Shape, polyPos: math.Vec2) bool {
    assert(circle == .Circle);
    assert(poly == .Polygon);
    return isCircleInPolygon(circlePos, circle.Circle.radius, polyPos, poly.Polygon.vertices);
}
inline fn rectInRect(rect1: Shape, rect1Pos: math.Vec2, rect2: Shape, rect2Pos: math.Vec2) bool {
    assert(rect1 == .Rectangle);
    assert(rect2 == .Rectangle);
    return isRectInRect(rect1.Rectangle.position.add(rect1Pos), rect1.Rectangle.size, rect2.Rectangle.position.add(rect2Pos), rect2.Rectangle.size);
}
inline fn rectInPoly(rectangle: Shape, rectanglePos: math.Vec2, poly: Shape, polyPos: math.Vec2) bool {
    assert(rectangle == .Rectangle);
    assert(poly == .Polygon);
    var rect = rectangle.Rectangle;
    rect.position = rect.position.add(rectanglePos);
    return isRectInPolygon(rect, polyPos, poly.Polygon.vertices);
}
inline fn polyInPoly(poly: Shape, polyPos: math.Vec2, poly2: Shape, poly2Pos: math.Vec2) bool {
    assert(poly2 == .Polygon);
    assert(poly == .Polygon);
    return isPolygonInPolygon(polyPos, poly.Polygon.vertices, poly2Pos, poly2.Polygon.vertices);
}

/// Simple container of many shape types. By using a shape in your code you can test overlaps against any other shape.
/// For simplicity sake, Rectangle is AABB, meaning it cannot be represented as rotated. For that you'll want to make your
/// own polygon, which works with any other shape.
/// Note that none of the shapes retain a position field, as position is supplied during the check functions to make this
/// interface a little more versatile. As such, a Point's position and a Rectangle's position both refer to an offset from
/// the position yet supplied. Polygon's vertices are as offsets from the position supplied.
pub const Shape = union(enum) {
    Circle: Circle,
    Rectangle: Rectangle,
    Point: Point,
    Polygon: Polygon,
    Line: Line,

    pub const Circle = struct { radius: f32 };
    pub const Rectangle = math.Rect;
    pub const Point = math.Vec2;
    pub const Polygon = struct { vertices: []math.Vec2 };
    pub const Line = struct {
        start: math.Vec2,
        end: math.Vec2,
    };

    pub fn circle(radius: f32) Shape {
        return .{ .Circle = .{ .radius = radius } };
    }
    pub fn line(from: math.Vec2, to: math.Vec2) Shape {
        return .{ .Line = .{ .start = from, .end = to } };
    }
    pub fn point(pos: math.Vec2) Shape {
        return .{ .Point = pos };
    }
    pub fn rectangle(pos: math.Vec2, size: math.Vec2) Shape {
        return .{ .Rectangle = math.rect(pos.x, pos.y, size.x, size.y) };
    }

    pub fn overlaps(self: Shape, selfPos: math.Vec2, other: Shape, otherPos: math.Vec2) bool {
        switch (self) {
            .Point => {
                switch (other) {
                    .Circle => {
                        return pointInCircle(self, selfPos, other, otherPos);
                    },
                    .Rectangle => {
                        return pointInRect(self, selfPos, other, otherPos);
                    },
                    .Polygon => {
                        return pointInPolygon(self, selfPos, other, otherPos);
                    },
                    .Line => {
                        return pointInLine(self, selfPos, other, otherPos);
                    },
                    .Point => {
                        return pointInPoint(self, selfPos, other, otherPos);
                    },
                }
            },
            .Circle => {
                switch (other) {
                    .Circle => {
                        return circleInCircle(self, selfPos, other, otherPos);
                    },
                    .Point => {
                        return pointInCircle(other, otherPos, self, selfPos);
                    },
                    .Rectangle => {
                        return circleInRect(self, selfPos, other, otherPos);
                    },
                    .Line => {
                        return circleInLine(self, selfPos, other, otherPos);
                    },
                    .Polygon => {
                        return circleInPoly(self, selfPos, other, otherPos);
                    },
                }
            },
            .Rectangle => {
                switch (other) {
                    .Circle => {
                        return circleInRect(other, otherPos, self, selfPos);
                    },
                    .Point => {
                        return pointInRect(other, otherPos, self, selfPos);
                    },
                    .Rectangle => {
                        return rectInRect(self, selfPos, other, otherPos);
                    },
                    .Line => {
                        return lineInRect(other, otherPos, self, selfPos);
                    },
                    .Polygon => {
                        return rectInPoly(self, selfPos, other, otherPos);
                    },
                }
            },
            .Line => {
                switch (other) {
                    .Circle => {
                        return circleInLine(other, otherPos, self, selfPos);
                    },
                    .Point => {
                        return pointInLine(other, otherPos, self, selfPos);
                    },
                    .Rectangle => {
                        return lineInRect(self, selfPos, other, otherPos);
                    },
                    .Line => {
                        return lineInLine(self, selfPos, other, otherPos);
                    },
                    .Polygon => {
                        return lineInPolygon(self, selfPos, other, otherPos);
                    },
                }
            },
            .Polygon => {
                switch (other) {
                    .Circle => {
                        return circleInPoly(other, otherPos, self, selfPos);
                    },
                    .Point => {
                        return pointInPolygon(other, otherPos, self, selfPos);
                    },
                    .Rectangle => {
                        return rectInPoly(other, otherPos, self, selfPos);
                    },
                    .Line => {
                        return lineInPolygon(other, otherPos, self, selfPos);
                    },
                    .Polygon => {
                        return polyInPoly(other, otherPos, self, selfPos);
                    },
                }
            },
        }
    }
};

test "Overlap methods" {
    var offsetPoint = Shape.point(.{ .x = -20 });
    var testPoint = Shape.point(.{});
    var testCircle = Shape.circle(10);
    var testRectangle = Shape.rectangle(.{}, .{ .x = 10, .y = 10 });
    var offsetRectangle = Shape.rectangle(.{ .x = 20 }, .{ .x = 10, .y = 10 });

    // Point -> Circle
    assert(isPointInCircle(.{}, .{}, 3));
    assert(Shape.overlaps(testPoint, .{}, testCircle, .{}));
    assert(Shape.overlaps(testCircle, .{}, testPoint, .{}));
    assert(!Shape.overlaps(offsetPoint, .{}, testCircle, .{}));
    assert(!Shape.overlaps(testPoint, .{ .x = 15 }, testCircle, .{}));
    assert(!Shape.overlaps(testCircle, .{}, testPoint, .{ .x = 15 }));

    // Point -> Rectangle
    assert(isPointInRect(.{}, .{ .size = .{ .x = 10, .y = 10 } }));
    assert(Shape.overlaps(testPoint, .{}, testRectangle, .{}));
    assert(Shape.overlaps(testPoint, .{ .x = 25 }, offsetRectangle, .{}));
    assert(!Shape.overlaps(offsetPoint, .{}, testRectangle, .{}));
    assert(!Shape.overlaps(testPoint, .{}, offsetRectangle, .{}));

    // Point -> Poly
    var polygons: []math.Vec2 = &.{
        math.vec2(-10, 0),
        math.vec2(0, -10),
        math.vec2(10, 0),
        math.vec2(0, 10),
    };
    var testPoly = Shape{ .Polygon = .{ .vertices = polygons } };
    assert(isPointInPolygon(.{}, .{}, polygons));
    assert(!isPointInPolygon(math.vec2(-8, -8), .{}, polygons));
    assert(Shape.overlaps(testPoint, .{}, testPoly, .{}));
    assert(!Shape.overlaps(testPoint, .{ .x = -8, .y = -8 }, testPoly, .{}));

    // Circle -> Circle
    assert(Shape.overlaps(testCircle, .{}, testCircle, .{}));
    assert(!Shape.overlaps(testCircle, .{ .x = 21 }, testCircle, .{}));

    // Circle -> Rectangle
    assert(Shape.overlaps(testRectangle, .{}, testCircle, .{}));
    assert(!Shape.overlaps(testRectangle, .{}, testCircle, .{ .x = -11 }));
}
