const std = @import("std");

/// Makes all vector and matrix types generic against Real
fn specializeOn(comptime Real: type) type {
    return struct {
        /// Helper for the swizzle operator.
        /// Returns the type fitting the number of swizzle elements
        fn SwizzleTypeByElements(comptime i: usize) type {
            return switch (i) {
                1 => Real,
                2 => Vec2,
                3 => Vec3,
                4 => Vec4,
                else => @compileError("Swizzle can take up to 4 elements!"),
            };
        }
        /// Returns a type mixin for a vector type implementing all component-wise operations.
        /// Reduces the amount of duplicated code by a lot
        fn VectorMixin(comptime Self: type) type {
            return struct {
                /// adds all components from `a` with the components of `b`.
                pub fn add(a: Self, b: Self) Self {
                    var result: Self = undefined;
                    inline for (@typeInfo(Self).Struct.fields) |fld| {
                        @field(result, fld.name) = @field(a, fld.name) + @field(b, fld.name);
                    }
                    return result;
                }

                pub fn hash(self: Self) u32 {
                    return std.hash.Adler32.hash(&std.mem.toBytes(self));
                }
                pub fn hash64(self: Self) u64 {
                    return std.hash.Wyhash.hash(34837813, &std.mem.toBytes(self));
                }

                /// subtracts all components from `a` with the components of `b`.
                pub fn sub(a: Self, b: Self) Self {
                    var result: Self = undefined;
                    inline for (@typeInfo(Self).Struct.fields) |fld| {
                        @field(result, fld.name) = @field(a, fld.name) - @field(b, fld.name);
                    }
                    return result;
                }

                /// multiplies all components from `a` with the components of `b`.
                pub fn mul(a: Self, b: Self) Self {
                    var result: Self = undefined;
                    inline for (@typeInfo(Self).Struct.fields) |fld| {
                        @field(result, fld.name) = @field(a, fld.name) * @field(b, fld.name);
                    }
                    return result;
                }

                /// divides all components from `a` by the components of `b`.
                pub fn div(a: Self, b: Self) Self {
                    var result: Self = undefined;
                    inline for (@typeInfo(Self).Struct.fields) |fld| {
                        @field(result, fld.name) = @field(a, fld.name) / @field(b, fld.name);
                    }
                    return result;
                }

                /// multiplies all components by a scalar value.
                pub fn scale(a: Self, b: Real) Self {
                    var result: Self = undefined;
                    inline for (@typeInfo(Self).Struct.fields) |fld| {
                        @field(result, fld.name) = @field(a, fld.name) * b;
                    }
                    return result;
                }
                pub fn scaleDiv(a: Self, b: Real) Self {
                    var result: Self = undefined;
                    inline for (@typeInfo(Self).Struct.fields) |fld| {
                        @field(result, fld.name) = @field(a, fld.name) / b;
                    }
                    return result;
                }

                /// returns the dot product of two vectors.
                /// This is the sum of products of all components.
                pub fn dot(a: Self, b: Self) Real {
                    var result: Real = 0;
                    inline for (@typeInfo(Self).Struct.fields) |fld| {
                        result += @field(a, fld.name) * @field(b, fld.name);
                    }
                    return result;
                }

                pub fn distanceTo(a: Self, b: Self) Real {
                    return (a.sub(b).abs()).length();
                }
                /// returns the magnitude of the vector.
                pub fn length(a: Self) Real {
                    return std.math.sqrt(a.length2());
                }

                /// returns the squared magnitude of the vector.
                pub fn length2(a: Self) Real {
                    return Self.dot(a, a);
                }

                /// returns either a normalized vector (`length() = 1`) or `zero` if the vector
                /// has length 0.
                pub fn normalize(vec: Self) Self {
                    var len = vec.length();
                    return if (len != 0.0)
                        vec.scale(1.0 / vec.length())
                    else
                        Self.zero;
                }

                /// applies component-wise absolute values
                pub fn abs(a: Self) Self {
                    var result: Self = undefined;
                    inline for (@typeInfo(Self).Struct.fields) |fld| {
                        @field(result, fld.name) = std.math.absFloat(@field(a, fld.name));
                    }
                    return result;
                }
                /// Returns a vector `mix`% between the two vectors.
                /// 0 is a, 1 is b, 0.5 is between the two.
                pub fn lerp(a: Self, b: Self, mix: f32) Self {
                    var result: Self = undefined;
                    inline for (@typeInfo(Self).Struct.fields) |fld| {
                        @field(result, fld.name) = (@field(a, fld.name) - @field(b, fld.name)) * mix;
                    }
                    return result;
                }
                /// swizzle vector fields into a new vector type.
                /// swizzle("xxx") will return a Vec3 with three times the x component.
                /// swizzle will return a vector or scalar type with the same number of components as the
                /// `components` string.
                /// `components` may be any sequence of `x`, `y`, `z`, `w`, `0` and `1`.
                /// The letters will be replaced by the corresponding component, the digits will be replaced
                /// by the corresponding literal value.
                ///
                /// Examples:
                /// - `vec4(1,2,3,4).swizzle("wzyx") == vec4(4, 3, 2, 1)`
                /// - `vec4(1,2,3,4).swizzle("xyx") == vec3(1,2,1)`
                /// - `vec2(1,2).swizzle("xyxy") == vec4(1,2,1,2)`
                /// - `vec2(3,4).swizzle("xy01") == vec4(3, 4, 0, 1)`
                ///
                pub fn swizzle(self: Self, comptime components: []const u8) SwizzleTypeByElements(components.len) {
                    const T = SwizzleTypeByElements(components.len);
                    var result: T = undefined;

                    if (components.len > 1) {
                        const fieldorder = "xyzw";
                        _ = fieldorder;
                        inline for (components) |c, i| {
                            _ = c;
                            const slice = components[i .. i + 1];
                            const temp = if (comptime std.mem.eql(u8, slice, "0"))
                                0
                            else if (comptime std.mem.eql(u8, slice, "1"))
                                1
                            else
                                @field(self, components[i .. i + 1]);
                            @field(result, switch (i) {
                                0 => "x",
                                1 => "y",
                                2 => "z",
                                3 => "w",
                                else => @compileError("this should not happen"),
                            }) = temp;
                        }
                    } else if (components.len == 1) {
                        result = @field(self, components);
                    } else {
                        @compileError("components must at least contain a single field!");
                    }

                    return result;
                }

                /// returns a new vector where each component is the minimum of the components of the input vectors.
                pub fn componentMin(a: Self, b: Self) Self {
                    var result: Self = undefined;
                    inline for (@typeInfo(Self).Struct.fields) |fld| {
                        @field(result, fld.name) = std.math.min(@field(a, fld.name), @field(b, fld.name));
                    }
                    return result;
                }

                /// returns a new vector where each component is the maximum of the components of the input vectors.
                pub fn componentMax(a: Self, b: Self) Self {
                    var result: Self = undefined;
                    inline for (@typeInfo(Self).Struct.fields) |fld| {
                        @field(result, fld.name) = std.math.max(@field(a, fld.name), @field(b, fld.name));
                    }
                    return result;
                }
            };
        }

        pub const Rect = extern struct {
            position: Vec2 = .{},
            size: Vec2 = .{},

            pub inline fn left(self: Rect) Real {
                return self.position.x;
            }
            pub inline fn top(self: Rect) Real {
                return self.position.y;
            }
            pub inline fn right(self: Rect) Real {
                return self.position.x + self.size.x;
            }
            pub inline fn bottom(self: Rect) Real {
                return self.position.y + self.size.y;
            }
            pub inline fn newVec(pos: Vec2, size: Vec2) Rect {
                return new(pos.x, pos.y, size.x, size.y);
            }
            pub fn new(x: Real, y: Real, width: Real, height: Real) Rect {
                return .{ .position = .{ .x = x, .y = y }, .size = .{ .x = width, .y = height } };
            }
            pub fn containsPoint(self: Rect, point: Vec2) bool {
                return point.x >= self.position.x and point.y >= self.position.y and
                    point.x <= self.position.x + self.size.x and point.y <= self.position.y + self.size.y;
            }
            pub fn containsRect(self: Rect, other: Rect) bool {
                return ((((self.position.x <= other.position.x) and ((other.position.x + other.size.x) <= (self.position.x + self.size.x))) and (self.position.y <= other.position.y)) and ((other.position.y + other.size.y) <= (self.position.y + self.size.y)));
            }
            pub fn intersectsRect(self: Rect, other: Rect) bool {
                return other.position.x < self.position.x + self.size.x and
                    self.position.x < other.position.x + other.size.x and
                    other.position.y < self.position.y + self.size.y and
                    self.position.y < other.position.y + other.size.y;
            }
            pub fn moved(self: Rect, position: Vec2) Rect {
                return rect(self.position.x + position.x, self.position.y + position.y, self.size.x, self.size.y);
            }
            pub fn inset(self: Rect, amount: Real) Rect {
                return rect(self.position.x + amount, self.position.y + amount, self.size.x - (amount * 2), self.size.y - (amount * 2));
            }
            /// Returns how much the two rectangles intersect on each axis, if they do.
            pub fn intersection(self: Rect, other: Rect) ?Vec2 {
                if (self.intersectsRect(other)) {
                    var val: Vec2 = .{};
                    val.x = std.math.min(self.right(), other.right()) - std.math.max(self.left(), other.left());
                    val.y = std.math.min(self.bottom(), other.bottom()) - std.math.max(self.top(), other.top());
                    return val;
                } else {
                    return null;
                }
            }
            /// negative expansion moves the left/top bounds, positive moves the bottom/right bounds.
            pub fn expand(self: Rect, expansion: Vec2) Rect {
                var copy = self;
                if (expansion.x < 0) {
                    copy.position.x += expansion.x;
                    copy.size.x -= expansion.x;
                } else {
                    copy.position.x += expansion.x;
                }
                if (expansion.y < 0) {
                    copy.position.y += expansion.y;
                    copy.size.y -= expansion.y;
                } else {
                    copy.position.y += expansion.y;
                }
                return copy;
            }
        };

        /// 2-dimensional vector type.
        pub const Vec2 = extern struct {
            x: Real = 0,
            y: Real = 0,

            pub const zero = Vec2.new(0, 0);
            pub const one = Vec2.new(1, 1);
            pub const unitX = Vec2.new(1, 0);
            pub const unitY = Vec2.new(0, 1);

            usingnamespace VectorMixin(Vec2);

            pub fn new(x: Real, y: Real) Vec2 {
                return Vec2{
                    .x = x,
                    .y = y,
                };
            }

            pub fn format(value: Vec2, comptime fmt: []const u8, options: std.fmt.FormatOptions, stream: anytype) !void {
                _ = options;
                _ = fmt;
                try stream.print("vec2({d:.2}, {d:.2})", .{ value.x, value.y });
            }

            fn getField(vec: Vec2, comptime index: comptime_int) Real {
                switch (index) {
                    0 => return vec.x,
                    1 => return vec.y,
                    else => @compileError("index out of bounds!"),
                }
            }

            /// multiplies the vector with a matrix.
            pub fn transform(vec: Vec2, mat: Mat2) Vec2 {
                var result = zero;
                inline for ([_]comptime_int{ 0, 1 }) |i| {
                    result.x += vec.getField(i) * mat.fields[0][i];
                    result.y += vec.getField(i) * mat.fields[1][i];
                }
                return result;
            }
            /// multiplies the vector with a matrix4.
            pub fn transform4(vec: Vec2, mat: Mat4) Vec2 {
                return Vec2.new(
                    // (position.X * matrix.M11) + (position.Y * matrix.M21) + matrix.M41
                    (vec.x * mat.fields[0][0]) + (vec.y * mat.fields[1][0]) + mat.fields[3][0],
                    // (position.X * matrix.M12) + (position.Y * matrix.M22) + matrix.M42
                    (vec.x * mat.fields[0][1]) + (vec.y * mat.fields[1][1]) + mat.fields[3][1],
                );
            }

            /// Assumes you are rotating around the 0,0 origin.
            pub fn rotate(vec: Vec2, radians: f32) Vec2 {
                return vec.transform4(Mat4.createZRotation(radians));
            }
        };

        /// 3-dimensional vector type.
        pub const Vec3 = extern struct {
            x: Real = 0,
            y: Real = 0,
            z: Real = 0,

            pub const zero = Vec3.new(0, 0, 0);
            pub const one = Vec3.new(1, 1, 1);
            pub const unitX = Vec3.new(1, 0, 0);
            pub const unitY = Vec3.new(0, 1, 0);
            pub const unitZ = Vec3.new(0, 0, 1);

            usingnamespace VectorMixin(Vec3);

            pub fn new(x: Real, y: Real, z: Real) Vec3 {
                return Vec3{
                    .x = x,
                    .y = y,
                    .z = z,
                };
            }

            pub fn format(value: Vec3, comptime fmt: []const u8, options: std.fmt.FormatOptions, stream: anytype) !void {
                _ = options;
                _ = fmt;
                try stream.print("vec3({d:.2}, {d:.2}, {d:.2})", .{ value.x, value.y, value.z });
            }

            /// calculates the cross product. result will be perpendicular to a and b.
            pub fn cross(a: Vec3, b: Vec3) Vec3 {
                return Vec3{
                    .x = a.y * b.z - a.z * b.y,
                    .y = a.z * b.x - a.x * b.z,
                    .z = a.x * b.y - a.y * b.x,
                };
            }

            /// converts the vector from an homogeneous position (w=1).
            pub fn toAffinePosition(a: Vec3) Vec4 {
                return Vec4{
                    .x = a.x,
                    .y = a.y,
                    .z = a.z,
                    .w = 1.0,
                };
            }

            /// converts the vector from an homogeneous direction (w=0).
            pub fn toAffineDirection(a: Vec3) Vec4 {
                return Vec4{
                    .x = a.x,
                    .y = a.y,
                    .z = a.z,
                    .w = 0.0,
                };
            }

            pub fn fromAffinePosition(a: Vec4) Vec3 {
                return Vec3{
                    .x = a.x / a.w,
                    .y = a.y / a.w,
                    .z = a.z / a.w,
                };
            }

            pub fn fromAffineDirection(a: Vec4) Vec3 {
                return Vec3{
                    .x = a.x,
                    .y = a.y,
                    .z = a.z,
                };
            }

            /// multiplies the vector with a matrix.
            pub fn transform(vec: Vec3, mat: Mat3) Vec3 {
                var result = zero;
                inline for ([_]comptime_int{ 0, 1, 2 }) |i| {
                    result.x += vec.getField(i) * mat.fields[0][i];
                    result.y += vec.getField(i) * mat.fields[1][i];
                    result.z += vec.getField(i) * mat.fields[2][i];
                }
                return result;
            }

            /// transforms a homogeneous position.
            pub fn transformPosition(vec: Vec3, mat: Mat4) Vec3 {
                return fromAffinePosition(vec.toAffinePosition().transform(mat));
            }

            /// transforms a homogeneous direction.
            pub fn transformDirection(vec: Vec3, mat: Mat4) Vec3 {
                return fromAffineDirection(vec.toAffineDirection().transform(mat));
            }

            fn getField(vec: Vec3, comptime index: comptime_int) Real {
                switch (index) {
                    0 => return vec.x,
                    1 => return vec.y,
                    2 => return vec.z,
                    else => @compileError("index out of bounds!"),
                }
            }
        };

        /// 4-dimensional vector type.
        pub const Vec4 = extern struct {
            x: Real = 0,
            y: Real = 0,
            z: Real = 0,
            w: Real = 0,

            pub const zero = Vec4.new(0, 0, 0, 0);
            pub const one = Vec4.new(1, 1, 1, 1);
            pub const unitX = Vec4.new(1, 0, 0, 0);
            pub const unitY = Vec4.new(0, 1, 0, 0);
            pub const unitZ = Vec4.new(0, 0, 1, 0);
            pub const unitW = Vec4.new(0, 0, 0, 1);

            pub const white = Vec4.new(1, 1, 1, 1);
            pub const black = Vec4.new(0, 0, 0, 1);
            pub const transparent = Vec4.new(0, 0, 0, 0);

            usingnamespace VectorMixin(Vec4);

            pub fn new(x: Real, y: Real, z: Real, w: Real) Vec4 {
                return Vec4{
                    .x = x,
                    .y = y,
                    .z = z,
                    .w = w,
                };
            }

            pub fn format(value: Vec4, comptime fmt: []const u8, options: std.fmt.FormatOptions, stream: anytype) !void {
                _ = options;
                _ = fmt;
                try stream.print("vec4({d:.2}, {d:.2}, {d:.2}, {d:.2})", .{ value.x, value.y, value.z, value.w });
            }

            /// multiplies the vector with a matrix.
            pub fn transform(vec: Vec4, mat: Mat4) Vec4 {
                var result = zero;
                inline for ([_]comptime_int{ 0, 1, 2, 3 }) |i| {
                    result.x += vec.getField(i) * mat.fields[i][0];
                    result.y += vec.getField(i) * mat.fields[i][1];
                    result.z += vec.getField(i) * mat.fields[i][2];
                    result.w += vec.getField(i) * mat.fields[i][3];
                }
                return result;
            }

            fn getField(vec: Vec4, comptime index: comptime_int) Real {
                switch (index) {
                    0 => return vec.x,
                    1 => return vec.y,
                    2 => return vec.z,
                    3 => return vec.w,
                    else => @compileError("index out of bounds!"),
                }
            }

            pub fn colorFaded(vec: Vec4, newTransparency: Real) Vec4 {
                return .{ .x = vec.x, .y = vec.y, .z = vec.z, .w = newTransparency };
            }
        };

        /// 2 by 2 matrix type.
        pub const Mat2 = extern struct {
            fields: [2][2]Real, // [row][col]

            /// identitiy matrix
            pub const identity = Mat2{
                .fields = [2]Real{
                    [2]Real{ 1, 0 },
                    [2]Real{ 0, 1 },
                },
            };
        };

        /// 3 by 3 matrix type.
        pub const Mat3 = extern struct {
            fields: [3][3]Real, // [row][col]

            /// identitiy matrix
            pub const identity = Mat3{
                .fields = [3]Real{
                    [3]Real{ 1, 0, 0 },
                    [3]Real{ 0, 1, 0 },
                    [3]Real{ 0, 0, 1 },
                },
            };
        };

        /// 4 by 4 matrix type.
        pub const Mat4 = extern struct {
            fields: [4][4]Real, // [row][col]

            /// zero matrix.
            pub const zero = Mat4{
                .fields = [4][4]Real{
                    [4]Real{ 0, 0, 0, 0 },
                    [4]Real{ 0, 0, 0, 0 },
                    [4]Real{ 0, 0, 0, 0 },
                    [4]Real{ 0, 0, 0, 0 },
                },
            };

            /// identitiy matrix
            pub const identity = Mat4{
                .fields = [4][4]Real{
                    [4]Real{ 1, 0, 0, 0 },
                    [4]Real{ 0, 1, 0, 0 },
                    [4]Real{ 0, 0, 1, 0 },
                    [4]Real{ 0, 0, 0, 1 },
                },
            };

            pub fn format(value: Mat4, comptime fmt: []const u8, options: std.fmt.FormatOptions, stream: anytype) !void {
                _ = options;
                _ = fmt;
                try stream.writeAll("mat4{");

                inline for ([_]comptime_int{ 0, 1, 2, 3 }) |i| {
                    const row = value.fields[i];
                    try stream.print(" ({d:.2} {d:.2} {d:.2} {d:.2})", .{ row[0], row[1], row[2], row[3] });
                }

                try stream.writeAll(" }");
            }

            /// performs matrix multiplication of a*b
            pub fn mul(a: Mat4, b: Mat4) Mat4 {
                var result: Mat4 = undefined;
                inline for ([_]comptime_int{ 0, 1, 2, 3 }) |row| {
                    inline for ([_]comptime_int{ 0, 1, 2, 3 }) |col| {
                        var sum: Real = 0.0;
                        inline for ([_]comptime_int{ 0, 1, 2, 3 }) |i| {
                            sum += a.fields[row][i] * b.fields[i][col];
                        }
                        result.fields[row][col] = sum;
                    }
                }
                return result;
            }

            /// transposes the matrix.
            /// this will swap columns with rows.
            pub fn transpose(a: Mat4) Mat4 {
                var result: Mat4 = undefined;
                inline for ([_]comptime_int{ 0, 1, 2, 3 }) |row| {
                    inline for ([_]comptime_int{ 0, 1, 2, 3 }) |col| {
                        result.fields[row][col] = a.fields[col][row];
                    }
                }
                return result;
            }

            // taken from GLM implementation

            /// Creates a look-at matrix.
            /// The matrix will create a transformation that can be used
            /// as a camera transform.
            /// the camera is located at `eye` and will look into `direction`.
            /// `up` is the direction from the screen center to the upper screen border.
            pub fn createLook(eye: Vec3, direction: Vec3, up: Vec3) Mat4 {
                const f = direction.normalize();
                const s = Vec3.cross(up, f).normalize();
                const u = Vec3.cross(f, s);

                var result = Mat4.identity;
                result.fields[0][0] = s.x;
                result.fields[1][0] = s.y;
                result.fields[2][0] = s.z;
                result.fields[0][1] = u.x;
                result.fields[1][1] = u.y;
                result.fields[2][1] = u.z;
                result.fields[0][2] = f.x;
                result.fields[1][2] = f.y;
                result.fields[2][2] = f.z;
                result.fields[3][0] = -Vec3.dot(s, eye);
                result.fields[3][1] = -Vec3.dot(u, eye);
                result.fields[3][2] = -Vec3.dot(f, eye);
                return result;
            }

            /// Creates a look-at matrix.
            /// The matrix will create a transformation that can be used
            /// as a camera transform.
            /// the camera is located at `eye` and will look at `center`.
            /// `up` is the direction from the screen center to the upper screen border.
            pub fn createLookAt(eye: Vec3, center: Vec3, up: Vec3) Mat4 {
                return createLook(eye, Vec3.sub(center, eye), up);
            }

            // taken from GLM implementation

            /// creates a perspective transformation matrix.
            /// `fov` is the field of view in radians,
            /// `aspect` is the screen aspect ratio (width / height)
            /// `near` is the distance of the near clip plane, whereas `far` is the distance to the far clip plane.
            pub fn createPerspective(fov: Real, aspect: Real, near: Real, far: Real) Mat4 {
                std.debug.assert(std.math.fabs(aspect - 0.001) > 0);

                const tanHalfFovy = std.math.tan(fov / 2);

                var result = Mat4.zero;
                result.fields[0][0] = 1.0 / (aspect * tanHalfFovy);
                result.fields[1][1] = 1.0 / (tanHalfFovy);
                result.fields[2][2] = far / (far - near);
                result.fields[2][3] = 1;
                result.fields[3][2] = -(far * near) / (far - near);
                return result;
            }

            /// creates a rotation matrix around a certain axis.
            pub fn createAngleAxis(axis: Vec3, angle: Real) Mat4 {
                var cos = std.math.cos(angle);
                var sin = std.math.sin(angle);
                var x = axis.x;
                var y = axis.y;
                var z = axis.z;

                return Mat4{
                    .fields = [4][4]Real{
                        [4]Real{ cos + x * x * (1 - cos), x * y * (1 - cos) - z * sin, x * z * (1 - cos) + y * sin, 0 },
                        [4]Real{ y * x * (1 - cos) + z * sin, cos + y * y * (1 - cos), y * z * (1 - cos) - x * sin, 0 },
                        [4]Real{ z * x * (1 * cos) - y * sin, z * y * (1 - cos) + x * sin, cos + z * z * (1 - cos), 0 },
                        [4]Real{ 0, 0, 0, 1 },
                    },
                };
            }

            pub fn createZRotation(radians: f32) Mat4 {
                var result = Mat4.identity;

                var val1 = @cos(radians);
                var val2 = @sin(radians);
                result.fields[0][0] = val1;
                result.fields[0][1] = val2;
                result.fields[1][0] = -val2;
                result.fields[1][1] = val1;

                return result;
            }

            /// creates matrix that will scale a homogeneous matrix.
            pub fn createUniformScale(scale: Real) Mat4 {
                return createScale(scale, scale, scale);
            }

            /// Creates a non-uniform scaling matrix
            pub fn createScale(x: Real, y: Real, z: Real) Mat4 {
                return Mat4{
                    .fields = [4][4]Real{
                        [4]Real{ x, 0, 0, 0 },
                        [4]Real{ 0, y, 0, 0 },
                        [4]Real{ 0, 0, z, 0 },
                        [4]Real{ 0, 0, 0, 1 },
                    },
                };
            }

            /// creates matrix that will translate a homogeneous matrix.
            pub fn createTranslationXYZ(x: Real, y: Real, z: Real) Mat4 {
                return Mat4{
                    .fields = [4][4]Real{
                        [4]Real{ 1, 0, 0, 0 },
                        [4]Real{ 0, 1, 0, 0 },
                        [4]Real{ 0, 0, 1, 0 },
                        [4]Real{ x, y, z, 1 },
                    },
                };
            }

            /// creates matrix that will scale a homogeneous matrix.
            pub fn createTranslation(v: Vec3) Mat4 {
                return Mat4{
                    .fields = [4][4]Real{
                        [4]Real{ 1, 0, 0, 0 },
                        [4]Real{ 0, 1, 0, 0 },
                        [4]Real{ 0, 0, 1, 0 },
                        [4]Real{ v.x, v.y, v.z, 1 },
                    },
                };
            }

            /// creates an orthogonal projection matrix.
            /// `left`, `right`, `bottom` and `top` are the borders of the screen whereas `near` and `far` define the
            /// distance of the near and far clipping planes.
            pub fn createOrthogonal(left: Real, right: Real, bottom: Real, top: Real, near: Real, far: Real) Mat4 {
                var result = Mat4.identity;
                result.fields[0][0] = 2 / (right - left);
                result.fields[1][1] = 2 / (top - bottom);
                result.fields[2][2] = 1 / (far - near);
                result.fields[3][0] = -(right + left) / (right - left);
                result.fields[3][1] = -(top + bottom) / (top - bottom);
                result.fields[3][2] = -near / (far - near);
                return result;
            }

            pub fn inlined(self: Mat4) [16]f32 {
                return @bitCast([16]f32, self.fields);
            }

            /// Batch matrix multiplication. Will multiply all matrices from "first" to "last".
            pub fn batchMul(items: []const Mat4) Mat4 {
                if (items.len == 0)
                    return Mat4.identity;
                if (items.len == 1)
                    return items[0];
                var value = items[0];
                var i: usize = 1;
                while (i < items.len) : (i += 1) {
                    value = value.mul(items[i]);
                }
                return value;
            }

            pub fn invert(src: Mat4) ?Mat4 {
                // https://github.com/stackgl/gl-mat4/blob/master/invert.js
                const a = @bitCast([16]f32, src.fields);

                const a00 = a[0];
                const a01 = a[1];
                const a02 = a[2];
                const a03 = a[3];
                const a10 = a[4];
                const a11 = a[5];
                const a12 = a[6];
                const a13 = a[7];
                const a20 = a[8];
                const a21 = a[9];
                const a22 = a[10];
                const a23 = a[11];
                const a30 = a[12];
                const a31 = a[13];
                const a32 = a[14];
                const a33 = a[15];

                const b00 = a00 * a11 - a01 * a10;
                const b01 = a00 * a12 - a02 * a10;
                const b02 = a00 * a13 - a03 * a10;
                const b03 = a01 * a12 - a02 * a11;
                const b04 = a01 * a13 - a03 * a11;
                const b05 = a02 * a13 - a03 * a12;
                const b06 = a20 * a31 - a21 * a30;
                const b07 = a20 * a32 - a22 * a30;
                const b08 = a20 * a33 - a23 * a30;
                const b09 = a21 * a32 - a22 * a31;
                const b10 = a21 * a33 - a23 * a31;
                const b11 = a22 * a33 - a23 * a32;

                // Calculate the determinant
                var det = b00 * b11 - b01 * b10 + b02 * b09 + b03 * b08 - b04 * b07 + b05 * b06;

                if (std.math.approxEqAbs(f32, det, 0, 1e-8)) {
                    return null;
                }
                det = 1.0 / det;

                const out = [16]f32{
                    (a11 * b11 - a12 * b10 + a13 * b09) * det, // 0
                    (a02 * b10 - a01 * b11 - a03 * b09) * det, // 1
                    (a31 * b05 - a32 * b04 + a33 * b03) * det, // 2
                    (a22 * b04 - a21 * b05 - a23 * b03) * det, // 3
                    (a12 * b08 - a10 * b11 - a13 * b07) * det, // 4
                    (a00 * b11 - a02 * b08 + a03 * b07) * det, // 5
                    (a32 * b02 - a30 * b05 - a33 * b01) * det, // 6
                    (a20 * b05 - a22 * b02 + a23 * b01) * det, // 7
                    (a10 * b10 - a11 * b08 + a13 * b06) * det, // 8
                    (a01 * b08 - a00 * b10 - a03 * b06) * det, // 9
                    (a30 * b04 - a31 * b02 + a33 * b00) * det, // 10
                    (a21 * b02 - a20 * b04 - a23 * b00) * det, // 11
                    (a11 * b07 - a10 * b09 - a12 * b06) * det, // 12
                    (a00 * b09 - a01 * b07 + a02 * b06) * det, // 13
                    (a31 * b01 - a30 * b03 - a32 * b00) * det, // 14
                    (a20 * b03 - a21 * b01 + a22 * b00) * det, // 15
                };
                return Mat4{
                    .fields = @bitCast([4][4]f32, out),
                };
            }
        };

        /// constructs a new Vec2.
        pub fn vec2(x: Real, y: Real) Vec2 {
            return Vec2.new(x, y);
        }

        /// constructs a new Vec3.
        pub fn vec3(x: Real, y: Real, z: Real) Vec3 {
            return Vec3.new(x, y, z);
        }

        /// constructs a new Vec4.
        pub fn vec4(x: Real, y: Real, z: Real, w: Real) Vec4 {
            return Vec4.new(x, y, z, w);
        }
        /// constructs a new Rectangle.
        pub fn rect(x: Real, y: Real, w: Real, h: Real) Rect {
            return .{
                .position = .{ .x = x, .y = y },
                .size = .{ .x = w, .y = h },
            };
        }
    };
}

/// Converts degrees to radian
pub fn toRadians(deg: anytype) @TypeOf(deg) {
    return std.math.pi * deg / 180.0;
}

/// Converts radian to degree
pub fn toDegrees(rad: anytype) @TypeOf(rad) {
    return 180.0 * rad / std.math.pi;
}

pub usingnamespace specializeOn(f32);
