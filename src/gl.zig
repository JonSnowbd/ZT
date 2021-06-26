const struct_gladGLversionStruct = extern struct {
    major: c_int,
    minor: c_int,
};
const GLADloadproc = ?fn ([*c]const u8) callconv(.C) ?*c_void;
extern var GLVersion: struct_gladGLversionStruct;
pub extern fn gladLoadGL() c_int;
extern fn gladLoadGLLoader(GLADloadproc) c_int;
const __builtin_va_list = [*c]u8;
const __gnuc_va_list = __builtin_va_list;
const va_list = __gnuc_va_list; // C:\zig\lib\zig\libc\include\any-windows-any\_mingw.h:583:3: warning: TODO implement translation of stmt class GCCAsmStmtClass
// C:\zig\lib\zig\libc\include\any-windows-any\_mingw.h:581:36: warning: unable to translate function, demoted to extern
extern fn __debugbreak() callconv(.C) void;
extern fn __mingw_get_crt_info() [*c]const u8;
const rsize_t = usize;
const ptrdiff_t = c_longlong;
const wchar_t = c_ushort;
const wint_t = c_ushort;
const wctype_t = c_ushort;
const errno_t = c_int;
const __time32_t = c_long;
const __time64_t = c_longlong;
const time_t = __time64_t;
const struct_tagLC_ID = extern struct {
    wLanguage: c_ushort,
    wCountry: c_ushort,
    wCodePage: c_ushort,
};
const LC_ID = struct_tagLC_ID;
const struct_unnamed_1 = extern struct {
    locale: [*c]u8,
    wlocale: [*c]wchar_t,
    refcount: [*c]c_int,
    wrefcount: [*c]c_int,
};
const struct_lconv = opaque {};
const struct___lc_time_data = opaque {};
const struct_threadlocaleinfostruct = extern struct {
    refcount: c_int,
    lc_codepage: c_uint,
    lc_collate_cp: c_uint,
    lc_handle: [6]c_ulong,
    lc_id: [6]LC_ID,
    lc_category: [6]struct_unnamed_1,
    lc_clike: c_int,
    mb_cur_max: c_int,
    lconv_intl_refcount: [*c]c_int,
    lconv_num_refcount: [*c]c_int,
    lconv_mon_refcount: [*c]c_int,
    lconv: ?*struct_lconv,
    ctype1_refcount: [*c]c_int,
    ctype1: [*c]c_ushort,
    pctype: [*c]const c_ushort,
    pclmap: [*c]const u8,
    pcumap: [*c]const u8,
    lc_time_curr: ?*struct___lc_time_data,
};
const struct_threadmbcinfostruct = opaque {};
const pthreadlocinfo = [*c]struct_threadlocaleinfostruct;
const pthreadmbcinfo = ?*struct_threadmbcinfostruct;
const struct_localeinfo_struct = extern struct {
    locinfo: pthreadlocinfo,
    mbcinfo: pthreadmbcinfo,
};
const _locale_tstruct = struct_localeinfo_struct;
const _locale_t = [*c]struct_localeinfo_struct;
const LPLC_ID = [*c]struct_tagLC_ID;
const threadlocinfo = struct_threadlocaleinfostruct;
const int_least8_t = i8;
const uint_least8_t = u8;
const int_least16_t = c_short;
const uint_least16_t = c_ushort;
const int_least32_t = c_int;
const uint_least32_t = c_uint;
const int_least64_t = c_longlong;
const uint_least64_t = c_ulonglong;
const int_fast8_t = i8;
const uint_fast8_t = u8;
const int_fast16_t = c_short;
const uint_fast16_t = c_ushort;
const int_fast32_t = c_int;
const uint_fast32_t = c_uint;
const int_fast64_t = c_longlong;
const uint_fast64_t = c_ulonglong;
const intmax_t = c_longlong;
const uintmax_t = c_ulonglong;
const khronos_int32_t = i32;
const khronos_uint32_t = u32;
const khronos_int64_t = i64;
const khronos_uint64_t = u64;
const khronos_int8_t = i8;
const khronos_uint8_t = u8;
const khronos_int16_t = c_short;
const khronos_uint16_t = c_ushort;
const khronos_intptr_t = c_longlong;
const khronos_uintptr_t = c_ulonglong;
const khronos_ssize_t = c_longlong;
const khronos_usize_t = c_ulonglong;
const khronos_float_t = f32;
const khronos_utime_nanoseconds_t = khronos_uint64_t;
const khronos_stime_nanoseconds_t = khronos_int64_t;
const khronos_boolean_enum_t = enum(c_int) {
    KHRONOS_FALSE = 0,
    KHRONOS_TRUE = 1,
    KHRONOS_BOOLEAN_ENUM_FORCE_SIZE = 2147483647,
    _,
};
const KHRONOS_FALSE = @enumToInt(khronos_boolean_enum_t.KHRONOS_FALSE);
const KHRONOS_TRUE = @enumToInt(khronos_boolean_enum_t.KHRONOS_TRUE);
const KHRONOS_BOOLEAN_ENUM_FORCE_SIZE = @enumToInt(khronos_boolean_enum_t.KHRONOS_BOOLEAN_ENUM_FORCE_SIZE);
pub const GLenum = c_uint;
pub const GLboolean = u8;
pub const GLbitfield = c_uint;
pub const GLvoid = c_void;
pub const GLbyte = khronos_int8_t;
pub const GLubyte = khronos_uint8_t;
pub const GLshort = khronos_int16_t;
pub const GLushort = khronos_uint16_t;
pub const GLint = c_int;
pub const GLuint = c_uint;
pub const GLclampx = khronos_int32_t;
pub const GLsizei = c_int;
pub const GLfloat = khronos_float_t;
pub const GLclampf = khronos_float_t;
pub const GLdouble = f64;
pub const GLclampd = f64;
pub const GLeglClientBufferEXT = ?*c_void;
pub const GLeglImageOES = ?*c_void;
pub const GLchar = u8;
pub const GLcharARB = u8;
pub const GLhandleARB = c_uint;
pub const GLhalf = khronos_uint16_t;
pub const GLhalfARB = khronos_uint16_t;
pub const GLfixed = khronos_int32_t;
pub const GLintptr = khronos_intptr_t;
pub const GLintptrARB = khronos_intptr_t;
pub const GLsizeiptr = khronos_ssize_t;
pub const GLsizeiptrARB = khronos_ssize_t;
pub const GLint64 = khronos_int64_t;
pub const GLint64EXT = khronos_int64_t;
pub const GLuint64 = khronos_uint64_t;
pub const GLuint64EXT = khronos_uint64_t;
const struct___GLsync = opaque {};
const GLsync = ?*struct___GLsync;
const struct__cl_context = opaque {};
const struct__cl_event = opaque {};
const GLDEBUGPROC = ?fn (GLenum, GLenum, GLuint, GLenum, GLsizei, [*c]const GLchar, ?*const c_void) callconv(.C) void;
const GLDEBUGPROCARB = ?fn (GLenum, GLenum, GLuint, GLenum, GLsizei, [*c]const GLchar, ?*const c_void) callconv(.C) void;
const GLDEBUGPROCKHR = ?fn (GLenum, GLenum, GLuint, GLenum, GLsizei, [*c]const GLchar, ?*const c_void) callconv(.C) void;
const GLDEBUGPROCAMD = ?fn (GLuint, GLenum, GLenum, GLsizei, [*c]const GLchar, ?*c_void) callconv(.C) void;
const GLhalfNV = c_ushort;
const GLvdpauSurfaceNV = GLintptr;
const GLVULKANPROCNV = ?fn () callconv(.C) void;
extern var GLAD_GL_VERSION_1_0: c_int;
const PFNGLCULLFACEPROC = ?fn (GLenum) callconv(.C) void;
extern var glad_glCullFace: PFNGLCULLFACEPROC;
const PFNGLFRONTFACEPROC = ?fn (GLenum) callconv(.C) void;
extern var glad_glFrontFace: PFNGLFRONTFACEPROC;
const PFNGLHINTPROC = ?fn (GLenum, GLenum) callconv(.C) void;
extern var glad_glHint: PFNGLHINTPROC;
const PFNGLLINEWIDTHPROC = ?fn (GLfloat) callconv(.C) void;
extern var glad_glLineWidth: PFNGLLINEWIDTHPROC;
const PFNGLPOINTSIZEPROC = ?fn (GLfloat) callconv(.C) void;
extern var glad_glPointSize: PFNGLPOINTSIZEPROC;
const PFNGLPOLYGONMODEPROC = ?fn (GLenum, GLenum) callconv(.C) void;
extern var glad_glPolygonMode: PFNGLPOLYGONMODEPROC;
const PFNGLSCISSORPROC = ?fn (GLint, GLint, GLsizei, GLsizei) callconv(.C) void;
extern var glad_glScissor: PFNGLSCISSORPROC;
const PFNGLTEXPARAMETERFPROC = ?fn (GLenum, GLenum, GLfloat) callconv(.C) void;
extern var glad_glTexParameterf: PFNGLTEXPARAMETERFPROC;
const PFNGLTEXPARAMETERFVPROC = ?fn (GLenum, GLenum, [*c]const GLfloat) callconv(.C) void;
extern var glad_glTexParameterfv: PFNGLTEXPARAMETERFVPROC;
const PFNGLTEXPARAMETERIPROC = ?fn (GLenum, GLenum, GLint) callconv(.C) void;
extern var glad_glTexParameteri: PFNGLTEXPARAMETERIPROC;
const PFNGLTEXPARAMETERIVPROC = ?fn (GLenum, GLenum, [*c]const GLint) callconv(.C) void;
extern var glad_glTexParameteriv: PFNGLTEXPARAMETERIVPROC;
const PFNGLTEXIMAGE1DPROC = ?fn (GLenum, GLint, GLint, GLsizei, GLint, GLenum, GLenum, ?*const c_void) callconv(.C) void;
extern var glad_glTexImage1D: PFNGLTEXIMAGE1DPROC;
const PFNGLTEXIMAGE2DPROC = ?fn (GLenum, GLint, GLint, GLsizei, GLsizei, GLint, GLenum, GLenum, ?*const c_void) callconv(.C) void;
extern var glad_glTexImage2D: PFNGLTEXIMAGE2DPROC;
const PFNGLDRAWBUFFERPROC = ?fn (GLenum) callconv(.C) void;
extern var glad_glDrawBuffer: PFNGLDRAWBUFFERPROC;
const PFNGLCLEARPROC = ?fn (GLbitfield) callconv(.C) void;
extern var glad_glClear: PFNGLCLEARPROC;
const PFNGLCLEARCOLORPROC = ?fn (GLfloat, GLfloat, GLfloat, GLfloat) callconv(.C) void;
extern var glad_glClearColor: PFNGLCLEARCOLORPROC;
const PFNGLCLEARSTENCILPROC = ?fn (GLint) callconv(.C) void;
extern var glad_glClearStencil: PFNGLCLEARSTENCILPROC;
const PFNGLCLEARDEPTHPROC = ?fn (GLdouble) callconv(.C) void;
extern var glad_glClearDepth: PFNGLCLEARDEPTHPROC;
const PFNGLSTENCILMASKPROC = ?fn (GLuint) callconv(.C) void;
extern var glad_glStencilMask: PFNGLSTENCILMASKPROC;
const PFNGLCOLORMASKPROC = ?fn (GLboolean, GLboolean, GLboolean, GLboolean) callconv(.C) void;
extern var glad_glColorMask: PFNGLCOLORMASKPROC;
const PFNGLDEPTHMASKPROC = ?fn (GLboolean) callconv(.C) void;
extern var glad_glDepthMask: PFNGLDEPTHMASKPROC;
const PFNGLDISABLEPROC = ?fn (GLenum) callconv(.C) void;
extern var glad_glDisable: PFNGLDISABLEPROC;
const PFNGLENABLEPROC = ?fn (GLenum) callconv(.C) void;
extern var glad_glEnable: PFNGLENABLEPROC;
const PFNGLFINISHPROC = ?fn () callconv(.C) void;
extern var glad_glFinish: PFNGLFINISHPROC;
const PFNGLFLUSHPROC = ?fn () callconv(.C) void;
extern var glad_glFlush: PFNGLFLUSHPROC;
const PFNGLBLENDFUNCPROC = ?fn (GLenum, GLenum) callconv(.C) void;
extern var glad_glBlendFunc: PFNGLBLENDFUNCPROC;
const PFNGLLOGICOPPROC = ?fn (GLenum) callconv(.C) void;
extern var glad_glLogicOp: PFNGLLOGICOPPROC;
const PFNGLSTENCILFUNCPROC = ?fn (GLenum, GLint, GLuint) callconv(.C) void;
extern var glad_glStencilFunc: PFNGLSTENCILFUNCPROC;
const PFNGLSTENCILOPPROC = ?fn (GLenum, GLenum, GLenum) callconv(.C) void;
extern var glad_glStencilOp: PFNGLSTENCILOPPROC;
const PFNGLDEPTHFUNCPROC = ?fn (GLenum) callconv(.C) void;
extern var glad_glDepthFunc: PFNGLDEPTHFUNCPROC;
const PFNGLPIXELSTOREFPROC = ?fn (GLenum, GLfloat) callconv(.C) void;
extern var glad_glPixelStoref: PFNGLPIXELSTOREFPROC;
const PFNGLPIXELSTOREIPROC = ?fn (GLenum, GLint) callconv(.C) void;
extern var glad_glPixelStorei: PFNGLPIXELSTOREIPROC;
const PFNGLREADBUFFERPROC = ?fn (GLenum) callconv(.C) void;
extern var glad_glReadBuffer: PFNGLREADBUFFERPROC;
const PFNGLREADPIXELSPROC = ?fn (GLint, GLint, GLsizei, GLsizei, GLenum, GLenum, ?*c_void) callconv(.C) void;
extern var glad_glReadPixels: PFNGLREADPIXELSPROC;
const PFNGLGETBOOLEANVPROC = ?fn (GLenum, [*c]GLboolean) callconv(.C) void;
extern var glad_glGetBooleanv: PFNGLGETBOOLEANVPROC;
const PFNGLGETDOUBLEVPROC = ?fn (GLenum, [*c]GLdouble) callconv(.C) void;
extern var glad_glGetDoublev: PFNGLGETDOUBLEVPROC;
const PFNGLGETERRORPROC = ?fn () callconv(.C) GLenum;
extern var glad_glGetError: PFNGLGETERRORPROC;
const PFNGLGETFLOATVPROC = ?fn (GLenum, [*c]GLfloat) callconv(.C) void;
extern var glad_glGetFloatv: PFNGLGETFLOATVPROC;
const PFNGLGETINTEGERVPROC = ?fn (GLenum, [*c]GLint) callconv(.C) void;
extern var glad_glGetIntegerv: PFNGLGETINTEGERVPROC;
const PFNGLGETSTRINGPROC = ?fn (GLenum) callconv(.C) [*c]const GLubyte;
extern var glad_glGetString: PFNGLGETSTRINGPROC;
const PFNGLGETTEXIMAGEPROC = ?fn (GLenum, GLint, GLenum, GLenum, ?*c_void) callconv(.C) void;
extern var glad_glGetTexImage: PFNGLGETTEXIMAGEPROC;
const PFNGLGETTEXPARAMETERFVPROC = ?fn (GLenum, GLenum, [*c]GLfloat) callconv(.C) void;
extern var glad_glGetTexParameterfv: PFNGLGETTEXPARAMETERFVPROC;
const PFNGLGETTEXPARAMETERIVPROC = ?fn (GLenum, GLenum, [*c]GLint) callconv(.C) void;
extern var glad_glGetTexParameteriv: PFNGLGETTEXPARAMETERIVPROC;
const PFNGLGETTEXLEVELPARAMETERFVPROC = ?fn (GLenum, GLint, GLenum, [*c]GLfloat) callconv(.C) void;
extern var glad_glGetTexLevelParameterfv: PFNGLGETTEXLEVELPARAMETERFVPROC;
const PFNGLGETTEXLEVELPARAMETERIVPROC = ?fn (GLenum, GLint, GLenum, [*c]GLint) callconv(.C) void;
extern var glad_glGetTexLevelParameteriv: PFNGLGETTEXLEVELPARAMETERIVPROC;
const PFNGLISENABLEDPROC = ?fn (GLenum) callconv(.C) GLboolean;
extern var glad_glIsEnabled: PFNGLISENABLEDPROC;
const PFNGLDEPTHRANGEPROC = ?fn (GLdouble, GLdouble) callconv(.C) void;
extern var glad_glDepthRange: PFNGLDEPTHRANGEPROC;
const PFNGLVIEWPORTPROC = ?fn (GLint, GLint, GLsizei, GLsizei) callconv(.C) void;
extern var glad_glViewport: PFNGLVIEWPORTPROC;
extern var GLAD_GL_VERSION_1_1: c_int;
const PFNGLDRAWARRAYSPROC = ?fn (GLenum, GLint, GLsizei) callconv(.C) void;
extern var glad_glDrawArrays: PFNGLDRAWARRAYSPROC;
const PFNGLDRAWELEMENTSPROC = ?fn (GLenum, GLsizei, GLenum, ?*const c_void) callconv(.C) void;
extern var glad_glDrawElements: PFNGLDRAWELEMENTSPROC;
const PFNGLPOLYGONOFFSETPROC = ?fn (GLfloat, GLfloat) callconv(.C) void;
extern var glad_glPolygonOffset: PFNGLPOLYGONOFFSETPROC;
const PFNGLCOPYTEXIMAGE1DPROC = ?fn (GLenum, GLint, GLenum, GLint, GLint, GLsizei, GLint) callconv(.C) void;
extern var glad_glCopyTexImage1D: PFNGLCOPYTEXIMAGE1DPROC;
const PFNGLCOPYTEXIMAGE2DPROC = ?fn (GLenum, GLint, GLenum, GLint, GLint, GLsizei, GLsizei, GLint) callconv(.C) void;
extern var glad_glCopyTexImage2D: PFNGLCOPYTEXIMAGE2DPROC;
const PFNGLCOPYTEXSUBIMAGE1DPROC = ?fn (GLenum, GLint, GLint, GLint, GLint, GLsizei) callconv(.C) void;
extern var glad_glCopyTexSubImage1D: PFNGLCOPYTEXSUBIMAGE1DPROC;
const PFNGLCOPYTEXSUBIMAGE2DPROC = ?fn (GLenum, GLint, GLint, GLint, GLint, GLint, GLsizei, GLsizei) callconv(.C) void;
extern var glad_glCopyTexSubImage2D: PFNGLCOPYTEXSUBIMAGE2DPROC;
const PFNGLTEXSUBIMAGE1DPROC = ?fn (GLenum, GLint, GLint, GLsizei, GLenum, GLenum, ?*const c_void) callconv(.C) void;
extern var glad_glTexSubImage1D: PFNGLTEXSUBIMAGE1DPROC;
const PFNGLTEXSUBIMAGE2DPROC = ?fn (GLenum, GLint, GLint, GLint, GLsizei, GLsizei, GLenum, GLenum, ?*const c_void) callconv(.C) void;
extern var glad_glTexSubImage2D: PFNGLTEXSUBIMAGE2DPROC;
const PFNGLBINDTEXTUREPROC = ?fn (GLenum, GLuint) callconv(.C) void;
extern var glad_glBindTexture: PFNGLBINDTEXTUREPROC;
const PFNGLDELETETEXTURESPROC = ?fn (GLsizei, [*c]const GLuint) callconv(.C) void;
extern var glad_glDeleteTextures: PFNGLDELETETEXTURESPROC;
const PFNGLGENTEXTURESPROC = ?fn (GLsizei, [*c]GLuint) callconv(.C) void;
extern var glad_glGenTextures: PFNGLGENTEXTURESPROC;
const PFNGLISTEXTUREPROC = ?fn (GLuint) callconv(.C) GLboolean;
extern var glad_glIsTexture: PFNGLISTEXTUREPROC;
extern var GLAD_GL_VERSION_1_2: c_int;
const PFNGLDRAWRANGEELEMENTSPROC = ?fn (GLenum, GLuint, GLuint, GLsizei, GLenum, ?*const c_void) callconv(.C) void;
extern var glad_glDrawRangeElements: PFNGLDRAWRANGEELEMENTSPROC;
const PFNGLTEXIMAGE3DPROC = ?fn (GLenum, GLint, GLint, GLsizei, GLsizei, GLsizei, GLint, GLenum, GLenum, ?*const c_void) callconv(.C) void;
extern var glad_glTexImage3D: PFNGLTEXIMAGE3DPROC;
const PFNGLTEXSUBIMAGE3DPROC = ?fn (GLenum, GLint, GLint, GLint, GLint, GLsizei, GLsizei, GLsizei, GLenum, GLenum, ?*const c_void) callconv(.C) void;
extern var glad_glTexSubImage3D: PFNGLTEXSUBIMAGE3DPROC;
const PFNGLCOPYTEXSUBIMAGE3DPROC = ?fn (GLenum, GLint, GLint, GLint, GLint, GLint, GLint, GLsizei, GLsizei) callconv(.C) void;
extern var glad_glCopyTexSubImage3D: PFNGLCOPYTEXSUBIMAGE3DPROC;
extern var GLAD_GL_VERSION_1_3: c_int;
const PFNGLACTIVETEXTUREPROC = ?fn (GLenum) callconv(.C) void;
extern var glad_glActiveTexture: PFNGLACTIVETEXTUREPROC;
const PFNGLSAMPLECOVERAGEPROC = ?fn (GLfloat, GLboolean) callconv(.C) void;
extern var glad_glSampleCoverage: PFNGLSAMPLECOVERAGEPROC;
const PFNGLCOMPRESSEDTEXIMAGE3DPROC = ?fn (GLenum, GLint, GLenum, GLsizei, GLsizei, GLsizei, GLint, GLsizei, ?*const c_void) callconv(.C) void;
extern var glad_glCompressedTexImage3D: PFNGLCOMPRESSEDTEXIMAGE3DPROC;
const PFNGLCOMPRESSEDTEXIMAGE2DPROC = ?fn (GLenum, GLint, GLenum, GLsizei, GLsizei, GLint, GLsizei, ?*const c_void) callconv(.C) void;
extern var glad_glCompressedTexImage2D: PFNGLCOMPRESSEDTEXIMAGE2DPROC;
const PFNGLCOMPRESSEDTEXIMAGE1DPROC = ?fn (GLenum, GLint, GLenum, GLsizei, GLint, GLsizei, ?*const c_void) callconv(.C) void;
extern var glad_glCompressedTexImage1D: PFNGLCOMPRESSEDTEXIMAGE1DPROC;
const PFNGLCOMPRESSEDTEXSUBIMAGE3DPROC = ?fn (GLenum, GLint, GLint, GLint, GLint, GLsizei, GLsizei, GLsizei, GLenum, GLsizei, ?*const c_void) callconv(.C) void;
extern var glad_glCompressedTexSubImage3D: PFNGLCOMPRESSEDTEXSUBIMAGE3DPROC;
const PFNGLCOMPRESSEDTEXSUBIMAGE2DPROC = ?fn (GLenum, GLint, GLint, GLint, GLsizei, GLsizei, GLenum, GLsizei, ?*const c_void) callconv(.C) void;
extern var glad_glCompressedTexSubImage2D: PFNGLCOMPRESSEDTEXSUBIMAGE2DPROC;
const PFNGLCOMPRESSEDTEXSUBIMAGE1DPROC = ?fn (GLenum, GLint, GLint, GLsizei, GLenum, GLsizei, ?*const c_void) callconv(.C) void;
extern var glad_glCompressedTexSubImage1D: PFNGLCOMPRESSEDTEXSUBIMAGE1DPROC;
const PFNGLGETCOMPRESSEDTEXIMAGEPROC = ?fn (GLenum, GLint, ?*c_void) callconv(.C) void;
extern var glad_glGetCompressedTexImage: PFNGLGETCOMPRESSEDTEXIMAGEPROC;
extern var GLAD_GL_VERSION_1_4: c_int;
const PFNGLBLENDFUNCSEPARATEPROC = ?fn (GLenum, GLenum, GLenum, GLenum) callconv(.C) void;
extern var glad_glBlendFuncSeparate: PFNGLBLENDFUNCSEPARATEPROC;
const PFNGLMULTIDRAWARRAYSPROC = ?fn (GLenum, [*c]const GLint, [*c]const GLsizei, GLsizei) callconv(.C) void;
extern var glad_glMultiDrawArrays: PFNGLMULTIDRAWARRAYSPROC;
const PFNGLMULTIDRAWELEMENTSPROC = ?fn (GLenum, [*c]const GLsizei, GLenum, [*c]const ?*const c_void, GLsizei) callconv(.C) void;
extern var glad_glMultiDrawElements: PFNGLMULTIDRAWELEMENTSPROC;
const PFNGLPOINTPARAMETERFPROC = ?fn (GLenum, GLfloat) callconv(.C) void;
extern var glad_glPointParameterf: PFNGLPOINTPARAMETERFPROC;
const PFNGLPOINTPARAMETERFVPROC = ?fn (GLenum, [*c]const GLfloat) callconv(.C) void;
extern var glad_glPointParameterfv: PFNGLPOINTPARAMETERFVPROC;
const PFNGLPOINTPARAMETERIPROC = ?fn (GLenum, GLint) callconv(.C) void;
extern var glad_glPointParameteri: PFNGLPOINTPARAMETERIPROC;
const PFNGLPOINTPARAMETERIVPROC = ?fn (GLenum, [*c]const GLint) callconv(.C) void;
extern var glad_glPointParameteriv: PFNGLPOINTPARAMETERIVPROC;
const PFNGLBLENDCOLORPROC = ?fn (GLfloat, GLfloat, GLfloat, GLfloat) callconv(.C) void;
extern var glad_glBlendColor: PFNGLBLENDCOLORPROC;
const PFNGLBLENDEQUATIONPROC = ?fn (GLenum) callconv(.C) void;
extern var glad_glBlendEquation: PFNGLBLENDEQUATIONPROC;
extern var GLAD_GL_VERSION_1_5: c_int;
const PFNGLGENQUERIESPROC = ?fn (GLsizei, [*c]GLuint) callconv(.C) void;
extern var glad_glGenQueries: PFNGLGENQUERIESPROC;
const PFNGLDELETEQUERIESPROC = ?fn (GLsizei, [*c]const GLuint) callconv(.C) void;
extern var glad_glDeleteQueries: PFNGLDELETEQUERIESPROC;
const PFNGLISQUERYPROC = ?fn (GLuint) callconv(.C) GLboolean;
extern var glad_glIsQuery: PFNGLISQUERYPROC;
const PFNGLBEGINQUERYPROC = ?fn (GLenum, GLuint) callconv(.C) void;
extern var glad_glBeginQuery: PFNGLBEGINQUERYPROC;
const PFNGLENDQUERYPROC = ?fn (GLenum) callconv(.C) void;
extern var glad_glEndQuery: PFNGLENDQUERYPROC;
const PFNGLGETQUERYIVPROC = ?fn (GLenum, GLenum, [*c]GLint) callconv(.C) void;
extern var glad_glGetQueryiv: PFNGLGETQUERYIVPROC;
const PFNGLGETQUERYOBJECTIVPROC = ?fn (GLuint, GLenum, [*c]GLint) callconv(.C) void;
extern var glad_glGetQueryObjectiv: PFNGLGETQUERYOBJECTIVPROC;
const PFNGLGETQUERYOBJECTUIVPROC = ?fn (GLuint, GLenum, [*c]GLuint) callconv(.C) void;
extern var glad_glGetQueryObjectuiv: PFNGLGETQUERYOBJECTUIVPROC;
const PFNGLBINDBUFFERPROC = ?fn (GLenum, GLuint) callconv(.C) void;
extern var glad_glBindBuffer: PFNGLBINDBUFFERPROC;
const PFNGLDELETEBUFFERSPROC = ?fn (GLsizei, [*c]const GLuint) callconv(.C) void;
extern var glad_glDeleteBuffers: PFNGLDELETEBUFFERSPROC;
const PFNGLGENBUFFERSPROC = ?fn (GLsizei, [*c]GLuint) callconv(.C) void;
extern var glad_glGenBuffers: PFNGLGENBUFFERSPROC;
const PFNGLISBUFFERPROC = ?fn (GLuint) callconv(.C) GLboolean;
extern var glad_glIsBuffer: PFNGLISBUFFERPROC;
const PFNGLBUFFERDATAPROC = ?fn (GLenum, GLsizeiptr, ?*const c_void, GLenum) callconv(.C) void;
extern var glad_glBufferData: PFNGLBUFFERDATAPROC;
const PFNGLBUFFERSUBDATAPROC = ?fn (GLenum, GLintptr, GLsizeiptr, ?*const c_void) callconv(.C) void;
extern var glad_glBufferSubData: PFNGLBUFFERSUBDATAPROC;
const PFNGLGETBUFFERSUBDATAPROC = ?fn (GLenum, GLintptr, GLsizeiptr, ?*c_void) callconv(.C) void;
extern var glad_glGetBufferSubData: PFNGLGETBUFFERSUBDATAPROC;
const PFNGLMAPBUFFERPROC = ?fn (GLenum, GLenum) callconv(.C) ?*c_void;
extern var glad_glMapBuffer: PFNGLMAPBUFFERPROC;
const PFNGLUNMAPBUFFERPROC = ?fn (GLenum) callconv(.C) GLboolean;
extern var glad_glUnmapBuffer: PFNGLUNMAPBUFFERPROC;
const PFNGLGETBUFFERPARAMETERIVPROC = ?fn (GLenum, GLenum, [*c]GLint) callconv(.C) void;
extern var glad_glGetBufferParameteriv: PFNGLGETBUFFERPARAMETERIVPROC;
const PFNGLGETBUFFERPOINTERVPROC = ?fn (GLenum, GLenum, [*c]?*c_void) callconv(.C) void;
extern var glad_glGetBufferPointerv: PFNGLGETBUFFERPOINTERVPROC;
extern var GLAD_GL_VERSION_2_0: c_int;
const PFNGLBLENDEQUATIONSEPARATEPROC = ?fn (GLenum, GLenum) callconv(.C) void;
extern var glad_glBlendEquationSeparate: PFNGLBLENDEQUATIONSEPARATEPROC;
const PFNGLDRAWBUFFERSPROC = ?fn (GLsizei, [*c]const GLenum) callconv(.C) void;
extern var glad_glDrawBuffers: PFNGLDRAWBUFFERSPROC;
const PFNGLSTENCILOPSEPARATEPROC = ?fn (GLenum, GLenum, GLenum, GLenum) callconv(.C) void;
extern var glad_glStencilOpSeparate: PFNGLSTENCILOPSEPARATEPROC;
const PFNGLSTENCILFUNCSEPARATEPROC = ?fn (GLenum, GLenum, GLint, GLuint) callconv(.C) void;
extern var glad_glStencilFuncSeparate: PFNGLSTENCILFUNCSEPARATEPROC;
const PFNGLSTENCILMASKSEPARATEPROC = ?fn (GLenum, GLuint) callconv(.C) void;
extern var glad_glStencilMaskSeparate: PFNGLSTENCILMASKSEPARATEPROC;
const PFNGLATTACHSHADERPROC = ?fn (GLuint, GLuint) callconv(.C) void;
extern var glad_glAttachShader: PFNGLATTACHSHADERPROC;
const PFNGLBINDATTRIBLOCATIONPROC = ?fn (GLuint, GLuint, [*c]const GLchar) callconv(.C) void;
extern var glad_glBindAttribLocation: PFNGLBINDATTRIBLOCATIONPROC;
const PFNGLCOMPILESHADERPROC = ?fn (GLuint) callconv(.C) void;
extern var glad_glCompileShader: PFNGLCOMPILESHADERPROC;
const PFNGLCREATEPROGRAMPROC = ?fn () callconv(.C) GLuint;
extern var glad_glCreateProgram: PFNGLCREATEPROGRAMPROC;
const PFNGLCREATESHADERPROC = ?fn (GLenum) callconv(.C) GLuint;
extern var glad_glCreateShader: PFNGLCREATESHADERPROC;
const PFNGLDELETEPROGRAMPROC = ?fn (GLuint) callconv(.C) void;
extern var glad_glDeleteProgram: PFNGLDELETEPROGRAMPROC;
const PFNGLDELETESHADERPROC = ?fn (GLuint) callconv(.C) void;
extern var glad_glDeleteShader: PFNGLDELETESHADERPROC;
const PFNGLDETACHSHADERPROC = ?fn (GLuint, GLuint) callconv(.C) void;
extern var glad_glDetachShader: PFNGLDETACHSHADERPROC;
const PFNGLDISABLEVERTEXATTRIBARRAYPROC = ?fn (GLuint) callconv(.C) void;
extern var glad_glDisableVertexAttribArray: PFNGLDISABLEVERTEXATTRIBARRAYPROC;
const PFNGLENABLEVERTEXATTRIBARRAYPROC = ?fn (GLuint) callconv(.C) void;
extern var glad_glEnableVertexAttribArray: PFNGLENABLEVERTEXATTRIBARRAYPROC;
const PFNGLGETACTIVEATTRIBPROC = ?fn (GLuint, GLuint, GLsizei, [*c]GLsizei, [*c]GLint, [*c]GLenum, [*c]GLchar) callconv(.C) void;
extern var glad_glGetActiveAttrib: PFNGLGETACTIVEATTRIBPROC;
const PFNGLGETACTIVEUNIFORMPROC = ?fn (GLuint, GLuint, GLsizei, [*c]GLsizei, [*c]GLint, [*c]GLenum, [*c]GLchar) callconv(.C) void;
extern var glad_glGetActiveUniform: PFNGLGETACTIVEUNIFORMPROC;
const PFNGLGETATTACHEDSHADERSPROC = ?fn (GLuint, GLsizei, [*c]GLsizei, [*c]GLuint) callconv(.C) void;
extern var glad_glGetAttachedShaders: PFNGLGETATTACHEDSHADERSPROC;
const PFNGLGETATTRIBLOCATIONPROC = ?fn (GLuint, [*c]const GLchar) callconv(.C) GLint;
extern var glad_glGetAttribLocation: PFNGLGETATTRIBLOCATIONPROC;
const PFNGLGETPROGRAMIVPROC = ?fn (GLuint, GLenum, [*c]GLint) callconv(.C) void;
extern var glad_glGetProgramiv: PFNGLGETPROGRAMIVPROC;
const PFNGLGETPROGRAMINFOLOGPROC = ?fn (GLuint, GLsizei, [*c]GLsizei, [*c]GLchar) callconv(.C) void;
extern var glad_glGetProgramInfoLog: PFNGLGETPROGRAMINFOLOGPROC;
const PFNGLGETSHADERIVPROC = ?fn (GLuint, GLenum, [*c]GLint) callconv(.C) void;
extern var glad_glGetShaderiv: PFNGLGETSHADERIVPROC;
const PFNGLGETSHADERINFOLOGPROC = ?fn (GLuint, GLsizei, [*c]GLsizei, [*c]GLchar) callconv(.C) void;
extern var glad_glGetShaderInfoLog: PFNGLGETSHADERINFOLOGPROC;
const PFNGLGETSHADERSOURCEPROC = ?fn (GLuint, GLsizei, [*c]GLsizei, [*c]GLchar) callconv(.C) void;
extern var glad_glGetShaderSource: PFNGLGETSHADERSOURCEPROC;
const PFNGLGETUNIFORMLOCATIONPROC = ?fn (GLuint, [*c]const GLchar) callconv(.C) GLint;
extern var glad_glGetUniformLocation: PFNGLGETUNIFORMLOCATIONPROC;
const PFNGLGETUNIFORMFVPROC = ?fn (GLuint, GLint, [*c]GLfloat) callconv(.C) void;
extern var glad_glGetUniformfv: PFNGLGETUNIFORMFVPROC;
const PFNGLGETUNIFORMIVPROC = ?fn (GLuint, GLint, [*c]GLint) callconv(.C) void;
extern var glad_glGetUniformiv: PFNGLGETUNIFORMIVPROC;
const PFNGLGETVERTEXATTRIBDVPROC = ?fn (GLuint, GLenum, [*c]GLdouble) callconv(.C) void;
extern var glad_glGetVertexAttribdv: PFNGLGETVERTEXATTRIBDVPROC;
const PFNGLGETVERTEXATTRIBFVPROC = ?fn (GLuint, GLenum, [*c]GLfloat) callconv(.C) void;
extern var glad_glGetVertexAttribfv: PFNGLGETVERTEXATTRIBFVPROC;
const PFNGLGETVERTEXATTRIBIVPROC = ?fn (GLuint, GLenum, [*c]GLint) callconv(.C) void;
extern var glad_glGetVertexAttribiv: PFNGLGETVERTEXATTRIBIVPROC;
const PFNGLGETVERTEXATTRIBPOINTERVPROC = ?fn (GLuint, GLenum, [*c]?*c_void) callconv(.C) void;
extern var glad_glGetVertexAttribPointerv: PFNGLGETVERTEXATTRIBPOINTERVPROC;
const PFNGLISPROGRAMPROC = ?fn (GLuint) callconv(.C) GLboolean;
extern var glad_glIsProgram: PFNGLISPROGRAMPROC;
const PFNGLISSHADERPROC = ?fn (GLuint) callconv(.C) GLboolean;
extern var glad_glIsShader: PFNGLISSHADERPROC;
const PFNGLLINKPROGRAMPROC = ?fn (GLuint) callconv(.C) void;
extern var glad_glLinkProgram: PFNGLLINKPROGRAMPROC;
const PFNGLSHADERSOURCEPROC = ?fn (GLuint, GLsizei, [*c]const [*c]const GLchar, [*c]const GLint) callconv(.C) void;
extern var glad_glShaderSource: PFNGLSHADERSOURCEPROC;
const PFNGLUSEPROGRAMPROC = ?fn (GLuint) callconv(.C) void;
extern var glad_glUseProgram: PFNGLUSEPROGRAMPROC;
const PFNGLUNIFORM1FPROC = ?fn (GLint, GLfloat) callconv(.C) void;
extern var glad_glUniform1f: PFNGLUNIFORM1FPROC;
const PFNGLUNIFORM2FPROC = ?fn (GLint, GLfloat, GLfloat) callconv(.C) void;
extern var glad_glUniform2f: PFNGLUNIFORM2FPROC;
const PFNGLUNIFORM3FPROC = ?fn (GLint, GLfloat, GLfloat, GLfloat) callconv(.C) void;
extern var glad_glUniform3f: PFNGLUNIFORM3FPROC;
const PFNGLUNIFORM4FPROC = ?fn (GLint, GLfloat, GLfloat, GLfloat, GLfloat) callconv(.C) void;
extern var glad_glUniform4f: PFNGLUNIFORM4FPROC;
const PFNGLUNIFORM1IPROC = ?fn (GLint, GLint) callconv(.C) void;
extern var glad_glUniform1i: PFNGLUNIFORM1IPROC;
const PFNGLUNIFORM2IPROC = ?fn (GLint, GLint, GLint) callconv(.C) void;
extern var glad_glUniform2i: PFNGLUNIFORM2IPROC;
const PFNGLUNIFORM3IPROC = ?fn (GLint, GLint, GLint, GLint) callconv(.C) void;
extern var glad_glUniform3i: PFNGLUNIFORM3IPROC;
const PFNGLUNIFORM4IPROC = ?fn (GLint, GLint, GLint, GLint, GLint) callconv(.C) void;
extern var glad_glUniform4i: PFNGLUNIFORM4IPROC;
const PFNGLUNIFORM1FVPROC = ?fn (GLint, GLsizei, [*c]const GLfloat) callconv(.C) void;
extern var glad_glUniform1fv: PFNGLUNIFORM1FVPROC;
const PFNGLUNIFORM2FVPROC = ?fn (GLint, GLsizei, [*c]const GLfloat) callconv(.C) void;
extern var glad_glUniform2fv: PFNGLUNIFORM2FVPROC;
const PFNGLUNIFORM3FVPROC = ?fn (GLint, GLsizei, [*c]const GLfloat) callconv(.C) void;
extern var glad_glUniform3fv: PFNGLUNIFORM3FVPROC;
const PFNGLUNIFORM4FVPROC = ?fn (GLint, GLsizei, [*c]const GLfloat) callconv(.C) void;
extern var glad_glUniform4fv: PFNGLUNIFORM4FVPROC;
const PFNGLUNIFORM1IVPROC = ?fn (GLint, GLsizei, [*c]const GLint) callconv(.C) void;
extern var glad_glUniform1iv: PFNGLUNIFORM1IVPROC;
const PFNGLUNIFORM2IVPROC = ?fn (GLint, GLsizei, [*c]const GLint) callconv(.C) void;
extern var glad_glUniform2iv: PFNGLUNIFORM2IVPROC;
const PFNGLUNIFORM3IVPROC = ?fn (GLint, GLsizei, [*c]const GLint) callconv(.C) void;
extern var glad_glUniform3iv: PFNGLUNIFORM3IVPROC;
const PFNGLUNIFORM4IVPROC = ?fn (GLint, GLsizei, [*c]const GLint) callconv(.C) void;
extern var glad_glUniform4iv: PFNGLUNIFORM4IVPROC;
const PFNGLUNIFORMMATRIX2FVPROC = ?fn (GLint, GLsizei, GLboolean, [*c]const GLfloat) callconv(.C) void;
extern var glad_glUniformMatrix2fv: PFNGLUNIFORMMATRIX2FVPROC;
const PFNGLUNIFORMMATRIX3FVPROC = ?fn (GLint, GLsizei, GLboolean, [*c]const GLfloat) callconv(.C) void;
extern var glad_glUniformMatrix3fv: PFNGLUNIFORMMATRIX3FVPROC;
const PFNGLUNIFORMMATRIX4FVPROC = ?fn (GLint, GLsizei, GLboolean, [*c]const GLfloat) callconv(.C) void;
extern var glad_glUniformMatrix4fv: PFNGLUNIFORMMATRIX4FVPROC;
const PFNGLVALIDATEPROGRAMPROC = ?fn (GLuint) callconv(.C) void;
extern var glad_glValidateProgram: PFNGLVALIDATEPROGRAMPROC;
const PFNGLVERTEXATTRIB1DPROC = ?fn (GLuint, GLdouble) callconv(.C) void;
extern var glad_glVertexAttrib1d: PFNGLVERTEXATTRIB1DPROC;
const PFNGLVERTEXATTRIB1DVPROC = ?fn (GLuint, [*c]const GLdouble) callconv(.C) void;
extern var glad_glVertexAttrib1dv: PFNGLVERTEXATTRIB1DVPROC;
const PFNGLVERTEXATTRIB1FPROC = ?fn (GLuint, GLfloat) callconv(.C) void;
extern var glad_glVertexAttrib1f: PFNGLVERTEXATTRIB1FPROC;
const PFNGLVERTEXATTRIB1FVPROC = ?fn (GLuint, [*c]const GLfloat) callconv(.C) void;
extern var glad_glVertexAttrib1fv: PFNGLVERTEXATTRIB1FVPROC;
const PFNGLVERTEXATTRIB1SPROC = ?fn (GLuint, GLshort) callconv(.C) void;
extern var glad_glVertexAttrib1s: PFNGLVERTEXATTRIB1SPROC;
const PFNGLVERTEXATTRIB1SVPROC = ?fn (GLuint, [*c]const GLshort) callconv(.C) void;
extern var glad_glVertexAttrib1sv: PFNGLVERTEXATTRIB1SVPROC;
const PFNGLVERTEXATTRIB2DPROC = ?fn (GLuint, GLdouble, GLdouble) callconv(.C) void;
extern var glad_glVertexAttrib2d: PFNGLVERTEXATTRIB2DPROC;
const PFNGLVERTEXATTRIB2DVPROC = ?fn (GLuint, [*c]const GLdouble) callconv(.C) void;
extern var glad_glVertexAttrib2dv: PFNGLVERTEXATTRIB2DVPROC;
const PFNGLVERTEXATTRIB2FPROC = ?fn (GLuint, GLfloat, GLfloat) callconv(.C) void;
extern var glad_glVertexAttrib2f: PFNGLVERTEXATTRIB2FPROC;
const PFNGLVERTEXATTRIB2FVPROC = ?fn (GLuint, [*c]const GLfloat) callconv(.C) void;
extern var glad_glVertexAttrib2fv: PFNGLVERTEXATTRIB2FVPROC;
const PFNGLVERTEXATTRIB2SPROC = ?fn (GLuint, GLshort, GLshort) callconv(.C) void;
extern var glad_glVertexAttrib2s: PFNGLVERTEXATTRIB2SPROC;
const PFNGLVERTEXATTRIB2SVPROC = ?fn (GLuint, [*c]const GLshort) callconv(.C) void;
extern var glad_glVertexAttrib2sv: PFNGLVERTEXATTRIB2SVPROC;
const PFNGLVERTEXATTRIB3DPROC = ?fn (GLuint, GLdouble, GLdouble, GLdouble) callconv(.C) void;
extern var glad_glVertexAttrib3d: PFNGLVERTEXATTRIB3DPROC;
const PFNGLVERTEXATTRIB3DVPROC = ?fn (GLuint, [*c]const GLdouble) callconv(.C) void;
extern var glad_glVertexAttrib3dv: PFNGLVERTEXATTRIB3DVPROC;
const PFNGLVERTEXATTRIB3FPROC = ?fn (GLuint, GLfloat, GLfloat, GLfloat) callconv(.C) void;
extern var glad_glVertexAttrib3f: PFNGLVERTEXATTRIB3FPROC;
const PFNGLVERTEXATTRIB3FVPROC = ?fn (GLuint, [*c]const GLfloat) callconv(.C) void;
extern var glad_glVertexAttrib3fv: PFNGLVERTEXATTRIB3FVPROC;
const PFNGLVERTEXATTRIB3SPROC = ?fn (GLuint, GLshort, GLshort, GLshort) callconv(.C) void;
extern var glad_glVertexAttrib3s: PFNGLVERTEXATTRIB3SPROC;
const PFNGLVERTEXATTRIB3SVPROC = ?fn (GLuint, [*c]const GLshort) callconv(.C) void;
extern var glad_glVertexAttrib3sv: PFNGLVERTEXATTRIB3SVPROC;
const PFNGLVERTEXATTRIB4NBVPROC = ?fn (GLuint, [*c]const GLbyte) callconv(.C) void;
extern var glad_glVertexAttrib4Nbv: PFNGLVERTEXATTRIB4NBVPROC;
const PFNGLVERTEXATTRIB4NIVPROC = ?fn (GLuint, [*c]const GLint) callconv(.C) void;
extern var glad_glVertexAttrib4Niv: PFNGLVERTEXATTRIB4NIVPROC;
const PFNGLVERTEXATTRIB4NSVPROC = ?fn (GLuint, [*c]const GLshort) callconv(.C) void;
extern var glad_glVertexAttrib4Nsv: PFNGLVERTEXATTRIB4NSVPROC;
const PFNGLVERTEXATTRIB4NUBPROC = ?fn (GLuint, GLubyte, GLubyte, GLubyte, GLubyte) callconv(.C) void;
extern var glad_glVertexAttrib4Nub: PFNGLVERTEXATTRIB4NUBPROC;
const PFNGLVERTEXATTRIB4NUBVPROC = ?fn (GLuint, [*c]const GLubyte) callconv(.C) void;
extern var glad_glVertexAttrib4Nubv: PFNGLVERTEXATTRIB4NUBVPROC;
const PFNGLVERTEXATTRIB4NUIVPROC = ?fn (GLuint, [*c]const GLuint) callconv(.C) void;
extern var glad_glVertexAttrib4Nuiv: PFNGLVERTEXATTRIB4NUIVPROC;
const PFNGLVERTEXATTRIB4NUSVPROC = ?fn (GLuint, [*c]const GLushort) callconv(.C) void;
extern var glad_glVertexAttrib4Nusv: PFNGLVERTEXATTRIB4NUSVPROC;
const PFNGLVERTEXATTRIB4BVPROC = ?fn (GLuint, [*c]const GLbyte) callconv(.C) void;
extern var glad_glVertexAttrib4bv: PFNGLVERTEXATTRIB4BVPROC;
const PFNGLVERTEXATTRIB4DPROC = ?fn (GLuint, GLdouble, GLdouble, GLdouble, GLdouble) callconv(.C) void;
extern var glad_glVertexAttrib4d: PFNGLVERTEXATTRIB4DPROC;
const PFNGLVERTEXATTRIB4DVPROC = ?fn (GLuint, [*c]const GLdouble) callconv(.C) void;
extern var glad_glVertexAttrib4dv: PFNGLVERTEXATTRIB4DVPROC;
const PFNGLVERTEXATTRIB4FPROC = ?fn (GLuint, GLfloat, GLfloat, GLfloat, GLfloat) callconv(.C) void;
extern var glad_glVertexAttrib4f: PFNGLVERTEXATTRIB4FPROC;
const PFNGLVERTEXATTRIB4FVPROC = ?fn (GLuint, [*c]const GLfloat) callconv(.C) void;
extern var glad_glVertexAttrib4fv: PFNGLVERTEXATTRIB4FVPROC;
const PFNGLVERTEXATTRIB4IVPROC = ?fn (GLuint, [*c]const GLint) callconv(.C) void;
extern var glad_glVertexAttrib4iv: PFNGLVERTEXATTRIB4IVPROC;
const PFNGLVERTEXATTRIB4SPROC = ?fn (GLuint, GLshort, GLshort, GLshort, GLshort) callconv(.C) void;
extern var glad_glVertexAttrib4s: PFNGLVERTEXATTRIB4SPROC;
const PFNGLVERTEXATTRIB4SVPROC = ?fn (GLuint, [*c]const GLshort) callconv(.C) void;
extern var glad_glVertexAttrib4sv: PFNGLVERTEXATTRIB4SVPROC;
const PFNGLVERTEXATTRIB4UBVPROC = ?fn (GLuint, [*c]const GLubyte) callconv(.C) void;
extern var glad_glVertexAttrib4ubv: PFNGLVERTEXATTRIB4UBVPROC;
const PFNGLVERTEXATTRIB4UIVPROC = ?fn (GLuint, [*c]const GLuint) callconv(.C) void;
extern var glad_glVertexAttrib4uiv: PFNGLVERTEXATTRIB4UIVPROC;
const PFNGLVERTEXATTRIB4USVPROC = ?fn (GLuint, [*c]const GLushort) callconv(.C) void;
extern var glad_glVertexAttrib4usv: PFNGLVERTEXATTRIB4USVPROC;
const PFNGLVERTEXATTRIBPOINTERPROC = ?fn (GLuint, GLint, GLenum, GLboolean, GLsizei, ?*const c_void) callconv(.C) void;
extern var glad_glVertexAttribPointer: PFNGLVERTEXATTRIBPOINTERPROC;
extern var GLAD_GL_VERSION_2_1: c_int;
const PFNGLUNIFORMMATRIX2X3FVPROC = ?fn (GLint, GLsizei, GLboolean, [*c]const GLfloat) callconv(.C) void;
extern var glad_glUniformMatrix2x3fv: PFNGLUNIFORMMATRIX2X3FVPROC;
const PFNGLUNIFORMMATRIX3X2FVPROC = ?fn (GLint, GLsizei, GLboolean, [*c]const GLfloat) callconv(.C) void;
extern var glad_glUniformMatrix3x2fv: PFNGLUNIFORMMATRIX3X2FVPROC;
const PFNGLUNIFORMMATRIX2X4FVPROC = ?fn (GLint, GLsizei, GLboolean, [*c]const GLfloat) callconv(.C) void;
extern var glad_glUniformMatrix2x4fv: PFNGLUNIFORMMATRIX2X4FVPROC;
const PFNGLUNIFORMMATRIX4X2FVPROC = ?fn (GLint, GLsizei, GLboolean, [*c]const GLfloat) callconv(.C) void;
extern var glad_glUniformMatrix4x2fv: PFNGLUNIFORMMATRIX4X2FVPROC;
const PFNGLUNIFORMMATRIX3X4FVPROC = ?fn (GLint, GLsizei, GLboolean, [*c]const GLfloat) callconv(.C) void;
extern var glad_glUniformMatrix3x4fv: PFNGLUNIFORMMATRIX3X4FVPROC;
const PFNGLUNIFORMMATRIX4X3FVPROC = ?fn (GLint, GLsizei, GLboolean, [*c]const GLfloat) callconv(.C) void;
extern var glad_glUniformMatrix4x3fv: PFNGLUNIFORMMATRIX4X3FVPROC;
extern var GLAD_GL_VERSION_3_0: c_int;
const PFNGLCOLORMASKIPROC = ?fn (GLuint, GLboolean, GLboolean, GLboolean, GLboolean) callconv(.C) void;
extern var glad_glColorMaski: PFNGLCOLORMASKIPROC;
const PFNGLGETBOOLEANI_VPROC = ?fn (GLenum, GLuint, [*c]GLboolean) callconv(.C) void;
extern var glad_glGetBooleani_v: PFNGLGETBOOLEANI_VPROC;
const PFNGLGETINTEGERI_VPROC = ?fn (GLenum, GLuint, [*c]GLint) callconv(.C) void;
extern var glad_glGetIntegeri_v: PFNGLGETINTEGERI_VPROC;
const PFNGLENABLEIPROC = ?fn (GLenum, GLuint) callconv(.C) void;
extern var glad_glEnablei: PFNGLENABLEIPROC;
const PFNGLDISABLEIPROC = ?fn (GLenum, GLuint) callconv(.C) void;
extern var glad_glDisablei: PFNGLDISABLEIPROC;
const PFNGLISENABLEDIPROC = ?fn (GLenum, GLuint) callconv(.C) GLboolean;
extern var glad_glIsEnabledi: PFNGLISENABLEDIPROC;
const PFNGLBEGINTRANSFORMFEEDBACKPROC = ?fn (GLenum) callconv(.C) void;
extern var glad_glBeginTransformFeedback: PFNGLBEGINTRANSFORMFEEDBACKPROC;
const PFNGLENDTRANSFORMFEEDBACKPROC = ?fn () callconv(.C) void;
extern var glad_glEndTransformFeedback: PFNGLENDTRANSFORMFEEDBACKPROC;
const PFNGLBINDBUFFERRANGEPROC = ?fn (GLenum, GLuint, GLuint, GLintptr, GLsizeiptr) callconv(.C) void;
extern var glad_glBindBufferRange: PFNGLBINDBUFFERRANGEPROC;
const PFNGLBINDBUFFERBASEPROC = ?fn (GLenum, GLuint, GLuint) callconv(.C) void;
extern var glad_glBindBufferBase: PFNGLBINDBUFFERBASEPROC;
const PFNGLTRANSFORMFEEDBACKVARYINGSPROC = ?fn (GLuint, GLsizei, [*c]const [*c]const GLchar, GLenum) callconv(.C) void;
extern var glad_glTransformFeedbackVaryings: PFNGLTRANSFORMFEEDBACKVARYINGSPROC;
const PFNGLGETTRANSFORMFEEDBACKVARYINGPROC = ?fn (GLuint, GLuint, GLsizei, [*c]GLsizei, [*c]GLsizei, [*c]GLenum, [*c]GLchar) callconv(.C) void;
extern var glad_glGetTransformFeedbackVarying: PFNGLGETTRANSFORMFEEDBACKVARYINGPROC;
const PFNGLCLAMPCOLORPROC = ?fn (GLenum, GLenum) callconv(.C) void;
extern var glad_glClampColor: PFNGLCLAMPCOLORPROC;
const PFNGLBEGINCONDITIONALRENDERPROC = ?fn (GLuint, GLenum) callconv(.C) void;
extern var glad_glBeginConditionalRender: PFNGLBEGINCONDITIONALRENDERPROC;
const PFNGLENDCONDITIONALRENDERPROC = ?fn () callconv(.C) void;
extern var glad_glEndConditionalRender: PFNGLENDCONDITIONALRENDERPROC;
const PFNGLVERTEXATTRIBIPOINTERPROC = ?fn (GLuint, GLint, GLenum, GLsizei, ?*const c_void) callconv(.C) void;
extern var glad_glVertexAttribIPointer: PFNGLVERTEXATTRIBIPOINTERPROC;
const PFNGLGETVERTEXATTRIBIIVPROC = ?fn (GLuint, GLenum, [*c]GLint) callconv(.C) void;
extern var glad_glGetVertexAttribIiv: PFNGLGETVERTEXATTRIBIIVPROC;
const PFNGLGETVERTEXATTRIBIUIVPROC = ?fn (GLuint, GLenum, [*c]GLuint) callconv(.C) void;
extern var glad_glGetVertexAttribIuiv: PFNGLGETVERTEXATTRIBIUIVPROC;
const PFNGLVERTEXATTRIBI1IPROC = ?fn (GLuint, GLint) callconv(.C) void;
extern var glad_glVertexAttribI1i: PFNGLVERTEXATTRIBI1IPROC;
const PFNGLVERTEXATTRIBI2IPROC = ?fn (GLuint, GLint, GLint) callconv(.C) void;
extern var glad_glVertexAttribI2i: PFNGLVERTEXATTRIBI2IPROC;
const PFNGLVERTEXATTRIBI3IPROC = ?fn (GLuint, GLint, GLint, GLint) callconv(.C) void;
extern var glad_glVertexAttribI3i: PFNGLVERTEXATTRIBI3IPROC;
const PFNGLVERTEXATTRIBI4IPROC = ?fn (GLuint, GLint, GLint, GLint, GLint) callconv(.C) void;
extern var glad_glVertexAttribI4i: PFNGLVERTEXATTRIBI4IPROC;
const PFNGLVERTEXATTRIBI1UIPROC = ?fn (GLuint, GLuint) callconv(.C) void;
extern var glad_glVertexAttribI1ui: PFNGLVERTEXATTRIBI1UIPROC;
const PFNGLVERTEXATTRIBI2UIPROC = ?fn (GLuint, GLuint, GLuint) callconv(.C) void;
extern var glad_glVertexAttribI2ui: PFNGLVERTEXATTRIBI2UIPROC;
const PFNGLVERTEXATTRIBI3UIPROC = ?fn (GLuint, GLuint, GLuint, GLuint) callconv(.C) void;
extern var glad_glVertexAttribI3ui: PFNGLVERTEXATTRIBI3UIPROC;
const PFNGLVERTEXATTRIBI4UIPROC = ?fn (GLuint, GLuint, GLuint, GLuint, GLuint) callconv(.C) void;
extern var glad_glVertexAttribI4ui: PFNGLVERTEXATTRIBI4UIPROC;
const PFNGLVERTEXATTRIBI1IVPROC = ?fn (GLuint, [*c]const GLint) callconv(.C) void;
extern var glad_glVertexAttribI1iv: PFNGLVERTEXATTRIBI1IVPROC;
const PFNGLVERTEXATTRIBI2IVPROC = ?fn (GLuint, [*c]const GLint) callconv(.C) void;
extern var glad_glVertexAttribI2iv: PFNGLVERTEXATTRIBI2IVPROC;
const PFNGLVERTEXATTRIBI3IVPROC = ?fn (GLuint, [*c]const GLint) callconv(.C) void;
extern var glad_glVertexAttribI3iv: PFNGLVERTEXATTRIBI3IVPROC;
const PFNGLVERTEXATTRIBI4IVPROC = ?fn (GLuint, [*c]const GLint) callconv(.C) void;
extern var glad_glVertexAttribI4iv: PFNGLVERTEXATTRIBI4IVPROC;
const PFNGLVERTEXATTRIBI1UIVPROC = ?fn (GLuint, [*c]const GLuint) callconv(.C) void;
extern var glad_glVertexAttribI1uiv: PFNGLVERTEXATTRIBI1UIVPROC;
const PFNGLVERTEXATTRIBI2UIVPROC = ?fn (GLuint, [*c]const GLuint) callconv(.C) void;
extern var glad_glVertexAttribI2uiv: PFNGLVERTEXATTRIBI2UIVPROC;
const PFNGLVERTEXATTRIBI3UIVPROC = ?fn (GLuint, [*c]const GLuint) callconv(.C) void;
extern var glad_glVertexAttribI3uiv: PFNGLVERTEXATTRIBI3UIVPROC;
const PFNGLVERTEXATTRIBI4UIVPROC = ?fn (GLuint, [*c]const GLuint) callconv(.C) void;
extern var glad_glVertexAttribI4uiv: PFNGLVERTEXATTRIBI4UIVPROC;
const PFNGLVERTEXATTRIBI4BVPROC = ?fn (GLuint, [*c]const GLbyte) callconv(.C) void;
extern var glad_glVertexAttribI4bv: PFNGLVERTEXATTRIBI4BVPROC;
const PFNGLVERTEXATTRIBI4SVPROC = ?fn (GLuint, [*c]const GLshort) callconv(.C) void;
extern var glad_glVertexAttribI4sv: PFNGLVERTEXATTRIBI4SVPROC;
const PFNGLVERTEXATTRIBI4UBVPROC = ?fn (GLuint, [*c]const GLubyte) callconv(.C) void;
extern var glad_glVertexAttribI4ubv: PFNGLVERTEXATTRIBI4UBVPROC;
const PFNGLVERTEXATTRIBI4USVPROC = ?fn (GLuint, [*c]const GLushort) callconv(.C) void;
extern var glad_glVertexAttribI4usv: PFNGLVERTEXATTRIBI4USVPROC;
const PFNGLGETUNIFORMUIVPROC = ?fn (GLuint, GLint, [*c]GLuint) callconv(.C) void;
extern var glad_glGetUniformuiv: PFNGLGETUNIFORMUIVPROC;
const PFNGLBINDFRAGDATALOCATIONPROC = ?fn (GLuint, GLuint, [*c]const GLchar) callconv(.C) void;
extern var glad_glBindFragDataLocation: PFNGLBINDFRAGDATALOCATIONPROC;
const PFNGLGETFRAGDATALOCATIONPROC = ?fn (GLuint, [*c]const GLchar) callconv(.C) GLint;
extern var glad_glGetFragDataLocation: PFNGLGETFRAGDATALOCATIONPROC;
const PFNGLUNIFORM1UIPROC = ?fn (GLint, GLuint) callconv(.C) void;
extern var glad_glUniform1ui: PFNGLUNIFORM1UIPROC;
const PFNGLUNIFORM2UIPROC = ?fn (GLint, GLuint, GLuint) callconv(.C) void;
extern var glad_glUniform2ui: PFNGLUNIFORM2UIPROC;
const PFNGLUNIFORM3UIPROC = ?fn (GLint, GLuint, GLuint, GLuint) callconv(.C) void;
extern var glad_glUniform3ui: PFNGLUNIFORM3UIPROC;
const PFNGLUNIFORM4UIPROC = ?fn (GLint, GLuint, GLuint, GLuint, GLuint) callconv(.C) void;
extern var glad_glUniform4ui: PFNGLUNIFORM4UIPROC;
const PFNGLUNIFORM1UIVPROC = ?fn (GLint, GLsizei, [*c]const GLuint) callconv(.C) void;
extern var glad_glUniform1uiv: PFNGLUNIFORM1UIVPROC;
const PFNGLUNIFORM2UIVPROC = ?fn (GLint, GLsizei, [*c]const GLuint) callconv(.C) void;
extern var glad_glUniform2uiv: PFNGLUNIFORM2UIVPROC;
const PFNGLUNIFORM3UIVPROC = ?fn (GLint, GLsizei, [*c]const GLuint) callconv(.C) void;
extern var glad_glUniform3uiv: PFNGLUNIFORM3UIVPROC;
const PFNGLUNIFORM4UIVPROC = ?fn (GLint, GLsizei, [*c]const GLuint) callconv(.C) void;
extern var glad_glUniform4uiv: PFNGLUNIFORM4UIVPROC;
const PFNGLTEXPARAMETERIIVPROC = ?fn (GLenum, GLenum, [*c]const GLint) callconv(.C) void;
extern var glad_glTexParameterIiv: PFNGLTEXPARAMETERIIVPROC;
const PFNGLTEXPARAMETERIUIVPROC = ?fn (GLenum, GLenum, [*c]const GLuint) callconv(.C) void;
extern var glad_glTexParameterIuiv: PFNGLTEXPARAMETERIUIVPROC;
const PFNGLGETTEXPARAMETERIIVPROC = ?fn (GLenum, GLenum, [*c]GLint) callconv(.C) void;
extern var glad_glGetTexParameterIiv: PFNGLGETTEXPARAMETERIIVPROC;
const PFNGLGETTEXPARAMETERIUIVPROC = ?fn (GLenum, GLenum, [*c]GLuint) callconv(.C) void;
extern var glad_glGetTexParameterIuiv: PFNGLGETTEXPARAMETERIUIVPROC;
const PFNGLCLEARBUFFERIVPROC = ?fn (GLenum, GLint, [*c]const GLint) callconv(.C) void;
extern var glad_glClearBufferiv: PFNGLCLEARBUFFERIVPROC;
const PFNGLCLEARBUFFERUIVPROC = ?fn (GLenum, GLint, [*c]const GLuint) callconv(.C) void;
extern var glad_glClearBufferuiv: PFNGLCLEARBUFFERUIVPROC;
const PFNGLCLEARBUFFERFVPROC = ?fn (GLenum, GLint, [*c]const GLfloat) callconv(.C) void;
extern var glad_glClearBufferfv: PFNGLCLEARBUFFERFVPROC;
const PFNGLCLEARBUFFERFIPROC = ?fn (GLenum, GLint, GLfloat, GLint) callconv(.C) void;
extern var glad_glClearBufferfi: PFNGLCLEARBUFFERFIPROC;
const PFNGLGETSTRINGIPROC = ?fn (GLenum, GLuint) callconv(.C) [*c]const GLubyte;
extern var glad_glGetStringi: PFNGLGETSTRINGIPROC;
const PFNGLISRENDERBUFFERPROC = ?fn (GLuint) callconv(.C) GLboolean;
extern var glad_glIsRenderbuffer: PFNGLISRENDERBUFFERPROC;
const PFNGLBINDRENDERBUFFERPROC = ?fn (GLenum, GLuint) callconv(.C) void;
extern var glad_glBindRenderbuffer: PFNGLBINDRENDERBUFFERPROC;
const PFNGLDELETERENDERBUFFERSPROC = ?fn (GLsizei, [*c]const GLuint) callconv(.C) void;
extern var glad_glDeleteRenderbuffers: PFNGLDELETERENDERBUFFERSPROC;
const PFNGLGENRENDERBUFFERSPROC = ?fn (GLsizei, [*c]GLuint) callconv(.C) void;
extern var glad_glGenRenderbuffers: PFNGLGENRENDERBUFFERSPROC;
const PFNGLRENDERBUFFERSTORAGEPROC = ?fn (GLenum, GLenum, GLsizei, GLsizei) callconv(.C) void;
extern var glad_glRenderbufferStorage: PFNGLRENDERBUFFERSTORAGEPROC;
const PFNGLGETRENDERBUFFERPARAMETERIVPROC = ?fn (GLenum, GLenum, [*c]GLint) callconv(.C) void;
extern var glad_glGetRenderbufferParameteriv: PFNGLGETRENDERBUFFERPARAMETERIVPROC;
const PFNGLISFRAMEBUFFERPROC = ?fn (GLuint) callconv(.C) GLboolean;
extern var glad_glIsFramebuffer: PFNGLISFRAMEBUFFERPROC;
const PFNGLBINDFRAMEBUFFERPROC = ?fn (GLenum, GLuint) callconv(.C) void;
extern var glad_glBindFramebuffer: PFNGLBINDFRAMEBUFFERPROC;
const PFNGLDELETEFRAMEBUFFERSPROC = ?fn (GLsizei, [*c]const GLuint) callconv(.C) void;
extern var glad_glDeleteFramebuffers: PFNGLDELETEFRAMEBUFFERSPROC;
const PFNGLGENFRAMEBUFFERSPROC = ?fn (GLsizei, [*c]GLuint) callconv(.C) void;
extern var glad_glGenFramebuffers: PFNGLGENFRAMEBUFFERSPROC;
const PFNGLCHECKFRAMEBUFFERSTATUSPROC = ?fn (GLenum) callconv(.C) GLenum;
extern var glad_glCheckFramebufferStatus: PFNGLCHECKFRAMEBUFFERSTATUSPROC;
const PFNGLFRAMEBUFFERTEXTURE1DPROC = ?fn (GLenum, GLenum, GLenum, GLuint, GLint) callconv(.C) void;
extern var glad_glFramebufferTexture1D: PFNGLFRAMEBUFFERTEXTURE1DPROC;
const PFNGLFRAMEBUFFERTEXTURE2DPROC = ?fn (GLenum, GLenum, GLenum, GLuint, GLint) callconv(.C) void;
extern var glad_glFramebufferTexture2D: PFNGLFRAMEBUFFERTEXTURE2DPROC;
const PFNGLFRAMEBUFFERTEXTURE3DPROC = ?fn (GLenum, GLenum, GLenum, GLuint, GLint, GLint) callconv(.C) void;
extern var glad_glFramebufferTexture3D: PFNGLFRAMEBUFFERTEXTURE3DPROC;
const PFNGLFRAMEBUFFERRENDERBUFFERPROC = ?fn (GLenum, GLenum, GLenum, GLuint) callconv(.C) void;
extern var glad_glFramebufferRenderbuffer: PFNGLFRAMEBUFFERRENDERBUFFERPROC;
const PFNGLGETFRAMEBUFFERATTACHMENTPARAMETERIVPROC = ?fn (GLenum, GLenum, GLenum, [*c]GLint) callconv(.C) void;
extern var glad_glGetFramebufferAttachmentParameteriv: PFNGLGETFRAMEBUFFERATTACHMENTPARAMETERIVPROC;
const PFNGLGENERATEMIPMAPPROC = ?fn (GLenum) callconv(.C) void;
extern var glad_glGenerateMipmap: PFNGLGENERATEMIPMAPPROC;
const PFNGLBLITFRAMEBUFFERPROC = ?fn (GLint, GLint, GLint, GLint, GLint, GLint, GLint, GLint, GLbitfield, GLenum) callconv(.C) void;
extern var glad_glBlitFramebuffer: PFNGLBLITFRAMEBUFFERPROC;
const PFNGLRENDERBUFFERSTORAGEMULTISAMPLEPROC = ?fn (GLenum, GLsizei, GLenum, GLsizei, GLsizei) callconv(.C) void;
extern var glad_glRenderbufferStorageMultisample: PFNGLRENDERBUFFERSTORAGEMULTISAMPLEPROC;
const PFNGLFRAMEBUFFERTEXTURELAYERPROC = ?fn (GLenum, GLenum, GLuint, GLint, GLint) callconv(.C) void;
extern var glad_glFramebufferTextureLayer: PFNGLFRAMEBUFFERTEXTURELAYERPROC;
const PFNGLMAPBUFFERRANGEPROC = ?fn (GLenum, GLintptr, GLsizeiptr, GLbitfield) callconv(.C) ?*c_void;
extern var glad_glMapBufferRange: PFNGLMAPBUFFERRANGEPROC;
const PFNGLFLUSHMAPPEDBUFFERRANGEPROC = ?fn (GLenum, GLintptr, GLsizeiptr) callconv(.C) void;
extern var glad_glFlushMappedBufferRange: PFNGLFLUSHMAPPEDBUFFERRANGEPROC;
const PFNGLBINDVERTEXARRAYPROC = ?fn (GLuint) callconv(.C) void;
extern var glad_glBindVertexArray: PFNGLBINDVERTEXARRAYPROC;
const PFNGLDELETEVERTEXARRAYSPROC = ?fn (GLsizei, [*c]const GLuint) callconv(.C) void;
extern var glad_glDeleteVertexArrays: PFNGLDELETEVERTEXARRAYSPROC;
const PFNGLGENVERTEXARRAYSPROC = ?fn (GLsizei, [*c]GLuint) callconv(.C) void;
extern var glad_glGenVertexArrays: PFNGLGENVERTEXARRAYSPROC;
const PFNGLISVERTEXARRAYPROC = ?fn (GLuint) callconv(.C) GLboolean;
extern var glad_glIsVertexArray: PFNGLISVERTEXARRAYPROC;
extern var GLAD_GL_VERSION_3_1: c_int;
const PFNGLDRAWARRAYSINSTANCEDPROC = ?fn (GLenum, GLint, GLsizei, GLsizei) callconv(.C) void;
extern var glad_glDrawArraysInstanced: PFNGLDRAWARRAYSINSTANCEDPROC;
const PFNGLDRAWELEMENTSINSTANCEDPROC = ?fn (GLenum, GLsizei, GLenum, ?*const c_void, GLsizei) callconv(.C) void;
extern var glad_glDrawElementsInstanced: PFNGLDRAWELEMENTSINSTANCEDPROC;
const PFNGLTEXBUFFERPROC = ?fn (GLenum, GLenum, GLuint) callconv(.C) void;
extern var glad_glTexBuffer: PFNGLTEXBUFFERPROC;
const PFNGLPRIMITIVERESTARTINDEXPROC = ?fn (GLuint) callconv(.C) void;
extern var glad_glPrimitiveRestartIndex: PFNGLPRIMITIVERESTARTINDEXPROC;
const PFNGLCOPYBUFFERSUBDATAPROC = ?fn (GLenum, GLenum, GLintptr, GLintptr, GLsizeiptr) callconv(.C) void;
extern var glad_glCopyBufferSubData: PFNGLCOPYBUFFERSUBDATAPROC;
const PFNGLGETUNIFORMINDICESPROC = ?fn (GLuint, GLsizei, [*c]const [*c]const GLchar, [*c]GLuint) callconv(.C) void;
extern var glad_glGetUniformIndices: PFNGLGETUNIFORMINDICESPROC;
const PFNGLGETACTIVEUNIFORMSIVPROC = ?fn (GLuint, GLsizei, [*c]const GLuint, GLenum, [*c]GLint) callconv(.C) void;
extern var glad_glGetActiveUniformsiv: PFNGLGETACTIVEUNIFORMSIVPROC;
const PFNGLGETACTIVEUNIFORMNAMEPROC = ?fn (GLuint, GLuint, GLsizei, [*c]GLsizei, [*c]GLchar) callconv(.C) void;
extern var glad_glGetActiveUniformName: PFNGLGETACTIVEUNIFORMNAMEPROC;
const PFNGLGETUNIFORMBLOCKINDEXPROC = ?fn (GLuint, [*c]const GLchar) callconv(.C) GLuint;
extern var glad_glGetUniformBlockIndex: PFNGLGETUNIFORMBLOCKINDEXPROC;
const PFNGLGETACTIVEUNIFORMBLOCKIVPROC = ?fn (GLuint, GLuint, GLenum, [*c]GLint) callconv(.C) void;
extern var glad_glGetActiveUniformBlockiv: PFNGLGETACTIVEUNIFORMBLOCKIVPROC;
const PFNGLGETACTIVEUNIFORMBLOCKNAMEPROC = ?fn (GLuint, GLuint, GLsizei, [*c]GLsizei, [*c]GLchar) callconv(.C) void;
extern var glad_glGetActiveUniformBlockName: PFNGLGETACTIVEUNIFORMBLOCKNAMEPROC;
const PFNGLUNIFORMBLOCKBINDINGPROC = ?fn (GLuint, GLuint, GLuint) callconv(.C) void;
extern var glad_glUniformBlockBinding: PFNGLUNIFORMBLOCKBINDINGPROC;
extern var GLAD_GL_VERSION_3_2: c_int;
const PFNGLDRAWELEMENTSBASEVERTEXPROC = ?fn (GLenum, GLsizei, GLenum, ?*const c_void, GLint) callconv(.C) void;
extern var glad_glDrawElementsBaseVertex: PFNGLDRAWELEMENTSBASEVERTEXPROC;
const PFNGLDRAWRANGEELEMENTSBASEVERTEXPROC = ?fn (GLenum, GLuint, GLuint, GLsizei, GLenum, ?*const c_void, GLint) callconv(.C) void;
extern var glad_glDrawRangeElementsBaseVertex: PFNGLDRAWRANGEELEMENTSBASEVERTEXPROC;
const PFNGLDRAWELEMENTSINSTANCEDBASEVERTEXPROC = ?fn (GLenum, GLsizei, GLenum, ?*const c_void, GLsizei, GLint) callconv(.C) void;
extern var glad_glDrawElementsInstancedBaseVertex: PFNGLDRAWELEMENTSINSTANCEDBASEVERTEXPROC;
const PFNGLMULTIDRAWELEMENTSBASEVERTEXPROC = ?fn (GLenum, [*c]const GLsizei, GLenum, [*c]const ?*const c_void, GLsizei, [*c]const GLint) callconv(.C) void;
extern var glad_glMultiDrawElementsBaseVertex: PFNGLMULTIDRAWELEMENTSBASEVERTEXPROC;
const PFNGLPROVOKINGVERTEXPROC = ?fn (GLenum) callconv(.C) void;
extern var glad_glProvokingVertex: PFNGLPROVOKINGVERTEXPROC;
const PFNGLFENCESYNCPROC = ?fn (GLenum, GLbitfield) callconv(.C) GLsync;
extern var glad_glFenceSync: PFNGLFENCESYNCPROC;
const PFNGLISSYNCPROC = ?fn (GLsync) callconv(.C) GLboolean;
extern var glad_glIsSync: PFNGLISSYNCPROC;
const PFNGLDELETESYNCPROC = ?fn (GLsync) callconv(.C) void;
extern var glad_glDeleteSync: PFNGLDELETESYNCPROC;
const PFNGLCLIENTWAITSYNCPROC = ?fn (GLsync, GLbitfield, GLuint64) callconv(.C) GLenum;
extern var glad_glClientWaitSync: PFNGLCLIENTWAITSYNCPROC;
const PFNGLWAITSYNCPROC = ?fn (GLsync, GLbitfield, GLuint64) callconv(.C) void;
extern var glad_glWaitSync: PFNGLWAITSYNCPROC;
const PFNGLGETINTEGER64VPROC = ?fn (GLenum, [*c]GLint64) callconv(.C) void;
extern var glad_glGetInteger64v: PFNGLGETINTEGER64VPROC;
const PFNGLGETSYNCIVPROC = ?fn (GLsync, GLenum, GLsizei, [*c]GLsizei, [*c]GLint) callconv(.C) void;
extern var glad_glGetSynciv: PFNGLGETSYNCIVPROC;
const PFNGLGETINTEGER64I_VPROC = ?fn (GLenum, GLuint, [*c]GLint64) callconv(.C) void;
extern var glad_glGetInteger64i_v: PFNGLGETINTEGER64I_VPROC;
const PFNGLGETBUFFERPARAMETERI64VPROC = ?fn (GLenum, GLenum, [*c]GLint64) callconv(.C) void;
extern var glad_glGetBufferParameteri64v: PFNGLGETBUFFERPARAMETERI64VPROC;
const PFNGLFRAMEBUFFERTEXTUREPROC = ?fn (GLenum, GLenum, GLuint, GLint) callconv(.C) void;
extern var glad_glFramebufferTexture: PFNGLFRAMEBUFFERTEXTUREPROC;
const PFNGLTEXIMAGE2DMULTISAMPLEPROC = ?fn (GLenum, GLsizei, GLenum, GLsizei, GLsizei, GLboolean) callconv(.C) void;
extern var glad_glTexImage2DMultisample: PFNGLTEXIMAGE2DMULTISAMPLEPROC;
const PFNGLTEXIMAGE3DMULTISAMPLEPROC = ?fn (GLenum, GLsizei, GLenum, GLsizei, GLsizei, GLsizei, GLboolean) callconv(.C) void;
extern var glad_glTexImage3DMultisample: PFNGLTEXIMAGE3DMULTISAMPLEPROC;
const PFNGLGETMULTISAMPLEFVPROC = ?fn (GLenum, GLuint, [*c]GLfloat) callconv(.C) void;
extern var glad_glGetMultisamplefv: PFNGLGETMULTISAMPLEFVPROC;
const PFNGLSAMPLEMASKIPROC = ?fn (GLuint, GLbitfield) callconv(.C) void;
extern var glad_glSampleMaski: PFNGLSAMPLEMASKIPROC;
extern var GLAD_GL_VERSION_3_3: c_int;
const PFNGLBINDFRAGDATALOCATIONINDEXEDPROC = ?fn (GLuint, GLuint, GLuint, [*c]const GLchar) callconv(.C) void;
extern var glad_glBindFragDataLocationIndexed: PFNGLBINDFRAGDATALOCATIONINDEXEDPROC;
const PFNGLGETFRAGDATAINDEXPROC = ?fn (GLuint, [*c]const GLchar) callconv(.C) GLint;
extern var glad_glGetFragDataIndex: PFNGLGETFRAGDATAINDEXPROC;
const PFNGLGENSAMPLERSPROC = ?fn (GLsizei, [*c]GLuint) callconv(.C) void;
extern var glad_glGenSamplers: PFNGLGENSAMPLERSPROC;
const PFNGLDELETESAMPLERSPROC = ?fn (GLsizei, [*c]const GLuint) callconv(.C) void;
extern var glad_glDeleteSamplers: PFNGLDELETESAMPLERSPROC;
const PFNGLISSAMPLERPROC = ?fn (GLuint) callconv(.C) GLboolean;
extern var glad_glIsSampler: PFNGLISSAMPLERPROC;
const PFNGLBINDSAMPLERPROC = ?fn (GLuint, GLuint) callconv(.C) void;
extern var glad_glBindSampler: PFNGLBINDSAMPLERPROC;
const PFNGLSAMPLERPARAMETERIPROC = ?fn (GLuint, GLenum, GLint) callconv(.C) void;
extern var glad_glSamplerParameteri: PFNGLSAMPLERPARAMETERIPROC;
const PFNGLSAMPLERPARAMETERIVPROC = ?fn (GLuint, GLenum, [*c]const GLint) callconv(.C) void;
extern var glad_glSamplerParameteriv: PFNGLSAMPLERPARAMETERIVPROC;
const PFNGLSAMPLERPARAMETERFPROC = ?fn (GLuint, GLenum, GLfloat) callconv(.C) void;
extern var glad_glSamplerParameterf: PFNGLSAMPLERPARAMETERFPROC;
const PFNGLSAMPLERPARAMETERFVPROC = ?fn (GLuint, GLenum, [*c]const GLfloat) callconv(.C) void;
extern var glad_glSamplerParameterfv: PFNGLSAMPLERPARAMETERFVPROC;
const PFNGLSAMPLERPARAMETERIIVPROC = ?fn (GLuint, GLenum, [*c]const GLint) callconv(.C) void;
extern var glad_glSamplerParameterIiv: PFNGLSAMPLERPARAMETERIIVPROC;
const PFNGLSAMPLERPARAMETERIUIVPROC = ?fn (GLuint, GLenum, [*c]const GLuint) callconv(.C) void;
extern var glad_glSamplerParameterIuiv: PFNGLSAMPLERPARAMETERIUIVPROC;
const PFNGLGETSAMPLERPARAMETERIVPROC = ?fn (GLuint, GLenum, [*c]GLint) callconv(.C) void;
extern var glad_glGetSamplerParameteriv: PFNGLGETSAMPLERPARAMETERIVPROC;
const PFNGLGETSAMPLERPARAMETERIIVPROC = ?fn (GLuint, GLenum, [*c]GLint) callconv(.C) void;
extern var glad_glGetSamplerParameterIiv: PFNGLGETSAMPLERPARAMETERIIVPROC;
const PFNGLGETSAMPLERPARAMETERFVPROC = ?fn (GLuint, GLenum, [*c]GLfloat) callconv(.C) void;
extern var glad_glGetSamplerParameterfv: PFNGLGETSAMPLERPARAMETERFVPROC;
const PFNGLGETSAMPLERPARAMETERIUIVPROC = ?fn (GLuint, GLenum, [*c]GLuint) callconv(.C) void;
extern var glad_glGetSamplerParameterIuiv: PFNGLGETSAMPLERPARAMETERIUIVPROC;
const PFNGLQUERYCOUNTERPROC = ?fn (GLuint, GLenum) callconv(.C) void;
extern var glad_glQueryCounter: PFNGLQUERYCOUNTERPROC;
const PFNGLGETQUERYOBJECTI64VPROC = ?fn (GLuint, GLenum, [*c]GLint64) callconv(.C) void;
extern var glad_glGetQueryObjecti64v: PFNGLGETQUERYOBJECTI64VPROC;
const PFNGLGETQUERYOBJECTUI64VPROC = ?fn (GLuint, GLenum, [*c]GLuint64) callconv(.C) void;
extern var glad_glGetQueryObjectui64v: PFNGLGETQUERYOBJECTUI64VPROC;
const PFNGLVERTEXATTRIBDIVISORPROC = ?fn (GLuint, GLuint) callconv(.C) void;
extern var glad_glVertexAttribDivisor: PFNGLVERTEXATTRIBDIVISORPROC;
const PFNGLVERTEXATTRIBP1UIPROC = ?fn (GLuint, GLenum, GLboolean, GLuint) callconv(.C) void;
extern var glad_glVertexAttribP1ui: PFNGLVERTEXATTRIBP1UIPROC;
const PFNGLVERTEXATTRIBP1UIVPROC = ?fn (GLuint, GLenum, GLboolean, [*c]const GLuint) callconv(.C) void;
extern var glad_glVertexAttribP1uiv: PFNGLVERTEXATTRIBP1UIVPROC;
const PFNGLVERTEXATTRIBP2UIPROC = ?fn (GLuint, GLenum, GLboolean, GLuint) callconv(.C) void;
extern var glad_glVertexAttribP2ui: PFNGLVERTEXATTRIBP2UIPROC;
const PFNGLVERTEXATTRIBP2UIVPROC = ?fn (GLuint, GLenum, GLboolean, [*c]const GLuint) callconv(.C) void;
extern var glad_glVertexAttribP2uiv: PFNGLVERTEXATTRIBP2UIVPROC;
const PFNGLVERTEXATTRIBP3UIPROC = ?fn (GLuint, GLenum, GLboolean, GLuint) callconv(.C) void;
extern var glad_glVertexAttribP3ui: PFNGLVERTEXATTRIBP3UIPROC;
const PFNGLVERTEXATTRIBP3UIVPROC = ?fn (GLuint, GLenum, GLboolean, [*c]const GLuint) callconv(.C) void;
extern var glad_glVertexAttribP3uiv: PFNGLVERTEXATTRIBP3UIVPROC;
const PFNGLVERTEXATTRIBP4UIPROC = ?fn (GLuint, GLenum, GLboolean, GLuint) callconv(.C) void;
extern var glad_glVertexAttribP4ui: PFNGLVERTEXATTRIBP4UIPROC;
const PFNGLVERTEXATTRIBP4UIVPROC = ?fn (GLuint, GLenum, GLboolean, [*c]const GLuint) callconv(.C) void;
extern var glad_glVertexAttribP4uiv: PFNGLVERTEXATTRIBP4UIVPROC;
const PFNGLVERTEXP2UIPROC = ?fn (GLenum, GLuint) callconv(.C) void;
extern var glad_glVertexP2ui: PFNGLVERTEXP2UIPROC;
const PFNGLVERTEXP2UIVPROC = ?fn (GLenum, [*c]const GLuint) callconv(.C) void;
extern var glad_glVertexP2uiv: PFNGLVERTEXP2UIVPROC;
const PFNGLVERTEXP3UIPROC = ?fn (GLenum, GLuint) callconv(.C) void;
extern var glad_glVertexP3ui: PFNGLVERTEXP3UIPROC;
const PFNGLVERTEXP3UIVPROC = ?fn (GLenum, [*c]const GLuint) callconv(.C) void;
extern var glad_glVertexP3uiv: PFNGLVERTEXP3UIVPROC;
const PFNGLVERTEXP4UIPROC = ?fn (GLenum, GLuint) callconv(.C) void;
extern var glad_glVertexP4ui: PFNGLVERTEXP4UIPROC;
const PFNGLVERTEXP4UIVPROC = ?fn (GLenum, [*c]const GLuint) callconv(.C) void;
extern var glad_glVertexP4uiv: PFNGLVERTEXP4UIVPROC;
const PFNGLTEXCOORDP1UIPROC = ?fn (GLenum, GLuint) callconv(.C) void;
extern var glad_glTexCoordP1ui: PFNGLTEXCOORDP1UIPROC;
const PFNGLTEXCOORDP1UIVPROC = ?fn (GLenum, [*c]const GLuint) callconv(.C) void;
extern var glad_glTexCoordP1uiv: PFNGLTEXCOORDP1UIVPROC;
const PFNGLTEXCOORDP2UIPROC = ?fn (GLenum, GLuint) callconv(.C) void;
extern var glad_glTexCoordP2ui: PFNGLTEXCOORDP2UIPROC;
const PFNGLTEXCOORDP2UIVPROC = ?fn (GLenum, [*c]const GLuint) callconv(.C) void;
extern var glad_glTexCoordP2uiv: PFNGLTEXCOORDP2UIVPROC;
const PFNGLTEXCOORDP3UIPROC = ?fn (GLenum, GLuint) callconv(.C) void;
extern var glad_glTexCoordP3ui: PFNGLTEXCOORDP3UIPROC;
const PFNGLTEXCOORDP3UIVPROC = ?fn (GLenum, [*c]const GLuint) callconv(.C) void;
extern var glad_glTexCoordP3uiv: PFNGLTEXCOORDP3UIVPROC;
const PFNGLTEXCOORDP4UIPROC = ?fn (GLenum, GLuint) callconv(.C) void;
extern var glad_glTexCoordP4ui: PFNGLTEXCOORDP4UIPROC;
const PFNGLTEXCOORDP4UIVPROC = ?fn (GLenum, [*c]const GLuint) callconv(.C) void;
extern var glad_glTexCoordP4uiv: PFNGLTEXCOORDP4UIVPROC;
const PFNGLMULTITEXCOORDP1UIPROC = ?fn (GLenum, GLenum, GLuint) callconv(.C) void;
extern var glad_glMultiTexCoordP1ui: PFNGLMULTITEXCOORDP1UIPROC;
const PFNGLMULTITEXCOORDP1UIVPROC = ?fn (GLenum, GLenum, [*c]const GLuint) callconv(.C) void;
extern var glad_glMultiTexCoordP1uiv: PFNGLMULTITEXCOORDP1UIVPROC;
const PFNGLMULTITEXCOORDP2UIPROC = ?fn (GLenum, GLenum, GLuint) callconv(.C) void;
extern var glad_glMultiTexCoordP2ui: PFNGLMULTITEXCOORDP2UIPROC;
const PFNGLMULTITEXCOORDP2UIVPROC = ?fn (GLenum, GLenum, [*c]const GLuint) callconv(.C) void;
extern var glad_glMultiTexCoordP2uiv: PFNGLMULTITEXCOORDP2UIVPROC;
const PFNGLMULTITEXCOORDP3UIPROC = ?fn (GLenum, GLenum, GLuint) callconv(.C) void;
extern var glad_glMultiTexCoordP3ui: PFNGLMULTITEXCOORDP3UIPROC;
const PFNGLMULTITEXCOORDP3UIVPROC = ?fn (GLenum, GLenum, [*c]const GLuint) callconv(.C) void;
extern var glad_glMultiTexCoordP3uiv: PFNGLMULTITEXCOORDP3UIVPROC;
const PFNGLMULTITEXCOORDP4UIPROC = ?fn (GLenum, GLenum, GLuint) callconv(.C) void;
extern var glad_glMultiTexCoordP4ui: PFNGLMULTITEXCOORDP4UIPROC;
const PFNGLMULTITEXCOORDP4UIVPROC = ?fn (GLenum, GLenum, [*c]const GLuint) callconv(.C) void;
extern var glad_glMultiTexCoordP4uiv: PFNGLMULTITEXCOORDP4UIVPROC;
const PFNGLNORMALP3UIPROC = ?fn (GLenum, GLuint) callconv(.C) void;
extern var glad_glNormalP3ui: PFNGLNORMALP3UIPROC;
const PFNGLNORMALP3UIVPROC = ?fn (GLenum, [*c]const GLuint) callconv(.C) void;
extern var glad_glNormalP3uiv: PFNGLNORMALP3UIVPROC;
const PFNGLCOLORP3UIPROC = ?fn (GLenum, GLuint) callconv(.C) void;
extern var glad_glColorP3ui: PFNGLCOLORP3UIPROC;
const PFNGLCOLORP3UIVPROC = ?fn (GLenum, [*c]const GLuint) callconv(.C) void;
extern var glad_glColorP3uiv: PFNGLCOLORP3UIVPROC;
const PFNGLCOLORP4UIPROC = ?fn (GLenum, GLuint) callconv(.C) void;
extern var glad_glColorP4ui: PFNGLCOLORP4UIPROC;
const PFNGLCOLORP4UIVPROC = ?fn (GLenum, [*c]const GLuint) callconv(.C) void;
extern var glad_glColorP4uiv: PFNGLCOLORP4UIVPROC;
const PFNGLSECONDARYCOLORP3UIPROC = ?fn (GLenum, GLuint) callconv(.C) void;
extern var glad_glSecondaryColorP3ui: PFNGLSECONDARYCOLORP3UIPROC;
const PFNGLSECONDARYCOLORP3UIVPROC = ?fn (GLenum, [*c]const GLuint) callconv(.C) void;
extern var glad_glSecondaryColorP3uiv: PFNGLSECONDARYCOLORP3UIVPROC;
const __llvm__ = @as(c_int, 1);
const __clang__ = @as(c_int, 1);
const __clang_major__ = @as(c_int, 12);
const __clang_minor__ = @as(c_int, 0);
const __clang_patchlevel__ = @as(c_int, 0);
const __clang_version__ = "12.0.0 (https://github.com/llvm/llvm-project fa0971b87fb2c9d14d1bba2551e61f02f18f329b)";
const __GNUC__ = @as(c_int, 4);
const __GNUC_MINOR__ = @as(c_int, 2);
const __GNUC_PATCHLEVEL__ = @as(c_int, 1);
const __GXX_ABI_VERSION = @as(c_int, 1002);
const __ATOMIC_RELAXED = @as(c_int, 0);
const __ATOMIC_CONSUME = @as(c_int, 1);
const __ATOMIC_ACQUIRE = @as(c_int, 2);
const __ATOMIC_RELEASE = @as(c_int, 3);
const __ATOMIC_ACQ_REL = @as(c_int, 4);
const __ATOMIC_SEQ_CST = @as(c_int, 5);
const __OPENCL_MEMORY_SCOPE_WORK_ITEM = @as(c_int, 0);
const __OPENCL_MEMORY_SCOPE_WORK_GROUP = @as(c_int, 1);
const __OPENCL_MEMORY_SCOPE_DEVICE = @as(c_int, 2);
const __OPENCL_MEMORY_SCOPE_ALL_SVM_DEVICES = @as(c_int, 3);
const __OPENCL_MEMORY_SCOPE_SUB_GROUP = @as(c_int, 4);
const __PRAGMA_REDEFINE_EXTNAME = @as(c_int, 1);
const __VERSION__ = "Clang 12.0.0 (https://github.com/llvm/llvm-project fa0971b87fb2c9d14d1bba2551e61f02f18f329b)";
const __OBJC_BOOL_IS_BOOL = @as(c_int, 0);
const __CONSTANT_CFSTRINGS__ = @as(c_int, 1);
const __SEH__ = @as(c_int, 1);
const __OPTIMIZE__ = @as(c_int, 1);
const __ORDER_LITTLE_ENDIAN__ = @as(c_int, 1234);
const __ORDER_BIG_ENDIAN__ = @as(c_int, 4321);
const __ORDER_PDP_ENDIAN__ = @as(c_int, 3412);
const __BYTE_ORDER__ = __ORDER_LITTLE_ENDIAN__;
const __LITTLE_ENDIAN__ = @as(c_int, 1);
const __CHAR_BIT__ = @as(c_int, 8);
const __SCHAR_MAX__ = @as(c_int, 127);
const __SHRT_MAX__ = @as(c_int, 32767);
const __INT_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
const __LONG_MAX__ = @as(c_long, 2147483647);
const __LONG_LONG_MAX__ = @as(c_longlong, 9223372036854775807);
const __WCHAR_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
const __WINT_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
const __INTMAX_MAX__ = @as(c_longlong, 9223372036854775807);
const __SIZE_MAX__ = @as(c_ulonglong, 18446744073709551615);
const __UINTMAX_MAX__ = @as(c_ulonglong, 18446744073709551615);
const __PTRDIFF_MAX__ = @as(c_longlong, 9223372036854775807);
const __INTPTR_MAX__ = @as(c_longlong, 9223372036854775807);
const __UINTPTR_MAX__ = @as(c_ulonglong, 18446744073709551615);
const __SIZEOF_DOUBLE__ = @as(c_int, 8);
const __SIZEOF_FLOAT__ = @as(c_int, 4);
const __SIZEOF_INT__ = @as(c_int, 4);
const __SIZEOF_LONG__ = @as(c_int, 4);
const __SIZEOF_LONG_DOUBLE__ = @as(c_int, 16);
const __SIZEOF_LONG_LONG__ = @as(c_int, 8);
const __SIZEOF_POINTER__ = @as(c_int, 8);
const __SIZEOF_SHORT__ = @as(c_int, 2);
const __SIZEOF_PTRDIFF_T__ = @as(c_int, 8);
const __SIZEOF_SIZE_T__ = @as(c_int, 8);
const __SIZEOF_WCHAR_T__ = @as(c_int, 2);
const __SIZEOF_WINT_T__ = @as(c_int, 2);
const __SIZEOF_INT128__ = @as(c_int, 16);
const __INTMAX_FMTd__ = "lld";
const __INTMAX_FMTi__ = "lli";
const __INTMAX_C_SUFFIX__ = LL;
const __UINTMAX_FMTo__ = "llo";
const __UINTMAX_FMTu__ = "llu";
const __UINTMAX_FMTx__ = "llx";
const __UINTMAX_FMTX__ = "llX";
const __UINTMAX_C_SUFFIX__ = ULL;
const __INTMAX_WIDTH__ = @as(c_int, 64);
const __PTRDIFF_FMTd__ = "lld";
const __PTRDIFF_FMTi__ = "lli";
const __PTRDIFF_WIDTH__ = @as(c_int, 64);
const __INTPTR_FMTd__ = "lld";
const __INTPTR_FMTi__ = "lli";
const __INTPTR_WIDTH__ = @as(c_int, 64);
const __SIZE_FMTo__ = "llo";
const __SIZE_FMTu__ = "llu";
const __SIZE_FMTx__ = "llx";
const __SIZE_FMTX__ = "llX";
const __SIZE_WIDTH__ = @as(c_int, 64);
const __WCHAR_TYPE__ = c_ushort;
const __WCHAR_WIDTH__ = @as(c_int, 16);
const __WINT_TYPE__ = c_ushort;
const __WINT_WIDTH__ = @as(c_int, 16);
const __SIG_ATOMIC_WIDTH__ = @as(c_int, 32);
const __SIG_ATOMIC_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
const __CHAR16_TYPE__ = c_ushort;
const __CHAR32_TYPE__ = c_uint;
const __UINTMAX_WIDTH__ = @as(c_int, 64);
const __UINTPTR_FMTo__ = "llo";
const __UINTPTR_FMTu__ = "llu";
const __UINTPTR_FMTx__ = "llx";
const __UINTPTR_FMTX__ = "llX";
const __UINTPTR_WIDTH__ = @as(c_int, 64);
const __FLT_DENORM_MIN__ = @as(f32, 1.40129846e-45);
const __FLT_HAS_DENORM__ = @as(c_int, 1);
const __FLT_DIG__ = @as(c_int, 6);
const __FLT_DECIMAL_DIG__ = @as(c_int, 9);
const __FLT_EPSILON__ = @as(f32, 1.19209290e-7);
const __FLT_HAS_INFINITY__ = @as(c_int, 1);
const __FLT_HAS_QUIET_NAN__ = @as(c_int, 1);
const __FLT_MANT_DIG__ = @as(c_int, 24);
const __FLT_MAX_10_EXP__ = @as(c_int, 38);
const __FLT_MAX_EXP__ = @as(c_int, 128);
const __FLT_MAX__ = @as(f32, 3.40282347e+38);
const __FLT_MIN_10_EXP__ = -@as(c_int, 37);
const __FLT_MIN_EXP__ = -@as(c_int, 125);
const __FLT_MIN__ = @as(f32, 1.17549435e-38);
const __DBL_DENORM_MIN__ = 4.9406564584124654e-324;
const __DBL_HAS_DENORM__ = @as(c_int, 1);
const __DBL_DIG__ = @as(c_int, 15);
const __DBL_DECIMAL_DIG__ = @as(c_int, 17);
const __DBL_EPSILON__ = 2.2204460492503131e-16;
const __DBL_HAS_INFINITY__ = @as(c_int, 1);
const __DBL_HAS_QUIET_NAN__ = @as(c_int, 1);
const __DBL_MANT_DIG__ = @as(c_int, 53);
const __DBL_MAX_10_EXP__ = @as(c_int, 308);
const __DBL_MAX_EXP__ = @as(c_int, 1024);
const __DBL_MAX__ = 1.7976931348623157e+308;
const __DBL_MIN_10_EXP__ = -@as(c_int, 307);
const __DBL_MIN_EXP__ = -@as(c_int, 1021);
const __DBL_MIN__ = 2.2250738585072014e-308;
const __LDBL_DENORM_MIN__ = @as(c_longdouble, 3.64519953188247460253e-4951);
const __LDBL_HAS_DENORM__ = @as(c_int, 1);
const __LDBL_DIG__ = @as(c_int, 18);
const __LDBL_DECIMAL_DIG__ = @as(c_int, 21);
const __LDBL_EPSILON__ = @as(c_longdouble, 1.08420217248550443401e-19);
const __LDBL_HAS_INFINITY__ = @as(c_int, 1);
const __LDBL_HAS_QUIET_NAN__ = @as(c_int, 1);
const __LDBL_MANT_DIG__ = @as(c_int, 64);
const __LDBL_MAX_10_EXP__ = @as(c_int, 4932);
const __LDBL_MAX_EXP__ = @as(c_int, 16384);
const __LDBL_MAX__ = @as(c_longdouble, 1.18973149535723176502e+4932);
const __LDBL_MIN_10_EXP__ = -@as(c_int, 4931);
const __LDBL_MIN_EXP__ = -@as(c_int, 16381);
const __LDBL_MIN__ = @as(c_longdouble, 3.36210314311209350626e-4932);
const __POINTER_WIDTH__ = @as(c_int, 64);
const __BIGGEST_ALIGNMENT__ = @as(c_int, 16);
const __WCHAR_UNSIGNED__ = @as(c_int, 1);
const __WINT_UNSIGNED__ = @as(c_int, 1);
const __INT8_TYPE__ = i8;
const __INT8_FMTd__ = "hhd";
const __INT8_FMTi__ = "hhi";
const __INT16_TYPE__ = c_short;
const __INT16_FMTd__ = "hd";
const __INT16_FMTi__ = "hi";
const __INT32_TYPE__ = c_int;
const __INT32_FMTd__ = "d";
const __INT32_FMTi__ = "i";
const __INT64_FMTd__ = "lld";
const __INT64_FMTi__ = "lli";
const __INT64_C_SUFFIX__ = LL;
const __UINT8_TYPE__ = u8;
const __UINT8_FMTo__ = "hho";
const __UINT8_FMTu__ = "hhu";
const __UINT8_FMTx__ = "hhx";
const __UINT8_FMTX__ = "hhX";
const __UINT8_MAX__ = @as(c_int, 255);
const __INT8_MAX__ = @as(c_int, 127);
const __UINT16_TYPE__ = c_ushort;
const __UINT16_FMTo__ = "ho";
const __UINT16_FMTu__ = "hu";
const __UINT16_FMTx__ = "hx";
const __UINT16_FMTX__ = "hX";
const __UINT16_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
const __INT16_MAX__ = @as(c_int, 32767);
const __UINT32_TYPE__ = c_uint;
const __UINT32_FMTo__ = "o";
const __UINT32_FMTu__ = "u";
const __UINT32_FMTx__ = "x";
const __UINT32_FMTX__ = "X";
const __UINT32_C_SUFFIX__ = U;
const __UINT32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
const __INT32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
const __UINT64_FMTo__ = "llo";
const __UINT64_FMTu__ = "llu";
const __UINT64_FMTx__ = "llx";
const __UINT64_FMTX__ = "llX";
const __UINT64_C_SUFFIX__ = ULL;
const __UINT64_MAX__ = @as(c_ulonglong, 18446744073709551615);
const __INT64_MAX__ = @as(c_longlong, 9223372036854775807);
const __INT_LEAST8_TYPE__ = i8;
const __INT_LEAST8_MAX__ = @as(c_int, 127);
const __INT_LEAST8_FMTd__ = "hhd";
const __INT_LEAST8_FMTi__ = "hhi";
const __UINT_LEAST8_TYPE__ = u8;
const __UINT_LEAST8_MAX__ = @as(c_int, 255);
const __UINT_LEAST8_FMTo__ = "hho";
const __UINT_LEAST8_FMTu__ = "hhu";
const __UINT_LEAST8_FMTx__ = "hhx";
const __UINT_LEAST8_FMTX__ = "hhX";
const __INT_LEAST16_TYPE__ = c_short;
const __INT_LEAST16_MAX__ = @as(c_int, 32767);
const __INT_LEAST16_FMTd__ = "hd";
const __INT_LEAST16_FMTi__ = "hi";
const __UINT_LEAST16_TYPE__ = c_ushort;
const __UINT_LEAST16_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
const __UINT_LEAST16_FMTo__ = "ho";
const __UINT_LEAST16_FMTu__ = "hu";
const __UINT_LEAST16_FMTx__ = "hx";
const __UINT_LEAST16_FMTX__ = "hX";
const __INT_LEAST32_TYPE__ = c_int;
const __INT_LEAST32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
const __INT_LEAST32_FMTd__ = "d";
const __INT_LEAST32_FMTi__ = "i";
const __UINT_LEAST32_TYPE__ = c_uint;
const __UINT_LEAST32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
const __UINT_LEAST32_FMTo__ = "o";
const __UINT_LEAST32_FMTu__ = "u";
const __UINT_LEAST32_FMTx__ = "x";
const __UINT_LEAST32_FMTX__ = "X";
const __INT_LEAST64_MAX__ = @as(c_longlong, 9223372036854775807);
const __INT_LEAST64_FMTd__ = "lld";
const __INT_LEAST64_FMTi__ = "lli";
const __UINT_LEAST64_MAX__ = @as(c_ulonglong, 18446744073709551615);
const __UINT_LEAST64_FMTo__ = "llo";
const __UINT_LEAST64_FMTu__ = "llu";
const __UINT_LEAST64_FMTx__ = "llx";
const __UINT_LEAST64_FMTX__ = "llX";
const __INT_FAST8_TYPE__ = i8;
const __INT_FAST8_MAX__ = @as(c_int, 127);
const __INT_FAST8_FMTd__ = "hhd";
const __INT_FAST8_FMTi__ = "hhi";
const __UINT_FAST8_TYPE__ = u8;
const __UINT_FAST8_MAX__ = @as(c_int, 255);
const __UINT_FAST8_FMTo__ = "hho";
const __UINT_FAST8_FMTu__ = "hhu";
const __UINT_FAST8_FMTx__ = "hhx";
const __UINT_FAST8_FMTX__ = "hhX";
const __INT_FAST16_TYPE__ = c_short;
const __INT_FAST16_MAX__ = @as(c_int, 32767);
const __INT_FAST16_FMTd__ = "hd";
const __INT_FAST16_FMTi__ = "hi";
const __UINT_FAST16_TYPE__ = c_ushort;
const __UINT_FAST16_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
const __UINT_FAST16_FMTo__ = "ho";
const __UINT_FAST16_FMTu__ = "hu";
const __UINT_FAST16_FMTx__ = "hx";
const __UINT_FAST16_FMTX__ = "hX";
const __INT_FAST32_TYPE__ = c_int;
const __INT_FAST32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
const __INT_FAST32_FMTd__ = "d";
const __INT_FAST32_FMTi__ = "i";
const __UINT_FAST32_TYPE__ = c_uint;
const __UINT_FAST32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
const __UINT_FAST32_FMTo__ = "o";
const __UINT_FAST32_FMTu__ = "u";
const __UINT_FAST32_FMTx__ = "x";
const __UINT_FAST32_FMTX__ = "X";
const __INT_FAST64_MAX__ = @as(c_longlong, 9223372036854775807);
const __INT_FAST64_FMTd__ = "lld";
const __INT_FAST64_FMTi__ = "lli";
const __UINT_FAST64_MAX__ = @as(c_ulonglong, 18446744073709551615);
const __UINT_FAST64_FMTo__ = "llo";
const __UINT_FAST64_FMTu__ = "llu";
const __UINT_FAST64_FMTx__ = "llx";
const __UINT_FAST64_FMTX__ = "llX";
const __FINITE_MATH_ONLY__ = @as(c_int, 0);
const __GNUC_STDC_INLINE__ = @as(c_int, 1);
const __GCC_ATOMIC_TEST_AND_SET_TRUEVAL = @as(c_int, 1);
const __CLANG_ATOMIC_BOOL_LOCK_FREE = @as(c_int, 2);
const __CLANG_ATOMIC_CHAR_LOCK_FREE = @as(c_int, 2);
const __CLANG_ATOMIC_CHAR16_T_LOCK_FREE = @as(c_int, 2);
const __CLANG_ATOMIC_CHAR32_T_LOCK_FREE = @as(c_int, 2);
const __CLANG_ATOMIC_WCHAR_T_LOCK_FREE = @as(c_int, 2);
const __CLANG_ATOMIC_SHORT_LOCK_FREE = @as(c_int, 2);
const __CLANG_ATOMIC_INT_LOCK_FREE = @as(c_int, 2);
const __CLANG_ATOMIC_LONG_LOCK_FREE = @as(c_int, 2);
const __CLANG_ATOMIC_LLONG_LOCK_FREE = @as(c_int, 2);
const __CLANG_ATOMIC_POINTER_LOCK_FREE = @as(c_int, 2);
const __GCC_ATOMIC_BOOL_LOCK_FREE = @as(c_int, 2);
const __GCC_ATOMIC_CHAR_LOCK_FREE = @as(c_int, 2);
const __GCC_ATOMIC_CHAR16_T_LOCK_FREE = @as(c_int, 2);
const __GCC_ATOMIC_CHAR32_T_LOCK_FREE = @as(c_int, 2);
const __GCC_ATOMIC_WCHAR_T_LOCK_FREE = @as(c_int, 2);
const __GCC_ATOMIC_SHORT_LOCK_FREE = @as(c_int, 2);
const __GCC_ATOMIC_INT_LOCK_FREE = @as(c_int, 2);
const __GCC_ATOMIC_LONG_LOCK_FREE = @as(c_int, 2);
const __GCC_ATOMIC_LLONG_LOCK_FREE = @as(c_int, 2);
const __GCC_ATOMIC_POINTER_LOCK_FREE = @as(c_int, 2);
const __PIC__ = @as(c_int, 2);
const __pic__ = @as(c_int, 2);
const __FLT_EVAL_METHOD__ = @as(c_int, 0);
const __FLT_RADIX__ = @as(c_int, 2);
const __DECIMAL_DIG__ = __LDBL_DECIMAL_DIG__;
const __SSP_STRONG__ = @as(c_int, 2);
const __GCC_ASM_FLAG_OUTPUTS__ = @as(c_int, 1);
const __code_model_small__ = @as(c_int, 1);
const __amd64__ = @as(c_int, 1);
const __amd64 = @as(c_int, 1);
const __x86_64 = @as(c_int, 1);
const __x86_64__ = @as(c_int, 1);
const __SEG_GS = @as(c_int, 1);
const __SEG_FS = @as(c_int, 1);
const __seg_gs = __attribute__(address_space(@as(c_int, 256)));
const __seg_fs = __attribute__(address_space(@as(c_int, 257)));
const __corei7 = @as(c_int, 1);
const __corei7__ = @as(c_int, 1);
const __tune_corei7__ = @as(c_int, 1);
const __NO_MATH_INLINES = @as(c_int, 1);
const __AES__ = @as(c_int, 1);
const __PCLMUL__ = @as(c_int, 1);
const __LAHF_SAHF__ = @as(c_int, 1);
const __LZCNT__ = @as(c_int, 1);
const __RDRND__ = @as(c_int, 1);
const __FSGSBASE__ = @as(c_int, 1);
const __BMI__ = @as(c_int, 1);
const __BMI2__ = @as(c_int, 1);
const __POPCNT__ = @as(c_int, 1);
const __RTM__ = @as(c_int, 1);
const __PRFCHW__ = @as(c_int, 1);
const __RDSEED__ = @as(c_int, 1);
const __ADX__ = @as(c_int, 1);
const __MOVBE__ = @as(c_int, 1);
const __FMA__ = @as(c_int, 1);
const __F16C__ = @as(c_int, 1);
const __FXSR__ = @as(c_int, 1);
const __XSAVE__ = @as(c_int, 1);
const __XSAVEOPT__ = @as(c_int, 1);
const __XSAVEC__ = @as(c_int, 1);
const __XSAVES__ = @as(c_int, 1);
const __CLFLUSHOPT__ = @as(c_int, 1);
const __INVPCID__ = @as(c_int, 1);
const __AVX2__ = @as(c_int, 1);
const __AVX__ = @as(c_int, 1);
const __SSE4_2__ = @as(c_int, 1);
const __SSE4_1__ = @as(c_int, 1);
const __SSSE3__ = @as(c_int, 1);
const __SSE3__ = @as(c_int, 1);
const __SSE2__ = @as(c_int, 1);
const __SSE2_MATH__ = @as(c_int, 1);
const __SSE__ = @as(c_int, 1);
const __SSE_MATH__ = @as(c_int, 1);
const __MMX__ = @as(c_int, 1);
const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 = @as(c_int, 1);
const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 = @as(c_int, 1);
const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 = @as(c_int, 1);
const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_8 = @as(c_int, 1);
const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_16 = @as(c_int, 1);
const __SIZEOF_FLOAT128__ = @as(c_int, 16);
const _WIN32 = @as(c_int, 1);
const _WIN64 = @as(c_int, 1);
const WIN32 = @as(c_int, 1);
const __WIN32 = @as(c_int, 1);
const __WIN32__ = @as(c_int, 1);
const WINNT = @as(c_int, 1);
const __WINNT = @as(c_int, 1);
const __WINNT__ = @as(c_int, 1);
const WIN64 = @as(c_int, 1);
const __WIN64 = @as(c_int, 1);
const __WIN64__ = @as(c_int, 1);
const __MINGW64__ = @as(c_int, 1);
const __MSVCRT__ = @as(c_int, 1);
const __MINGW32__ = @as(c_int, 1);
inline fn __declspec(a: anytype) @TypeOf(__attribute__(a)) {
    return __attribute__(a);
}
const _cdecl = __attribute__(__cdecl__);
const __cdecl = __attribute__(__cdecl__);
const _stdcall = __attribute__(__stdcall__);
const __stdcall = __attribute__(__stdcall__);
const _fastcall = __attribute__(__fastcall__);
const __fastcall = __attribute__(__fastcall__);
const _thiscall = __attribute__(__thiscall__);
const __thiscall = __attribute__(__thiscall__);
const _pascal = __attribute__(__pascal__);
const __pascal = __attribute__(__pascal__);
const __STDC__ = @as(c_int, 1);
const __STDC_HOSTED__ = @as(c_int, 1);
const __STDC_VERSION__ = @as(c_long, 201710);
const __STDC_UTF_16__ = @as(c_int, 1);
const __STDC_UTF_32__ = @as(c_int, 1);
const _DEBUG = @as(c_int, 1);
const APIENTRY = __stdcall;
const APIENTRYP = [*c]APIENTRY;
const GLAPIENTRY = APIENTRY;
const KHRONOS_APICALL = __declspec(dllimport);
const KHRONOS_APIENTRY = __stdcall;
inline fn __MINGW64_STRINGIFY(x: anytype) @TypeOf(__STRINGIFY(x)) {
    return __STRINGIFY(x);
}
const __MINGW64_VERSION_MAJOR = @as(c_int, 8);
const __MINGW64_VERSION_MINOR = @as(c_int, 0);
const __MINGW64_VERSION_BUGFIX = @as(c_int, 0);
const __MINGW64_VERSION_RC = @as(c_int, 0);
const __MINGW64_VERSION_STATE = "alpha";
const __MINGW32_MAJOR_VERSION = @as(c_int, 3);
const __MINGW32_MINOR_VERSION = @as(c_int, 11);
const _M_AMD64 = @as(c_int, 100);
const _M_X64 = @as(c_int, 100);
const _ = @as(c_int, 1);
const __MINGW_USE_UNDERSCORE_PREFIX = @as(c_int, 0);
inline fn __MINGW_USYMBOL(sym: anytype) @TypeOf(sym) {
    return sym;
}
inline fn __MINGW_ASM_CALL(func: anytype) @TypeOf(__asm__(__MINGW64_STRINGIFY(__MINGW_USYMBOL(func)))) {
    return __asm__(__MINGW64_STRINGIFY(__MINGW_USYMBOL(func)));
}
inline fn __MINGW_ASM_CRT_CALL(func: anytype) @TypeOf(__asm__(__STRINGIFY(func))) {
    return __asm__(__STRINGIFY(func));
}
const __MINGW_EXTENSION = __extension__;
const __C89_NAMELESS = __MINGW_EXTENSION;
const __GNU_EXTENSION = __MINGW_EXTENSION;
const __MINGW_HAVE_ANSI_C99_PRINTF = @as(c_int, 1);
const __MINGW_HAVE_WIDE_C99_PRINTF = @as(c_int, 1);
const __MINGW_HAVE_ANSI_C99_SCANF = @as(c_int, 1);
const __MINGW_HAVE_WIDE_C99_SCANF = @as(c_int, 1);
const __MINGW_GCC_VERSION = ((__GNUC__ * @as(c_int, 10000)) + (__GNUC_MINOR__ * @as(c_int, 100))) + __GNUC_PATCHLEVEL__;
inline fn __MINGW_GNUC_PREREQ(major: anytype, minor: anytype) @TypeOf((__GNUC__ > major) or ((__GNUC__ == major) and (__GNUC_MINOR__ >= minor))) {
    return (__GNUC__ > major) or ((__GNUC__ == major) and (__GNUC_MINOR__ >= minor));
}
inline fn __MINGW_MSC_PREREQ(major: anytype, minor: anytype) @TypeOf(@as(c_int, 0)) {
    _ = major;
    _ = minor;
    return @as(c_int, 0);
}
const __MINGW_SEC_WARN_STR = "This function or variable may be unsafe, use _CRT_SECURE_NO_WARNINGS to disable deprecation";
const __MINGW_MSVC2005_DEPREC_STR = "This POSIX function is deprecated beginning in Visual C++ 2005, use _CRT_NONSTDC_NO_DEPRECATE to disable deprecation";
const __MINGW_ATTRIB_DEPRECATED_MSVC2005 = __MINGW_ATTRIB_DEPRECATED_STR(__MINGW_MSVC2005_DEPREC_STR);
const __MINGW_ATTRIB_DEPRECATED_SEC_WARN = __MINGW_ATTRIB_DEPRECATED_STR(__MINGW_SEC_WARN_STR);
inline fn __MINGW_MS_PRINTF(__format: anytype, __args: anytype) @TypeOf(__attribute__(__format__(ms_printf, __format, __args))) {
    return __attribute__(__format__(ms_printf, __format, __args));
}
inline fn __MINGW_MS_SCANF(__format: anytype, __args: anytype) @TypeOf(__attribute__(__format__(ms_scanf, __format, __args))) {
    return __attribute__(__format__(ms_scanf, __format, __args));
}
inline fn __MINGW_GNU_PRINTF(__format: anytype, __args: anytype) @TypeOf(__attribute__(__format__(gnu_printf, __format, __args))) {
    return __attribute__(__format__(gnu_printf, __format, __args));
}
inline fn __MINGW_GNU_SCANF(__format: anytype, __args: anytype) @TypeOf(__attribute__(__format__(gnu_scanf, __format, __args))) {
    return __attribute__(__format__(gnu_scanf, __format, __args));
}
const __mingw_static_ovr = __mingw_ovr;
const __MINGW_FORTIFY_LEVEL = @as(c_int, 0);
const __mingw_bos_ovr = __mingw_ovr;
const __MINGW_FORTIFY_VA_ARG = @as(c_int, 0);
const _CRT_SECURE_CPP_OVERLOAD_SECURE_NAMES = @as(c_int, 0);
const _CRT_SECURE_CPP_OVERLOAD_SECURE_NAMES_MEMORY = @as(c_int, 0);
const _CRT_SECURE_CPP_OVERLOAD_STANDARD_NAMES = @as(c_int, 0);
const _CRT_SECURE_CPP_OVERLOAD_STANDARD_NAMES_COUNT = @as(c_int, 0);
const _CRT_SECURE_CPP_OVERLOAD_STANDARD_NAMES_MEMORY = @as(c_int, 0);
const __LONG32 = c_long;
const __USE_CRTIMP = @as(c_int, 1);
const _CRTIMP = __attribute__(__dllimport__);
const USE___UUIDOF = @as(c_int, 0);
const _inline = __inline;
inline fn __UNUSED_PARAM(x: anytype) @TypeOf(x ++ __attribute__(__unused__)) {
    return x ++ __attribute__(__unused__);
}
const __restrict_arr = __restrict;
const __MINGW_ATTRIB_NORETURN = __attribute__(__noreturn__);
const __MINGW_ATTRIB_CONST = __attribute__(__const__);
const __MINGW_ATTRIB_MALLOC = __attribute__(__malloc__);
const __MINGW_ATTRIB_PURE = __attribute__(__pure__);
inline fn __MINGW_ATTRIB_NONNULL(arg: anytype) @TypeOf(__attribute__(__nonnull__(arg))) {
    return __attribute__(__nonnull__(arg));
}
const __MINGW_ATTRIB_UNUSED = __attribute__(__unused__);
const __MINGW_ATTRIB_USED = __attribute__(__used__);
const __MINGW_ATTRIB_DEPRECATED = __attribute__(__deprecated__);
inline fn __MINGW_ATTRIB_DEPRECATED_MSG(x: anytype) @TypeOf(__attribute__(__deprecated__(x))) {
    return __attribute__(__deprecated__(x));
}
const __MINGW_NOTHROW = __attribute__(__nothrow__);
const __MSVCRT_VERSION__ = @as(c_int, 0x700);
const _WIN32_WINNT = @as(c_int, 0x0603);
const __int8 = u8;
const __int16 = c_short;
const __int32 = c_int;
const MINGW_HAS_SECURE_API = @as(c_int, 1);
const __STDC_SECURE_LIB__ = @as(c_long, 200411);
const __GOT_SECURE_LIB__ = __STDC_SECURE_LIB__;
const _CRT_PACKING = @as(c_int, 8);
inline fn _ADDRESSOF(v: anytype) @TypeOf(&v) {
    return &v;
}
inline fn _CRT_STRINGIZE(_Value: anytype) @TypeOf(__CRT_STRINGIZE(_Value)) {
    return __CRT_STRINGIZE(_Value);
}
inline fn _CRT_WIDE(_String: anytype) @TypeOf(__CRT_WIDE(_String)) {
    return __CRT_WIDE(_String);
}
const _CRTIMP_NOIA64 = _CRTIMP;
const _CRTIMP2 = _CRTIMP;
const _CRTIMP_ALTERNATIVE = _CRTIMP;
const _MRTIMP2 = _CRTIMP;
const _MCRTIMP = _CRTIMP;
const _CRTIMP_PURE = _CRTIMP;
const _SECURECRT_FILL_BUFFER_PATTERN = @as(c_int, 0xFD);
inline fn _CRT_DEPRECATE_TEXT(_Text: anytype) @TypeOf(__declspec(deprecated)) {
    _ = _Text;
    return __declspec(deprecated);
}
const UNALIGNED = __unaligned;
inline fn _CRT_ALIGN(x: anytype) @TypeOf(__attribute__(__aligned__(x))) {
    return __attribute__(__aligned__(x));
}
const __CRTDECL = __cdecl;
const _ARGMAX = @as(c_int, 100);
const _TRUNCATE = usize - @as(c_int, 1);
inline fn _CRT_UNUSED(x: anytype) c_void {
    return @import("std").meta.cast(c_void, x);
}
const __USE_MINGW_ANSI_STDIO = @as(c_int, 1);
const _CRT_glob = _dowildcard;
const _ANONYMOUS_UNION = __MINGW_EXTENSION;
const _ANONYMOUS_STRUCT = __MINGW_EXTENSION;
const __MINGW_DEBUGBREAK_IMPL = !(__has_builtin(__debugbreak) != 0);
const _CRT_SECURE_CPP_NOTHROW = throw();
const INT8_MIN = -@as(c_int, 128);
const INT16_MIN = -@import("std").zig.c_translation.promoteIntLiteral(c_int, 32768, .decimal);
const INT32_MIN = -@import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal) - @as(c_int, 1);
const INT64_MIN = -@as(c_longlong, 9223372036854775807) - @as(c_int, 1);
const INT8_MAX = @as(c_int, 127);
const INT16_MAX = @as(c_int, 32767);
const INT32_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
const INT64_MAX = @as(c_longlong, 9223372036854775807);
const UINT8_MAX = @as(c_int, 255);
const UINT16_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
const UINT32_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0xffffffff, .hexadecimal);
const UINT64_MAX = @as(c_ulonglong, 0xffffffffffffffff);
const INT_LEAST8_MIN = INT8_MIN;
const INT_LEAST16_MIN = INT16_MIN;
const INT_LEAST32_MIN = INT32_MIN;
const INT_LEAST64_MIN = INT64_MIN;
const INT_LEAST8_MAX = INT8_MAX;
const INT_LEAST16_MAX = INT16_MAX;
const INT_LEAST32_MAX = INT32_MAX;
const INT_LEAST64_MAX = INT64_MAX;
const UINT_LEAST8_MAX = UINT8_MAX;
const UINT_LEAST16_MAX = UINT16_MAX;
const UINT_LEAST32_MAX = UINT32_MAX;
const UINT_LEAST64_MAX = UINT64_MAX;
const INT_FAST8_MIN = INT8_MIN;
const INT_FAST16_MIN = INT16_MIN;
const INT_FAST32_MIN = INT32_MIN;
const INT_FAST64_MIN = INT64_MIN;
const INT_FAST8_MAX = INT8_MAX;
const INT_FAST16_MAX = INT16_MAX;
const INT_FAST32_MAX = INT32_MAX;
const INT_FAST64_MAX = INT64_MAX;
const UINT_FAST8_MAX = UINT8_MAX;
const UINT_FAST16_MAX = UINT16_MAX;
const UINT_FAST32_MAX = UINT32_MAX;
const UINT_FAST64_MAX = UINT64_MAX;
const INTPTR_MIN = INT64_MIN;
const INTPTR_MAX = INT64_MAX;
const UINTPTR_MAX = UINT64_MAX;
const INTMAX_MIN = INT64_MIN;
const INTMAX_MAX = INT64_MAX;
const UINTMAX_MAX = UINT64_MAX;
const PTRDIFF_MIN = INT64_MIN;
const PTRDIFF_MAX = INT64_MAX;
const SIG_ATOMIC_MIN = INT32_MIN;
const SIG_ATOMIC_MAX = INT32_MAX;
const SIZE_MAX = UINT64_MAX;
const WCHAR_MIN = @as(c_uint, 0);
const WCHAR_MAX = @as(c_uint, 0xffff);
const WINT_MIN = @as(c_uint, 0);
const WINT_MAX = @as(c_uint, 0xffff);
inline fn INT8_C(val: anytype) @TypeOf((INT_LEAST8_MAX - INT_LEAST8_MAX) + val) {
    return (INT_LEAST8_MAX - INT_LEAST8_MAX) + val;
}
inline fn INT16_C(val: anytype) @TypeOf((INT_LEAST16_MAX - INT_LEAST16_MAX) + val) {
    return (INT_LEAST16_MAX - INT_LEAST16_MAX) + val;
}
inline fn INT32_C(val: anytype) @TypeOf((INT_LEAST32_MAX - INT_LEAST32_MAX) + val) {
    return (INT_LEAST32_MAX - INT_LEAST32_MAX) + val;
}
inline fn UINT8_C(val: anytype) @TypeOf(val) {
    return val;
}
inline fn UINT16_C(val: anytype) @TypeOf(val) {
    return val;
}
const KHRONOS_SUPPORT_INT64 = @as(c_int, 1);
const KHRONOS_SUPPORT_FLOAT = @as(c_int, 1);
const KHRONOS_MAX_ENUM = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x7FFFFFFF, .hexadecimal);
pub const GL_DEPTH_BUFFER_BIT = @as(c_int, 0x00000100);
pub const GL_STENCIL_BUFFER_BIT = @as(c_int, 0x00000400);
pub const GL_COLOR_BUFFER_BIT = @as(c_int, 0x00004000);
pub const GL_FALSE = @as(c_int, 0);
pub const GL_TRUE = @as(c_int, 1);
pub const GL_POINTS = @as(c_int, 0x0000);
pub const GL_LINES = @as(c_int, 0x0001);
pub const GL_LINE_LOOP = @as(c_int, 0x0002);
pub const GL_LINE_STRIP = @as(c_int, 0x0003);
pub const GL_TRIANGLES = @as(c_int, 0x0004);
pub const GL_TRIANGLE_STRIP = @as(c_int, 0x0005);
pub const GL_TRIANGLE_FAN = @as(c_int, 0x0006);
pub const GL_NEVER = @as(c_int, 0x0200);
pub const GL_LESS = @as(c_int, 0x0201);
pub const GL_EQUAL = @as(c_int, 0x0202);
pub const GL_LEQUAL = @as(c_int, 0x0203);
pub const GL_GREATER = @as(c_int, 0x0204);
pub const GL_NOTEQUAL = @as(c_int, 0x0205);
pub const GL_GEQUAL = @as(c_int, 0x0206);
pub const GL_ALWAYS = @as(c_int, 0x0207);
pub const GL_ZERO = @as(c_int, 0);
pub const GL_ONE = @as(c_int, 1);
pub const GL_SRC_COLOR = @as(c_int, 0x0300);
pub const GL_ONE_MINUS_SRC_COLOR = @as(c_int, 0x0301);
pub const GL_SRC_ALPHA = @as(c_int, 0x0302);
pub const GL_ONE_MINUS_SRC_ALPHA = @as(c_int, 0x0303);
pub const GL_DST_ALPHA = @as(c_int, 0x0304);
pub const GL_ONE_MINUS_DST_ALPHA = @as(c_int, 0x0305);
pub const GL_DST_COLOR = @as(c_int, 0x0306);
pub const GL_ONE_MINUS_DST_COLOR = @as(c_int, 0x0307);
pub const GL_SRC_ALPHA_SATURATE = @as(c_int, 0x0308);
pub const GL_NONE = @as(c_int, 0);
pub const GL_FRONT_LEFT = @as(c_int, 0x0400);
pub const GL_FRONT_RIGHT = @as(c_int, 0x0401);
pub const GL_BACK_LEFT = @as(c_int, 0x0402);
pub const GL_BACK_RIGHT = @as(c_int, 0x0403);
pub const GL_FRONT = @as(c_int, 0x0404);
pub const GL_BACK = @as(c_int, 0x0405);
pub const GL_LEFT = @as(c_int, 0x0406);
pub const GL_RIGHT = @as(c_int, 0x0407);
pub const GL_FRONT_AND_BACK = @as(c_int, 0x0408);
pub const GL_NO_ERROR = @as(c_int, 0);
pub const GL_INVALID_ENUM = @as(c_int, 0x0500);
pub const GL_INVALID_VALUE = @as(c_int, 0x0501);
pub const GL_INVALID_OPERATION = @as(c_int, 0x0502);
pub const GL_OUT_OF_MEMORY = @as(c_int, 0x0505);
pub const GL_CW = @as(c_int, 0x0900);
pub const GL_CCW = @as(c_int, 0x0901);
pub const GL_POINT_SIZE = @as(c_int, 0x0B11);
pub const GL_POINT_SIZE_RANGE = @as(c_int, 0x0B12);
pub const GL_POINT_SIZE_GRANULARITY = @as(c_int, 0x0B13);
pub const GL_LINE_SMOOTH = @as(c_int, 0x0B20);
pub const GL_LINE_WIDTH = @as(c_int, 0x0B21);
pub const GL_LINE_WIDTH_RANGE = @as(c_int, 0x0B22);
pub const GL_LINE_WIDTH_GRANULARITY = @as(c_int, 0x0B23);
pub const GL_POLYGON_MODE = @as(c_int, 0x0B40);
pub const GL_POLYGON_SMOOTH = @as(c_int, 0x0B41);
pub const GL_CULL_FACE = @as(c_int, 0x0B44);
pub const GL_CULL_FACE_MODE = @as(c_int, 0x0B45);
pub const GL_FRONT_FACE = @as(c_int, 0x0B46);
pub const GL_DEPTH_RANGE = @as(c_int, 0x0B70);
pub const GL_DEPTH_TEST = @as(c_int, 0x0B71);
pub const GL_DEPTH_WRITEMASK = @as(c_int, 0x0B72);
pub const GL_DEPTH_CLEAR_VALUE = @as(c_int, 0x0B73);
pub const GL_DEPTH_FUNC = @as(c_int, 0x0B74);
pub const GL_STENCIL_TEST = @as(c_int, 0x0B90);
pub const GL_STENCIL_CLEAR_VALUE = @as(c_int, 0x0B91);
pub const GL_STENCIL_FUNC = @as(c_int, 0x0B92);
pub const GL_STENCIL_VALUE_MASK = @as(c_int, 0x0B93);
pub const GL_STENCIL_FAIL = @as(c_int, 0x0B94);
pub const GL_STENCIL_PASS_DEPTH_FAIL = @as(c_int, 0x0B95);
pub const GL_STENCIL_PASS_DEPTH_PASS = @as(c_int, 0x0B96);
pub const GL_STENCIL_REF = @as(c_int, 0x0B97);
pub const GL_STENCIL_WRITEMASK = @as(c_int, 0x0B98);
pub const GL_VIEWPORT = @as(c_int, 0x0BA2);
pub const GL_DITHER = @as(c_int, 0x0BD0);
pub const GL_BLEND_DST = @as(c_int, 0x0BE0);
pub const GL_BLEND_SRC = @as(c_int, 0x0BE1);
pub const GL_BLEND = @as(c_int, 0x0BE2);
pub const GL_LOGIC_OP_MODE = @as(c_int, 0x0BF0);
pub const GL_DRAW_BUFFER = @as(c_int, 0x0C01);
pub const GL_READ_BUFFER = @as(c_int, 0x0C02);
pub const GL_SCISSOR_BOX = @as(c_int, 0x0C10);
pub const GL_SCISSOR_TEST = @as(c_int, 0x0C11);
pub const GL_COLOR_CLEAR_VALUE = @as(c_int, 0x0C22);
pub const GL_COLOR_WRITEMASK = @as(c_int, 0x0C23);
pub const GL_DOUBLEBUFFER = @as(c_int, 0x0C32);
pub const GL_STEREO = @as(c_int, 0x0C33);
pub const GL_LINE_SMOOTH_HINT = @as(c_int, 0x0C52);
pub const GL_POLYGON_SMOOTH_HINT = @as(c_int, 0x0C53);
pub const GL_UNPACK_SWAP_BYTES = @as(c_int, 0x0CF0);
pub const GL_UNPACK_LSB_FIRST = @as(c_int, 0x0CF1);
pub const GL_UNPACK_ROW_LENGTH = @as(c_int, 0x0CF2);
pub const GL_UNPACK_SKIP_ROWS = @as(c_int, 0x0CF3);
pub const GL_UNPACK_SKIP_PIXELS = @as(c_int, 0x0CF4);
pub const GL_UNPACK_ALIGNMENT = @as(c_int, 0x0CF5);
pub const GL_PACK_SWAP_BYTES = @as(c_int, 0x0D00);
pub const GL_PACK_LSB_FIRST = @as(c_int, 0x0D01);
pub const GL_PACK_ROW_LENGTH = @as(c_int, 0x0D02);
pub const GL_PACK_SKIP_ROWS = @as(c_int, 0x0D03);
pub const GL_PACK_SKIP_PIXELS = @as(c_int, 0x0D04);
pub const GL_PACK_ALIGNMENT = @as(c_int, 0x0D05);
pub const GL_MAX_TEXTURE_SIZE = @as(c_int, 0x0D33);
pub const GL_MAX_VIEWPORT_DIMS = @as(c_int, 0x0D3A);
pub const GL_SUBPIXEL_BITS = @as(c_int, 0x0D50);
pub const GL_TEXTURE_1D = @as(c_int, 0x0DE0);
pub const GL_TEXTURE_2D = @as(c_int, 0x0DE1);
pub const GL_TEXTURE_WIDTH = @as(c_int, 0x1000);
pub const GL_TEXTURE_HEIGHT = @as(c_int, 0x1001);
pub const GL_TEXTURE_BORDER_COLOR = @as(c_int, 0x1004);
pub const GL_DONT_CARE = @as(c_int, 0x1100);
pub const GL_FASTEST = @as(c_int, 0x1101);
pub const GL_NICEST = @as(c_int, 0x1102);
pub const GL_BYTE = @as(c_int, 0x1400);
pub const GL_UNSIGNED_BYTE = @as(c_int, 0x1401);
pub const GL_SHORT = @as(c_int, 0x1402);
pub const GL_UNSIGNED_SHORT = @as(c_int, 0x1403);
pub const GL_INT = @as(c_int, 0x1404);
pub const GL_UNSIGNED_INT = @as(c_int, 0x1405);
pub const GL_FLOAT = @as(c_int, 0x1406);
pub const GL_CLEAR = @as(c_int, 0x1500);
pub const GL_AND = @as(c_int, 0x1501);
pub const GL_AND_REVERSE = @as(c_int, 0x1502);
pub const GL_COPY = @as(c_int, 0x1503);
pub const GL_AND_INVERTED = @as(c_int, 0x1504);
pub const GL_NOOP = @as(c_int, 0x1505);
pub const GL_XOR = @as(c_int, 0x1506);
pub const GL_OR = @as(c_int, 0x1507);
pub const GL_NOR = @as(c_int, 0x1508);
pub const GL_EQUIV = @as(c_int, 0x1509);
pub const GL_INVERT = @as(c_int, 0x150A);
pub const GL_OR_REVERSE = @as(c_int, 0x150B);
pub const GL_COPY_INVERTED = @as(c_int, 0x150C);
pub const GL_OR_INVERTED = @as(c_int, 0x150D);
pub const GL_NAND = @as(c_int, 0x150E);
pub const GL_SET = @as(c_int, 0x150F);
pub const GL_TEXTURE = @as(c_int, 0x1702);
pub const GL_COLOR = @as(c_int, 0x1800);
pub const GL_DEPTH = @as(c_int, 0x1801);
pub const GL_STENCIL = @as(c_int, 0x1802);
pub const GL_STENCIL_INDEX = @as(c_int, 0x1901);
pub const GL_DEPTH_COMPONENT = @as(c_int, 0x1902);
pub const GL_RED = @as(c_int, 0x1903);
pub const GL_GREEN = @as(c_int, 0x1904);
pub const GL_BLUE = @as(c_int, 0x1905);
pub const GL_ALPHA = @as(c_int, 0x1906);
pub const GL_RGB = @as(c_int, 0x1907);
pub const GL_RGBA = @as(c_int, 0x1908);
pub const GL_POINT = @as(c_int, 0x1B00);
pub const GL_LINE = @as(c_int, 0x1B01);
pub const GL_FILL = @as(c_int, 0x1B02);
pub const GL_KEEP = @as(c_int, 0x1E00);
pub const GL_REPLACE = @as(c_int, 0x1E01);
pub const GL_INCR = @as(c_int, 0x1E02);
pub const GL_DECR = @as(c_int, 0x1E03);
pub const GL_VENDOR = @as(c_int, 0x1F00);
pub const GL_RENDERER = @as(c_int, 0x1F01);
pub const GL_VERSION = @as(c_int, 0x1F02);
pub const GL_EXTENSIONS = @as(c_int, 0x1F03);
pub const GL_NEAREST = @as(c_int, 0x2600);
pub const GL_LINEAR = @as(c_int, 0x2601);
pub const GL_NEAREST_MIPMAP_NEAREST = @as(c_int, 0x2700);
pub const GL_LINEAR_MIPMAP_NEAREST = @as(c_int, 0x2701);
pub const GL_NEAREST_MIPMAP_LINEAR = @as(c_int, 0x2702);
pub const GL_LINEAR_MIPMAP_LINEAR = @as(c_int, 0x2703);
pub const GL_TEXTURE_MAG_FILTER = @as(c_int, 0x2800);
pub const GL_TEXTURE_MIN_FILTER = @as(c_int, 0x2801);
pub const GL_TEXTURE_WRAP_S = @as(c_int, 0x2802);
pub const GL_TEXTURE_WRAP_T = @as(c_int, 0x2803);
pub const GL_REPEAT = @as(c_int, 0x2901);
pub const GL_COLOR_LOGIC_OP = @as(c_int, 0x0BF2);
pub const GL_POLYGON_OFFSET_UNITS = @as(c_int, 0x2A00);
pub const GL_POLYGON_OFFSET_POINT = @as(c_int, 0x2A01);
pub const GL_POLYGON_OFFSET_LINE = @as(c_int, 0x2A02);
pub const GL_POLYGON_OFFSET_FILL = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8037, .hexadecimal);
pub const GL_POLYGON_OFFSET_FACTOR = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8038, .hexadecimal);
pub const GL_TEXTURE_BINDING_1D = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8068, .hexadecimal);
pub const GL_TEXTURE_BINDING_2D = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8069, .hexadecimal);
pub const GL_TEXTURE_INTERNAL_FORMAT = @as(c_int, 0x1003);
pub const GL_TEXTURE_RED_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x805C, .hexadecimal);
pub const GL_TEXTURE_GREEN_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x805D, .hexadecimal);
pub const GL_TEXTURE_BLUE_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x805E, .hexadecimal);
pub const GL_TEXTURE_ALPHA_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x805F, .hexadecimal);
pub const GL_DOUBLE = @as(c_int, 0x140A);
pub const GL_PROXY_TEXTURE_1D = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8063, .hexadecimal);
pub const GL_PROXY_TEXTURE_2D = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8064, .hexadecimal);
pub const GL_R3_G3_B2 = @as(c_int, 0x2A10);
pub const GL_RGB4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x804F, .hexadecimal);
pub const GL_RGB5 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8050, .hexadecimal);
pub const GL_RGB8 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8051, .hexadecimal);
pub const GL_RGB10 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8052, .hexadecimal);
pub const GL_RGB12 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8053, .hexadecimal);
pub const GL_RGB16 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8054, .hexadecimal);
pub const GL_RGBA2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8055, .hexadecimal);
pub const GL_RGBA4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8056, .hexadecimal);
pub const GL_RGB5_A1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8057, .hexadecimal);
pub const GL_RGBA8 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8058, .hexadecimal);
pub const GL_RGB10_A2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8059, .hexadecimal);
pub const GL_RGBA12 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x805A, .hexadecimal);
pub const GL_RGBA16 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x805B, .hexadecimal);
pub const GL_UNSIGNED_BYTE_3_3_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8032, .hexadecimal);
pub const GL_UNSIGNED_SHORT_4_4_4_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8033, .hexadecimal);
pub const GL_UNSIGNED_SHORT_5_5_5_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8034, .hexadecimal);
pub const GL_UNSIGNED_INT_8_8_8_8 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8035, .hexadecimal);
pub const GL_UNSIGNED_INT_10_10_10_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8036, .hexadecimal);
pub const GL_TEXTURE_BINDING_3D = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x806A, .hexadecimal);
pub const GL_PACK_SKIP_IMAGES = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x806B, .hexadecimal);
pub const GL_PACK_IMAGE_HEIGHT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x806C, .hexadecimal);
pub const GL_UNPACK_SKIP_IMAGES = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x806D, .hexadecimal);
pub const GL_UNPACK_IMAGE_HEIGHT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x806E, .hexadecimal);
pub const GL_TEXTURE_3D = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x806F, .hexadecimal);
pub const GL_PROXY_TEXTURE_3D = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8070, .hexadecimal);
pub const GL_TEXTURE_DEPTH = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8071, .hexadecimal);
pub const GL_TEXTURE_WRAP_R = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8072, .hexadecimal);
pub const GL_MAX_3D_TEXTURE_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8073, .hexadecimal);
pub const GL_UNSIGNED_BYTE_2_3_3_REV = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8362, .hexadecimal);
pub const GL_UNSIGNED_SHORT_5_6_5 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8363, .hexadecimal);
pub const GL_UNSIGNED_SHORT_5_6_5_REV = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8364, .hexadecimal);
pub const GL_UNSIGNED_SHORT_4_4_4_4_REV = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8365, .hexadecimal);
pub const GL_UNSIGNED_SHORT_1_5_5_5_REV = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8366, .hexadecimal);
pub const GL_UNSIGNED_INT_8_8_8_8_REV = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8367, .hexadecimal);
pub const GL_UNSIGNED_INT_2_10_10_10_REV = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8368, .hexadecimal);
pub const GL_BGR = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80E0, .hexadecimal);
pub const GL_BGRA = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80E1, .hexadecimal);
pub const GL_MAX_ELEMENTS_VERTICES = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80E8, .hexadecimal);
pub const GL_MAX_ELEMENTS_INDICES = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80E9, .hexadecimal);
pub const GL_CLAMP_TO_EDGE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x812F, .hexadecimal);
pub const GL_TEXTURE_MIN_LOD = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x813A, .hexadecimal);
pub const GL_TEXTURE_MAX_LOD = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x813B, .hexadecimal);
pub const GL_TEXTURE_BASE_LEVEL = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x813C, .hexadecimal);
pub const GL_TEXTURE_MAX_LEVEL = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x813D, .hexadecimal);
pub const GL_SMOOTH_POINT_SIZE_RANGE = @as(c_int, 0x0B12);
pub const GL_SMOOTH_POINT_SIZE_GRANULARITY = @as(c_int, 0x0B13);
pub const GL_SMOOTH_LINE_WIDTH_RANGE = @as(c_int, 0x0B22);
pub const GL_SMOOTH_LINE_WIDTH_GRANULARITY = @as(c_int, 0x0B23);
pub const GL_ALIASED_LINE_WIDTH_RANGE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x846E, .hexadecimal);
pub const GL_TEXTURE0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84C0, .hexadecimal);
pub const GL_TEXTURE1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84C1, .hexadecimal);
pub const GL_TEXTURE2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84C2, .hexadecimal);
pub const GL_TEXTURE3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84C3, .hexadecimal);
pub const GL_TEXTURE4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84C4, .hexadecimal);
pub const GL_TEXTURE5 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84C5, .hexadecimal);
pub const GL_TEXTURE6 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84C6, .hexadecimal);
pub const GL_TEXTURE7 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84C7, .hexadecimal);
pub const GL_TEXTURE8 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84C8, .hexadecimal);
pub const GL_TEXTURE9 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84C9, .hexadecimal);
pub const GL_TEXTURE10 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84CA, .hexadecimal);
pub const GL_TEXTURE11 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84CB, .hexadecimal);
pub const GL_TEXTURE12 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84CC, .hexadecimal);
pub const GL_TEXTURE13 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84CD, .hexadecimal);
pub const GL_TEXTURE14 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84CE, .hexadecimal);
pub const GL_TEXTURE15 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84CF, .hexadecimal);
pub const GL_TEXTURE16 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84D0, .hexadecimal);
pub const GL_TEXTURE17 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84D1, .hexadecimal);
pub const GL_TEXTURE18 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84D2, .hexadecimal);
pub const GL_TEXTURE19 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84D3, .hexadecimal);
pub const GL_TEXTURE20 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84D4, .hexadecimal);
pub const GL_TEXTURE21 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84D5, .hexadecimal);
pub const GL_TEXTURE22 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84D6, .hexadecimal);
pub const GL_TEXTURE23 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84D7, .hexadecimal);
pub const GL_TEXTURE24 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84D8, .hexadecimal);
pub const GL_TEXTURE25 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84D9, .hexadecimal);
pub const GL_TEXTURE26 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84DA, .hexadecimal);
pub const GL_TEXTURE27 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84DB, .hexadecimal);
pub const GL_TEXTURE28 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84DC, .hexadecimal);
pub const GL_TEXTURE29 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84DD, .hexadecimal);
pub const GL_TEXTURE30 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84DE, .hexadecimal);
pub const GL_TEXTURE31 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84DF, .hexadecimal);
pub const GL_ACTIVE_TEXTURE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84E0, .hexadecimal);
pub const GL_MULTISAMPLE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x809D, .hexadecimal);
pub const GL_SAMPLE_ALPHA_TO_COVERAGE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x809E, .hexadecimal);
pub const GL_SAMPLE_ALPHA_TO_ONE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x809F, .hexadecimal);
pub const GL_SAMPLE_COVERAGE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80A0, .hexadecimal);
pub const GL_SAMPLE_BUFFERS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80A8, .hexadecimal);
pub const GL_SAMPLES = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80A9, .hexadecimal);
pub const GL_SAMPLE_COVERAGE_VALUE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80AA, .hexadecimal);
pub const GL_SAMPLE_COVERAGE_INVERT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80AB, .hexadecimal);
pub const GL_TEXTURE_CUBE_MAP = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8513, .hexadecimal);
pub const GL_TEXTURE_BINDING_CUBE_MAP = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8514, .hexadecimal);
pub const GL_TEXTURE_CUBE_MAP_POSITIVE_X = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8515, .hexadecimal);
pub const GL_TEXTURE_CUBE_MAP_NEGATIVE_X = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8516, .hexadecimal);
pub const GL_TEXTURE_CUBE_MAP_POSITIVE_Y = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8517, .hexadecimal);
pub const GL_TEXTURE_CUBE_MAP_NEGATIVE_Y = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8518, .hexadecimal);
pub const GL_TEXTURE_CUBE_MAP_POSITIVE_Z = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8519, .hexadecimal);
pub const GL_TEXTURE_CUBE_MAP_NEGATIVE_Z = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x851A, .hexadecimal);
pub const GL_PROXY_TEXTURE_CUBE_MAP = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x851B, .hexadecimal);
pub const GL_MAX_CUBE_MAP_TEXTURE_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x851C, .hexadecimal);
pub const GL_COMPRESSED_RGB = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84ED, .hexadecimal);
pub const GL_COMPRESSED_RGBA = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84EE, .hexadecimal);
pub const GL_TEXTURE_COMPRESSION_HINT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84EF, .hexadecimal);
pub const GL_TEXTURE_COMPRESSED_IMAGE_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x86A0, .hexadecimal);
pub const GL_TEXTURE_COMPRESSED = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x86A1, .hexadecimal);
pub const GL_NUM_COMPRESSED_TEXTURE_FORMATS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x86A2, .hexadecimal);
pub const GL_COMPRESSED_TEXTURE_FORMATS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x86A3, .hexadecimal);
pub const GL_CLAMP_TO_BORDER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x812D, .hexadecimal);
pub const GL_BLEND_DST_RGB = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80C8, .hexadecimal);
pub const GL_BLEND_SRC_RGB = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80C9, .hexadecimal);
pub const GL_BLEND_DST_ALPHA = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80CA, .hexadecimal);
pub const GL_BLEND_SRC_ALPHA = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80CB, .hexadecimal);
pub const GL_POINT_FADE_THRESHOLD_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8128, .hexadecimal);
pub const GL_DEPTH_COMPONENT16 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x81A5, .hexadecimal);
pub const GL_DEPTH_COMPONENT24 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x81A6, .hexadecimal);
pub const GL_DEPTH_COMPONENT32 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x81A7, .hexadecimal);
pub const GL_MIRRORED_REPEAT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8370, .hexadecimal);
pub const GL_MAX_TEXTURE_LOD_BIAS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84FD, .hexadecimal);
pub const GL_TEXTURE_LOD_BIAS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8501, .hexadecimal);
pub const GL_INCR_WRAP = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8507, .hexadecimal);
pub const GL_DECR_WRAP = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8508, .hexadecimal);
pub const GL_TEXTURE_DEPTH_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x884A, .hexadecimal);
pub const GL_TEXTURE_COMPARE_MODE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x884C, .hexadecimal);
pub const GL_TEXTURE_COMPARE_FUNC = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x884D, .hexadecimal);
pub const GL_BLEND_COLOR = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8005, .hexadecimal);
pub const GL_BLEND_EQUATION = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8009, .hexadecimal);
pub const GL_CONSTANT_COLOR = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8001, .hexadecimal);
pub const GL_ONE_MINUS_CONSTANT_COLOR = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8002, .hexadecimal);
pub const GL_CONSTANT_ALPHA = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8003, .hexadecimal);
pub const GL_ONE_MINUS_CONSTANT_ALPHA = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8004, .hexadecimal);
pub const GL_FUNC_ADD = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8006, .hexadecimal);
pub const GL_FUNC_REVERSE_SUBTRACT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x800B, .hexadecimal);
pub const GL_FUNC_SUBTRACT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x800A, .hexadecimal);
pub const GL_MIN = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8007, .hexadecimal);
pub const GL_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8008, .hexadecimal);
pub const GL_BUFFER_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8764, .hexadecimal);
pub const GL_BUFFER_USAGE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8765, .hexadecimal);
pub const GL_QUERY_COUNTER_BITS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8864, .hexadecimal);
pub const GL_CURRENT_QUERY = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8865, .hexadecimal);
pub const GL_QUERY_RESULT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8866, .hexadecimal);
pub const GL_QUERY_RESULT_AVAILABLE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8867, .hexadecimal);
pub const GL_ARRAY_BUFFER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8892, .hexadecimal);
pub const GL_ELEMENT_ARRAY_BUFFER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8893, .hexadecimal);
pub const GL_ARRAY_BUFFER_BINDING = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8894, .hexadecimal);
pub const GL_ELEMENT_ARRAY_BUFFER_BINDING = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8895, .hexadecimal);
pub const GL_VERTEX_ATTRIB_ARRAY_BUFFER_BINDING = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x889F, .hexadecimal);
pub const GL_READ_ONLY = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x88B8, .hexadecimal);
pub const GL_WRITE_ONLY = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x88B9, .hexadecimal);
pub const GL_READ_WRITE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x88BA, .hexadecimal);
pub const GL_BUFFER_ACCESS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x88BB, .hexadecimal);
pub const GL_BUFFER_MAPPED = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x88BC, .hexadecimal);
pub const GL_BUFFER_MAP_POINTER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x88BD, .hexadecimal);
pub const GL_STREAM_DRAW = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x88E0, .hexadecimal);
pub const GL_STREAM_READ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x88E1, .hexadecimal);
pub const GL_STREAM_COPY = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x88E2, .hexadecimal);
pub const GL_STATIC_DRAW = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x88E4, .hexadecimal);
pub const GL_STATIC_READ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x88E5, .hexadecimal);
pub const GL_STATIC_COPY = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x88E6, .hexadecimal);
pub const GL_DYNAMIC_DRAW = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x88E8, .hexadecimal);
pub const GL_DYNAMIC_READ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x88E9, .hexadecimal);
pub const GL_DYNAMIC_COPY = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x88EA, .hexadecimal);
pub const GL_SAMPLES_PASSED = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8914, .hexadecimal);
pub const GL_SRC1_ALPHA = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8589, .hexadecimal);
pub const GL_BLEND_EQUATION_RGB = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8009, .hexadecimal);
pub const GL_VERTEX_ATTRIB_ARRAY_ENABLED = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8622, .hexadecimal);
pub const GL_VERTEX_ATTRIB_ARRAY_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8623, .hexadecimal);
pub const GL_VERTEX_ATTRIB_ARRAY_STRIDE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8624, .hexadecimal);
pub const GL_VERTEX_ATTRIB_ARRAY_TYPE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8625, .hexadecimal);
pub const GL_CURRENT_VERTEX_ATTRIB = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8626, .hexadecimal);
pub const GL_VERTEX_PROGRAM_POINT_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8642, .hexadecimal);
pub const GL_VERTEX_ATTRIB_ARRAY_POINTER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8645, .hexadecimal);
pub const GL_STENCIL_BACK_FUNC = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8800, .hexadecimal);
pub const GL_STENCIL_BACK_FAIL = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8801, .hexadecimal);
pub const GL_STENCIL_BACK_PASS_DEPTH_FAIL = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8802, .hexadecimal);
pub const GL_STENCIL_BACK_PASS_DEPTH_PASS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8803, .hexadecimal);
pub const GL_MAX_DRAW_BUFFERS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8824, .hexadecimal);
pub const GL_DRAW_BUFFER0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8825, .hexadecimal);
pub const GL_DRAW_BUFFER1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8826, .hexadecimal);
pub const GL_DRAW_BUFFER2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8827, .hexadecimal);
pub const GL_DRAW_BUFFER3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8828, .hexadecimal);
pub const GL_DRAW_BUFFER4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8829, .hexadecimal);
pub const GL_DRAW_BUFFER5 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x882A, .hexadecimal);
pub const GL_DRAW_BUFFER6 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x882B, .hexadecimal);
pub const GL_DRAW_BUFFER7 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x882C, .hexadecimal);
pub const GL_DRAW_BUFFER8 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x882D, .hexadecimal);
pub const GL_DRAW_BUFFER9 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x882E, .hexadecimal);
pub const GL_DRAW_BUFFER10 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x882F, .hexadecimal);
pub const GL_DRAW_BUFFER11 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8830, .hexadecimal);
pub const GL_DRAW_BUFFER12 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8831, .hexadecimal);
pub const GL_DRAW_BUFFER13 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8832, .hexadecimal);
pub const GL_DRAW_BUFFER14 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8833, .hexadecimal);
pub const GL_DRAW_BUFFER15 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8834, .hexadecimal);
pub const GL_BLEND_EQUATION_ALPHA = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x883D, .hexadecimal);
pub const GL_MAX_VERTEX_ATTRIBS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8869, .hexadecimal);
pub const GL_VERTEX_ATTRIB_ARRAY_NORMALIZED = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x886A, .hexadecimal);
pub const GL_MAX_TEXTURE_IMAGE_UNITS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8872, .hexadecimal);
pub const GL_FRAGMENT_SHADER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B30, .hexadecimal);
pub const GL_VERTEX_SHADER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B31, .hexadecimal);
pub const GL_MAX_FRAGMENT_UNIFORM_COMPONENTS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B49, .hexadecimal);
pub const GL_MAX_VERTEX_UNIFORM_COMPONENTS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B4A, .hexadecimal);
pub const GL_MAX_VARYING_FLOATS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B4B, .hexadecimal);
pub const GL_MAX_VERTEX_TEXTURE_IMAGE_UNITS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B4C, .hexadecimal);
pub const GL_MAX_COMBINED_TEXTURE_IMAGE_UNITS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B4D, .hexadecimal);
pub const GL_SHADER_TYPE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B4F, .hexadecimal);
pub const GL_FLOAT_VEC2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B50, .hexadecimal);
pub const GL_FLOAT_VEC3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B51, .hexadecimal);
pub const GL_FLOAT_VEC4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B52, .hexadecimal);
pub const GL_INT_VEC2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B53, .hexadecimal);
pub const GL_INT_VEC3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B54, .hexadecimal);
pub const GL_INT_VEC4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B55, .hexadecimal);
pub const GL_BOOL = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B56, .hexadecimal);
pub const GL_BOOL_VEC2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B57, .hexadecimal);
pub const GL_BOOL_VEC3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B58, .hexadecimal);
pub const GL_BOOL_VEC4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B59, .hexadecimal);
pub const GL_FLOAT_MAT2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B5A, .hexadecimal);
pub const GL_FLOAT_MAT3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B5B, .hexadecimal);
pub const GL_FLOAT_MAT4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B5C, .hexadecimal);
pub const GL_SAMPLER_1D = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B5D, .hexadecimal);
pub const GL_SAMPLER_2D = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B5E, .hexadecimal);
pub const GL_SAMPLER_3D = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B5F, .hexadecimal);
pub const GL_SAMPLER_CUBE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B60, .hexadecimal);
pub const GL_SAMPLER_1D_SHADOW = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B61, .hexadecimal);
pub const GL_SAMPLER_2D_SHADOW = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B62, .hexadecimal);
pub const GL_DELETE_STATUS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B80, .hexadecimal);
pub const GL_COMPILE_STATUS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B81, .hexadecimal);
pub const GL_LINK_STATUS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B82, .hexadecimal);
pub const GL_VALIDATE_STATUS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B83, .hexadecimal);
pub const GL_INFO_LOG_LENGTH = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B84, .hexadecimal);
pub const GL_ATTACHED_SHADERS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B85, .hexadecimal);
pub const GL_ACTIVE_UNIFORMS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B86, .hexadecimal);
pub const GL_ACTIVE_UNIFORM_MAX_LENGTH = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B87, .hexadecimal);
pub const GL_SHADER_SOURCE_LENGTH = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B88, .hexadecimal);
pub const GL_ACTIVE_ATTRIBUTES = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B89, .hexadecimal);
pub const GL_ACTIVE_ATTRIBUTE_MAX_LENGTH = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B8A, .hexadecimal);
pub const GL_FRAGMENT_SHADER_DERIVATIVE_HINT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B8B, .hexadecimal);
pub const GL_SHADING_LANGUAGE_VERSION = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B8C, .hexadecimal);
pub const GL_CURRENT_PROGRAM = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B8D, .hexadecimal);
pub const GL_POINT_SPRITE_COORD_ORIGIN = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CA0, .hexadecimal);
pub const GL_LOWER_LEFT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CA1, .hexadecimal);
pub const GL_UPPER_LEFT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CA2, .hexadecimal);
pub const GL_STENCIL_BACK_REF = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CA3, .hexadecimal);
pub const GL_STENCIL_BACK_VALUE_MASK = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CA4, .hexadecimal);
pub const GL_STENCIL_BACK_WRITEMASK = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CA5, .hexadecimal);
pub const GL_PIXEL_PACK_BUFFER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x88EB, .hexadecimal);
pub const GL_PIXEL_UNPACK_BUFFER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x88EC, .hexadecimal);
pub const GL_PIXEL_PACK_BUFFER_BINDING = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x88ED, .hexadecimal);
pub const GL_PIXEL_UNPACK_BUFFER_BINDING = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x88EF, .hexadecimal);
pub const GL_FLOAT_MAT2x3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B65, .hexadecimal);
pub const GL_FLOAT_MAT2x4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B66, .hexadecimal);
pub const GL_FLOAT_MAT3x2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B67, .hexadecimal);
pub const GL_FLOAT_MAT3x4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B68, .hexadecimal);
pub const GL_FLOAT_MAT4x2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B69, .hexadecimal);
pub const GL_FLOAT_MAT4x3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B6A, .hexadecimal);
pub const GL_SRGB = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C40, .hexadecimal);
pub const GL_SRGB8 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C41, .hexadecimal);
pub const GL_SRGB_ALPHA = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C42, .hexadecimal);
pub const GL_SRGB8_ALPHA8 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C43, .hexadecimal);
pub const GL_COMPRESSED_SRGB = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C48, .hexadecimal);
pub const GL_COMPRESSED_SRGB_ALPHA = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C49, .hexadecimal);
pub const GL_COMPARE_REF_TO_TEXTURE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x884E, .hexadecimal);
pub const GL_CLIP_DISTANCE0 = @as(c_int, 0x3000);
pub const GL_CLIP_DISTANCE1 = @as(c_int, 0x3001);
pub const GL_CLIP_DISTANCE2 = @as(c_int, 0x3002);
pub const GL_CLIP_DISTANCE3 = @as(c_int, 0x3003);
pub const GL_CLIP_DISTANCE4 = @as(c_int, 0x3004);
pub const GL_CLIP_DISTANCE5 = @as(c_int, 0x3005);
pub const GL_CLIP_DISTANCE6 = @as(c_int, 0x3006);
pub const GL_CLIP_DISTANCE7 = @as(c_int, 0x3007);
pub const GL_MAX_CLIP_DISTANCES = @as(c_int, 0x0D32);
pub const GL_MAJOR_VERSION = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x821B, .hexadecimal);
pub const GL_MINOR_VERSION = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x821C, .hexadecimal);
pub const GL_NUM_EXTENSIONS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x821D, .hexadecimal);
pub const GL_CONTEXT_FLAGS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x821E, .hexadecimal);
pub const GL_COMPRESSED_RED = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8225, .hexadecimal);
pub const GL_COMPRESSED_RG = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8226, .hexadecimal);
pub const GL_CONTEXT_FLAG_FORWARD_COMPATIBLE_BIT = @as(c_int, 0x00000001);
pub const GL_RGBA32F = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8814, .hexadecimal);
pub const GL_RGB32F = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8815, .hexadecimal);
pub const GL_RGBA16F = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x881A, .hexadecimal);
pub const GL_RGB16F = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x881B, .hexadecimal);
pub const GL_VERTEX_ATTRIB_ARRAY_INTEGER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x88FD, .hexadecimal);
pub const GL_MAX_ARRAY_TEXTURE_LAYERS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x88FF, .hexadecimal);
pub const GL_MIN_PROGRAM_TEXEL_OFFSET = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8904, .hexadecimal);
pub const GL_MAX_PROGRAM_TEXEL_OFFSET = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8905, .hexadecimal);
pub const GL_CLAMP_READ_COLOR = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x891C, .hexadecimal);
pub const GL_FIXED_ONLY = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x891D, .hexadecimal);
pub const GL_MAX_VARYING_COMPONENTS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B4B, .hexadecimal);
pub const GL_TEXTURE_1D_ARRAY = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C18, .hexadecimal);
pub const GL_PROXY_TEXTURE_1D_ARRAY = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C19, .hexadecimal);
pub const GL_TEXTURE_2D_ARRAY = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C1A, .hexadecimal);
pub const GL_PROXY_TEXTURE_2D_ARRAY = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C1B, .hexadecimal);
pub const GL_TEXTURE_BINDING_1D_ARRAY = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C1C, .hexadecimal);
pub const GL_TEXTURE_BINDING_2D_ARRAY = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C1D, .hexadecimal);
pub const GL_R11F_G11F_B10F = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C3A, .hexadecimal);
pub const GL_UNSIGNED_INT_10F_11F_11F_REV = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C3B, .hexadecimal);
pub const GL_RGB9_E5 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C3D, .hexadecimal);
pub const GL_UNSIGNED_INT_5_9_9_9_REV = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C3E, .hexadecimal);
pub const GL_TEXTURE_SHARED_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C3F, .hexadecimal);
pub const GL_TRANSFORM_FEEDBACK_VARYING_MAX_LENGTH = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C76, .hexadecimal);
pub const GL_TRANSFORM_FEEDBACK_BUFFER_MODE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C7F, .hexadecimal);
pub const GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_COMPONENTS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C80, .hexadecimal);
pub const GL_TRANSFORM_FEEDBACK_VARYINGS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C83, .hexadecimal);
pub const GL_TRANSFORM_FEEDBACK_BUFFER_START = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C84, .hexadecimal);
pub const GL_TRANSFORM_FEEDBACK_BUFFER_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C85, .hexadecimal);
pub const GL_PRIMITIVES_GENERATED = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C87, .hexadecimal);
pub const GL_TRANSFORM_FEEDBACK_PRIMITIVES_WRITTEN = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C88, .hexadecimal);
pub const GL_RASTERIZER_DISCARD = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C89, .hexadecimal);
pub const GL_MAX_TRANSFORM_FEEDBACK_INTERLEAVED_COMPONENTS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C8A, .hexadecimal);
pub const GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_ATTRIBS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C8B, .hexadecimal);
pub const GL_INTERLEAVED_ATTRIBS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C8C, .hexadecimal);
pub const GL_SEPARATE_ATTRIBS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C8D, .hexadecimal);
pub const GL_TRANSFORM_FEEDBACK_BUFFER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C8E, .hexadecimal);
pub const GL_TRANSFORM_FEEDBACK_BUFFER_BINDING = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C8F, .hexadecimal);
pub const GL_RGBA32UI = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8D70, .hexadecimal);
pub const GL_RGB32UI = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8D71, .hexadecimal);
pub const GL_RGBA16UI = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8D76, .hexadecimal);
pub const GL_RGB16UI = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8D77, .hexadecimal);
pub const GL_RGBA8UI = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8D7C, .hexadecimal);
pub const GL_RGB8UI = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8D7D, .hexadecimal);
pub const GL_RGBA32I = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8D82, .hexadecimal);
pub const GL_RGB32I = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8D83, .hexadecimal);
pub const GL_RGBA16I = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8D88, .hexadecimal);
pub const GL_RGB16I = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8D89, .hexadecimal);
pub const GL_RGBA8I = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8D8E, .hexadecimal);
pub const GL_RGB8I = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8D8F, .hexadecimal);
pub const GL_RED_INTEGER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8D94, .hexadecimal);
pub const GL_GREEN_INTEGER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8D95, .hexadecimal);
pub const GL_BLUE_INTEGER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8D96, .hexadecimal);
pub const GL_RGB_INTEGER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8D98, .hexadecimal);
pub const GL_RGBA_INTEGER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8D99, .hexadecimal);
pub const GL_BGR_INTEGER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8D9A, .hexadecimal);
pub const GL_BGRA_INTEGER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8D9B, .hexadecimal);
pub const GL_SAMPLER_1D_ARRAY = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8DC0, .hexadecimal);
pub const GL_SAMPLER_2D_ARRAY = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8DC1, .hexadecimal);
pub const GL_SAMPLER_1D_ARRAY_SHADOW = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8DC3, .hexadecimal);
pub const GL_SAMPLER_2D_ARRAY_SHADOW = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8DC4, .hexadecimal);
pub const GL_SAMPLER_CUBE_SHADOW = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8DC5, .hexadecimal);
pub const GL_UNSIGNED_INT_VEC2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8DC6, .hexadecimal);
pub const GL_UNSIGNED_INT_VEC3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8DC7, .hexadecimal);
pub const GL_UNSIGNED_INT_VEC4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8DC8, .hexadecimal);
pub const GL_INT_SAMPLER_1D = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8DC9, .hexadecimal);
pub const GL_INT_SAMPLER_2D = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8DCA, .hexadecimal);
pub const GL_INT_SAMPLER_3D = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8DCB, .hexadecimal);
pub const GL_INT_SAMPLER_CUBE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8DCC, .hexadecimal);
pub const GL_INT_SAMPLER_1D_ARRAY = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8DCE, .hexadecimal);
pub const GL_INT_SAMPLER_2D_ARRAY = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8DCF, .hexadecimal);
pub const GL_UNSIGNED_INT_SAMPLER_1D = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8DD1, .hexadecimal);
pub const GL_UNSIGNED_INT_SAMPLER_2D = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8DD2, .hexadecimal);
pub const GL_UNSIGNED_INT_SAMPLER_3D = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8DD3, .hexadecimal);
pub const GL_UNSIGNED_INT_SAMPLER_CUBE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8DD4, .hexadecimal);
pub const GL_UNSIGNED_INT_SAMPLER_1D_ARRAY = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8DD6, .hexadecimal);
pub const GL_UNSIGNED_INT_SAMPLER_2D_ARRAY = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8DD7, .hexadecimal);
pub const GL_QUERY_WAIT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8E13, .hexadecimal);
pub const GL_QUERY_NO_WAIT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8E14, .hexadecimal);
pub const GL_QUERY_BY_REGION_WAIT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8E15, .hexadecimal);
pub const GL_QUERY_BY_REGION_NO_WAIT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8E16, .hexadecimal);
pub const GL_BUFFER_ACCESS_FLAGS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x911F, .hexadecimal);
pub const GL_BUFFER_MAP_LENGTH = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x9120, .hexadecimal);
pub const GL_BUFFER_MAP_OFFSET = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x9121, .hexadecimal);
pub const GL_DEPTH_COMPONENT32F = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CAC, .hexadecimal);
pub const GL_DEPTH32F_STENCIL8 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CAD, .hexadecimal);
pub const GL_FLOAT_32_UNSIGNED_INT_24_8_REV = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8DAD, .hexadecimal);
pub const GL_INVALID_FRAMEBUFFER_OPERATION = @as(c_int, 0x0506);
pub const GL_FRAMEBUFFER_ATTACHMENT_COLOR_ENCODING = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8210, .hexadecimal);
pub const GL_FRAMEBUFFER_ATTACHMENT_COMPONENT_TYPE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8211, .hexadecimal);
pub const GL_FRAMEBUFFER_ATTACHMENT_RED_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8212, .hexadecimal);
pub const GL_FRAMEBUFFER_ATTACHMENT_GREEN_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8213, .hexadecimal);
pub const GL_FRAMEBUFFER_ATTACHMENT_BLUE_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8214, .hexadecimal);
pub const GL_FRAMEBUFFER_ATTACHMENT_ALPHA_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8215, .hexadecimal);
pub const GL_FRAMEBUFFER_ATTACHMENT_DEPTH_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8216, .hexadecimal);
pub const GL_FRAMEBUFFER_ATTACHMENT_STENCIL_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8217, .hexadecimal);
pub const GL_FRAMEBUFFER_DEFAULT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8218, .hexadecimal);
pub const GL_FRAMEBUFFER_UNDEFINED = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8219, .hexadecimal);
pub const GL_DEPTH_STENCIL_ATTACHMENT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x821A, .hexadecimal);
pub const GL_MAX_RENDERBUFFER_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84E8, .hexadecimal);
pub const GL_DEPTH_STENCIL = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84F9, .hexadecimal);
pub const GL_UNSIGNED_INT_24_8 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84FA, .hexadecimal);
pub const GL_DEPTH24_STENCIL8 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x88F0, .hexadecimal);
pub const GL_TEXTURE_STENCIL_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x88F1, .hexadecimal);
pub const GL_TEXTURE_RED_TYPE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C10, .hexadecimal);
pub const GL_TEXTURE_GREEN_TYPE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C11, .hexadecimal);
pub const GL_TEXTURE_BLUE_TYPE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C12, .hexadecimal);
pub const GL_TEXTURE_ALPHA_TYPE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C13, .hexadecimal);
pub const GL_TEXTURE_DEPTH_TYPE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C16, .hexadecimal);
pub const GL_UNSIGNED_NORMALIZED = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C17, .hexadecimal);
pub const GL_FRAMEBUFFER_BINDING = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CA6, .hexadecimal);
pub const GL_DRAW_FRAMEBUFFER_BINDING = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CA6, .hexadecimal);
pub const GL_RENDERBUFFER_BINDING = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CA7, .hexadecimal);
pub const GL_READ_FRAMEBUFFER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CA8, .hexadecimal);
pub const GL_DRAW_FRAMEBUFFER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CA9, .hexadecimal);
pub const GL_READ_FRAMEBUFFER_BINDING = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CAA, .hexadecimal);
pub const GL_RENDERBUFFER_SAMPLES = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CAB, .hexadecimal);
pub const GL_FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CD0, .hexadecimal);
pub const GL_FRAMEBUFFER_ATTACHMENT_OBJECT_NAME = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CD1, .hexadecimal);
pub const GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CD2, .hexadecimal);
pub const GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CD3, .hexadecimal);
pub const GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LAYER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CD4, .hexadecimal);
pub const GL_FRAMEBUFFER_COMPLETE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CD5, .hexadecimal);
pub const GL_FRAMEBUFFER_INCOMPLETE_ATTACHMENT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CD6, .hexadecimal);
pub const GL_FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CD7, .hexadecimal);
pub const GL_FRAMEBUFFER_INCOMPLETE_DRAW_BUFFER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CDB, .hexadecimal);
pub const GL_FRAMEBUFFER_INCOMPLETE_READ_BUFFER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CDC, .hexadecimal);
pub const GL_FRAMEBUFFER_UNSUPPORTED = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CDD, .hexadecimal);
pub const GL_MAX_COLOR_ATTACHMENTS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CDF, .hexadecimal);
pub const GL_COLOR_ATTACHMENT0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CE0, .hexadecimal);
pub const GL_COLOR_ATTACHMENT1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CE1, .hexadecimal);
pub const GL_COLOR_ATTACHMENT2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CE2, .hexadecimal);
pub const GL_COLOR_ATTACHMENT3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CE3, .hexadecimal);
pub const GL_COLOR_ATTACHMENT4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CE4, .hexadecimal);
pub const GL_COLOR_ATTACHMENT5 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CE5, .hexadecimal);
pub const GL_COLOR_ATTACHMENT6 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CE6, .hexadecimal);
pub const GL_COLOR_ATTACHMENT7 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CE7, .hexadecimal);
pub const GL_COLOR_ATTACHMENT8 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CE8, .hexadecimal);
pub const GL_COLOR_ATTACHMENT9 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CE9, .hexadecimal);
pub const GL_COLOR_ATTACHMENT10 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CEA, .hexadecimal);
pub const GL_COLOR_ATTACHMENT11 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CEB, .hexadecimal);
pub const GL_COLOR_ATTACHMENT12 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CEC, .hexadecimal);
pub const GL_COLOR_ATTACHMENT13 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CED, .hexadecimal);
pub const GL_COLOR_ATTACHMENT14 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CEE, .hexadecimal);
pub const GL_COLOR_ATTACHMENT15 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CEF, .hexadecimal);
pub const GL_COLOR_ATTACHMENT16 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CF0, .hexadecimal);
pub const GL_COLOR_ATTACHMENT17 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CF1, .hexadecimal);
pub const GL_COLOR_ATTACHMENT18 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CF2, .hexadecimal);
pub const GL_COLOR_ATTACHMENT19 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CF3, .hexadecimal);
pub const GL_COLOR_ATTACHMENT20 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CF4, .hexadecimal);
pub const GL_COLOR_ATTACHMENT21 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CF5, .hexadecimal);
pub const GL_COLOR_ATTACHMENT22 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CF6, .hexadecimal);
pub const GL_COLOR_ATTACHMENT23 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CF7, .hexadecimal);
pub const GL_COLOR_ATTACHMENT24 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CF8, .hexadecimal);
pub const GL_COLOR_ATTACHMENT25 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CF9, .hexadecimal);
pub const GL_COLOR_ATTACHMENT26 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CFA, .hexadecimal);
pub const GL_COLOR_ATTACHMENT27 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CFB, .hexadecimal);
pub const GL_COLOR_ATTACHMENT28 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CFC, .hexadecimal);
pub const GL_COLOR_ATTACHMENT29 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CFD, .hexadecimal);
pub const GL_COLOR_ATTACHMENT30 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CFE, .hexadecimal);
pub const GL_COLOR_ATTACHMENT31 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CFF, .hexadecimal);
pub const GL_DEPTH_ATTACHMENT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8D00, .hexadecimal);
pub const GL_STENCIL_ATTACHMENT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8D20, .hexadecimal);
pub const GL_FRAMEBUFFER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8D40, .hexadecimal);
pub const GL_RENDERBUFFER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8D41, .hexadecimal);
pub const GL_RENDERBUFFER_WIDTH = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8D42, .hexadecimal);
pub const GL_RENDERBUFFER_HEIGHT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8D43, .hexadecimal);
pub const GL_RENDERBUFFER_INTERNAL_FORMAT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8D44, .hexadecimal);
pub const GL_STENCIL_INDEX1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8D46, .hexadecimal);
pub const GL_STENCIL_INDEX4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8D47, .hexadecimal);
pub const GL_STENCIL_INDEX8 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8D48, .hexadecimal);
pub const GL_STENCIL_INDEX16 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8D49, .hexadecimal);
pub const GL_RENDERBUFFER_RED_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8D50, .hexadecimal);
pub const GL_RENDERBUFFER_GREEN_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8D51, .hexadecimal);
pub const GL_RENDERBUFFER_BLUE_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8D52, .hexadecimal);
pub const GL_RENDERBUFFER_ALPHA_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8D53, .hexadecimal);
pub const GL_RENDERBUFFER_DEPTH_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8D54, .hexadecimal);
pub const GL_RENDERBUFFER_STENCIL_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8D55, .hexadecimal);
pub const GL_FRAMEBUFFER_INCOMPLETE_MULTISAMPLE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8D56, .hexadecimal);
pub const GL_MAX_SAMPLES = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8D57, .hexadecimal);
pub const GL_FRAMEBUFFER_SRGB = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8DB9, .hexadecimal);
pub const GL_HALF_FLOAT = @as(c_int, 0x140B);
pub const GL_MAP_READ_BIT = @as(c_int, 0x0001);
pub const GL_MAP_WRITE_BIT = @as(c_int, 0x0002);
pub const GL_MAP_INVALIDATE_RANGE_BIT = @as(c_int, 0x0004);
pub const GL_MAP_INVALIDATE_BUFFER_BIT = @as(c_int, 0x0008);
pub const GL_MAP_FLUSH_EXPLICIT_BIT = @as(c_int, 0x0010);
pub const GL_MAP_UNSYNCHRONIZED_BIT = @as(c_int, 0x0020);
pub const GL_COMPRESSED_RED_RGTC1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8DBB, .hexadecimal);
pub const GL_COMPRESSED_SIGNED_RED_RGTC1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8DBC, .hexadecimal);
pub const GL_COMPRESSED_RG_RGTC2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8DBD, .hexadecimal);
pub const GL_COMPRESSED_SIGNED_RG_RGTC2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8DBE, .hexadecimal);
pub const GL_RG = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8227, .hexadecimal);
pub const GL_RG_INTEGER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8228, .hexadecimal);
pub const GL_R8 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8229, .hexadecimal);
pub const GL_R16 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x822A, .hexadecimal);
pub const GL_RG8 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x822B, .hexadecimal);
pub const GL_RG16 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x822C, .hexadecimal);
pub const GL_R16F = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x822D, .hexadecimal);
pub const GL_R32F = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x822E, .hexadecimal);
pub const GL_RG16F = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x822F, .hexadecimal);
pub const GL_RG32F = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8230, .hexadecimal);
pub const GL_R8I = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8231, .hexadecimal);
pub const GL_R8UI = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8232, .hexadecimal);
pub const GL_R16I = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8233, .hexadecimal);
pub const GL_R16UI = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8234, .hexadecimal);
pub const GL_R32I = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8235, .hexadecimal);
pub const GL_R32UI = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8236, .hexadecimal);
pub const GL_RG8I = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8237, .hexadecimal);
pub const GL_RG8UI = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8238, .hexadecimal);
pub const GL_RG16I = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8239, .hexadecimal);
pub const GL_RG16UI = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x823A, .hexadecimal);
pub const GL_RG32I = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x823B, .hexadecimal);
pub const GL_RG32UI = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x823C, .hexadecimal);
pub const GL_VERTEX_ARRAY_BINDING = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x85B5, .hexadecimal);
pub const GL_SAMPLER_2D_RECT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B63, .hexadecimal);
pub const GL_SAMPLER_2D_RECT_SHADOW = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B64, .hexadecimal);
pub const GL_SAMPLER_BUFFER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8DC2, .hexadecimal);
pub const GL_INT_SAMPLER_2D_RECT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8DCD, .hexadecimal);
pub const GL_INT_SAMPLER_BUFFER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8DD0, .hexadecimal);
pub const GL_UNSIGNED_INT_SAMPLER_2D_RECT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8DD5, .hexadecimal);
pub const GL_UNSIGNED_INT_SAMPLER_BUFFER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8DD8, .hexadecimal);
pub const GL_TEXTURE_BUFFER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C2A, .hexadecimal);
pub const GL_MAX_TEXTURE_BUFFER_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C2B, .hexadecimal);
pub const GL_TEXTURE_BINDING_BUFFER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C2C, .hexadecimal);
pub const GL_TEXTURE_BUFFER_DATA_STORE_BINDING = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C2D, .hexadecimal);
pub const GL_TEXTURE_RECTANGLE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84F5, .hexadecimal);
pub const GL_TEXTURE_BINDING_RECTANGLE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84F6, .hexadecimal);
pub const GL_PROXY_TEXTURE_RECTANGLE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84F7, .hexadecimal);
pub const GL_MAX_RECTANGLE_TEXTURE_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84F8, .hexadecimal);
pub const GL_R8_SNORM = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8F94, .hexadecimal);
pub const GL_RG8_SNORM = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8F95, .hexadecimal);
pub const GL_RGB8_SNORM = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8F96, .hexadecimal);
pub const GL_RGBA8_SNORM = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8F97, .hexadecimal);
pub const GL_R16_SNORM = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8F98, .hexadecimal);
pub const GL_RG16_SNORM = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8F99, .hexadecimal);
pub const GL_RGB16_SNORM = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8F9A, .hexadecimal);
pub const GL_RGBA16_SNORM = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8F9B, .hexadecimal);
pub const GL_SIGNED_NORMALIZED = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8F9C, .hexadecimal);
pub const GL_PRIMITIVE_RESTART = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8F9D, .hexadecimal);
pub const GL_PRIMITIVE_RESTART_INDEX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8F9E, .hexadecimal);
pub const GL_COPY_READ_BUFFER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8F36, .hexadecimal);
pub const GL_COPY_WRITE_BUFFER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8F37, .hexadecimal);
pub const GL_UNIFORM_BUFFER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8A11, .hexadecimal);
pub const GL_UNIFORM_BUFFER_BINDING = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8A28, .hexadecimal);
pub const GL_UNIFORM_BUFFER_START = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8A29, .hexadecimal);
pub const GL_UNIFORM_BUFFER_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8A2A, .hexadecimal);
pub const GL_MAX_VERTEX_UNIFORM_BLOCKS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8A2B, .hexadecimal);
pub const GL_MAX_GEOMETRY_UNIFORM_BLOCKS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8A2C, .hexadecimal);
pub const GL_MAX_FRAGMENT_UNIFORM_BLOCKS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8A2D, .hexadecimal);
pub const GL_MAX_COMBINED_UNIFORM_BLOCKS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8A2E, .hexadecimal);
pub const GL_MAX_UNIFORM_BUFFER_BINDINGS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8A2F, .hexadecimal);
pub const GL_MAX_UNIFORM_BLOCK_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8A30, .hexadecimal);
pub const GL_MAX_COMBINED_VERTEX_UNIFORM_COMPONENTS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8A31, .hexadecimal);
pub const GL_MAX_COMBINED_GEOMETRY_UNIFORM_COMPONENTS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8A32, .hexadecimal);
pub const GL_MAX_COMBINED_FRAGMENT_UNIFORM_COMPONENTS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8A33, .hexadecimal);
pub const GL_UNIFORM_BUFFER_OFFSET_ALIGNMENT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8A34, .hexadecimal);
pub const GL_ACTIVE_UNIFORM_BLOCK_MAX_NAME_LENGTH = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8A35, .hexadecimal);
pub const GL_ACTIVE_UNIFORM_BLOCKS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8A36, .hexadecimal);
pub const GL_UNIFORM_TYPE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8A37, .hexadecimal);
pub const GL_UNIFORM_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8A38, .hexadecimal);
pub const GL_UNIFORM_NAME_LENGTH = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8A39, .hexadecimal);
pub const GL_UNIFORM_BLOCK_INDEX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8A3A, .hexadecimal);
pub const GL_UNIFORM_OFFSET = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8A3B, .hexadecimal);
pub const GL_UNIFORM_ARRAY_STRIDE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8A3C, .hexadecimal);
pub const GL_UNIFORM_MATRIX_STRIDE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8A3D, .hexadecimal);
pub const GL_UNIFORM_IS_ROW_MAJOR = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8A3E, .hexadecimal);
pub const GL_UNIFORM_BLOCK_BINDING = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8A3F, .hexadecimal);
pub const GL_UNIFORM_BLOCK_DATA_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8A40, .hexadecimal);
pub const GL_UNIFORM_BLOCK_NAME_LENGTH = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8A41, .hexadecimal);
pub const GL_UNIFORM_BLOCK_ACTIVE_UNIFORMS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8A42, .hexadecimal);
pub const GL_UNIFORM_BLOCK_ACTIVE_UNIFORM_INDICES = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8A43, .hexadecimal);
pub const GL_UNIFORM_BLOCK_REFERENCED_BY_VERTEX_SHADER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8A44, .hexadecimal);
pub const GL_UNIFORM_BLOCK_REFERENCED_BY_GEOMETRY_SHADER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8A45, .hexadecimal);
pub const GL_UNIFORM_BLOCK_REFERENCED_BY_FRAGMENT_SHADER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8A46, .hexadecimal);
pub const GL_INVALID_INDEX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xFFFFFFFF, .hexadecimal);
pub const GL_CONTEXT_CORE_PROFILE_BIT = @as(c_int, 0x00000001);
pub const GL_CONTEXT_COMPATIBILITY_PROFILE_BIT = @as(c_int, 0x00000002);
pub const GL_LINES_ADJACENCY = @as(c_int, 0x000A);
pub const GL_LINE_STRIP_ADJACENCY = @as(c_int, 0x000B);
pub const GL_TRIANGLES_ADJACENCY = @as(c_int, 0x000C);
pub const GL_TRIANGLE_STRIP_ADJACENCY = @as(c_int, 0x000D);
pub const GL_PROGRAM_POINT_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8642, .hexadecimal);
pub const GL_MAX_GEOMETRY_TEXTURE_IMAGE_UNITS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C29, .hexadecimal);
pub const GL_FRAMEBUFFER_ATTACHMENT_LAYERED = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8DA7, .hexadecimal);
pub const GL_FRAMEBUFFER_INCOMPLETE_LAYER_TARGETS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8DA8, .hexadecimal);
pub const GL_GEOMETRY_SHADER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8DD9, .hexadecimal);
pub const GL_GEOMETRY_VERTICES_OUT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8916, .hexadecimal);
pub const GL_GEOMETRY_INPUT_TYPE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8917, .hexadecimal);
pub const GL_GEOMETRY_OUTPUT_TYPE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8918, .hexadecimal);
pub const GL_MAX_GEOMETRY_UNIFORM_COMPONENTS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8DDF, .hexadecimal);
pub const GL_MAX_GEOMETRY_OUTPUT_VERTICES = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8DE0, .hexadecimal);
pub const GL_MAX_GEOMETRY_TOTAL_OUTPUT_COMPONENTS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8DE1, .hexadecimal);
pub const GL_MAX_VERTEX_OUTPUT_COMPONENTS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x9122, .hexadecimal);
pub const GL_MAX_GEOMETRY_INPUT_COMPONENTS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x9123, .hexadecimal);
pub const GL_MAX_GEOMETRY_OUTPUT_COMPONENTS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x9124, .hexadecimal);
pub const GL_MAX_FRAGMENT_INPUT_COMPONENTS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x9125, .hexadecimal);
pub const GL_CONTEXT_PROFILE_MASK = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x9126, .hexadecimal);
pub const GL_DEPTH_CLAMP = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x864F, .hexadecimal);
pub const GL_QUADS_FOLLOW_PROVOKING_VERTEX_CONVENTION = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8E4C, .hexadecimal);
pub const GL_FIRST_VERTEX_CONVENTION = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8E4D, .hexadecimal);
pub const GL_LAST_VERTEX_CONVENTION = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8E4E, .hexadecimal);
pub const GL_PROVOKING_VERTEX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8E4F, .hexadecimal);
pub const GL_TEXTURE_CUBE_MAP_SEAMLESS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x884F, .hexadecimal);
pub const GL_MAX_SERVER_WAIT_TIMEOUT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x9111, .hexadecimal);
pub const GL_OBJECT_TYPE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x9112, .hexadecimal);
pub const GL_SYNC_CONDITION = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x9113, .hexadecimal);
pub const GL_SYNC_STATUS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x9114, .hexadecimal);
pub const GL_SYNC_FLAGS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x9115, .hexadecimal);
pub const GL_SYNC_FENCE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x9116, .hexadecimal);
pub const GL_SYNC_GPU_COMMANDS_COMPLETE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x9117, .hexadecimal);
pub const GL_UNSIGNALED = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x9118, .hexadecimal);
pub const GL_SIGNALED = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x9119, .hexadecimal);
pub const GL_ALREADY_SIGNALED = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x911A, .hexadecimal);
pub const GL_TIMEOUT_EXPIRED = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x911B, .hexadecimal);
pub const GL_CONDITION_SATISFIED = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x911C, .hexadecimal);
pub const GL_WAIT_FAILED = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x911D, .hexadecimal);
pub const GL_TIMEOUT_IGNORED = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xFFFFFFFFFFFFFFFF, .hexadecimal);
pub const GL_SYNC_FLUSH_COMMANDS_BIT = @as(c_int, 0x00000001);
pub const GL_SAMPLE_POSITION = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8E50, .hexadecimal);
pub const GL_SAMPLE_MASK = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8E51, .hexadecimal);
pub const GL_SAMPLE_MASK_VALUE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8E52, .hexadecimal);
pub const GL_MAX_SAMPLE_MASK_WORDS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8E59, .hexadecimal);
pub const GL_TEXTURE_2D_MULTISAMPLE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x9100, .hexadecimal);
pub const GL_PROXY_TEXTURE_2D_MULTISAMPLE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x9101, .hexadecimal);
pub const GL_TEXTURE_2D_MULTISAMPLE_ARRAY = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x9102, .hexadecimal);
pub const GL_PROXY_TEXTURE_2D_MULTISAMPLE_ARRAY = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x9103, .hexadecimal);
pub const GL_TEXTURE_BINDING_2D_MULTISAMPLE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x9104, .hexadecimal);
pub const GL_TEXTURE_BINDING_2D_MULTISAMPLE_ARRAY = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x9105, .hexadecimal);
pub const GL_TEXTURE_SAMPLES = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x9106, .hexadecimal);
pub const GL_TEXTURE_FIXED_SAMPLE_LOCATIONS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x9107, .hexadecimal);
pub const GL_SAMPLER_2D_MULTISAMPLE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x9108, .hexadecimal);
pub const GL_INT_SAMPLER_2D_MULTISAMPLE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x9109, .hexadecimal);
pub const GL_UNSIGNED_INT_SAMPLER_2D_MULTISAMPLE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x910A, .hexadecimal);
pub const GL_SAMPLER_2D_MULTISAMPLE_ARRAY = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x910B, .hexadecimal);
pub const GL_INT_SAMPLER_2D_MULTISAMPLE_ARRAY = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x910C, .hexadecimal);
pub const GL_UNSIGNED_INT_SAMPLER_2D_MULTISAMPLE_ARRAY = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x910D, .hexadecimal);
pub const GL_MAX_COLOR_TEXTURE_SAMPLES = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x910E, .hexadecimal);
pub const GL_MAX_DEPTH_TEXTURE_SAMPLES = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x910F, .hexadecimal);
pub const GL_MAX_INTEGER_SAMPLES = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x9110, .hexadecimal);
pub const GL_VERTEX_ATTRIB_ARRAY_DIVISOR = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x88FE, .hexadecimal);
pub const GL_SRC1_COLOR = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x88F9, .hexadecimal);
pub const GL_ONE_MINUS_SRC1_COLOR = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x88FA, .hexadecimal);
pub const GL_ONE_MINUS_SRC1_ALPHA = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x88FB, .hexadecimal);
pub const GL_MAX_DUAL_SOURCE_DRAW_BUFFERS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x88FC, .hexadecimal);
pub const GL_ANY_SAMPLES_PASSED = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C2F, .hexadecimal);
pub const GL_SAMPLER_BINDING = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8919, .hexadecimal);
pub const GL_RGB10_A2UI = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x906F, .hexadecimal);
pub const GL_TEXTURE_SWIZZLE_R = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8E42, .hexadecimal);
pub const GL_TEXTURE_SWIZZLE_G = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8E43, .hexadecimal);
pub const GL_TEXTURE_SWIZZLE_B = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8E44, .hexadecimal);
pub const GL_TEXTURE_SWIZZLE_A = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8E45, .hexadecimal);
pub const GL_TEXTURE_SWIZZLE_RGBA = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8E46, .hexadecimal);
pub const GL_TIME_ELAPSED = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x88BF, .hexadecimal);
pub const GL_TIMESTAMP = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8E28, .hexadecimal);
pub const GL_INT_2_10_10_10_REV = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8D9F, .hexadecimal);
pub const GL_VERSION_1_0 = @as(c_int, 1);
pub inline fn glCullFace(arg_2: GLenum) void {
    return glad_glCullFace.?(arg_2);
}
pub inline fn glFrontFace(arg_3: GLenum) void {
    return glad_glFrontFace.?(arg_3);
}
pub inline fn glHint(arg_4: GLenum, arg_5: GLenum) void {
    return glad_glHint.?(arg_4, arg_5);
}
pub inline fn glLineWidth(arg_6: GLfloat) void {
    return glad_glLineWidth.?(arg_6);
}
pub inline fn glPointSize(arg_7: GLfloat) void {
    return glad_glPointSize.?(arg_7);
}
pub inline fn glPolygonMode(arg_8: GLenum, arg_9: GLenum) void {
    return glad_glPolygonMode.?(arg_8, arg_9);
}
pub inline fn glScissor(arg_10: GLint, arg_11: GLint, arg_12: GLsizei, arg_13: GLsizei) void {
    return glad_glScissor.?(arg_10, arg_11, arg_12, arg_13);
}
pub inline fn glTexParameterf(arg_14: GLenum, arg_15: GLenum, arg_16: GLfloat) void {
    return glad_glTexParameterf.?(arg_14, arg_15, arg_16);
}
pub inline fn glTexParameterfv(arg_17: GLenum, arg_18: GLenum, arg_19: [*c]const GLfloat) void {
    return glad_glTexParameterfv.?(arg_17, arg_18, arg_19);
}
pub inline fn glTexParameteri(arg_20: GLenum, arg_21: GLenum, arg_22: GLint) void {
    return glad_glTexParameteri.?(arg_20, arg_21, arg_22);
}
pub inline fn glTexParameteriv(arg_23: GLenum, arg_24: GLenum, arg_25: [*c]const GLint) void {
    return glad_glTexParameteriv.?(arg_23, arg_24, arg_25);
}
pub inline fn glTexImage1D(arg_26: GLenum, arg_27: GLint, arg_28: GLint, arg_29: GLsizei, arg_30: GLint, arg_31: GLenum, arg_32: GLenum, arg_33: ?*const c_void) void {
    return glad_glTexImage1D.?(arg_26, arg_27, arg_28, arg_29, arg_30, arg_31, arg_32, arg_33);
}
pub inline fn glTexImage2D(arg_34: GLenum, arg_35: GLint, arg_36: GLint, arg_37: GLsizei, arg_38: GLsizei, arg_39: GLint, arg_40: GLenum, arg_41: GLenum, arg_42: ?*const c_void) void {
    return glad_glTexImage2D.?(arg_34, arg_35, arg_36, arg_37, arg_38, arg_39, arg_40, arg_41, arg_42);
}
pub inline fn glDrawBuffer(arg_43: GLenum) void {
    return glad_glDrawBuffer.?(arg_43);
}
pub inline fn glClear(arg_44: GLbitfield) void {
    return glad_glClear.?(arg_44);
}
pub inline fn glClearColor(arg_45: GLfloat, arg_46: GLfloat, arg_47: GLfloat, arg_48: GLfloat) void {
    return glad_glClearColor.?(arg_45, arg_46, arg_47, arg_48);
}
pub inline fn glClearStencil(arg_49: GLint) void {
    return glad_glClearStencil.?(arg_49);
}
pub inline fn glClearDepth(arg_50: GLdouble) void {
    return glad_glClearDepth.?(arg_50);
}
pub inline fn glStencilMask(arg_51: GLuint) void {
    return glad_glStencilMask.?(arg_51);
}
pub inline fn glColorMask(arg_52: GLboolean, arg_53: GLboolean, arg_54: GLboolean, arg_55: GLboolean) void {
    return glad_glColorMask.?(arg_52, arg_53, arg_54, arg_55);
}
pub inline fn glDepthMask(arg_56: GLboolean) void {
    return glad_glDepthMask.?(arg_56);
}
pub inline fn glDisable(arg_57: GLenum) void {
    return glad_glDisable.?(arg_57);
}
pub inline fn glEnable(arg_58: GLenum) void {
    return glad_glEnable.?(arg_58);
}
pub inline fn glFinish() void {
    return glad_glFinish.?();
}
pub inline fn glFlush() void {
    return glad_glFlush.?();
}
pub inline fn glBlendFunc(arg_59: GLenum, arg_60: GLenum) void {
    return glad_glBlendFunc.?(arg_59, arg_60);
}
pub inline fn glLogicOp(arg_61: GLenum) void {
    return glad_glLogicOp.?(arg_61);
}
pub inline fn glStencilFunc(arg_62: GLenum, arg_63: GLint, arg_64: GLuint) void {
    return glad_glStencilFunc.?(arg_62, arg_63, arg_64);
}
pub inline fn glStencilOp(arg_65: GLenum, arg_66: GLenum, arg_67: GLenum) void {
    return glad_glStencilOp.?(arg_65, arg_66, arg_67);
}
pub inline fn glDepthFunc(arg_68: GLenum) void {
    return glad_glDepthFunc.?(arg_68);
}
pub inline fn glPixelStoref(arg_69: GLenum, arg_70: GLfloat) void {
    return glad_glPixelStoref.?(arg_69, arg_70);
}
pub inline fn glPixelStorei(arg_71: GLenum, arg_72: GLint) void {
    return glad_glPixelStorei.?(arg_71, arg_72);
}
pub inline fn glReadBuffer(arg_73: GLenum) void {
    return glad_glReadBuffer.?(arg_73);
}
pub inline fn glReadPixels(arg_74: GLint, arg_75: GLint, arg_76: GLsizei, arg_77: GLsizei, arg_78: GLenum, arg_79: GLenum, arg_80: ?*c_void) void {
    return glad_glReadPixels.?(arg_74, arg_75, arg_76, arg_77, arg_78, arg_79, arg_80);
}
pub inline fn glGetBooleanv(arg_81: GLenum, arg_82: [*c]GLboolean) void {
    return glad_glGetBooleanv.?(arg_81, arg_82);
}
pub inline fn glGetDoublev(arg_83: GLenum, arg_84: [*c]GLdouble) void {
    return glad_glGetDoublev.?(arg_83, arg_84);
}
pub inline fn glGetError() GLenum {
    return glad_glGetError.?();
}
pub inline fn glGetFloatv(arg_85: GLenum, arg_86: [*c]GLfloat) void {
    return glad_glGetFloatv.?(arg_85, arg_86);
}
pub inline fn glGetIntegerv(arg_87: GLenum, arg_88: [*c]GLint) void {
    return glad_glGetIntegerv.?(arg_87, arg_88);
}
pub inline fn glGetString(arg_89: GLenum) [*c]const GLubyte {
    return glad_glGetString.?(arg_89);
}
pub inline fn glGetTexImage(arg_90: GLenum, arg_91: GLint, arg_92: GLenum, arg_93: GLenum, arg_94: ?*c_void) void {
    return glad_glGetTexImage.?(arg_90, arg_91, arg_92, arg_93, arg_94);
}
pub inline fn glGetTexParameterfv(arg_95: GLenum, arg_96: GLenum, arg_97: [*c]GLfloat) void {
    return glad_glGetTexParameterfv.?(arg_95, arg_96, arg_97);
}
pub inline fn glGetTexParameteriv(arg_98: GLenum, arg_99: GLenum, arg_100: [*c]GLint) void {
    return glad_glGetTexParameteriv.?(arg_98, arg_99, arg_100);
}
pub inline fn glGetTexLevelParameterfv(arg_101: GLenum, arg_102: GLint, arg_103: GLenum, arg_104: [*c]GLfloat) void {
    return glad_glGetTexLevelParameterfv.?(arg_101, arg_102, arg_103, arg_104);
}
pub inline fn glGetTexLevelParameteriv(arg_105: GLenum, arg_106: GLint, arg_107: GLenum, arg_108: [*c]GLint) void {
    return glad_glGetTexLevelParameteriv.?(arg_105, arg_106, arg_107, arg_108);
}
pub inline fn glIsEnabled(arg_109: GLenum) GLboolean {
    return glad_glIsEnabled.?(arg_109);
}
pub inline fn glDepthRange(arg_110: GLdouble, arg_111: GLdouble) void {
    return glad_glDepthRange.?(arg_110, arg_111);
}
pub inline fn glViewport(x: GLint, y: GLint, w: GLsizei, h: GLsizei) void {
    return glad_glViewport.?(x, y, w, h);
}
pub const GL_VERSION_1_1 = @as(c_int, 1);
pub inline fn glDrawArrays(arg_116: GLenum, arg_117: GLint, arg_118: GLsizei) void {
    return glad_glDrawArrays.?(arg_116, arg_117, arg_118);
}
pub inline fn glDrawElements(arg_119: GLenum, arg_120: GLsizei, arg_121: GLenum, arg_122: ?*const c_void) void {
    return glad_glDrawElements.?(arg_119, arg_120, arg_121, arg_122);
}
pub inline fn glPolygonOffset(arg_123: GLfloat, arg_124: GLfloat) void {
    return glad_glPolygonOffset.?(arg_123, arg_124);
}
pub inline fn glCopyTexImage1D(arg_125: GLenum, arg_126: GLint, arg_127: GLenum, arg_128: GLint, arg_129: GLint, arg_130: GLsizei, arg_131: GLint) void {
    return glad_glCopyTexImage1D.?(arg_125, arg_126, arg_127, arg_128, arg_129, arg_130, arg_131);
}
pub inline fn glCopyTexImage2D(arg_132: GLenum, arg_133: GLint, arg_134: GLenum, arg_135: GLint, arg_136: GLint, arg_137: GLsizei, arg_138: GLsizei, arg_139: GLint) void {
    return glad_glCopyTexImage2D.?(arg_132, arg_133, arg_134, arg_135, arg_136, arg_137, arg_138, arg_139);
}
pub inline fn glCopyTexSubImage1D(arg_140: GLenum, arg_141: GLint, arg_142: GLint, arg_143: GLint, arg_144: GLint, arg_145: GLsizei) void {
    return glad_glCopyTexSubImage1D.?(arg_140, arg_141, arg_142, arg_143, arg_144, arg_145);
}
pub inline fn glCopyTexSubImage2D(arg_146: GLenum, arg_147: GLint, arg_148: GLint, arg_149: GLint, arg_150: GLint, arg_151: GLint, arg_152: GLsizei, arg_153: GLsizei) void {
    return glad_glCopyTexSubImage2D.?(arg_146, arg_147, arg_148, arg_149, arg_150, arg_151, arg_152, arg_153);
}
pub inline fn glTexSubImage1D(arg_154: GLenum, arg_155: GLint, arg_156: GLint, arg_157: GLsizei, arg_158: GLenum, arg_159: GLenum, arg_160: ?*const c_void) void {
    return glad_glTexSubImage1D.?(arg_154, arg_155, arg_156, arg_157, arg_158, arg_159, arg_160);
}
pub inline fn glTexSubImage2D(arg_161: GLenum, arg_162: GLint, arg_163: GLint, arg_164: GLint, arg_165: GLsizei, arg_166: GLsizei, arg_167: GLenum, arg_168: GLenum, arg_169: ?*const c_void) void {
    return glad_glTexSubImage2D.?(arg_161, arg_162, arg_163, arg_164, arg_165, arg_166, arg_167, arg_168, arg_169);
}
pub inline fn glBindTexture(arg_170: GLenum, arg_171: GLuint) void {
    return glad_glBindTexture.?(arg_170, arg_171);
}
pub inline fn glDeleteTextures(arg_172: GLsizei, arg_173: [*c]const GLuint) void {
    return glad_glDeleteTextures.?(arg_172, arg_173);
}
pub inline fn glGenTextures(arg_174: GLsizei, arg_175: [*c]GLuint) void {
    return glad_glGenTextures.?(arg_174, arg_175);
}
pub inline fn glIsTexture(arg_176: GLuint) GLboolean {
    return glad_glIsTexture.?(arg_176);
}
pub const GL_VERSION_1_2 = @as(c_int, 1);
pub inline fn glDrawRangeElements(arg_177: GLenum, arg_178: GLuint, arg_179: GLuint, arg_180: GLsizei, arg_181: GLenum, arg_182: ?*const c_void) void {
    return glad_glDrawRangeElements.?(arg_177, arg_178, arg_179, arg_180, arg_181, arg_182);
}
pub inline fn glTexImage3D(arg_183: GLenum, arg_184: GLint, arg_185: GLint, arg_186: GLsizei, arg_187: GLsizei, arg_188: GLsizei, arg_189: GLint, arg_190: GLenum, arg_191: GLenum, arg_192: ?*const c_void) void {
    return glad_glTexImage3D.?(arg_183, arg_184, arg_185, arg_186, arg_187, arg_188, arg_189, arg_190, arg_191, arg_192);
}
pub inline fn glTexSubImage3D(arg_193: GLenum, arg_194: GLint, arg_195: GLint, arg_196: GLint, arg_197: GLint, arg_198: GLsizei, arg_199: GLsizei, arg_200: GLsizei, arg_201: GLenum, arg_202: GLenum, arg_203: ?*const c_void) void {
    return glad_glTexSubImage3D.?(arg_193, arg_194, arg_195, arg_196, arg_197, arg_198, arg_199, arg_200, arg_201, arg_202, arg_203);
}
pub inline fn glCopyTexSubImage3D(arg_204: GLenum, arg_205: GLint, arg_206: GLint, arg_207: GLint, arg_208: GLint, arg_209: GLint, arg_210: GLint, arg_211: GLsizei, arg_212: GLsizei) void {
    return glad_glCopyTexSubImage3D.?(arg_204, arg_205, arg_206, arg_207, arg_208, arg_209, arg_210, arg_211, arg_212);
}
pub const GL_VERSION_1_3 = @as(c_int, 1);
pub inline fn glActiveTexture(arg_213: GLenum) void {
    return glad_glActiveTexture.?(arg_213);
}
pub inline fn glSampleCoverage(arg_214: GLfloat, arg_215: GLboolean) void {
    return glad_glSampleCoverage.?(arg_214, arg_215);
}
pub inline fn glCompressedTexImage3D(arg_216: GLenum, arg_217: GLint, arg_218: GLenum, arg_219: GLsizei, arg_220: GLsizei, arg_221: GLsizei, arg_222: GLint, arg_223: GLsizei, arg_224: ?*const c_void) void {
    return glad_glCompressedTexImage3D.?(arg_216, arg_217, arg_218, arg_219, arg_220, arg_221, arg_222, arg_223, arg_224);
}
pub inline fn glCompressedTexImage2D(arg_225: GLenum, arg_226: GLint, arg_227: GLenum, arg_228: GLsizei, arg_229: GLsizei, arg_230: GLint, arg_231: GLsizei, arg_232: ?*const c_void) void {
    return glad_glCompressedTexImage2D.?(arg_225, arg_226, arg_227, arg_228, arg_229, arg_230, arg_231, arg_232);
}
pub inline fn glCompressedTexImage1D(arg_233: GLenum, arg_234: GLint, arg_235: GLenum, arg_236: GLsizei, arg_237: GLint, arg_238: GLsizei, arg_239: ?*const c_void) void {
    return glad_glCompressedTexImage1D.?(arg_233, arg_234, arg_235, arg_236, arg_237, arg_238, arg_239);
}
pub inline fn glCompressedTexSubImage3D(arg_240: GLenum, arg_241: GLint, arg_242: GLint, arg_243: GLint, arg_244: GLint, arg_245: GLsizei, arg_246: GLsizei, arg_247: GLsizei, arg_248: GLenum, arg_249: GLsizei, arg_250: ?*const c_void) void {
    return glad_glCompressedTexSubImage3D.?(arg_240, arg_241, arg_242, arg_243, arg_244, arg_245, arg_246, arg_247, arg_248, arg_249, arg_250);
}
pub inline fn glCompressedTexSubImage2D(arg_251: GLenum, arg_252: GLint, arg_253: GLint, arg_254: GLint, arg_255: GLsizei, arg_256: GLsizei, arg_257: GLenum, arg_258: GLsizei, arg_259: ?*const c_void) void {
    return glad_glCompressedTexSubImage2D.?(arg_251, arg_252, arg_253, arg_254, arg_255, arg_256, arg_257, arg_258, arg_259);
}
pub inline fn glCompressedTexSubImage1D(arg_260: GLenum, arg_261: GLint, arg_262: GLint, arg_263: GLsizei, arg_264: GLenum, arg_265: GLsizei, arg_266: ?*const c_void) void {
    return glad_glCompressedTexSubImage1D.?(arg_260, arg_261, arg_262, arg_263, arg_264, arg_265, arg_266);
}
pub inline fn glGetCompressedTexImage(arg_267: GLenum, arg_268: GLint, arg_269: ?*c_void) void {
    return glad_glGetCompressedTexImage.?(arg_267, arg_268, arg_269);
}
pub const GL_VERSION_1_4 = @as(c_int, 1);
pub inline fn glBlendFuncSeparate(arg_270: GLenum, arg_271: GLenum, arg_272: GLenum, arg_273: GLenum) void {
    return glad_glBlendFuncSeparate.?(arg_270, arg_271, arg_272, arg_273);
}
pub inline fn glMultiDrawArrays(arg_274: GLenum, arg_275: [*c]const GLint, arg_276: [*c]const GLsizei, arg_277: GLsizei) void {
    return glad_glMultiDrawArrays.?(arg_274, arg_275, arg_276, arg_277);
}
pub inline fn glMultiDrawElements(arg_278: GLenum, arg_279: [*c]const GLsizei, arg_280: GLenum, arg_281: [*c]const ?*const c_void, arg_282: GLsizei) void {
    return glad_glMultiDrawElements.?(arg_278, arg_279, arg_280, arg_281, arg_282);
}
pub inline fn glPointParameterf(arg_283: GLenum, arg_284: GLfloat) void {
    return glad_glPointParameterf.?(arg_283, arg_284);
}
pub inline fn glPointParameterfv(arg_285: GLenum, arg_286: [*c]const GLfloat) void {
    return glad_glPointParameterfv.?(arg_285, arg_286);
}
pub inline fn glPointParameteri(arg_287: GLenum, arg_288: GLint) void {
    return glad_glPointParameteri.?(arg_287, arg_288);
}
pub inline fn glPointParameteriv(arg_289: GLenum, arg_290: [*c]const GLint) void {
    return glad_glPointParameteriv.?(arg_289, arg_290);
}
pub inline fn glBlendColor(arg_291: GLfloat, arg_292: GLfloat, arg_293: GLfloat, arg_294: GLfloat) void {
    return glad_glBlendColor.?(arg_291, arg_292, arg_293, arg_294);
}
pub inline fn glBlendEquation(arg_295: GLenum) void {
    return glad_glBlendEquation.?(arg_295);
}
pub const GL_VERSION_1_5 = @as(c_int, 1);
pub inline fn glGenQueries(arg_296: GLsizei, arg_297: [*c]GLuint) void {
    return glad_glGenQueries.?(arg_296, arg_297);
}
pub inline fn glDeleteQueries(arg_298: GLsizei, arg_299: [*c]const GLuint) void {
    return glad_glDeleteQueries.?(arg_298, arg_299);
}
pub inline fn glIsQuery(arg_300: GLuint) GLboolean {
    return glad_glIsQuery.?(arg_300);
}
pub inline fn glBeginQuery(arg_301: GLenum, arg_302: GLuint) void {
    return glad_glBeginQuery.?(arg_301, arg_302);
}
pub inline fn glEndQuery(arg_303: GLenum) void {
    return glad_glEndQuery.?(arg_303);
}
pub inline fn glGetQueryiv(arg_304: GLenum, arg_305: GLenum, arg_306: [*c]GLint) void {
    return glad_glGetQueryiv.?(arg_304, arg_305, arg_306);
}
pub inline fn glGetQueryObjectiv(arg_307: GLuint, arg_308: GLenum, arg_309: [*c]GLint) void {
    return glad_glGetQueryObjectiv.?(arg_307, arg_308, arg_309);
}
pub inline fn glGetQueryObjectuiv(arg_310: GLuint, arg_311: GLenum, arg_312: [*c]GLuint) void {
    return glad_glGetQueryObjectuiv.?(arg_310, arg_311, arg_312);
}
pub inline fn glBindBuffer(arg_313: GLenum, arg_314: GLuint) void {
    return glad_glBindBuffer.?(arg_313, arg_314);
}
pub inline fn glDeleteBuffers(arg_315: GLsizei, arg_316: [*c]const GLuint) void {
    return glad_glDeleteBuffers.?(arg_315, arg_316);
}
pub inline fn glGenBuffers(arg_317: GLsizei, arg_318: [*c]GLuint) void {
    return glad_glGenBuffers.?(arg_317, arg_318);
}
pub inline fn glIsBuffer(arg_319: GLuint) GLboolean {
    return glad_glIsBuffer.?(arg_319);
}
pub inline fn glBufferData(arg_320: GLenum, arg_321: GLsizeiptr, arg_322: ?*const c_void, arg_323: GLenum) void {
    return glad_glBufferData.?(arg_320, arg_321, arg_322, arg_323);
}
pub inline fn glBufferSubData(arg_324: GLenum, arg_325: GLintptr, arg_326: GLsizeiptr, arg_327: ?*const c_void) void {
    return glad_glBufferSubData.?(arg_324, arg_325, arg_326, arg_327);
}
pub inline fn glGetBufferSubData(arg_328: GLenum, arg_329: GLintptr, arg_330: GLsizeiptr, arg_331: ?*c_void) void {
    return glad_glGetBufferSubData.?(arg_328, arg_329, arg_330, arg_331);
}
pub inline fn glMapBuffer(arg_332: GLenum, arg_333: GLenum) ?*c_void {
    return glad_glMapBuffer.?(arg_332, arg_333);
}
pub inline fn glUnmapBuffer(arg_334: GLenum) GLboolean {
    return glad_glUnmapBuffer.?(arg_334);
}
pub inline fn glGetBufferParameteriv(arg_335: GLenum, arg_336: GLenum, arg_337: [*c]GLint) void {
    return glad_glGetBufferParameteriv.?(arg_335, arg_336, arg_337);
}
pub inline fn glGetBufferPointerv(arg_338: GLenum, arg_339: GLenum, arg_340: [*c]?*c_void) void {
    return glad_glGetBufferPointerv.?(arg_338, arg_339, arg_340);
}
pub const GL_VERSION_2_0 = @as(c_int, 1);
pub inline fn glBlendEquationSeparate(arg_341: GLenum, arg_342: GLenum) void {
    return glad_glBlendEquationSeparate.?(arg_341, arg_342);
}
pub inline fn glDrawBuffers(arg_343: GLsizei, arg_344: [*c]const GLenum) void {
    return glad_glDrawBuffers.?(arg_343, arg_344);
}
pub inline fn glStencilOpSeparate(arg_345: GLenum, arg_346: GLenum, arg_347: GLenum, arg_348: GLenum) void {
    return glad_glStencilOpSeparate.?(arg_345, arg_346, arg_347, arg_348);
}
pub inline fn glStencilFuncSeparate(arg_349: GLenum, arg_350: GLenum, arg_351: GLint, arg_352: GLuint) void {
    return glad_glStencilFuncSeparate.?(arg_349, arg_350, arg_351, arg_352);
}
pub inline fn glStencilMaskSeparate(arg_353: GLenum, arg_354: GLuint) void {
    return glad_glStencilMaskSeparate.?(arg_353, arg_354);
}
pub inline fn glAttachShader(arg_355: GLuint, arg_356: GLuint) void {
    return glad_glAttachShader.?(arg_355, arg_356);
}
pub inline fn glBindAttribLocation(arg_357: GLuint, arg_358: GLuint, arg_359: [*c]const GLchar) void {
    return glad_glBindAttribLocation.?(arg_357, arg_358, arg_359);
}
pub inline fn glCompileShader(arg_360: GLuint) void {
    return glad_glCompileShader.?(arg_360);
}
pub inline fn glCreateProgram() GLuint {
    return glad_glCreateProgram.?();
}
pub inline fn glCreateShader(arg_361: GLenum) GLuint {
    return glad_glCreateShader.?(arg_361);
}
pub inline fn glDeleteProgram(arg_362: GLuint) void {
    return glad_glDeleteProgram.?(arg_362);
}
pub inline fn glDeleteShader(arg_363: GLuint) void {
    return glad_glDeleteShader.?(arg_363);
}
pub inline fn glDetachShader(arg_364: GLuint, arg_365: GLuint) void {
    return glad_glDetachShader.?(arg_364, arg_365);
}
pub inline fn glDisableVertexAttribArray(arg_366: GLuint) void {
    return glad_glDisableVertexAttribArray.?(arg_366);
}
pub inline fn glEnableVertexAttribArray(arg_367: GLuint) void {
    return glad_glEnableVertexAttribArray.?(arg_367);
}
pub inline fn glGetActiveAttrib(arg_368: GLuint, arg_369: GLuint, arg_370: GLsizei, arg_371: [*c]GLsizei, arg_372: [*c]GLint, arg_373: [*c]GLenum, arg_374: [*c]GLchar) void {
    return glad_glGetActiveAttrib.?(arg_368, arg_369, arg_370, arg_371, arg_372, arg_373, arg_374);
}
pub inline fn glGetActiveUniform(arg_375: GLuint, arg_376: GLuint, arg_377: GLsizei, arg_378: [*c]GLsizei, arg_379: [*c]GLint, arg_380: [*c]GLenum, arg_381: [*c]GLchar) void {
    return glad_glGetActiveUniform.?(arg_375, arg_376, arg_377, arg_378, arg_379, arg_380, arg_381);
}
pub inline fn glGetAttachedShaders(arg_382: GLuint, arg_383: GLsizei, arg_384: [*c]GLsizei, arg_385: [*c]GLuint) void {
    return glad_glGetAttachedShaders.?(arg_382, arg_383, arg_384, arg_385);
}
pub inline fn glGetAttribLocation(arg_386: GLuint, arg_387: [*c]const GLchar) GLint {
    return glad_glGetAttribLocation.?(arg_386, arg_387);
}
pub inline fn glGetProgramiv(arg_388: GLuint, arg_389: GLenum, arg_390: [*c]GLint) void {
    return glad_glGetProgramiv.?(arg_388, arg_389, arg_390);
}
pub inline fn glGetProgramInfoLog(arg_391: GLuint, arg_392: GLsizei, arg_393: [*c]GLsizei, arg_394: [*c]GLchar) void {
    return glad_glGetProgramInfoLog.?(arg_391, arg_392, arg_393, arg_394);
}
pub inline fn glGetShaderiv(arg_395: GLuint, arg_396: GLenum, arg_397: [*c]GLint) void {
    return glad_glGetShaderiv.?(arg_395, arg_396, arg_397);
}
pub inline fn glGetShaderInfoLog(arg_398: GLuint, arg_399: GLsizei, arg_400: [*c]GLsizei, arg_401: [*c]GLchar) void {
    return glad_glGetShaderInfoLog.?(arg_398, arg_399, arg_400, arg_401);
}
pub inline fn glGetShaderSource(arg_402: GLuint, arg_403: GLsizei, arg_404: [*c]GLsizei, arg_405: [*c]GLchar) void {
    return glad_glGetShaderSource.?(arg_402, arg_403, arg_404, arg_405);
}
pub inline fn glGetUniformLocation(arg_406: GLuint, arg_407: [*c]const GLchar) GLint {
    return glad_glGetUniformLocation.?(arg_406, arg_407);
}
pub inline fn glGetUniformfv(arg_408: GLuint, arg_409: GLint, arg_410: [*c]GLfloat) void {
    return glad_glGetUniformfv.?(arg_408, arg_409, arg_410);
}
pub inline fn glGetUniformiv(arg_411: GLuint, arg_412: GLint, arg_413: [*c]GLint) void {
    return glad_glGetUniformiv.?(arg_411, arg_412, arg_413);
}
pub inline fn glGetVertexAttribdv(arg_414: GLuint, arg_415: GLenum, arg_416: [*c]GLdouble) void {
    return glad_glGetVertexAttribdv.?(arg_414, arg_415, arg_416);
}
pub inline fn glGetVertexAttribfv(arg_417: GLuint, arg_418: GLenum, arg_419: [*c]GLfloat) void {
    return glad_glGetVertexAttribfv.?(arg_417, arg_418, arg_419);
}
pub inline fn glGetVertexAttribiv(arg_420: GLuint, arg_421: GLenum, arg_422: [*c]GLint) void {
    return glad_glGetVertexAttribiv.?(arg_420, arg_421, arg_422);
}
pub inline fn glGetVertexAttribPointerv(arg_423: GLuint, arg_424: GLenum, arg_425: [*c]?*c_void) void {
    return glad_glGetVertexAttribPointerv.?(arg_423, arg_424, arg_425);
}
pub inline fn glIsProgram(arg_426: GLuint) GLboolean {
    return glad_glIsProgram.?(arg_426);
}
pub inline fn glIsShader(arg_427: GLuint) GLboolean {
    return glad_glIsShader.?(arg_427);
}
pub inline fn glLinkProgram(arg_428: GLuint) void {
    return glad_glLinkProgram.?(arg_428);
}
pub inline fn glShaderSource(arg_429: GLuint, arg_430: GLsizei, arg_431: [*c]const [*c]const GLchar, arg_432: [*c]const GLint) void {
    return glad_glShaderSource.?(arg_429, arg_430, arg_431, arg_432);
}
pub inline fn glUseProgram(arg_433: GLuint) void {
    return glad_glUseProgram.?(arg_433);
}
pub inline fn glUniform1f(arg_434: GLint, arg_435: GLfloat) void {
    return glad_glUniform1f.?(arg_434, arg_435);
}
pub inline fn glUniform2f(arg_436: GLint, arg_437: GLfloat, arg_438: GLfloat) void {
    return glad_glUniform2f.?(arg_436, arg_437, arg_438);
}
pub inline fn glUniform3f(arg_439: GLint, arg_440: GLfloat, arg_441: GLfloat, arg_442: GLfloat) void {
    return glad_glUniform3f.?(arg_439, arg_440, arg_441, arg_442);
}
pub inline fn glUniform4f(arg_443: GLint, arg_444: GLfloat, arg_445: GLfloat, arg_446: GLfloat, arg_447: GLfloat) void {
    return glad_glUniform4f.?(arg_443, arg_444, arg_445, arg_446, arg_447);
}
pub inline fn glUniform1i(arg_448: GLint, arg_449: GLint) void {
    return glad_glUniform1i.?(arg_448, arg_449);
}
pub inline fn glUniform2i(arg_450: GLint, arg_451: GLint, arg_452: GLint) void {
    return glad_glUniform2i.?(arg_450, arg_451, arg_452);
}
pub inline fn glUniform3i(arg_453: GLint, arg_454: GLint, arg_455: GLint, arg_456: GLint) void {
    return glad_glUniform3i.?(arg_453, arg_454, arg_455, arg_456);
}
pub inline fn glUniform4i(arg_457: GLint, arg_458: GLint, arg_459: GLint, arg_460: GLint, arg_461: GLint) void {
    return glad_glUniform4i.?(arg_457, arg_458, arg_459, arg_460, arg_461);
}
pub inline fn glUniform1fv(arg_462: GLint, arg_463: GLsizei, arg_464: [*c]const GLfloat) void {
    return glad_glUniform1fv.?(arg_462, arg_463, arg_464);
}
pub inline fn glUniform2fv(arg_465: GLint, arg_466: GLsizei, arg_467: [*c]const GLfloat) void {
    return glad_glUniform2fv.?(arg_465, arg_466, arg_467);
}
pub inline fn glUniform3fv(arg_468: GLint, arg_469: GLsizei, arg_470: [*c]const GLfloat) void {
    return glad_glUniform3fv.?(arg_468, arg_469, arg_470);
}
pub inline fn glUniform4fv(arg_471: GLint, arg_472: GLsizei, arg_473: [*c]const GLfloat) void {
    return glad_glUniform4fv.?(arg_471, arg_472, arg_473);
}
pub inline fn glUniform1iv(arg_474: GLint, arg_475: GLsizei, arg_476: [*c]const GLint) void {
    return glad_glUniform1iv.?(arg_474, arg_475, arg_476);
}
pub inline fn glUniform2iv(arg_477: GLint, arg_478: GLsizei, arg_479: [*c]const GLint) void {
    return glad_glUniform2iv.?(arg_477, arg_478, arg_479);
}
pub inline fn glUniform3iv(arg_480: GLint, arg_481: GLsizei, arg_482: [*c]const GLint) void {
    return glad_glUniform3iv.?(arg_480, arg_481, arg_482);
}
pub inline fn glUniform4iv(arg_483: GLint, arg_484: GLsizei, arg_485: [*c]const GLint) void {
    return glad_glUniform4iv.?(arg_483, arg_484, arg_485);
}
pub inline fn glUniformMatrix2fv(arg_486: GLint, arg_487: GLsizei, arg_488: GLboolean, arg_489: [*c]const GLfloat) void {
    return glad_glUniformMatrix2fv.?(arg_486, arg_487, arg_488, arg_489);
}
pub inline fn glUniformMatrix3fv(arg_490: GLint, arg_491: GLsizei, arg_492: GLboolean, arg_493: [*c]const GLfloat) void {
    return glad_glUniformMatrix3fv.?(arg_490, arg_491, arg_492, arg_493);
}
pub inline fn glUniformMatrix4fv(arg_494: GLint, arg_495: GLsizei, arg_496: GLboolean, arg_497: [*c]const GLfloat) void {
    return glad_glUniformMatrix4fv.?(arg_494, arg_495, arg_496, arg_497);
}
pub inline fn glValidateProgram(arg_498: GLuint) void {
    return glad_glValidateProgram.?(arg_498);
}
pub inline fn glVertexAttrib1d(arg_499: GLuint, arg_500: GLdouble) void {
    return glad_glVertexAttrib1d.?(arg_499, arg_500);
}
pub inline fn glVertexAttrib1dv(arg_501: GLuint, arg_502: [*c]const GLdouble) void {
    return glad_glVertexAttrib1dv.?(arg_501, arg_502);
}
pub inline fn glVertexAttrib1f(arg_503: GLuint, arg_504: GLfloat) void {
    return glad_glVertexAttrib1f.?(arg_503, arg_504);
}
pub inline fn glVertexAttrib1fv(arg_505: GLuint, arg_506: [*c]const GLfloat) void {
    return glad_glVertexAttrib1fv.?(arg_505, arg_506);
}
pub inline fn glVertexAttrib1s(arg_507: GLuint, arg_508: GLshort) void {
    return glad_glVertexAttrib1s.?(arg_507, arg_508);
}
pub inline fn glVertexAttrib1sv(arg_509: GLuint, arg_510: [*c]const GLshort) void {
    return glad_glVertexAttrib1sv.?(arg_509, arg_510);
}
pub inline fn glVertexAttrib2d(arg_511: GLuint, arg_512: GLdouble, arg_513: GLdouble) void {
    return glad_glVertexAttrib2d.?(arg_511, arg_512, arg_513);
}
pub inline fn glVertexAttrib2dv(arg_514: GLuint, arg_515: [*c]const GLdouble) void {
    return glad_glVertexAttrib2dv.?(arg_514, arg_515);
}
pub inline fn glVertexAttrib2f(arg_516: GLuint, arg_517: GLfloat, arg_518: GLfloat) void {
    return glad_glVertexAttrib2f.?(arg_516, arg_517, arg_518);
}
pub inline fn glVertexAttrib2fv(arg_519: GLuint, arg_520: [*c]const GLfloat) void {
    return glad_glVertexAttrib2fv.?(arg_519, arg_520);
}
pub inline fn glVertexAttrib2s(arg_521: GLuint, arg_522: GLshort, arg_523: GLshort) void {
    return glad_glVertexAttrib2s.?(arg_521, arg_522, arg_523);
}
pub inline fn glVertexAttrib2sv(arg_524: GLuint, arg_525: [*c]const GLshort) void {
    return glad_glVertexAttrib2sv.?(arg_524, arg_525);
}
pub inline fn glVertexAttrib3d(arg_526: GLuint, arg_527: GLdouble, arg_528: GLdouble, arg_529: GLdouble) void {
    return glad_glVertexAttrib3d.?(arg_526, arg_527, arg_528, arg_529);
}
pub inline fn glVertexAttrib3dv(arg_530: GLuint, arg_531: [*c]const GLdouble) void {
    return glad_glVertexAttrib3dv.?(arg_530, arg_531);
}
pub inline fn glVertexAttrib3f(arg_532: GLuint, arg_533: GLfloat, arg_534: GLfloat, arg_535: GLfloat) void {
    return glad_glVertexAttrib3f.?(arg_532, arg_533, arg_534, arg_535);
}
pub inline fn glVertexAttrib3fv(arg_536: GLuint, arg_537: [*c]const GLfloat) void {
    return glad_glVertexAttrib3fv.?(arg_536, arg_537);
}
pub inline fn glVertexAttrib3s(arg_538: GLuint, arg_539: GLshort, arg_540: GLshort, arg_541: GLshort) void {
    return glad_glVertexAttrib3s.?(arg_538, arg_539, arg_540, arg_541);
}
pub inline fn glVertexAttrib3sv(arg_542: GLuint, arg_543: [*c]const GLshort) void {
    return glad_glVertexAttrib3sv.?(arg_542, arg_543);
}
pub inline fn glVertexAttrib4Nbv(arg_544: GLuint, arg_545: [*c]const GLbyte) void {
    return glad_glVertexAttrib4Nbv.?(arg_544, arg_545);
}
pub inline fn glVertexAttrib4Niv(arg_546: GLuint, arg_547: [*c]const GLint) void {
    return glad_glVertexAttrib4Niv.?(arg_546, arg_547);
}
pub inline fn glVertexAttrib4Nsv(arg_548: GLuint, arg_549: [*c]const GLshort) void {
    return glad_glVertexAttrib4Nsv.?(arg_548, arg_549);
}
pub inline fn glVertexAttrib4Nub(arg_550: GLuint, arg_551: GLubyte, arg_552: GLubyte, arg_553: GLubyte, arg_554: GLubyte) void {
    return glad_glVertexAttrib4Nub.?(arg_550, arg_551, arg_552, arg_553, arg_554);
}
pub inline fn glVertexAttrib4Nubv(arg_555: GLuint, arg_556: [*c]const GLubyte) void {
    return glad_glVertexAttrib4Nubv.?(arg_555, arg_556);
}
pub inline fn glVertexAttrib4Nuiv(arg_557: GLuint, arg_558: [*c]const GLuint) void {
    return glad_glVertexAttrib4Nuiv.?(arg_557, arg_558);
}
pub inline fn glVertexAttrib4Nusv(arg_559: GLuint, arg_560: [*c]const GLushort) void {
    return glad_glVertexAttrib4Nusv.?(arg_559, arg_560);
}
pub inline fn glVertexAttrib4bv(arg_561: GLuint, arg_562: [*c]const GLbyte) void {
    return glad_glVertexAttrib4bv.?(arg_561, arg_562);
}
pub inline fn glVertexAttrib4d(arg_563: GLuint, arg_564: GLdouble, arg_565: GLdouble, arg_566: GLdouble, arg_567: GLdouble) void {
    return glad_glVertexAttrib4d.?(arg_563, arg_564, arg_565, arg_566, arg_567);
}
pub inline fn glVertexAttrib4dv(arg_568: GLuint, arg_569: [*c]const GLdouble) void {
    return glad_glVertexAttrib4dv.?(arg_568, arg_569);
}
pub inline fn glVertexAttrib4f(arg_570: GLuint, arg_571: GLfloat, arg_572: GLfloat, arg_573: GLfloat, arg_574: GLfloat) void {
    return glad_glVertexAttrib4f.?(arg_570, arg_571, arg_572, arg_573, arg_574);
}
pub inline fn glVertexAttrib4fv(arg_575: GLuint, arg_576: [*c]const GLfloat) void {
    return glad_glVertexAttrib4fv.?(arg_575, arg_576);
}
pub inline fn glVertexAttrib4iv(arg_577: GLuint, arg_578: [*c]const GLint) void {
    return glad_glVertexAttrib4iv.?(arg_577, arg_578);
}
pub inline fn glVertexAttrib4s(arg_579: GLuint, arg_580: GLshort, arg_581: GLshort, arg_582: GLshort, arg_583: GLshort) void {
    return glad_glVertexAttrib4s.?(arg_579, arg_580, arg_581, arg_582, arg_583);
}
pub inline fn glVertexAttrib4sv(arg_584: GLuint, arg_585: [*c]const GLshort) void {
    return glad_glVertexAttrib4sv.?(arg_584, arg_585);
}
pub inline fn glVertexAttrib4ubv(arg_586: GLuint, arg_587: [*c]const GLubyte) void {
    return glad_glVertexAttrib4ubv.?(arg_586, arg_587);
}
pub inline fn glVertexAttrib4uiv(arg_588: GLuint, arg_589: [*c]const GLuint) void {
    return glad_glVertexAttrib4uiv.?(arg_588, arg_589);
}
pub inline fn glVertexAttrib4usv(arg_590: GLuint, arg_591: [*c]const GLushort) void {
    return glad_glVertexAttrib4usv.?(arg_590, arg_591);
}
pub inline fn glVertexAttribPointer(arg_592: GLuint, arg_593: GLint, arg_594: GLenum, arg_595: GLboolean, arg_596: GLsizei, arg_597: ?*const c_void) void {
    return glad_glVertexAttribPointer.?(arg_592, arg_593, arg_594, arg_595, arg_596, arg_597);
}
pub const GL_VERSION_2_1 = @as(c_int, 1);
pub inline fn glUniformMatrix2x3fv(arg_598: GLint, arg_599: GLsizei, arg_600: GLboolean, arg_601: [*c]const GLfloat) void {
    return glad_glUniformMatrix2x3fv.?(arg_598, arg_599, arg_600, arg_601);
}
pub inline fn glUniformMatrix3x2fv(arg_602: GLint, arg_603: GLsizei, arg_604: GLboolean, arg_605: [*c]const GLfloat) void {
    return glad_glUniformMatrix3x2fv.?(arg_602, arg_603, arg_604, arg_605);
}
pub inline fn glUniformMatrix2x4fv(arg_606: GLint, arg_607: GLsizei, arg_608: GLboolean, arg_609: [*c]const GLfloat) void {
    return glad_glUniformMatrix2x4fv.?(arg_606, arg_607, arg_608, arg_609);
}
pub inline fn glUniformMatrix4x2fv(arg_610: GLint, arg_611: GLsizei, arg_612: GLboolean, arg_613: [*c]const GLfloat) void {
    return glad_glUniformMatrix4x2fv.?(arg_610, arg_611, arg_612, arg_613);
}
pub inline fn glUniformMatrix3x4fv(arg_614: GLint, arg_615: GLsizei, arg_616: GLboolean, arg_617: [*c]const GLfloat) void {
    return glad_glUniformMatrix3x4fv.?(arg_614, arg_615, arg_616, arg_617);
}
pub inline fn glUniformMatrix4x3fv(arg_618: GLint, arg_619: GLsizei, arg_620: GLboolean, arg_621: [*c]const GLfloat) void {
    return glad_glUniformMatrix4x3fv.?(arg_618, arg_619, arg_620, arg_621);
}
pub const GL_VERSION_3_0 = @as(c_int, 1);
pub inline fn glColorMaski(arg_622: GLuint, arg_623: GLboolean, arg_624: GLboolean, arg_625: GLboolean, arg_626: GLboolean) void {
    return glad_glColorMaski.?(arg_622, arg_623, arg_624, arg_625, arg_626);
}
pub inline fn glGetBooleani_v(arg_627: GLenum, arg_628: GLuint, arg_629: [*c]GLboolean) void {
    return glad_glGetBooleani_v.?(arg_627, arg_628, arg_629);
}
pub inline fn glGetIntegeri_v(arg_630: GLenum, arg_631: GLuint, arg_632: [*c]GLint) void {
    return glad_glGetIntegeri_v.?(arg_630, arg_631, arg_632);
}
pub inline fn glEnablei(arg_633: GLenum, arg_634: GLuint) void {
    return glad_glEnablei.?(arg_633, arg_634);
}
pub inline fn glDisablei(arg_635: GLenum, arg_636: GLuint) void {
    return glad_glDisablei.?(arg_635, arg_636);
}
pub inline fn glIsEnabledi(arg_637: GLenum, arg_638: GLuint) GLboolean {
    return glad_glIsEnabledi.?(arg_637, arg_638);
}
pub inline fn glBeginTransformFeedback(arg_639: GLenum) void {
    return glad_glBeginTransformFeedback.?(arg_639);
}
pub inline fn glEndTransformFeedback() void {
    return glad_glEndTransformFeedback.?();
}
pub inline fn glBindBufferRange(arg_640: GLenum, arg_641: GLuint, arg_642: GLuint, arg_643: GLintptr, arg_644: GLsizeiptr) void {
    return glad_glBindBufferRange.?(arg_640, arg_641, arg_642, arg_643, arg_644);
}
pub inline fn glBindBufferBase(arg_645: GLenum, arg_646: GLuint, arg_647: GLuint) void {
    return glad_glBindBufferBase.?(arg_645, arg_646, arg_647);
}
pub inline fn glTransformFeedbackVaryings(arg_648: GLuint, arg_649: GLsizei, arg_650: [*c]const [*c]const GLchar, arg_651: GLenum) void {
    return glad_glTransformFeedbackVaryings.?(arg_648, arg_649, arg_650, arg_651);
}
pub inline fn glGetTransformFeedbackVarying(arg_652: GLuint, arg_653: GLuint, arg_654: GLsizei, arg_655: [*c]GLsizei, arg_656: [*c]GLsizei, arg_657: [*c]GLenum, arg_658: [*c]GLchar) void {
    return glad_glGetTransformFeedbackVarying.?(arg_652, arg_653, arg_654, arg_655, arg_656, arg_657, arg_658);
}
pub inline fn glClampColor(arg_659: GLenum, arg_660: GLenum) void {
    return glad_glClampColor.?(arg_659, arg_660);
}
pub inline fn glBeginConditionalRender(arg_661: GLuint, arg_662: GLenum) void {
    return glad_glBeginConditionalRender.?(arg_661, arg_662);
}
pub inline fn glEndConditionalRender() void {
    return glad_glEndConditionalRender.?();
}
pub inline fn glVertexAttribIPointer(arg_663: GLuint, arg_664: GLint, arg_665: GLenum, arg_666: GLsizei, arg_667: ?*const c_void) void {
    return glad_glVertexAttribIPointer.?(arg_663, arg_664, arg_665, arg_666, arg_667);
}
pub inline fn glGetVertexAttribIiv(arg_668: GLuint, arg_669: GLenum, arg_670: [*c]GLint) void {
    return glad_glGetVertexAttribIiv.?(arg_668, arg_669, arg_670);
}
pub inline fn glGetVertexAttribIuiv(arg_671: GLuint, arg_672: GLenum, arg_673: [*c]GLuint) void {
    return glad_glGetVertexAttribIuiv.?(arg_671, arg_672, arg_673);
}
pub inline fn glVertexAttribI1i(arg_674: GLuint, arg_675: GLint) void {
    return glad_glVertexAttribI1i.?(arg_674, arg_675);
}
pub inline fn glVertexAttribI2i(arg_676: GLuint, arg_677: GLint, arg_678: GLint) void {
    return glad_glVertexAttribI2i.?(arg_676, arg_677, arg_678);
}
pub inline fn glVertexAttribI3i(arg_679: GLuint, arg_680: GLint, arg_681: GLint, arg_682: GLint) void {
    return glad_glVertexAttribI3i.?(arg_679, arg_680, arg_681, arg_682);
}
pub inline fn glVertexAttribI4i(arg_683: GLuint, arg_684: GLint, arg_685: GLint, arg_686: GLint, arg_687: GLint) void {
    return glad_glVertexAttribI4i.?(arg_683, arg_684, arg_685, arg_686, arg_687);
}
pub inline fn glVertexAttribI1ui(arg_688: GLuint, arg_689: GLuint) void {
    return glad_glVertexAttribI1ui.?(arg_688, arg_689);
}
pub inline fn glVertexAttribI2ui(arg_690: GLuint, arg_691: GLuint, arg_692: GLuint) void {
    return glad_glVertexAttribI2ui.?(arg_690, arg_691, arg_692);
}
pub inline fn glVertexAttribI3ui(arg_693: GLuint, arg_694: GLuint, arg_695: GLuint, arg_696: GLuint) void {
    return glad_glVertexAttribI3ui.?(arg_693, arg_694, arg_695, arg_696);
}
pub inline fn glVertexAttribI4ui(arg_697: GLuint, arg_698: GLuint, arg_699: GLuint, arg_700: GLuint, arg_701: GLuint) void {
    return glad_glVertexAttribI4ui.?(arg_697, arg_698, arg_699, arg_700, arg_701);
}
pub inline fn glVertexAttribI1iv(arg_702: GLuint, arg_703: [*c]const GLint) void {
    return glad_glVertexAttribI1iv.?(arg_702, arg_703);
}
pub inline fn glVertexAttribI2iv(arg_704: GLuint, arg_705: [*c]const GLint) void {
    return glad_glVertexAttribI2iv.?(arg_704, arg_705);
}
pub inline fn glVertexAttribI3iv(arg_706: GLuint, arg_707: [*c]const GLint) void {
    return glad_glVertexAttribI3iv.?(arg_706, arg_707);
}
pub inline fn glVertexAttribI4iv(arg_708: GLuint, arg_709: [*c]const GLint) void {
    return glad_glVertexAttribI4iv.?(arg_708, arg_709);
}
pub inline fn glVertexAttribI1uiv(arg_710: GLuint, arg_711: [*c]const GLuint) void {
    return glad_glVertexAttribI1uiv.?(arg_710, arg_711);
}
pub inline fn glVertexAttribI2uiv(arg_712: GLuint, arg_713: [*c]const GLuint) void {
    return glad_glVertexAttribI2uiv.?(arg_712, arg_713);
}
pub inline fn glVertexAttribI3uiv(arg_714: GLuint, arg_715: [*c]const GLuint) void {
    return glad_glVertexAttribI3uiv.?(arg_714, arg_715);
}
pub inline fn glVertexAttribI4uiv(arg_716: GLuint, arg_717: [*c]const GLuint) void {
    return glad_glVertexAttribI4uiv.?(arg_716, arg_717);
}
pub inline fn glVertexAttribI4bv(arg_718: GLuint, arg_719: [*c]const GLbyte) void {
    return glad_glVertexAttribI4bv.?(arg_718, arg_719);
}
pub inline fn glVertexAttribI4sv(arg_720: GLuint, arg_721: [*c]const GLshort) void {
    return glad_glVertexAttribI4sv.?(arg_720, arg_721);
}
pub inline fn glVertexAttribI4ubv(arg_722: GLuint, arg_723: [*c]const GLubyte) void {
    return glad_glVertexAttribI4ubv.?(arg_722, arg_723);
}
pub inline fn glVertexAttribI4usv(arg_724: GLuint, arg_725: [*c]const GLushort) void {
    return glad_glVertexAttribI4usv.?(arg_724, arg_725);
}
pub inline fn glGetUniformuiv(arg_726: GLuint, arg_727: GLint, arg_728: [*c]GLuint) void {
    return glad_glGetUniformuiv.?(arg_726, arg_727, arg_728);
}
pub inline fn glBindFragDataLocation(arg_729: GLuint, arg_730: GLuint, arg_731: [*c]const GLchar) void {
    return glad_glBindFragDataLocation.?(arg_729, arg_730, arg_731);
}
pub inline fn glGetFragDataLocation(arg_732: GLuint, arg_733: [*c]const GLchar) GLint {
    return glad_glGetFragDataLocation.?(arg_732, arg_733);
}
pub inline fn glUniform1ui(arg_734: GLint, arg_735: GLuint) void {
    return glad_glUniform1ui.?(arg_734, arg_735);
}
pub inline fn glUniform2ui(arg_736: GLint, arg_737: GLuint, arg_738: GLuint) void {
    return glad_glUniform2ui.?(arg_736, arg_737, arg_738);
}
pub inline fn glUniform3ui(arg_739: GLint, arg_740: GLuint, arg_741: GLuint, arg_742: GLuint) void {
    return glad_glUniform3ui.?(arg_739, arg_740, arg_741, arg_742);
}
pub inline fn glUniform4ui(arg_743: GLint, arg_744: GLuint, arg_745: GLuint, arg_746: GLuint, arg_747: GLuint) void {
    return glad_glUniform4ui.?(arg_743, arg_744, arg_745, arg_746, arg_747);
}
pub inline fn glUniform1uiv(arg_748: GLint, arg_749: GLsizei, arg_750: [*c]const GLuint) void {
    return glad_glUniform1uiv.?(arg_748, arg_749, arg_750);
}
pub inline fn glUniform2uiv(arg_751: GLint, arg_752: GLsizei, arg_753: [*c]const GLuint) void {
    return glad_glUniform2uiv.?(arg_751, arg_752, arg_753);
}
pub inline fn glUniform3uiv(arg_754: GLint, arg_755: GLsizei, arg_756: [*c]const GLuint) void {
    return glad_glUniform3uiv.?(arg_754, arg_755, arg_756);
}
pub inline fn glUniform4uiv(arg_757: GLint, arg_758: GLsizei, arg_759: [*c]const GLuint) void {
    return glad_glUniform4uiv.?(arg_757, arg_758, arg_759);
}
pub inline fn glTexParameterIiv(arg_760: GLenum, arg_761: GLenum, arg_762: [*c]const GLint) void {
    return glad_glTexParameterIiv.?(arg_760, arg_761, arg_762);
}
pub inline fn glTexParameterIuiv(arg_763: GLenum, arg_764: GLenum, arg_765: [*c]const GLuint) void {
    return glad_glTexParameterIuiv.?(arg_763, arg_764, arg_765);
}
pub inline fn glGetTexParameterIiv(arg_766: GLenum, arg_767: GLenum, arg_768: [*c]GLint) void {
    return glad_glGetTexParameterIiv.?(arg_766, arg_767, arg_768);
}
pub inline fn glGetTexParameterIuiv(arg_769: GLenum, arg_770: GLenum, arg_771: [*c]GLuint) void {
    return glad_glGetTexParameterIuiv.?(arg_769, arg_770, arg_771);
}
pub inline fn glClearBufferiv(arg_772: GLenum, arg_773: GLint, arg_774: [*c]const GLint) void {
    return glad_glClearBufferiv.?(arg_772, arg_773, arg_774);
}
pub inline fn glClearBufferuiv(arg_775: GLenum, arg_776: GLint, arg_777: [*c]const GLuint) void {
    return glad_glClearBufferuiv.?(arg_775, arg_776, arg_777);
}
pub inline fn glClearBufferfv(arg_778: GLenum, arg_779: GLint, arg_780: [*c]const GLfloat) void {
    return glad_glClearBufferfv.?(arg_778, arg_779, arg_780);
}
pub inline fn glClearBufferfi(arg_781: GLenum, arg_782: GLint, arg_783: GLfloat, arg_784: GLint) void {
    return glad_glClearBufferfi.?(arg_781, arg_782, arg_783, arg_784);
}
pub inline fn glGetStringi(arg_785: GLenum, arg_786: GLuint) [*c]const GLubyte {
    return glad_glGetStringi.?(arg_785, arg_786);
}
pub inline fn glIsRenderbuffer(arg_787: GLuint) GLboolean {
    return glad_glIsRenderbuffer.?(arg_787);
}
pub inline fn glBindRenderbuffer(arg_788: GLenum, arg_789: GLuint) void {
    return glad_glBindRenderbuffer.?(arg_788, arg_789);
}
pub inline fn glDeleteRenderbuffers(arg_790: GLsizei, arg_791: [*c]const GLuint) void {
    return glad_glDeleteRenderbuffers.?(arg_790, arg_791);
}
pub inline fn glGenRenderbuffers(arg_792: GLsizei, arg_793: [*c]GLuint) void {
    return glad_glGenRenderbuffers.?(arg_792, arg_793);
}
pub inline fn glRenderbufferStorage(arg_794: GLenum, arg_795: GLenum, arg_796: GLsizei, arg_797: GLsizei) void {
    return glad_glRenderbufferStorage.?(arg_794, arg_795, arg_796, arg_797);
}
pub inline fn glGetRenderbufferParameteriv(arg_798: GLenum, arg_799: GLenum, arg_800: [*c]GLint) void {
    return glad_glGetRenderbufferParameteriv.?(arg_798, arg_799, arg_800);
}
pub inline fn glIsFramebuffer(arg_801: GLuint) GLboolean {
    return glad_glIsFramebuffer.?(arg_801);
}
pub inline fn glBindFramebuffer(arg_802: GLenum, arg_803: GLuint) void {
    return glad_glBindFramebuffer.?(arg_802, arg_803);
}
pub inline fn glDeleteFramebuffers(arg_804: GLsizei, arg_805: [*c]const GLuint) void {
    return glad_glDeleteFramebuffers.?(arg_804, arg_805);
}
pub inline fn glGenFramebuffers(arg_806: GLsizei, arg_807: [*c]GLuint) void {
    return glad_glGenFramebuffers.?(arg_806, arg_807);
}
pub inline fn glCheckFramebufferStatus(arg_808: GLenum) GLenum {
    return glad_glCheckFramebufferStatus.?(arg_808);
}
pub inline fn glFramebufferTexture1D(arg_809: GLenum, arg_810: GLenum, arg_811: GLenum, arg_812: GLuint, arg_813: GLint) void {
    return glad_glFramebufferTexture1D.?(arg_809, arg_810, arg_811, arg_812, arg_813);
}
pub inline fn glFramebufferTexture2D(arg_814: GLenum, arg_815: GLenum, arg_816: GLenum, arg_817: GLuint, arg_818: GLint) void {
    return glad_glFramebufferTexture2D.?(arg_814, arg_815, arg_816, arg_817, arg_818);
}
pub inline fn glFramebufferTexture3D(arg_819: GLenum, arg_820: GLenum, arg_821: GLenum, arg_822: GLuint, arg_823: GLint, arg_824: GLint) void {
    return glad_glFramebufferTexture3D.?(arg_819, arg_820, arg_821, arg_822, arg_823, arg_824);
}
pub inline fn glFramebufferRenderbuffer(arg_825: GLenum, arg_826: GLenum, arg_827: GLenum, arg_828: GLuint) void {
    return glad_glFramebufferRenderbuffer.?(arg_825, arg_826, arg_827, arg_828);
}
pub inline fn glGetFramebufferAttachmentParameteriv(arg_829: GLenum, arg_830: GLenum, arg_831: GLenum, arg_832: [*c]GLint) void {
    return glad_glGetFramebufferAttachmentParameteriv.?(arg_829, arg_830, arg_831, arg_832);
}
pub inline fn glGenerateMipmap(arg_833: GLenum) void {
    return glad_glGenerateMipmap.?(arg_833);
}
pub inline fn glBlitFramebuffer(arg_834: GLint, arg_835: GLint, arg_836: GLint, arg_837: GLint, arg_838: GLint, arg_839: GLint, arg_840: GLint, arg_841: GLint, arg_842: GLbitfield, arg_843: GLenum) void {
    return glad_glBlitFramebuffer.?(arg_834, arg_835, arg_836, arg_837, arg_838, arg_839, arg_840, arg_841, arg_842, arg_843);
}
pub inline fn glRenderbufferStorageMultisample(arg_844: GLenum, arg_845: GLsizei, arg_846: GLenum, arg_847: GLsizei, arg_848: GLsizei) void {
    return glad_glRenderbufferStorageMultisample.?(arg_844, arg_845, arg_846, arg_847, arg_848);
}
pub inline fn glFramebufferTextureLayer(arg_849: GLenum, arg_850: GLenum, arg_851: GLuint, arg_852: GLint, arg_853: GLint) void {
    return glad_glFramebufferTextureLayer.?(arg_849, arg_850, arg_851, arg_852, arg_853);
}
pub inline fn glMapBufferRange(arg_854: GLenum, arg_855: GLintptr, arg_856: GLsizeiptr, arg_857: GLbitfield) ?*c_void {
    return glad_glMapBufferRange.?(arg_854, arg_855, arg_856, arg_857);
}
pub inline fn glFlushMappedBufferRange(arg_858: GLenum, arg_859: GLintptr, arg_860: GLsizeiptr) void {
    return glad_glFlushMappedBufferRange.?(arg_858, arg_859, arg_860);
}
pub inline fn glBindVertexArray(arg_861: GLuint) void {
    return glad_glBindVertexArray.?(arg_861);
}
pub inline fn glDeleteVertexArrays(arg_862: GLsizei, arg_863: [*c]const GLuint) void {
    return glad_glDeleteVertexArrays.?(arg_862, arg_863);
}
pub inline fn glGenVertexArrays(arg_864: GLsizei, arg_865: [*c]GLuint) void {
    return glad_glGenVertexArrays.?(arg_864, arg_865);
}
pub inline fn glIsVertexArray(arg_866: GLuint) GLboolean {
    return glad_glIsVertexArray.?(arg_866);
}
pub const GL_VERSION_3_1 = @as(c_int, 1);
pub inline fn glDrawArraysInstanced(arg_867: GLenum, arg_868: GLint, arg_869: GLsizei, arg_870: GLsizei) void {
    return glad_glDrawArraysInstanced.?(arg_867, arg_868, arg_869, arg_870);
}
pub inline fn glDrawElementsInstanced(arg_871: GLenum, arg_872: GLsizei, arg_873: GLenum, arg_874: ?*const c_void, arg_875: GLsizei) void {
    return glad_glDrawElementsInstanced.?(arg_871, arg_872, arg_873, arg_874, arg_875);
}
pub inline fn glTexBuffer(arg_876: GLenum, arg_877: GLenum, arg_878: GLuint) void {
    return glad_glTexBuffer.?(arg_876, arg_877, arg_878);
}
pub inline fn glPrimitiveRestartIndex(arg_879: GLuint) void {
    return glad_glPrimitiveRestartIndex.?(arg_879);
}
pub inline fn glCopyBufferSubData(arg_880: GLenum, arg_881: GLenum, arg_882: GLintptr, arg_883: GLintptr, arg_884: GLsizeiptr) void {
    return glad_glCopyBufferSubData.?(arg_880, arg_881, arg_882, arg_883, arg_884);
}
pub inline fn glGetUniformIndices(arg_885: GLuint, arg_886: GLsizei, arg_887: [*c]const [*c]const GLchar, arg_888: [*c]GLuint) void {
    return glad_glGetUniformIndices.?(arg_885, arg_886, arg_887, arg_888);
}
pub inline fn glGetActiveUniformsiv(arg_889: GLuint, arg_890: GLsizei, arg_891: [*c]const GLuint, arg_892: GLenum, arg_893: [*c]GLint) void {
    return glad_glGetActiveUniformsiv.?(arg_889, arg_890, arg_891, arg_892, arg_893);
}
pub inline fn glGetActiveUniformName(arg_894: GLuint, arg_895: GLuint, arg_896: GLsizei, arg_897: [*c]GLsizei, arg_898: [*c]GLchar) void {
    return glad_glGetActiveUniformName.?(arg_894, arg_895, arg_896, arg_897, arg_898);
}
pub inline fn glGetUniformBlockIndex(arg_899: GLuint, arg_900: [*c]const GLchar) GLuint {
    return glad_glGetUniformBlockIndex.?(arg_899, arg_900);
}
pub inline fn glGetActiveUniformBlockiv(arg_901: GLuint, arg_902: GLuint, arg_903: GLenum, arg_904: [*c]GLint) void {
    return glad_glGetActiveUniformBlockiv.?(arg_901, arg_902, arg_903, arg_904);
}
pub inline fn glGetActiveUniformBlockName(arg_905: GLuint, arg_906: GLuint, arg_907: GLsizei, arg_908: [*c]GLsizei, arg_909: [*c]GLchar) void {
    return glad_glGetActiveUniformBlockName.?(arg_905, arg_906, arg_907, arg_908, arg_909);
}
pub inline fn glUniformBlockBinding(arg_910: GLuint, arg_911: GLuint, arg_912: GLuint) void {
    return glad_glUniformBlockBinding.?(arg_910, arg_911, arg_912);
}
pub const GL_VERSION_3_2 = @as(c_int, 1);
pub inline fn glDrawElementsBaseVertex(arg_913: GLenum, arg_914: GLsizei, arg_915: GLenum, arg_916: ?*const c_void, arg_917: GLint) void {
    return glad_glDrawElementsBaseVertex.?(arg_913, arg_914, arg_915, arg_916, arg_917);
}
pub inline fn glDrawRangeElementsBaseVertex(arg_918: GLenum, arg_919: GLuint, arg_920: GLuint, arg_921: GLsizei, arg_922: GLenum, arg_923: ?*const c_void, arg_924: GLint) void {
    return glad_glDrawRangeElementsBaseVertex.?(arg_918, arg_919, arg_920, arg_921, arg_922, arg_923, arg_924);
}
pub inline fn glDrawElementsInstancedBaseVertex(arg_925: GLenum, arg_926: GLsizei, arg_927: GLenum, arg_928: ?*const c_void, arg_929: GLsizei, arg_930: GLint) void {
    return glad_glDrawElementsInstancedBaseVertex.?(arg_925, arg_926, arg_927, arg_928, arg_929, arg_930);
}
pub inline fn glMultiDrawElementsBaseVertex(arg_931: GLenum, arg_932: [*c]const GLsizei, arg_933: GLenum, arg_934: [*c]const ?*const c_void, arg_935: GLsizei, arg_936: [*c]const GLint) void {
    return glad_glMultiDrawElementsBaseVertex.?(arg_931, arg_932, arg_933, arg_934, arg_935, arg_936);
}
pub inline fn glProvokingVertex(arg_937: GLenum) void {
    return glad_glProvokingVertex.?(arg_937);
}
pub inline fn glFenceSync(arg_938: GLenum, arg_939: GLbitfield) GLsync {
    return glad_glFenceSync.?(arg_938, arg_939);
}
pub inline fn glIsSync(arg_940: GLsync) GLboolean {
    return glad_glIsSync.?(arg_940);
}
pub inline fn glDeleteSync(arg_941: GLsync) void {
    return glad_glDeleteSync.?(arg_941);
}
pub inline fn glClientWaitSync(arg_942: GLsync, arg_943: GLbitfield, arg_944: GLuint64) GLenum {
    return glad_glClientWaitSync.?(arg_942, arg_943, arg_944);
}
pub inline fn glWaitSync(arg_945: GLsync, arg_946: GLbitfield, arg_947: GLuint64) void {
    return glad_glWaitSync.?(arg_945, arg_946, arg_947);
}
pub inline fn glGetInteger64v(arg_948: GLenum, arg_949: [*c]GLint64) void {
    return glad_glGetInteger64v.?(arg_948, arg_949);
}
pub inline fn glGetSynciv(arg_950: GLsync, arg_951: GLenum, arg_952: GLsizei, arg_953: [*c]GLsizei, arg_954: [*c]GLint) void {
    return glad_glGetSynciv.?(arg_950, arg_951, arg_952, arg_953, arg_954);
}
pub inline fn glGetInteger64i_v(arg_955: GLenum, arg_956: GLuint, arg_957: [*c]GLint64) void {
    return glad_glGetInteger64i_v.?(arg_955, arg_956, arg_957);
}
pub inline fn glGetBufferParameteri64v(arg_958: GLenum, arg_959: GLenum, arg_960: [*c]GLint64) void {
    return glad_glGetBufferParameteri64v.?(arg_958, arg_959, arg_960);
}
pub inline fn glFramebufferTexture(arg_961: GLenum, arg_962: GLenum, arg_963: GLuint, arg_964: GLint) void {
    return glad_glFramebufferTexture.?(arg_961, arg_962, arg_963, arg_964);
}
pub inline fn glTexImage2DMultisample(arg_965: GLenum, arg_966: GLsizei, arg_967: GLenum, arg_968: GLsizei, arg_969: GLsizei, arg_970: GLboolean) void {
    return glad_glTexImage2DMultisample.?(arg_965, arg_966, arg_967, arg_968, arg_969, arg_970);
}
pub inline fn glTexImage3DMultisample(arg_971: GLenum, arg_972: GLsizei, arg_973: GLenum, arg_974: GLsizei, arg_975: GLsizei, arg_976: GLsizei, arg_977: GLboolean) void {
    return glad_glTexImage3DMultisample.?(arg_971, arg_972, arg_973, arg_974, arg_975, arg_976, arg_977);
}
pub inline fn glGetMultisamplefv(arg_978: GLenum, arg_979: GLuint, arg_980: [*c]GLfloat) void {
    return glad_glGetMultisamplefv.?(arg_978, arg_979, arg_980);
}
pub inline fn glSampleMaski(arg_981: GLuint, arg_982: GLbitfield) void {
    return glad_glSampleMaski.?(arg_981, arg_982);
}
pub const GL_VERSION_3_3 = @as(c_int, 1);
pub inline fn glBindFragDataLocationIndexed(arg_983: GLuint, arg_984: GLuint, arg_985: GLuint, arg_986: [*c]const GLchar) void {
    return glad_glBindFragDataLocationIndexed.?(arg_983, arg_984, arg_985, arg_986);
}
pub inline fn glGetFragDataIndex(arg_987: GLuint, arg_988: [*c]const GLchar) GLint {
    return glad_glGetFragDataIndex.?(arg_987, arg_988);
}
pub inline fn glGenSamplers(arg_989: GLsizei, arg_990: [*c]GLuint) void {
    return glad_glGenSamplers.?(arg_989, arg_990);
}
pub inline fn glDeleteSamplers(arg_991: GLsizei, arg_992: [*c]const GLuint) void {
    return glad_glDeleteSamplers.?(arg_991, arg_992);
}
pub inline fn glIsSampler(arg_993: GLuint) GLboolean {
    return glad_glIsSampler.?(arg_993);
}
pub inline fn glBindSampler(arg_994: GLuint, arg_995: GLuint) void {
    return glad_glBindSampler.?(arg_994, arg_995);
}
pub inline fn glSamplerParameteri(arg_996: GLuint, arg_997: GLenum, arg_998: GLint) void {
    return glad_glSamplerParameteri.?(arg_996, arg_997, arg_998);
}
pub inline fn glSamplerParameteriv(arg_999: GLuint, arg_1000: GLenum, arg_1001: [*c]const GLint) void {
    return glad_glSamplerParameteriv.?(arg_999, arg_1000, arg_1001);
}
pub inline fn glSamplerParameterf(arg_1002: GLuint, arg_1003: GLenum, arg_1004: GLfloat) void {
    return glad_glSamplerParameterf.?(arg_1002, arg_1003, arg_1004);
}
pub inline fn glSamplerParameterfv(arg_1005: GLuint, arg_1006: GLenum, arg_1007: [*c]const GLfloat) void {
    return glad_glSamplerParameterfv.?(arg_1005, arg_1006, arg_1007);
}
pub inline fn glSamplerParameterIiv(arg_1008: GLuint, arg_1009: GLenum, arg_1010: [*c]const GLint) void {
    return glad_glSamplerParameterIiv.?(arg_1008, arg_1009, arg_1010);
}
pub inline fn glSamplerParameterIuiv(arg_1011: GLuint, arg_1012: GLenum, arg_1013: [*c]const GLuint) void {
    return glad_glSamplerParameterIuiv.?(arg_1011, arg_1012, arg_1013);
}
pub inline fn glGetSamplerParameteriv(arg_1014: GLuint, arg_1015: GLenum, arg_1016: [*c]GLint) void {
    return glad_glGetSamplerParameteriv.?(arg_1014, arg_1015, arg_1016);
}
pub inline fn glGetSamplerParameterIiv(arg_1017: GLuint, arg_1018: GLenum, arg_1019: [*c]GLint) void {
    return glad_glGetSamplerParameterIiv.?(arg_1017, arg_1018, arg_1019);
}
pub inline fn glGetSamplerParameterfv(arg_1020: GLuint, arg_1021: GLenum, arg_1022: [*c]GLfloat) void {
    return glad_glGetSamplerParameterfv.?(arg_1020, arg_1021, arg_1022);
}
pub inline fn glGetSamplerParameterIuiv(arg_1023: GLuint, arg_1024: GLenum, arg_1025: [*c]GLuint) void {
    return glad_glGetSamplerParameterIuiv.?(arg_1023, arg_1024, arg_1025);
}
pub inline fn glQueryCounter(arg_1026: GLuint, arg_1027: GLenum) void {
    return glad_glQueryCounter.?(arg_1026, arg_1027);
}
pub inline fn glGetQueryObjecti64v(arg_1028: GLuint, arg_1029: GLenum, arg_1030: [*c]GLint64) void {
    return glad_glGetQueryObjecti64v.?(arg_1028, arg_1029, arg_1030);
}
pub inline fn glGetQueryObjectui64v(arg_1031: GLuint, arg_1032: GLenum, arg_1033: [*c]GLuint64) void {
    return glad_glGetQueryObjectui64v.?(arg_1031, arg_1032, arg_1033);
}
pub inline fn glVertexAttribDivisor(arg_1034: GLuint, arg_1035: GLuint) void {
    return glad_glVertexAttribDivisor.?(arg_1034, arg_1035);
}
pub inline fn glVertexAttribP1ui(arg_1036: GLuint, arg_1037: GLenum, arg_1038: GLboolean, arg_1039: GLuint) void {
    return glad_glVertexAttribP1ui.?(arg_1036, arg_1037, arg_1038, arg_1039);
}
pub inline fn glVertexAttribP1uiv(arg_1040: GLuint, arg_1041: GLenum, arg_1042: GLboolean, arg_1043: [*c]const GLuint) void {
    return glad_glVertexAttribP1uiv.?(arg_1040, arg_1041, arg_1042, arg_1043);
}
pub inline fn glVertexAttribP2ui(arg_1044: GLuint, arg_1045: GLenum, arg_1046: GLboolean, arg_1047: GLuint) void {
    return glad_glVertexAttribP2ui.?(arg_1044, arg_1045, arg_1046, arg_1047);
}
pub inline fn glVertexAttribP2uiv(arg_1048: GLuint, arg_1049: GLenum, arg_1050: GLboolean, arg_1051: [*c]const GLuint) void {
    return glad_glVertexAttribP2uiv.?(arg_1048, arg_1049, arg_1050, arg_1051);
}
pub inline fn glVertexAttribP3ui(arg_1052: GLuint, arg_1053: GLenum, arg_1054: GLboolean, arg_1055: GLuint) void {
    return glad_glVertexAttribP3ui.?(arg_1052, arg_1053, arg_1054, arg_1055);
}
pub inline fn glVertexAttribP3uiv(arg_1056: GLuint, arg_1057: GLenum, arg_1058: GLboolean, arg_1059: [*c]const GLuint) void {
    return glad_glVertexAttribP3uiv.?(arg_1056, arg_1057, arg_1058, arg_1059);
}
pub inline fn glVertexAttribP4ui(arg_1060: GLuint, arg_1061: GLenum, arg_1062: GLboolean, arg_1063: GLuint) void {
    return glad_glVertexAttribP4ui.?(arg_1060, arg_1061, arg_1062, arg_1063);
}
pub inline fn glVertexAttribP4uiv(arg_1064: GLuint, arg_1065: GLenum, arg_1066: GLboolean, arg_1067: [*c]const GLuint) void {
    return glad_glVertexAttribP4uiv.?(arg_1064, arg_1065, arg_1066, arg_1067);
}
pub inline fn glVertexP2ui(arg_1068: GLenum, arg_1069: GLuint) void {
    return glad_glVertexP2ui.?(arg_1068, arg_1069);
}
pub inline fn glVertexP2uiv(arg_1070: GLenum, arg_1071: [*c]const GLuint) void {
    return glad_glVertexP2uiv.?(arg_1070, arg_1071);
}
pub inline fn glVertexP3ui(arg_1072: GLenum, arg_1073: GLuint) void {
    return glad_glVertexP3ui.?(arg_1072, arg_1073);
}
pub inline fn glVertexP3uiv(arg_1074: GLenum, arg_1075: [*c]const GLuint) void {
    return glad_glVertexP3uiv.?(arg_1074, arg_1075);
}
pub inline fn glVertexP4ui(arg_1076: GLenum, arg_1077: GLuint) void {
    return glad_glVertexP4ui.?(arg_1076, arg_1077);
}
pub inline fn glVertexP4uiv(arg_1078: GLenum, arg_1079: [*c]const GLuint) void {
    return glad_glVertexP4uiv.?(arg_1078, arg_1079);
}
pub inline fn glTexCoordP1ui(arg_1080: GLenum, arg_1081: GLuint) void {
    return glad_glTexCoordP1ui.?(arg_1080, arg_1081);
}
pub inline fn glTexCoordP1uiv(arg_1082: GLenum, arg_1083: [*c]const GLuint) void {
    return glad_glTexCoordP1uiv.?(arg_1082, arg_1083);
}
pub inline fn glTexCoordP2ui(arg_1084: GLenum, arg_1085: GLuint) void {
    return glad_glTexCoordP2ui.?(arg_1084, arg_1085);
}
pub inline fn glTexCoordP2uiv(arg_1086: GLenum, arg_1087: [*c]const GLuint) void {
    return glad_glTexCoordP2uiv.?(arg_1086, arg_1087);
}
pub inline fn glTexCoordP3ui(arg_1088: GLenum, arg_1089: GLuint) void {
    return glad_glTexCoordP3ui.?(arg_1088, arg_1089);
}
pub inline fn glTexCoordP3uiv(arg_1090: GLenum, arg_1091: [*c]const GLuint) void {
    return glad_glTexCoordP3uiv.?(arg_1090, arg_1091);
}
pub inline fn glTexCoordP4ui(arg_1092: GLenum, arg_1093: GLuint) void {
    return glad_glTexCoordP4ui.?(arg_1092, arg_1093);
}
pub inline fn glTexCoordP4uiv(arg_1094: GLenum, arg_1095: [*c]const GLuint) void {
    return glad_glTexCoordP4uiv.?(arg_1094, arg_1095);
}
pub inline fn glMultiTexCoordP1ui(arg_1096: GLenum, arg_1097: GLenum, arg_1098: GLuint) void {
    return glad_glMultiTexCoordP1ui.?(arg_1096, arg_1097, arg_1098);
}
pub inline fn glMultiTexCoordP1uiv(arg_1099: GLenum, arg_1100: GLenum, arg_1101: [*c]const GLuint) void {
    return glad_glMultiTexCoordP1uiv.?(arg_1099, arg_1100, arg_1101);
}
pub inline fn glMultiTexCoordP2ui(arg_1102: GLenum, arg_1103: GLenum, arg_1104: GLuint) void {
    return glad_glMultiTexCoordP2ui.?(arg_1102, arg_1103, arg_1104);
}
pub inline fn glMultiTexCoordP2uiv(arg_1105: GLenum, arg_1106: GLenum, arg_1107: [*c]const GLuint) void {
    return glad_glMultiTexCoordP2uiv.?(arg_1105, arg_1106, arg_1107);
}
pub inline fn glMultiTexCoordP3ui(arg_1108: GLenum, arg_1109: GLenum, arg_1110: GLuint) void {
    return glad_glMultiTexCoordP3ui.?(arg_1108, arg_1109, arg_1110);
}
pub inline fn glMultiTexCoordP3uiv(arg_1111: GLenum, arg_1112: GLenum, arg_1113: [*c]const GLuint) void {
    return glad_glMultiTexCoordP3uiv.?(arg_1111, arg_1112, arg_1113);
}
pub inline fn glMultiTexCoordP4ui(arg_1114: GLenum, arg_1115: GLenum, arg_1116: GLuint) void {
    return glad_glMultiTexCoordP4ui.?(arg_1114, arg_1115, arg_1116);
}
pub inline fn glMultiTexCoordP4uiv(arg_1117: GLenum, arg_1118: GLenum, arg_1119: [*c]const GLuint) void {
    return glad_glMultiTexCoordP4uiv.?(arg_1117, arg_1118, arg_1119);
}
pub inline fn glNormalP3ui(arg_1120: GLenum, arg_1121: GLuint) void {
    return glad_glNormalP3ui.?(arg_1120, arg_1121);
}
pub inline fn glNormalP3uiv(arg_1122: GLenum, arg_1123: [*c]const GLuint) void {
    return glad_glNormalP3uiv.?(arg_1122, arg_1123);
}
pub inline fn glColorP3ui(arg_1124: GLenum, arg_1125: GLuint) void {
    return glad_glColorP3ui.?(arg_1124, arg_1125);
}
pub inline fn glColorP3uiv(arg_1126: GLenum, arg_1127: [*c]const GLuint) void {
    return glad_glColorP3uiv.?(arg_1126, arg_1127);
}
pub inline fn glColorP4ui(arg_1128: GLenum, arg_1129: GLuint) void {
    return glad_glColorP4ui.?(arg_1128, arg_1129);
}
pub inline fn glColorP4uiv(arg_1130: GLenum, arg_1131: [*c]const GLuint) void {
    return glad_glColorP4uiv.?(arg_1130, arg_1131);
}
pub inline fn glSecondaryColorP3ui(arg_1132: GLenum, arg_1133: GLuint) void {
    return glad_glSecondaryColorP3ui.?(arg_1132, arg_1133);
}
pub inline fn glSecondaryColorP3uiv(arg_1134: GLenum, arg_1135: [*c]const GLuint) void {
    return glad_glSecondaryColorP3uiv.?(arg_1134, arg_1135);
}
const gladGLversionStruct = struct_gladGLversionStruct;
const tagLC_ID = struct_tagLC_ID;
const lconv = struct_lconv;
const __lc_time_data = struct___lc_time_data;
const threadlocaleinfostruct = struct_threadlocaleinfostruct;
const threadmbcinfostruct = struct_threadmbcinfostruct;
const localeinfo_struct = struct_localeinfo_struct;
const __GLsync = struct___GLsync;
const _cl_context = struct__cl_context;
const _cl_event = struct__cl_event;
