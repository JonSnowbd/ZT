pub const khronos_int32_t = i32;
pub const khronos_uint32_t = u32;
pub const khronos_int64_t = i64;
pub const khronos_uint64_t = u64;
pub const khronos_int8_t = i8;
pub const khronos_uint8_t = u8;
pub const khronos_int16_t = c_short;
pub const khronos_uint16_t = c_ushort;
pub const khronos_intptr_t = c_longlong;
pub const khronos_uintptr_t = c_ulonglong;
pub const khronos_ssize_t = c_longlong;
pub const khronos_usize_t = c_ulonglong;
pub const khronos_float_t = f32;
pub const khronos_utime_nanoseconds_t = khronos_uint64_t;
pub const khronos_stime_nanoseconds_t = khronos_int64_t;
pub const KHRONOS_FALSE: c_int = 0;
pub const KHRONOS_TRUE: c_int = 1;
pub const KHRONOS_BOOLEAN_ENUM_FORCE_SIZE: c_int = 2147483647;
pub const khronos_boolean_enum_t = c_uint;
pub const GLenum = c_uint;
pub const GLboolean = u8;
pub const GLbitfield = c_uint;
pub const GLvoid = anyopaque;
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
pub const GLeglClientBufferEXT = ?*anyopaque;
pub const GLeglImageOES = ?*anyopaque;
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
const GLDEBUGPROC = ?*const fn (GLenum, GLenum, GLuint, GLenum, GLsizei, [*c]const GLchar, ?*const anyopaque) callconv(.C) void;
const GLDEBUGPROCARB = ?*const fn (GLenum, GLenum, GLuint, GLenum, GLsizei, [*c]const GLchar, ?*const anyopaque) callconv(.C) void;
const GLDEBUGPROCKHR = ?*const fn (GLenum, GLenum, GLuint, GLenum, GLsizei, [*c]const GLchar, ?*const anyopaque) callconv(.C) void;
const GLDEBUGPROCAMD = ?*const fn (GLuint, GLenum, GLenum, GLsizei, [*c]const GLchar, ?*anyopaque) callconv(.C) void;
const GLhalfNV = c_ushort;
const GLvdpauSurfaceNV = GLintptr;
const GLVULKANPROCNV = ?*const fn () callconv(.C) void;
pub const GLADloadproc = ?*const fn ([*c]const u8) callconv(.C) ?*anyopaque;
pub extern fn gladLoadGL() c_int;
pub extern fn gladLoadGLLoader(GLADloadproc) c_int;
extern var GLAD_GL_VERSION_1_0: c_int;
const PFNGLCULLFACEPROC = ?*const fn (GLenum) callconv(.C) void;
extern var glad_glCullFace: PFNGLCULLFACEPROC;
const PFNGLFRONTFACEPROC = ?*const fn (GLenum) callconv(.C) void;
extern var glad_glFrontFace: PFNGLFRONTFACEPROC;
const PFNGLHINTPROC = ?*const fn (GLenum, GLenum) callconv(.C) void;
extern var glad_glHint: PFNGLHINTPROC;
const PFNGLLINEWIDTHPROC = ?*const fn (GLfloat) callconv(.C) void;
extern var glad_glLineWidth: PFNGLLINEWIDTHPROC;
const PFNGLPOINTSIZEPROC = ?*const fn (GLfloat) callconv(.C) void;
extern var glad_glPointSize: PFNGLPOINTSIZEPROC;
const PFNGLPOLYGONMODEPROC = ?*const fn (GLenum, GLenum) callconv(.C) void;
extern var glad_glPolygonMode: PFNGLPOLYGONMODEPROC;
const PFNGLSCISSORPROC = ?*const fn (GLint, GLint, GLsizei, GLsizei) callconv(.C) void;
extern var glad_glScissor: PFNGLSCISSORPROC;
const PFNGLTEXPARAMETERFPROC = ?*const fn (GLenum, GLenum, GLfloat) callconv(.C) void;
extern var glad_glTexParameterf: PFNGLTEXPARAMETERFPROC;
const PFNGLTEXPARAMETERFVPROC = ?*const fn (GLenum, GLenum, [*c]const GLfloat) callconv(.C) void;
extern var glad_glTexParameterfv: PFNGLTEXPARAMETERFVPROC;
const PFNGLTEXPARAMETERIPROC = ?*const fn (GLenum, GLenum, GLint) callconv(.C) void;
extern var glad_glTexParameteri: PFNGLTEXPARAMETERIPROC;
const PFNGLTEXPARAMETERIVPROC = ?*const fn (GLenum, GLenum, [*c]const GLint) callconv(.C) void;
extern var glad_glTexParameteriv: PFNGLTEXPARAMETERIVPROC;
const PFNGLTEXIMAGE1DPROC = ?*const fn (GLenum, GLint, GLint, GLsizei, GLint, GLenum, GLenum, ?*const anyopaque) callconv(.C) void;
extern var glad_glTexImage1D: PFNGLTEXIMAGE1DPROC;
const PFNGLTEXIMAGE2DPROC = ?*const fn (GLenum, GLint, GLint, GLsizei, GLsizei, GLint, GLenum, GLenum, ?*const anyopaque) callconv(.C) void;
extern var glad_glTexImage2D: PFNGLTEXIMAGE2DPROC;
const PFNGLDRAWBUFFERPROC = ?*const fn (GLenum) callconv(.C) void;
extern var glad_glDrawBuffer: PFNGLDRAWBUFFERPROC;
const PFNGLCLEARPROC = ?*const fn (GLbitfield) callconv(.C) void;
extern var glad_glClear: PFNGLCLEARPROC;
const PFNGLCLEARCOLORPROC = ?*const fn (GLfloat, GLfloat, GLfloat, GLfloat) callconv(.C) void;
extern var glad_glClearColor: PFNGLCLEARCOLORPROC;
const PFNGLCLEARSTENCILPROC = ?*const fn (GLint) callconv(.C) void;
extern var glad_glClearStencil: PFNGLCLEARSTENCILPROC;
const PFNGLCLEARDEPTHPROC = ?*const fn (GLdouble) callconv(.C) void;
extern var glad_glClearDepth: PFNGLCLEARDEPTHPROC;
const PFNGLSTENCILMASKPROC = ?*const fn (GLuint) callconv(.C) void;
extern var glad_glStencilMask: PFNGLSTENCILMASKPROC;
const PFNGLCOLORMASKPROC = ?*const fn (GLboolean, GLboolean, GLboolean, GLboolean) callconv(.C) void;
extern var glad_glColorMask: PFNGLCOLORMASKPROC;
const PFNGLDEPTHMASKPROC = ?*const fn (GLboolean) callconv(.C) void;
extern var glad_glDepthMask: PFNGLDEPTHMASKPROC;
const PFNGLDISABLEPROC = ?*const fn (GLenum) callconv(.C) void;
extern var glad_glDisable: PFNGLDISABLEPROC;
const PFNGLENABLEPROC = ?*const fn (GLenum) callconv(.C) void;
extern var glad_glEnable: PFNGLENABLEPROC;
const PFNGLFINISHPROC = ?*const fn () callconv(.C) void;
extern var glad_glFinish: PFNGLFINISHPROC;
const PFNGLFLUSHPROC = ?*const fn () callconv(.C) void;
extern var glad_glFlush: PFNGLFLUSHPROC;
const PFNGLBLENDFUNCPROC = ?*const fn (GLenum, GLenum) callconv(.C) void;
extern var glad_glBlendFunc: PFNGLBLENDFUNCPROC;
const PFNGLLOGICOPPROC = ?*const fn (GLenum) callconv(.C) void;
extern var glad_glLogicOp: PFNGLLOGICOPPROC;
const PFNGLSTENCILFUNCPROC = ?*const fn (GLenum, GLint, GLuint) callconv(.C) void;
extern var glad_glStencilFunc: PFNGLSTENCILFUNCPROC;
const PFNGLSTENCILOPPROC = ?*const fn (GLenum, GLenum, GLenum) callconv(.C) void;
extern var glad_glStencilOp: PFNGLSTENCILOPPROC;
const PFNGLDEPTHFUNCPROC = ?*const fn (GLenum) callconv(.C) void;
extern var glad_glDepthFunc: PFNGLDEPTHFUNCPROC;
const PFNGLPIXELSTOREFPROC = ?*const fn (GLenum, GLfloat) callconv(.C) void;
extern var glad_glPixelStoref: PFNGLPIXELSTOREFPROC;
const PFNGLPIXELSTOREIPROC = ?*const fn (GLenum, GLint) callconv(.C) void;
extern var glad_glPixelStorei: PFNGLPIXELSTOREIPROC;
const PFNGLREADBUFFERPROC = ?*const fn (GLenum) callconv(.C) void;
extern var glad_glReadBuffer: PFNGLREADBUFFERPROC;
const PFNGLREADPIXELSPROC = ?*const fn (GLint, GLint, GLsizei, GLsizei, GLenum, GLenum, ?*anyopaque) callconv(.C) void;
extern var glad_glReadPixels: PFNGLREADPIXELSPROC;
const PFNGLGETBOOLEANVPROC = ?*const fn (GLenum, [*c]GLboolean) callconv(.C) void;
extern var glad_glGetBooleanv: PFNGLGETBOOLEANVPROC;
const PFNGLGETDOUBLEVPROC = ?*const fn (GLenum, [*c]GLdouble) callconv(.C) void;
extern var glad_glGetDoublev: PFNGLGETDOUBLEVPROC;
const PFNGLGETERRORPROC = ?*const fn () callconv(.C) GLenum;
extern var glad_glGetError: PFNGLGETERRORPROC;
const PFNGLGETFLOATVPROC = ?*const fn (GLenum, [*c]GLfloat) callconv(.C) void;
extern var glad_glGetFloatv: PFNGLGETFLOATVPROC;
const PFNGLGETINTEGERVPROC = ?*const fn (GLenum, [*c]GLint) callconv(.C) void;
extern var glad_glGetIntegerv: PFNGLGETINTEGERVPROC;
const PFNGLGETSTRINGPROC = ?*const fn (GLenum) callconv(.C) [*c]const GLubyte;
extern var glad_glGetString: PFNGLGETSTRINGPROC;
const PFNGLGETTEXIMAGEPROC = ?*const fn (GLenum, GLint, GLenum, GLenum, ?*anyopaque) callconv(.C) void;
extern var glad_glGetTexImage: PFNGLGETTEXIMAGEPROC;
const PFNGLGETTEXPARAMETERFVPROC = ?*const fn (GLenum, GLenum, [*c]GLfloat) callconv(.C) void;
extern var glad_glGetTexParameterfv: PFNGLGETTEXPARAMETERFVPROC;
const PFNGLGETTEXPARAMETERIVPROC = ?*const fn (GLenum, GLenum, [*c]GLint) callconv(.C) void;
extern var glad_glGetTexParameteriv: PFNGLGETTEXPARAMETERIVPROC;
const PFNGLGETTEXLEVELPARAMETERFVPROC = ?*const fn (GLenum, GLint, GLenum, [*c]GLfloat) callconv(.C) void;
extern var glad_glGetTexLevelParameterfv: PFNGLGETTEXLEVELPARAMETERFVPROC;
const PFNGLGETTEXLEVELPARAMETERIVPROC = ?*const fn (GLenum, GLint, GLenum, [*c]GLint) callconv(.C) void;
extern var glad_glGetTexLevelParameteriv: PFNGLGETTEXLEVELPARAMETERIVPROC;
const PFNGLISENABLEDPROC = ?*const fn (GLenum) callconv(.C) GLboolean;
extern var glad_glIsEnabled: PFNGLISENABLEDPROC;
const PFNGLDEPTHRANGEPROC = ?*const fn (GLdouble, GLdouble) callconv(.C) void;
extern var glad_glDepthRange: PFNGLDEPTHRANGEPROC;
const PFNGLVIEWPORTPROC = ?*const fn (GLint, GLint, GLsizei, GLsizei) callconv(.C) void;
extern var glad_glViewport: PFNGLVIEWPORTPROC;
extern var GLAD_GL_VERSION_1_1: c_int;
const PFNGLDRAWARRAYSPROC = ?*const fn (GLenum, GLint, GLsizei) callconv(.C) void;
extern var glad_glDrawArrays: PFNGLDRAWARRAYSPROC;
const PFNGLDRAWELEMENTSPROC = ?*const fn (GLenum, GLsizei, GLenum, ?*const anyopaque) callconv(.C) void;
extern var glad_glDrawElements: PFNGLDRAWELEMENTSPROC;
const PFNGLPOLYGONOFFSETPROC = ?*const fn (GLfloat, GLfloat) callconv(.C) void;
extern var glad_glPolygonOffset: PFNGLPOLYGONOFFSETPROC;
const PFNGLCOPYTEXIMAGE1DPROC = ?*const fn (GLenum, GLint, GLenum, GLint, GLint, GLsizei, GLint) callconv(.C) void;
extern var glad_glCopyTexImage1D: PFNGLCOPYTEXIMAGE1DPROC;
const PFNGLCOPYTEXIMAGE2DPROC = ?*const fn (GLenum, GLint, GLenum, GLint, GLint, GLsizei, GLsizei, GLint) callconv(.C) void;
extern var glad_glCopyTexImage2D: PFNGLCOPYTEXIMAGE2DPROC;
const PFNGLCOPYTEXSUBIMAGE1DPROC = ?*const fn (GLenum, GLint, GLint, GLint, GLint, GLsizei) callconv(.C) void;
extern var glad_glCopyTexSubImage1D: PFNGLCOPYTEXSUBIMAGE1DPROC;
const PFNGLCOPYTEXSUBIMAGE2DPROC = ?*const fn (GLenum, GLint, GLint, GLint, GLint, GLint, GLsizei, GLsizei) callconv(.C) void;
extern var glad_glCopyTexSubImage2D: PFNGLCOPYTEXSUBIMAGE2DPROC;
const PFNGLTEXSUBIMAGE1DPROC = ?*const fn (GLenum, GLint, GLint, GLsizei, GLenum, GLenum, ?*const anyopaque) callconv(.C) void;
extern var glad_glTexSubImage1D: PFNGLTEXSUBIMAGE1DPROC;
const PFNGLTEXSUBIMAGE2DPROC = ?*const fn (GLenum, GLint, GLint, GLint, GLsizei, GLsizei, GLenum, GLenum, ?*const anyopaque) callconv(.C) void;
extern var glad_glTexSubImage2D: PFNGLTEXSUBIMAGE2DPROC;
const PFNGLBINDTEXTUREPROC = ?*const fn (GLenum, GLuint) callconv(.C) void;
extern var glad_glBindTexture: PFNGLBINDTEXTUREPROC;
const PFNGLDELETETEXTURESPROC = ?*const fn (GLsizei, [*c]const GLuint) callconv(.C) void;
extern var glad_glDeleteTextures: PFNGLDELETETEXTURESPROC;
const PFNGLGENTEXTURESPROC = ?*const fn (GLsizei, [*c]GLuint) callconv(.C) void;
extern var glad_glGenTextures: PFNGLGENTEXTURESPROC;
const PFNGLISTEXTUREPROC = ?*const fn (GLuint) callconv(.C) GLboolean;
extern var glad_glIsTexture: PFNGLISTEXTUREPROC;
extern var GLAD_GL_VERSION_1_2: c_int;
const PFNGLDRAWRANGEELEMENTSPROC = ?*const fn (GLenum, GLuint, GLuint, GLsizei, GLenum, ?*const anyopaque) callconv(.C) void;
extern var glad_glDrawRangeElements: PFNGLDRAWRANGEELEMENTSPROC;
const PFNGLTEXIMAGE3DPROC = ?*const fn (GLenum, GLint, GLint, GLsizei, GLsizei, GLsizei, GLint, GLenum, GLenum, ?*const anyopaque) callconv(.C) void;
extern var glad_glTexImage3D: PFNGLTEXIMAGE3DPROC;
const PFNGLTEXSUBIMAGE3DPROC = ?*const fn (GLenum, GLint, GLint, GLint, GLint, GLsizei, GLsizei, GLsizei, GLenum, GLenum, ?*const anyopaque) callconv(.C) void;
extern var glad_glTexSubImage3D: PFNGLTEXSUBIMAGE3DPROC;
const PFNGLCOPYTEXSUBIMAGE3DPROC = ?*const fn (GLenum, GLint, GLint, GLint, GLint, GLint, GLint, GLsizei, GLsizei) callconv(.C) void;
extern var glad_glCopyTexSubImage3D: PFNGLCOPYTEXSUBIMAGE3DPROC;
extern var GLAD_GL_VERSION_1_3: c_int;
const PFNGLACTIVETEXTUREPROC = ?*const fn (GLenum) callconv(.C) void;
extern var glad_glActiveTexture: PFNGLACTIVETEXTUREPROC;
const PFNGLSAMPLECOVERAGEPROC = ?*const fn (GLfloat, GLboolean) callconv(.C) void;
extern var glad_glSampleCoverage: PFNGLSAMPLECOVERAGEPROC;
const PFNGLCOMPRESSEDTEXIMAGE3DPROC = ?*const fn (GLenum, GLint, GLenum, GLsizei, GLsizei, GLsizei, GLint, GLsizei, ?*const anyopaque) callconv(.C) void;
extern var glad_glCompressedTexImage3D: PFNGLCOMPRESSEDTEXIMAGE3DPROC;
const PFNGLCOMPRESSEDTEXIMAGE2DPROC = ?*const fn (GLenum, GLint, GLenum, GLsizei, GLsizei, GLint, GLsizei, ?*const anyopaque) callconv(.C) void;
extern var glad_glCompressedTexImage2D: PFNGLCOMPRESSEDTEXIMAGE2DPROC;
const PFNGLCOMPRESSEDTEXIMAGE1DPROC = ?*const fn (GLenum, GLint, GLenum, GLsizei, GLint, GLsizei, ?*const anyopaque) callconv(.C) void;
extern var glad_glCompressedTexImage1D: PFNGLCOMPRESSEDTEXIMAGE1DPROC;
const PFNGLCOMPRESSEDTEXSUBIMAGE3DPROC = ?*const fn (GLenum, GLint, GLint, GLint, GLint, GLsizei, GLsizei, GLsizei, GLenum, GLsizei, ?*const anyopaque) callconv(.C) void;
extern var glad_glCompressedTexSubImage3D: PFNGLCOMPRESSEDTEXSUBIMAGE3DPROC;
const PFNGLCOMPRESSEDTEXSUBIMAGE2DPROC = ?*const fn (GLenum, GLint, GLint, GLint, GLsizei, GLsizei, GLenum, GLsizei, ?*const anyopaque) callconv(.C) void;
extern var glad_glCompressedTexSubImage2D: PFNGLCOMPRESSEDTEXSUBIMAGE2DPROC;
const PFNGLCOMPRESSEDTEXSUBIMAGE1DPROC = ?*const fn (GLenum, GLint, GLint, GLsizei, GLenum, GLsizei, ?*const anyopaque) callconv(.C) void;
extern var glad_glCompressedTexSubImage1D: PFNGLCOMPRESSEDTEXSUBIMAGE1DPROC;
const PFNGLGETCOMPRESSEDTEXIMAGEPROC = ?*const fn (GLenum, GLint, ?*anyopaque) callconv(.C) void;
extern var glad_glGetCompressedTexImage: PFNGLGETCOMPRESSEDTEXIMAGEPROC;
extern var GLAD_GL_VERSION_1_4: c_int;
const PFNGLBLENDFUNCSEPARATEPROC = ?*const fn (GLenum, GLenum, GLenum, GLenum) callconv(.C) void;
extern var glad_glBlendFuncSeparate: PFNGLBLENDFUNCSEPARATEPROC;
const PFNGLMULTIDRAWARRAYSPROC = ?*const fn (GLenum, [*c]const GLint, [*c]const GLsizei, GLsizei) callconv(.C) void;
extern var glad_glMultiDrawArrays: PFNGLMULTIDRAWARRAYSPROC;
const PFNGLMULTIDRAWELEMENTSPROC = ?*const fn (GLenum, [*c]const GLsizei, GLenum, [*c]const ?*const anyopaque, GLsizei) callconv(.C) void;
extern var glad_glMultiDrawElements: PFNGLMULTIDRAWELEMENTSPROC;
const PFNGLPOINTPARAMETERFPROC = ?*const fn (GLenum, GLfloat) callconv(.C) void;
extern var glad_glPointParameterf: PFNGLPOINTPARAMETERFPROC;
const PFNGLPOINTPARAMETERFVPROC = ?*const fn (GLenum, [*c]const GLfloat) callconv(.C) void;
extern var glad_glPointParameterfv: PFNGLPOINTPARAMETERFVPROC;
const PFNGLPOINTPARAMETERIPROC = ?*const fn (GLenum, GLint) callconv(.C) void;
extern var glad_glPointParameteri: PFNGLPOINTPARAMETERIPROC;
const PFNGLPOINTPARAMETERIVPROC = ?*const fn (GLenum, [*c]const GLint) callconv(.C) void;
extern var glad_glPointParameteriv: PFNGLPOINTPARAMETERIVPROC;
const PFNGLBLENDCOLORPROC = ?*const fn (GLfloat, GLfloat, GLfloat, GLfloat) callconv(.C) void;
extern var glad_glBlendColor: PFNGLBLENDCOLORPROC;
const PFNGLBLENDEQUATIONPROC = ?*const fn (GLenum) callconv(.C) void;
extern var glad_glBlendEquation: PFNGLBLENDEQUATIONPROC;
extern var GLAD_GL_VERSION_1_5: c_int;
const PFNGLGENQUERIESPROC = ?*const fn (GLsizei, [*c]GLuint) callconv(.C) void;
extern var glad_glGenQueries: PFNGLGENQUERIESPROC;
const PFNGLDELETEQUERIESPROC = ?*const fn (GLsizei, [*c]const GLuint) callconv(.C) void;
extern var glad_glDeleteQueries: PFNGLDELETEQUERIESPROC;
const PFNGLISQUERYPROC = ?*const fn (GLuint) callconv(.C) GLboolean;
extern var glad_glIsQuery: PFNGLISQUERYPROC;
const PFNGLBEGINQUERYPROC = ?*const fn (GLenum, GLuint) callconv(.C) void;
extern var glad_glBeginQuery: PFNGLBEGINQUERYPROC;
const PFNGLENDQUERYPROC = ?*const fn (GLenum) callconv(.C) void;
extern var glad_glEndQuery: PFNGLENDQUERYPROC;
const PFNGLGETQUERYIVPROC = ?*const fn (GLenum, GLenum, [*c]GLint) callconv(.C) void;
extern var glad_glGetQueryiv: PFNGLGETQUERYIVPROC;
const PFNGLGETQUERYOBJECTIVPROC = ?*const fn (GLuint, GLenum, [*c]GLint) callconv(.C) void;
extern var glad_glGetQueryObjectiv: PFNGLGETQUERYOBJECTIVPROC;
const PFNGLGETQUERYOBJECTUIVPROC = ?*const fn (GLuint, GLenum, [*c]GLuint) callconv(.C) void;
extern var glad_glGetQueryObjectuiv: PFNGLGETQUERYOBJECTUIVPROC;
const PFNGLBINDBUFFERPROC = ?*const fn (GLenum, GLuint) callconv(.C) void;
extern var glad_glBindBuffer: PFNGLBINDBUFFERPROC;
const PFNGLDELETEBUFFERSPROC = ?*const fn (GLsizei, [*c]const GLuint) callconv(.C) void;
extern var glad_glDeleteBuffers: PFNGLDELETEBUFFERSPROC;
const PFNGLGENBUFFERSPROC = ?*const fn (GLsizei, [*c]GLuint) callconv(.C) void;
extern var glad_glGenBuffers: PFNGLGENBUFFERSPROC;
const PFNGLISBUFFERPROC = ?*const fn (GLuint) callconv(.C) GLboolean;
extern var glad_glIsBuffer: PFNGLISBUFFERPROC;
const PFNGLBUFFERDATAPROC = ?*const fn (GLenum, GLsizeiptr, ?*const anyopaque, GLenum) callconv(.C) void;
extern var glad_glBufferData: PFNGLBUFFERDATAPROC;
const PFNGLBUFFERSUBDATAPROC = ?*const fn (GLenum, GLintptr, GLsizeiptr, ?*const anyopaque) callconv(.C) void;
extern var glad_glBufferSubData: PFNGLBUFFERSUBDATAPROC;
const PFNGLGETBUFFERSUBDATAPROC = ?*const fn (GLenum, GLintptr, GLsizeiptr, ?*anyopaque) callconv(.C) void;
extern var glad_glGetBufferSubData: PFNGLGETBUFFERSUBDATAPROC;
const PFNGLMAPBUFFERPROC = ?*const fn (GLenum, GLenum) callconv(.C) ?*anyopaque;
extern var glad_glMapBuffer: PFNGLMAPBUFFERPROC;
const PFNGLUNMAPBUFFERPROC = ?*const fn (GLenum) callconv(.C) GLboolean;
extern var glad_glUnmapBuffer: PFNGLUNMAPBUFFERPROC;
const PFNGLGETBUFFERPARAMETERIVPROC = ?*const fn (GLenum, GLenum, [*c]GLint) callconv(.C) void;
extern var glad_glGetBufferParameteriv: PFNGLGETBUFFERPARAMETERIVPROC;
const PFNGLGETBUFFERPOINTERVPROC = ?*const fn (GLenum, GLenum, [*c]?*anyopaque) callconv(.C) void;
extern var glad_glGetBufferPointerv: PFNGLGETBUFFERPOINTERVPROC;
extern var GLAD_GL_VERSION_2_0: c_int;
const PFNGLBLENDEQUATIONSEPARATEPROC = ?*const fn (GLenum, GLenum) callconv(.C) void;
extern var glad_glBlendEquationSeparate: PFNGLBLENDEQUATIONSEPARATEPROC;
const PFNGLDRAWBUFFERSPROC = ?*const fn (GLsizei, [*c]const GLenum) callconv(.C) void;
extern var glad_glDrawBuffers: PFNGLDRAWBUFFERSPROC;
const PFNGLSTENCILOPSEPARATEPROC = ?*const fn (GLenum, GLenum, GLenum, GLenum) callconv(.C) void;
extern var glad_glStencilOpSeparate: PFNGLSTENCILOPSEPARATEPROC;
const PFNGLSTENCILFUNCSEPARATEPROC = ?*const fn (GLenum, GLenum, GLint, GLuint) callconv(.C) void;
extern var glad_glStencilFuncSeparate: PFNGLSTENCILFUNCSEPARATEPROC;
const PFNGLSTENCILMASKSEPARATEPROC = ?*const fn (GLenum, GLuint) callconv(.C) void;
extern var glad_glStencilMaskSeparate: PFNGLSTENCILMASKSEPARATEPROC;
const PFNGLATTACHSHADERPROC = ?*const fn (GLuint, GLuint) callconv(.C) void;
extern var glad_glAttachShader: PFNGLATTACHSHADERPROC;
const PFNGLBINDATTRIBLOCATIONPROC = ?*const fn (GLuint, GLuint, [*c]const GLchar) callconv(.C) void;
extern var glad_glBindAttribLocation: PFNGLBINDATTRIBLOCATIONPROC;
const PFNGLCOMPILESHADERPROC = ?*const fn (GLuint) callconv(.C) void;
extern var glad_glCompileShader: PFNGLCOMPILESHADERPROC;
const PFNGLCREATEPROGRAMPROC = ?*const fn () callconv(.C) GLuint;
extern var glad_glCreateProgram: PFNGLCREATEPROGRAMPROC;
const PFNGLCREATESHADERPROC = ?*const fn (GLenum) callconv(.C) GLuint;
extern var glad_glCreateShader: PFNGLCREATESHADERPROC;
const PFNGLDELETEPROGRAMPROC = ?*const fn (GLuint) callconv(.C) void;
extern var glad_glDeleteProgram: PFNGLDELETEPROGRAMPROC;
const PFNGLDELETESHADERPROC = ?*const fn (GLuint) callconv(.C) void;
extern var glad_glDeleteShader: PFNGLDELETESHADERPROC;
const PFNGLDETACHSHADERPROC = ?*const fn (GLuint, GLuint) callconv(.C) void;
extern var glad_glDetachShader: PFNGLDETACHSHADERPROC;
const PFNGLDISABLEVERTEXATTRIBARRAYPROC = ?*const fn (GLuint) callconv(.C) void;
extern var glad_glDisableVertexAttribArray: PFNGLDISABLEVERTEXATTRIBARRAYPROC;
const PFNGLENABLEVERTEXATTRIBARRAYPROC = ?*const fn (GLuint) callconv(.C) void;
extern var glad_glEnableVertexAttribArray: PFNGLENABLEVERTEXATTRIBARRAYPROC;
const PFNGLGETACTIVEATTRIBPROC = ?*const fn (GLuint, GLuint, GLsizei, [*c]GLsizei, [*c]GLint, [*c]GLenum, [*c]GLchar) callconv(.C) void;
extern var glad_glGetActiveAttrib: PFNGLGETACTIVEATTRIBPROC;
const PFNGLGETACTIVEUNIFORMPROC = ?*const fn (GLuint, GLuint, GLsizei, [*c]GLsizei, [*c]GLint, [*c]GLenum, [*c]GLchar) callconv(.C) void;
extern var glad_glGetActiveUniform: PFNGLGETACTIVEUNIFORMPROC;
const PFNGLGETATTACHEDSHADERSPROC = ?*const fn (GLuint, GLsizei, [*c]GLsizei, [*c]GLuint) callconv(.C) void;
extern var glad_glGetAttachedShaders: PFNGLGETATTACHEDSHADERSPROC;
const PFNGLGETATTRIBLOCATIONPROC = ?*const fn (GLuint, [*c]const GLchar) callconv(.C) GLint;
extern var glad_glGetAttribLocation: PFNGLGETATTRIBLOCATIONPROC;
const PFNGLGETPROGRAMIVPROC = ?*const fn (GLuint, GLenum, [*c]GLint) callconv(.C) void;
extern var glad_glGetProgramiv: PFNGLGETPROGRAMIVPROC;
const PFNGLGETPROGRAMINFOLOGPROC = ?*const fn (GLuint, GLsizei, [*c]GLsizei, [*c]GLchar) callconv(.C) void;
extern var glad_glGetProgramInfoLog: PFNGLGETPROGRAMINFOLOGPROC;
const PFNGLGETSHADERIVPROC = ?*const fn (GLuint, GLenum, [*c]GLint) callconv(.C) void;
extern var glad_glGetShaderiv: PFNGLGETSHADERIVPROC;
const PFNGLGETSHADERINFOLOGPROC = ?*const fn (GLuint, GLsizei, [*c]GLsizei, [*c]GLchar) callconv(.C) void;
extern var glad_glGetShaderInfoLog: PFNGLGETSHADERINFOLOGPROC;
const PFNGLGETSHADERSOURCEPROC = ?*const fn (GLuint, GLsizei, [*c]GLsizei, [*c]GLchar) callconv(.C) void;
extern var glad_glGetShaderSource: PFNGLGETSHADERSOURCEPROC;
const PFNGLGETUNIFORMLOCATIONPROC = ?*const fn (GLuint, [*c]const GLchar) callconv(.C) GLint;
extern var glad_glGetUniformLocation: PFNGLGETUNIFORMLOCATIONPROC;
const PFNGLGETUNIFORMFVPROC = ?*const fn (GLuint, GLint, [*c]GLfloat) callconv(.C) void;
extern var glad_glGetUniformfv: PFNGLGETUNIFORMFVPROC;
const PFNGLGETUNIFORMIVPROC = ?*const fn (GLuint, GLint, [*c]GLint) callconv(.C) void;
extern var glad_glGetUniformiv: PFNGLGETUNIFORMIVPROC;
const PFNGLGETVERTEXATTRIBDVPROC = ?*const fn (GLuint, GLenum, [*c]GLdouble) callconv(.C) void;
extern var glad_glGetVertexAttribdv: PFNGLGETVERTEXATTRIBDVPROC;
const PFNGLGETVERTEXATTRIBFVPROC = ?*const fn (GLuint, GLenum, [*c]GLfloat) callconv(.C) void;
extern var glad_glGetVertexAttribfv: PFNGLGETVERTEXATTRIBFVPROC;
const PFNGLGETVERTEXATTRIBIVPROC = ?*const fn (GLuint, GLenum, [*c]GLint) callconv(.C) void;
extern var glad_glGetVertexAttribiv: PFNGLGETVERTEXATTRIBIVPROC;
const PFNGLGETVERTEXATTRIBPOINTERVPROC = ?*const fn (GLuint, GLenum, [*c]?*anyopaque) callconv(.C) void;
extern var glad_glGetVertexAttribPointerv: PFNGLGETVERTEXATTRIBPOINTERVPROC;
const PFNGLISPROGRAMPROC = ?*const fn (GLuint) callconv(.C) GLboolean;
extern var glad_glIsProgram: PFNGLISPROGRAMPROC;
const PFNGLISSHADERPROC = ?*const fn (GLuint) callconv(.C) GLboolean;
extern var glad_glIsShader: PFNGLISSHADERPROC;
const PFNGLLINKPROGRAMPROC = ?*const fn (GLuint) callconv(.C) void;
extern var glad_glLinkProgram: PFNGLLINKPROGRAMPROC;
const PFNGLSHADERSOURCEPROC = ?*const fn (GLuint, GLsizei, [*c]const [*c]const GLchar, [*c]const GLint) callconv(.C) void;
extern var glad_glShaderSource: PFNGLSHADERSOURCEPROC;
const PFNGLUSEPROGRAMPROC = ?*const fn (GLuint) callconv(.C) void;
extern var glad_glUseProgram: PFNGLUSEPROGRAMPROC;
const PFNGLUNIFORM1FPROC = ?*const fn (GLint, GLfloat) callconv(.C) void;
extern var glad_glUniform1f: PFNGLUNIFORM1FPROC;
const PFNGLUNIFORM2FPROC = ?*const fn (GLint, GLfloat, GLfloat) callconv(.C) void;
extern var glad_glUniform2f: PFNGLUNIFORM2FPROC;
const PFNGLUNIFORM3FPROC = ?*const fn (GLint, GLfloat, GLfloat, GLfloat) callconv(.C) void;
extern var glad_glUniform3f: PFNGLUNIFORM3FPROC;
const PFNGLUNIFORM4FPROC = ?*const fn (GLint, GLfloat, GLfloat, GLfloat, GLfloat) callconv(.C) void;
extern var glad_glUniform4f: PFNGLUNIFORM4FPROC;
const PFNGLUNIFORM1IPROC = ?*const fn (GLint, GLint) callconv(.C) void;
extern var glad_glUniform1i: PFNGLUNIFORM1IPROC;
const PFNGLUNIFORM2IPROC = ?*const fn (GLint, GLint, GLint) callconv(.C) void;
extern var glad_glUniform2i: PFNGLUNIFORM2IPROC;
const PFNGLUNIFORM3IPROC = ?*const fn (GLint, GLint, GLint, GLint) callconv(.C) void;
extern var glad_glUniform3i: PFNGLUNIFORM3IPROC;
const PFNGLUNIFORM4IPROC = ?*const fn (GLint, GLint, GLint, GLint, GLint) callconv(.C) void;
extern var glad_glUniform4i: PFNGLUNIFORM4IPROC;
const PFNGLUNIFORM1FVPROC = ?*const fn (GLint, GLsizei, [*c]const GLfloat) callconv(.C) void;
extern var glad_glUniform1fv: PFNGLUNIFORM1FVPROC;
const PFNGLUNIFORM2FVPROC = ?*const fn (GLint, GLsizei, [*c]const GLfloat) callconv(.C) void;
extern var glad_glUniform2fv: PFNGLUNIFORM2FVPROC;
const PFNGLUNIFORM3FVPROC = ?*const fn (GLint, GLsizei, [*c]const GLfloat) callconv(.C) void;
extern var glad_glUniform3fv: PFNGLUNIFORM3FVPROC;
const PFNGLUNIFORM4FVPROC = ?*const fn (GLint, GLsizei, [*c]const GLfloat) callconv(.C) void;
extern var glad_glUniform4fv: PFNGLUNIFORM4FVPROC;
const PFNGLUNIFORM1IVPROC = ?*const fn (GLint, GLsizei, [*c]const GLint) callconv(.C) void;
extern var glad_glUniform1iv: PFNGLUNIFORM1IVPROC;
const PFNGLUNIFORM2IVPROC = ?*const fn (GLint, GLsizei, [*c]const GLint) callconv(.C) void;
extern var glad_glUniform2iv: PFNGLUNIFORM2IVPROC;
const PFNGLUNIFORM3IVPROC = ?*const fn (GLint, GLsizei, [*c]const GLint) callconv(.C) void;
extern var glad_glUniform3iv: PFNGLUNIFORM3IVPROC;
const PFNGLUNIFORM4IVPROC = ?*const fn (GLint, GLsizei, [*c]const GLint) callconv(.C) void;
extern var glad_glUniform4iv: PFNGLUNIFORM4IVPROC;
const PFNGLUNIFORMMATRIX2FVPROC = ?*const fn (GLint, GLsizei, GLboolean, [*c]const GLfloat) callconv(.C) void;
extern var glad_glUniformMatrix2fv: PFNGLUNIFORMMATRIX2FVPROC;
const PFNGLUNIFORMMATRIX3FVPROC = ?*const fn (GLint, GLsizei, GLboolean, [*c]const GLfloat) callconv(.C) void;
extern var glad_glUniformMatrix3fv: PFNGLUNIFORMMATRIX3FVPROC;
const PFNGLUNIFORMMATRIX4FVPROC = ?*const fn (GLint, GLsizei, GLboolean, [*c]const GLfloat) callconv(.C) void;
extern var glad_glUniformMatrix4fv: PFNGLUNIFORMMATRIX4FVPROC;
const PFNGLVALIDATEPROGRAMPROC = ?*const fn (GLuint) callconv(.C) void;
extern var glad_glValidateProgram: PFNGLVALIDATEPROGRAMPROC;
const PFNGLVERTEXATTRIB1DPROC = ?*const fn (GLuint, GLdouble) callconv(.C) void;
extern var glad_glVertexAttrib1d: PFNGLVERTEXATTRIB1DPROC;
const PFNGLVERTEXATTRIB1DVPROC = ?*const fn (GLuint, [*c]const GLdouble) callconv(.C) void;
extern var glad_glVertexAttrib1dv: PFNGLVERTEXATTRIB1DVPROC;
const PFNGLVERTEXATTRIB1FPROC = ?*const fn (GLuint, GLfloat) callconv(.C) void;
extern var glad_glVertexAttrib1f: PFNGLVERTEXATTRIB1FPROC;
const PFNGLVERTEXATTRIB1FVPROC = ?*const fn (GLuint, [*c]const GLfloat) callconv(.C) void;
extern var glad_glVertexAttrib1fv: PFNGLVERTEXATTRIB1FVPROC;
const PFNGLVERTEXATTRIB1SPROC = ?*const fn (GLuint, GLshort) callconv(.C) void;
extern var glad_glVertexAttrib1s: PFNGLVERTEXATTRIB1SPROC;
const PFNGLVERTEXATTRIB1SVPROC = ?*const fn (GLuint, [*c]const GLshort) callconv(.C) void;
extern var glad_glVertexAttrib1sv: PFNGLVERTEXATTRIB1SVPROC;
const PFNGLVERTEXATTRIB2DPROC = ?*const fn (GLuint, GLdouble, GLdouble) callconv(.C) void;
extern var glad_glVertexAttrib2d: PFNGLVERTEXATTRIB2DPROC;
const PFNGLVERTEXATTRIB2DVPROC = ?*const fn (GLuint, [*c]const GLdouble) callconv(.C) void;
extern var glad_glVertexAttrib2dv: PFNGLVERTEXATTRIB2DVPROC;
const PFNGLVERTEXATTRIB2FPROC = ?*const fn (GLuint, GLfloat, GLfloat) callconv(.C) void;
extern var glad_glVertexAttrib2f: PFNGLVERTEXATTRIB2FPROC;
const PFNGLVERTEXATTRIB2FVPROC = ?*const fn (GLuint, [*c]const GLfloat) callconv(.C) void;
extern var glad_glVertexAttrib2fv: PFNGLVERTEXATTRIB2FVPROC;
const PFNGLVERTEXATTRIB2SPROC = ?*const fn (GLuint, GLshort, GLshort) callconv(.C) void;
extern var glad_glVertexAttrib2s: PFNGLVERTEXATTRIB2SPROC;
const PFNGLVERTEXATTRIB2SVPROC = ?*const fn (GLuint, [*c]const GLshort) callconv(.C) void;
extern var glad_glVertexAttrib2sv: PFNGLVERTEXATTRIB2SVPROC;
const PFNGLVERTEXATTRIB3DPROC = ?*const fn (GLuint, GLdouble, GLdouble, GLdouble) callconv(.C) void;
extern var glad_glVertexAttrib3d: PFNGLVERTEXATTRIB3DPROC;
const PFNGLVERTEXATTRIB3DVPROC = ?*const fn (GLuint, [*c]const GLdouble) callconv(.C) void;
extern var glad_glVertexAttrib3dv: PFNGLVERTEXATTRIB3DVPROC;
const PFNGLVERTEXATTRIB3FPROC = ?*const fn (GLuint, GLfloat, GLfloat, GLfloat) callconv(.C) void;
extern var glad_glVertexAttrib3f: PFNGLVERTEXATTRIB3FPROC;
const PFNGLVERTEXATTRIB3FVPROC = ?*const fn (GLuint, [*c]const GLfloat) callconv(.C) void;
extern var glad_glVertexAttrib3fv: PFNGLVERTEXATTRIB3FVPROC;
const PFNGLVERTEXATTRIB3SPROC = ?*const fn (GLuint, GLshort, GLshort, GLshort) callconv(.C) void;
extern var glad_glVertexAttrib3s: PFNGLVERTEXATTRIB3SPROC;
const PFNGLVERTEXATTRIB3SVPROC = ?*const fn (GLuint, [*c]const GLshort) callconv(.C) void;
extern var glad_glVertexAttrib3sv: PFNGLVERTEXATTRIB3SVPROC;
const PFNGLVERTEXATTRIB4NBVPROC = ?*const fn (GLuint, [*c]const GLbyte) callconv(.C) void;
extern var glad_glVertexAttrib4Nbv: PFNGLVERTEXATTRIB4NBVPROC;
const PFNGLVERTEXATTRIB4NIVPROC = ?*const fn (GLuint, [*c]const GLint) callconv(.C) void;
extern var glad_glVertexAttrib4Niv: PFNGLVERTEXATTRIB4NIVPROC;
const PFNGLVERTEXATTRIB4NSVPROC = ?*const fn (GLuint, [*c]const GLshort) callconv(.C) void;
extern var glad_glVertexAttrib4Nsv: PFNGLVERTEXATTRIB4NSVPROC;
const PFNGLVERTEXATTRIB4NUBPROC = ?*const fn (GLuint, GLubyte, GLubyte, GLubyte, GLubyte) callconv(.C) void;
extern var glad_glVertexAttrib4Nub: PFNGLVERTEXATTRIB4NUBPROC;
const PFNGLVERTEXATTRIB4NUBVPROC = ?*const fn (GLuint, [*c]const GLubyte) callconv(.C) void;
extern var glad_glVertexAttrib4Nubv: PFNGLVERTEXATTRIB4NUBVPROC;
const PFNGLVERTEXATTRIB4NUIVPROC = ?*const fn (GLuint, [*c]const GLuint) callconv(.C) void;
extern var glad_glVertexAttrib4Nuiv: PFNGLVERTEXATTRIB4NUIVPROC;
const PFNGLVERTEXATTRIB4NUSVPROC = ?*const fn (GLuint, [*c]const GLushort) callconv(.C) void;
extern var glad_glVertexAttrib4Nusv: PFNGLVERTEXATTRIB4NUSVPROC;
const PFNGLVERTEXATTRIB4BVPROC = ?*const fn (GLuint, [*c]const GLbyte) callconv(.C) void;
extern var glad_glVertexAttrib4bv: PFNGLVERTEXATTRIB4BVPROC;
const PFNGLVERTEXATTRIB4DPROC = ?*const fn (GLuint, GLdouble, GLdouble, GLdouble, GLdouble) callconv(.C) void;
extern var glad_glVertexAttrib4d: PFNGLVERTEXATTRIB4DPROC;
const PFNGLVERTEXATTRIB4DVPROC = ?*const fn (GLuint, [*c]const GLdouble) callconv(.C) void;
extern var glad_glVertexAttrib4dv: PFNGLVERTEXATTRIB4DVPROC;
const PFNGLVERTEXATTRIB4FPROC = ?*const fn (GLuint, GLfloat, GLfloat, GLfloat, GLfloat) callconv(.C) void;
extern var glad_glVertexAttrib4f: PFNGLVERTEXATTRIB4FPROC;
const PFNGLVERTEXATTRIB4FVPROC = ?*const fn (GLuint, [*c]const GLfloat) callconv(.C) void;
extern var glad_glVertexAttrib4fv: PFNGLVERTEXATTRIB4FVPROC;
const PFNGLVERTEXATTRIB4IVPROC = ?*const fn (GLuint, [*c]const GLint) callconv(.C) void;
extern var glad_glVertexAttrib4iv: PFNGLVERTEXATTRIB4IVPROC;
const PFNGLVERTEXATTRIB4SPROC = ?*const fn (GLuint, GLshort, GLshort, GLshort, GLshort) callconv(.C) void;
extern var glad_glVertexAttrib4s: PFNGLVERTEXATTRIB4SPROC;
const PFNGLVERTEXATTRIB4SVPROC = ?*const fn (GLuint, [*c]const GLshort) callconv(.C) void;
extern var glad_glVertexAttrib4sv: PFNGLVERTEXATTRIB4SVPROC;
const PFNGLVERTEXATTRIB4UBVPROC = ?*const fn (GLuint, [*c]const GLubyte) callconv(.C) void;
extern var glad_glVertexAttrib4ubv: PFNGLVERTEXATTRIB4UBVPROC;
const PFNGLVERTEXATTRIB4UIVPROC = ?*const fn (GLuint, [*c]const GLuint) callconv(.C) void;
extern var glad_glVertexAttrib4uiv: PFNGLVERTEXATTRIB4UIVPROC;
const PFNGLVERTEXATTRIB4USVPROC = ?*const fn (GLuint, [*c]const GLushort) callconv(.C) void;
extern var glad_glVertexAttrib4usv: PFNGLVERTEXATTRIB4USVPROC;
const PFNGLVERTEXATTRIBPOINTERPROC = ?*const fn (GLuint, GLint, GLenum, GLboolean, GLsizei, ?*const anyopaque) callconv(.C) void;
extern var glad_glVertexAttribPointer: PFNGLVERTEXATTRIBPOINTERPROC;
extern var GLAD_GL_VERSION_2_1: c_int;
const PFNGLUNIFORMMATRIX2X3FVPROC = ?*const fn (GLint, GLsizei, GLboolean, [*c]const GLfloat) callconv(.C) void;
extern var glad_glUniformMatrix2x3fv: PFNGLUNIFORMMATRIX2X3FVPROC;
const PFNGLUNIFORMMATRIX3X2FVPROC = ?*const fn (GLint, GLsizei, GLboolean, [*c]const GLfloat) callconv(.C) void;
extern var glad_glUniformMatrix3x2fv: PFNGLUNIFORMMATRIX3X2FVPROC;
const PFNGLUNIFORMMATRIX2X4FVPROC = ?*const fn (GLint, GLsizei, GLboolean, [*c]const GLfloat) callconv(.C) void;
extern var glad_glUniformMatrix2x4fv: PFNGLUNIFORMMATRIX2X4FVPROC;
const PFNGLUNIFORMMATRIX4X2FVPROC = ?*const fn (GLint, GLsizei, GLboolean, [*c]const GLfloat) callconv(.C) void;
extern var glad_glUniformMatrix4x2fv: PFNGLUNIFORMMATRIX4X2FVPROC;
const PFNGLUNIFORMMATRIX3X4FVPROC = ?*const fn (GLint, GLsizei, GLboolean, [*c]const GLfloat) callconv(.C) void;
extern var glad_glUniformMatrix3x4fv: PFNGLUNIFORMMATRIX3X4FVPROC;
const PFNGLUNIFORMMATRIX4X3FVPROC = ?*const fn (GLint, GLsizei, GLboolean, [*c]const GLfloat) callconv(.C) void;
extern var glad_glUniformMatrix4x3fv: PFNGLUNIFORMMATRIX4X3FVPROC;
extern var GLAD_GL_VERSION_3_0: c_int;
const PFNGLCOLORMASKIPROC = ?*const fn (GLuint, GLboolean, GLboolean, GLboolean, GLboolean) callconv(.C) void;
extern var glad_glColorMaski: PFNGLCOLORMASKIPROC;
const PFNGLGETBOOLEANI_VPROC = ?*const fn (GLenum, GLuint, [*c]GLboolean) callconv(.C) void;
extern var glad_glGetBooleani_v: PFNGLGETBOOLEANI_VPROC;
const PFNGLGETINTEGERI_VPROC = ?*const fn (GLenum, GLuint, [*c]GLint) callconv(.C) void;
extern var glad_glGetIntegeri_v: PFNGLGETINTEGERI_VPROC;
const PFNGLENABLEIPROC = ?*const fn (GLenum, GLuint) callconv(.C) void;
extern var glad_glEnablei: PFNGLENABLEIPROC;
const PFNGLDISABLEIPROC = ?*const fn (GLenum, GLuint) callconv(.C) void;
extern var glad_glDisablei: PFNGLDISABLEIPROC;
const PFNGLISENABLEDIPROC = ?*const fn (GLenum, GLuint) callconv(.C) GLboolean;
extern var glad_glIsEnabledi: PFNGLISENABLEDIPROC;
const PFNGLBEGINTRANSFORMFEEDBACKPROC = ?*const fn (GLenum) callconv(.C) void;
extern var glad_glBeginTransformFeedback: PFNGLBEGINTRANSFORMFEEDBACKPROC;
const PFNGLENDTRANSFORMFEEDBACKPROC = ?*const fn () callconv(.C) void;
extern var glad_glEndTransformFeedback: PFNGLENDTRANSFORMFEEDBACKPROC;
const PFNGLBINDBUFFERRANGEPROC = ?*const fn (GLenum, GLuint, GLuint, GLintptr, GLsizeiptr) callconv(.C) void;
extern var glad_glBindBufferRange: PFNGLBINDBUFFERRANGEPROC;
const PFNGLBINDBUFFERBASEPROC = ?*const fn (GLenum, GLuint, GLuint) callconv(.C) void;
extern var glad_glBindBufferBase: PFNGLBINDBUFFERBASEPROC;
const PFNGLTRANSFORMFEEDBACKVARYINGSPROC = ?*const fn (GLuint, GLsizei, [*c]const [*c]const GLchar, GLenum) callconv(.C) void;
extern var glad_glTransformFeedbackVaryings: PFNGLTRANSFORMFEEDBACKVARYINGSPROC;
const PFNGLGETTRANSFORMFEEDBACKVARYINGPROC = ?*const fn (GLuint, GLuint, GLsizei, [*c]GLsizei, [*c]GLsizei, [*c]GLenum, [*c]GLchar) callconv(.C) void;
extern var glad_glGetTransformFeedbackVarying: PFNGLGETTRANSFORMFEEDBACKVARYINGPROC;
const PFNGLCLAMPCOLORPROC = ?*const fn (GLenum, GLenum) callconv(.C) void;
extern var glad_glClampColor: PFNGLCLAMPCOLORPROC;
const PFNGLBEGINCONDITIONALRENDERPROC = ?*const fn (GLuint, GLenum) callconv(.C) void;
extern var glad_glBeginConditionalRender: PFNGLBEGINCONDITIONALRENDERPROC;
const PFNGLENDCONDITIONALRENDERPROC = ?*const fn () callconv(.C) void;
extern var glad_glEndConditionalRender: PFNGLENDCONDITIONALRENDERPROC;
const PFNGLVERTEXATTRIBIPOINTERPROC = ?*const fn (GLuint, GLint, GLenum, GLsizei, ?*const anyopaque) callconv(.C) void;
extern var glad_glVertexAttribIPointer: PFNGLVERTEXATTRIBIPOINTERPROC;
const PFNGLGETVERTEXATTRIBIIVPROC = ?*const fn (GLuint, GLenum, [*c]GLint) callconv(.C) void;
extern var glad_glGetVertexAttribIiv: PFNGLGETVERTEXATTRIBIIVPROC;
const PFNGLGETVERTEXATTRIBIUIVPROC = ?*const fn (GLuint, GLenum, [*c]GLuint) callconv(.C) void;
extern var glad_glGetVertexAttribIuiv: PFNGLGETVERTEXATTRIBIUIVPROC;
const PFNGLVERTEXATTRIBI1IPROC = ?*const fn (GLuint, GLint) callconv(.C) void;
extern var glad_glVertexAttribI1i: PFNGLVERTEXATTRIBI1IPROC;
const PFNGLVERTEXATTRIBI2IPROC = ?*const fn (GLuint, GLint, GLint) callconv(.C) void;
extern var glad_glVertexAttribI2i: PFNGLVERTEXATTRIBI2IPROC;
const PFNGLVERTEXATTRIBI3IPROC = ?*const fn (GLuint, GLint, GLint, GLint) callconv(.C) void;
extern var glad_glVertexAttribI3i: PFNGLVERTEXATTRIBI3IPROC;
const PFNGLVERTEXATTRIBI4IPROC = ?*const fn (GLuint, GLint, GLint, GLint, GLint) callconv(.C) void;
extern var glad_glVertexAttribI4i: PFNGLVERTEXATTRIBI4IPROC;
const PFNGLVERTEXATTRIBI1UIPROC = ?*const fn (GLuint, GLuint) callconv(.C) void;
extern var glad_glVertexAttribI1ui: PFNGLVERTEXATTRIBI1UIPROC;
const PFNGLVERTEXATTRIBI2UIPROC = ?*const fn (GLuint, GLuint, GLuint) callconv(.C) void;
extern var glad_glVertexAttribI2ui: PFNGLVERTEXATTRIBI2UIPROC;
const PFNGLVERTEXATTRIBI3UIPROC = ?*const fn (GLuint, GLuint, GLuint, GLuint) callconv(.C) void;
extern var glad_glVertexAttribI3ui: PFNGLVERTEXATTRIBI3UIPROC;
const PFNGLVERTEXATTRIBI4UIPROC = ?*const fn (GLuint, GLuint, GLuint, GLuint, GLuint) callconv(.C) void;
extern var glad_glVertexAttribI4ui: PFNGLVERTEXATTRIBI4UIPROC;
const PFNGLVERTEXATTRIBI1IVPROC = ?*const fn (GLuint, [*c]const GLint) callconv(.C) void;
extern var glad_glVertexAttribI1iv: PFNGLVERTEXATTRIBI1IVPROC;
const PFNGLVERTEXATTRIBI2IVPROC = ?*const fn (GLuint, [*c]const GLint) callconv(.C) void;
extern var glad_glVertexAttribI2iv: PFNGLVERTEXATTRIBI2IVPROC;
const PFNGLVERTEXATTRIBI3IVPROC = ?*const fn (GLuint, [*c]const GLint) callconv(.C) void;
extern var glad_glVertexAttribI3iv: PFNGLVERTEXATTRIBI3IVPROC;
const PFNGLVERTEXATTRIBI4IVPROC = ?*const fn (GLuint, [*c]const GLint) callconv(.C) void;
extern var glad_glVertexAttribI4iv: PFNGLVERTEXATTRIBI4IVPROC;
const PFNGLVERTEXATTRIBI1UIVPROC = ?*const fn (GLuint, [*c]const GLuint) callconv(.C) void;
extern var glad_glVertexAttribI1uiv: PFNGLVERTEXATTRIBI1UIVPROC;
const PFNGLVERTEXATTRIBI2UIVPROC = ?*const fn (GLuint, [*c]const GLuint) callconv(.C) void;
extern var glad_glVertexAttribI2uiv: PFNGLVERTEXATTRIBI2UIVPROC;
const PFNGLVERTEXATTRIBI3UIVPROC = ?*const fn (GLuint, [*c]const GLuint) callconv(.C) void;
extern var glad_glVertexAttribI3uiv: PFNGLVERTEXATTRIBI3UIVPROC;
const PFNGLVERTEXATTRIBI4UIVPROC = ?*const fn (GLuint, [*c]const GLuint) callconv(.C) void;
extern var glad_glVertexAttribI4uiv: PFNGLVERTEXATTRIBI4UIVPROC;
const PFNGLVERTEXATTRIBI4BVPROC = ?*const fn (GLuint, [*c]const GLbyte) callconv(.C) void;
extern var glad_glVertexAttribI4bv: PFNGLVERTEXATTRIBI4BVPROC;
const PFNGLVERTEXATTRIBI4SVPROC = ?*const fn (GLuint, [*c]const GLshort) callconv(.C) void;
extern var glad_glVertexAttribI4sv: PFNGLVERTEXATTRIBI4SVPROC;
const PFNGLVERTEXATTRIBI4UBVPROC = ?*const fn (GLuint, [*c]const GLubyte) callconv(.C) void;
extern var glad_glVertexAttribI4ubv: PFNGLVERTEXATTRIBI4UBVPROC;
const PFNGLVERTEXATTRIBI4USVPROC = ?*const fn (GLuint, [*c]const GLushort) callconv(.C) void;
extern var glad_glVertexAttribI4usv: PFNGLVERTEXATTRIBI4USVPROC;
const PFNGLGETUNIFORMUIVPROC = ?*const fn (GLuint, GLint, [*c]GLuint) callconv(.C) void;
extern var glad_glGetUniformuiv: PFNGLGETUNIFORMUIVPROC;
const PFNGLBINDFRAGDATALOCATIONPROC = ?*const fn (GLuint, GLuint, [*c]const GLchar) callconv(.C) void;
extern var glad_glBindFragDataLocation: PFNGLBINDFRAGDATALOCATIONPROC;
const PFNGLGETFRAGDATALOCATIONPROC = ?*const fn (GLuint, [*c]const GLchar) callconv(.C) GLint;
extern var glad_glGetFragDataLocation: PFNGLGETFRAGDATALOCATIONPROC;
const PFNGLUNIFORM1UIPROC = ?*const fn (GLint, GLuint) callconv(.C) void;
extern var glad_glUniform1ui: PFNGLUNIFORM1UIPROC;
const PFNGLUNIFORM2UIPROC = ?*const fn (GLint, GLuint, GLuint) callconv(.C) void;
extern var glad_glUniform2ui: PFNGLUNIFORM2UIPROC;
const PFNGLUNIFORM3UIPROC = ?*const fn (GLint, GLuint, GLuint, GLuint) callconv(.C) void;
extern var glad_glUniform3ui: PFNGLUNIFORM3UIPROC;
const PFNGLUNIFORM4UIPROC = ?*const fn (GLint, GLuint, GLuint, GLuint, GLuint) callconv(.C) void;
extern var glad_glUniform4ui: PFNGLUNIFORM4UIPROC;
const PFNGLUNIFORM1UIVPROC = ?*const fn (GLint, GLsizei, [*c]const GLuint) callconv(.C) void;
extern var glad_glUniform1uiv: PFNGLUNIFORM1UIVPROC;
const PFNGLUNIFORM2UIVPROC = ?*const fn (GLint, GLsizei, [*c]const GLuint) callconv(.C) void;
extern var glad_glUniform2uiv: PFNGLUNIFORM2UIVPROC;
const PFNGLUNIFORM3UIVPROC = ?*const fn (GLint, GLsizei, [*c]const GLuint) callconv(.C) void;
extern var glad_glUniform3uiv: PFNGLUNIFORM3UIVPROC;
const PFNGLUNIFORM4UIVPROC = ?*const fn (GLint, GLsizei, [*c]const GLuint) callconv(.C) void;
extern var glad_glUniform4uiv: PFNGLUNIFORM4UIVPROC;
const PFNGLTEXPARAMETERIIVPROC = ?*const fn (GLenum, GLenum, [*c]const GLint) callconv(.C) void;
extern var glad_glTexParameterIiv: PFNGLTEXPARAMETERIIVPROC;
const PFNGLTEXPARAMETERIUIVPROC = ?*const fn (GLenum, GLenum, [*c]const GLuint) callconv(.C) void;
extern var glad_glTexParameterIuiv: PFNGLTEXPARAMETERIUIVPROC;
const PFNGLGETTEXPARAMETERIIVPROC = ?*const fn (GLenum, GLenum, [*c]GLint) callconv(.C) void;
extern var glad_glGetTexParameterIiv: PFNGLGETTEXPARAMETERIIVPROC;
const PFNGLGETTEXPARAMETERIUIVPROC = ?*const fn (GLenum, GLenum, [*c]GLuint) callconv(.C) void;
extern var glad_glGetTexParameterIuiv: PFNGLGETTEXPARAMETERIUIVPROC;
const PFNGLCLEARBUFFERIVPROC = ?*const fn (GLenum, GLint, [*c]const GLint) callconv(.C) void;
extern var glad_glClearBufferiv: PFNGLCLEARBUFFERIVPROC;
const PFNGLCLEARBUFFERUIVPROC = ?*const fn (GLenum, GLint, [*c]const GLuint) callconv(.C) void;
extern var glad_glClearBufferuiv: PFNGLCLEARBUFFERUIVPROC;
const PFNGLCLEARBUFFERFVPROC = ?*const fn (GLenum, GLint, [*c]const GLfloat) callconv(.C) void;
extern var glad_glClearBufferfv: PFNGLCLEARBUFFERFVPROC;
const PFNGLCLEARBUFFERFIPROC = ?*const fn (GLenum, GLint, GLfloat, GLint) callconv(.C) void;
extern var glad_glClearBufferfi: PFNGLCLEARBUFFERFIPROC;
const PFNGLGETSTRINGIPROC = ?*const fn (GLenum, GLuint) callconv(.C) [*c]const GLubyte;
extern var glad_glGetStringi: PFNGLGETSTRINGIPROC;
const PFNGLISRENDERBUFFERPROC = ?*const fn (GLuint) callconv(.C) GLboolean;
extern var glad_glIsRenderbuffer: PFNGLISRENDERBUFFERPROC;
const PFNGLBINDRENDERBUFFERPROC = ?*const fn (GLenum, GLuint) callconv(.C) void;
extern var glad_glBindRenderbuffer: PFNGLBINDRENDERBUFFERPROC;
const PFNGLDELETERENDERBUFFERSPROC = ?*const fn (GLsizei, [*c]const GLuint) callconv(.C) void;
extern var glad_glDeleteRenderbuffers: PFNGLDELETERENDERBUFFERSPROC;
const PFNGLGENRENDERBUFFERSPROC = ?*const fn (GLsizei, [*c]GLuint) callconv(.C) void;
extern var glad_glGenRenderbuffers: PFNGLGENRENDERBUFFERSPROC;
const PFNGLRENDERBUFFERSTORAGEPROC = ?*const fn (GLenum, GLenum, GLsizei, GLsizei) callconv(.C) void;
extern var glad_glRenderbufferStorage: PFNGLRENDERBUFFERSTORAGEPROC;
const PFNGLGETRENDERBUFFERPARAMETERIVPROC = ?*const fn (GLenum, GLenum, [*c]GLint) callconv(.C) void;
extern var glad_glGetRenderbufferParameteriv: PFNGLGETRENDERBUFFERPARAMETERIVPROC;
const PFNGLISFRAMEBUFFERPROC = ?*const fn (GLuint) callconv(.C) GLboolean;
extern var glad_glIsFramebuffer: PFNGLISFRAMEBUFFERPROC;
const PFNGLBINDFRAMEBUFFERPROC = ?*const fn (GLenum, GLuint) callconv(.C) void;
extern var glad_glBindFramebuffer: PFNGLBINDFRAMEBUFFERPROC;
const PFNGLDELETEFRAMEBUFFERSPROC = ?*const fn (GLsizei, [*c]const GLuint) callconv(.C) void;
extern var glad_glDeleteFramebuffers: PFNGLDELETEFRAMEBUFFERSPROC;
const PFNGLGENFRAMEBUFFERSPROC = ?*const fn (GLsizei, [*c]GLuint) callconv(.C) void;
extern var glad_glGenFramebuffers: PFNGLGENFRAMEBUFFERSPROC;
const PFNGLCHECKFRAMEBUFFERSTATUSPROC = ?*const fn (GLenum) callconv(.C) GLenum;
extern var glad_glCheckFramebufferStatus: PFNGLCHECKFRAMEBUFFERSTATUSPROC;
const PFNGLFRAMEBUFFERTEXTURE1DPROC = ?*const fn (GLenum, GLenum, GLenum, GLuint, GLint) callconv(.C) void;
extern var glad_glFramebufferTexture1D: PFNGLFRAMEBUFFERTEXTURE1DPROC;
const PFNGLFRAMEBUFFERTEXTURE2DPROC = ?*const fn (GLenum, GLenum, GLenum, GLuint, GLint) callconv(.C) void;
extern var glad_glFramebufferTexture2D: PFNGLFRAMEBUFFERTEXTURE2DPROC;
const PFNGLFRAMEBUFFERTEXTURE3DPROC = ?*const fn (GLenum, GLenum, GLenum, GLuint, GLint, GLint) callconv(.C) void;
extern var glad_glFramebufferTexture3D: PFNGLFRAMEBUFFERTEXTURE3DPROC;
const PFNGLFRAMEBUFFERRENDERBUFFERPROC = ?*const fn (GLenum, GLenum, GLenum, GLuint) callconv(.C) void;
extern var glad_glFramebufferRenderbuffer: PFNGLFRAMEBUFFERRENDERBUFFERPROC;
const PFNGLGETFRAMEBUFFERATTACHMENTPARAMETERIVPROC = ?*const fn (GLenum, GLenum, GLenum, [*c]GLint) callconv(.C) void;
extern var glad_glGetFramebufferAttachmentParameteriv: PFNGLGETFRAMEBUFFERATTACHMENTPARAMETERIVPROC;
const PFNGLGENERATEMIPMAPPROC = ?*const fn (GLenum) callconv(.C) void;
extern var glad_glGenerateMipmap: PFNGLGENERATEMIPMAPPROC;
const PFNGLBLITFRAMEBUFFERPROC = ?*const fn (GLint, GLint, GLint, GLint, GLint, GLint, GLint, GLint, GLbitfield, GLenum) callconv(.C) void;
extern var glad_glBlitFramebuffer: PFNGLBLITFRAMEBUFFERPROC;
const PFNGLRENDERBUFFERSTORAGEMULTISAMPLEPROC = ?*const fn (GLenum, GLsizei, GLenum, GLsizei, GLsizei) callconv(.C) void;
extern var glad_glRenderbufferStorageMultisample: PFNGLRENDERBUFFERSTORAGEMULTISAMPLEPROC;
const PFNGLFRAMEBUFFERTEXTURELAYERPROC = ?*const fn (GLenum, GLenum, GLuint, GLint, GLint) callconv(.C) void;
extern var glad_glFramebufferTextureLayer: PFNGLFRAMEBUFFERTEXTURELAYERPROC;
const PFNGLMAPBUFFERRANGEPROC = ?*const fn (GLenum, GLintptr, GLsizeiptr, GLbitfield) callconv(.C) ?*anyopaque;
extern var glad_glMapBufferRange: PFNGLMAPBUFFERRANGEPROC;
const PFNGLFLUSHMAPPEDBUFFERRANGEPROC = ?*const fn (GLenum, GLintptr, GLsizeiptr) callconv(.C) void;
extern var glad_glFlushMappedBufferRange: PFNGLFLUSHMAPPEDBUFFERRANGEPROC;
const PFNGLBINDVERTEXARRAYPROC = ?*const fn (GLuint) callconv(.C) void;
extern var glad_glBindVertexArray: PFNGLBINDVERTEXARRAYPROC;
const PFNGLDELETEVERTEXARRAYSPROC = ?*const fn (GLsizei, [*c]const GLuint) callconv(.C) void;
extern var glad_glDeleteVertexArrays: PFNGLDELETEVERTEXARRAYSPROC;
const PFNGLGENVERTEXARRAYSPROC = ?*const fn (GLsizei, [*c]GLuint) callconv(.C) void;
extern var glad_glGenVertexArrays: PFNGLGENVERTEXARRAYSPROC;
const PFNGLISVERTEXARRAYPROC = ?*const fn (GLuint) callconv(.C) GLboolean;
extern var glad_glIsVertexArray: PFNGLISVERTEXARRAYPROC;
extern var GLAD_GL_VERSION_3_1: c_int;
const PFNGLDRAWARRAYSINSTANCEDPROC = ?*const fn (GLenum, GLint, GLsizei, GLsizei) callconv(.C) void;
extern var glad_glDrawArraysInstanced: PFNGLDRAWARRAYSINSTANCEDPROC;
const PFNGLDRAWELEMENTSINSTANCEDPROC = ?*const fn (GLenum, GLsizei, GLenum, ?*const anyopaque, GLsizei) callconv(.C) void;
extern var glad_glDrawElementsInstanced: PFNGLDRAWELEMENTSINSTANCEDPROC;
const PFNGLTEXBUFFERPROC = ?*const fn (GLenum, GLenum, GLuint) callconv(.C) void;
extern var glad_glTexBuffer: PFNGLTEXBUFFERPROC;
const PFNGLPRIMITIVERESTARTINDEXPROC = ?*const fn (GLuint) callconv(.C) void;
extern var glad_glPrimitiveRestartIndex: PFNGLPRIMITIVERESTARTINDEXPROC;
const PFNGLCOPYBUFFERSUBDATAPROC = ?*const fn (GLenum, GLenum, GLintptr, GLintptr, GLsizeiptr) callconv(.C) void;
extern var glad_glCopyBufferSubData: PFNGLCOPYBUFFERSUBDATAPROC;
const PFNGLGETUNIFORMINDICESPROC = ?*const fn (GLuint, GLsizei, [*c]const [*c]const GLchar, [*c]GLuint) callconv(.C) void;
extern var glad_glGetUniformIndices: PFNGLGETUNIFORMINDICESPROC;
const PFNGLGETACTIVEUNIFORMSIVPROC = ?*const fn (GLuint, GLsizei, [*c]const GLuint, GLenum, [*c]GLint) callconv(.C) void;
extern var glad_glGetActiveUniformsiv: PFNGLGETACTIVEUNIFORMSIVPROC;
const PFNGLGETACTIVEUNIFORMNAMEPROC = ?*const fn (GLuint, GLuint, GLsizei, [*c]GLsizei, [*c]GLchar) callconv(.C) void;
extern var glad_glGetActiveUniformName: PFNGLGETACTIVEUNIFORMNAMEPROC;
const PFNGLGETUNIFORMBLOCKINDEXPROC = ?*const fn (GLuint, [*c]const GLchar) callconv(.C) GLuint;
extern var glad_glGetUniformBlockIndex: PFNGLGETUNIFORMBLOCKINDEXPROC;
const PFNGLGETACTIVEUNIFORMBLOCKIVPROC = ?*const fn (GLuint, GLuint, GLenum, [*c]GLint) callconv(.C) void;
extern var glad_glGetActiveUniformBlockiv: PFNGLGETACTIVEUNIFORMBLOCKIVPROC;
const PFNGLGETACTIVEUNIFORMBLOCKNAMEPROC = ?*const fn (GLuint, GLuint, GLsizei, [*c]GLsizei, [*c]GLchar) callconv(.C) void;
extern var glad_glGetActiveUniformBlockName: PFNGLGETACTIVEUNIFORMBLOCKNAMEPROC;
const PFNGLUNIFORMBLOCKBINDINGPROC = ?*const fn (GLuint, GLuint, GLuint) callconv(.C) void;
extern var glad_glUniformBlockBinding: PFNGLUNIFORMBLOCKBINDINGPROC;
extern var GLAD_GL_VERSION_3_2: c_int;
const PFNGLDRAWELEMENTSBASEVERTEXPROC = ?*const fn (GLenum, GLsizei, GLenum, ?*const anyopaque, GLint) callconv(.C) void;
extern var glad_glDrawElementsBaseVertex: PFNGLDRAWELEMENTSBASEVERTEXPROC;
const PFNGLDRAWRANGEELEMENTSBASEVERTEXPROC = ?*const fn (GLenum, GLuint, GLuint, GLsizei, GLenum, ?*const anyopaque, GLint) callconv(.C) void;
extern var glad_glDrawRangeElementsBaseVertex: PFNGLDRAWRANGEELEMENTSBASEVERTEXPROC;
const PFNGLDRAWELEMENTSINSTANCEDBASEVERTEXPROC = ?*const fn (GLenum, GLsizei, GLenum, ?*const anyopaque, GLsizei, GLint) callconv(.C) void;
extern var glad_glDrawElementsInstancedBaseVertex: PFNGLDRAWELEMENTSINSTANCEDBASEVERTEXPROC;
const PFNGLMULTIDRAWELEMENTSBASEVERTEXPROC = ?*const fn (GLenum, [*c]const GLsizei, GLenum, [*c]const ?*const anyopaque, GLsizei, [*c]const GLint) callconv(.C) void;
extern var glad_glMultiDrawElementsBaseVertex: PFNGLMULTIDRAWELEMENTSBASEVERTEXPROC;
const PFNGLPROVOKINGVERTEXPROC = ?*const fn (GLenum) callconv(.C) void;
extern var glad_glProvokingVertex: PFNGLPROVOKINGVERTEXPROC;
const PFNGLFENCESYNCPROC = ?*const fn (GLenum, GLbitfield) callconv(.C) GLsync;
extern var glad_glFenceSync: PFNGLFENCESYNCPROC;
const PFNGLISSYNCPROC = ?*const fn (GLsync) callconv(.C) GLboolean;
extern var glad_glIsSync: PFNGLISSYNCPROC;
const PFNGLDELETESYNCPROC = ?*const fn (GLsync) callconv(.C) void;
extern var glad_glDeleteSync: PFNGLDELETESYNCPROC;
const PFNGLCLIENTWAITSYNCPROC = ?*const fn (GLsync, GLbitfield, GLuint64) callconv(.C) GLenum;
extern var glad_glClientWaitSync: PFNGLCLIENTWAITSYNCPROC;
const PFNGLWAITSYNCPROC = ?*const fn (GLsync, GLbitfield, GLuint64) callconv(.C) void;
extern var glad_glWaitSync: PFNGLWAITSYNCPROC;
const PFNGLGETINTEGER64VPROC = ?*const fn (GLenum, [*c]GLint64) callconv(.C) void;
extern var glad_glGetInteger64v: PFNGLGETINTEGER64VPROC;
const PFNGLGETSYNCIVPROC = ?*const fn (GLsync, GLenum, GLsizei, [*c]GLsizei, [*c]GLint) callconv(.C) void;
extern var glad_glGetSynciv: PFNGLGETSYNCIVPROC;
const PFNGLGETINTEGER64I_VPROC = ?*const fn (GLenum, GLuint, [*c]GLint64) callconv(.C) void;
extern var glad_glGetInteger64i_v: PFNGLGETINTEGER64I_VPROC;
const PFNGLGETBUFFERPARAMETERI64VPROC = ?*const fn (GLenum, GLenum, [*c]GLint64) callconv(.C) void;
extern var glad_glGetBufferParameteri64v: PFNGLGETBUFFERPARAMETERI64VPROC;
const PFNGLFRAMEBUFFERTEXTUREPROC = ?*const fn (GLenum, GLenum, GLuint, GLint) callconv(.C) void;
extern var glad_glFramebufferTexture: PFNGLFRAMEBUFFERTEXTUREPROC;
const PFNGLTEXIMAGE2DMULTISAMPLEPROC = ?*const fn (GLenum, GLsizei, GLenum, GLsizei, GLsizei, GLboolean) callconv(.C) void;
extern var glad_glTexImage2DMultisample: PFNGLTEXIMAGE2DMULTISAMPLEPROC;
const PFNGLTEXIMAGE3DMULTISAMPLEPROC = ?*const fn (GLenum, GLsizei, GLenum, GLsizei, GLsizei, GLsizei, GLboolean) callconv(.C) void;
extern var glad_glTexImage3DMultisample: PFNGLTEXIMAGE3DMULTISAMPLEPROC;
const PFNGLGETMULTISAMPLEFVPROC = ?*const fn (GLenum, GLuint, [*c]GLfloat) callconv(.C) void;
extern var glad_glGetMultisamplefv: PFNGLGETMULTISAMPLEFVPROC;
const PFNGLSAMPLEMASKIPROC = ?*const fn (GLuint, GLbitfield) callconv(.C) void;
extern var glad_glSampleMaski: PFNGLSAMPLEMASKIPROC;
extern var GLAD_GL_VERSION_3_3: c_int;
const PFNGLBINDFRAGDATALOCATIONINDEXEDPROC = ?*const fn (GLuint, GLuint, GLuint, [*c]const GLchar) callconv(.C) void;
extern var glad_glBindFragDataLocationIndexed: PFNGLBINDFRAGDATALOCATIONINDEXEDPROC;
const PFNGLGETFRAGDATAINDEXPROC = ?*const fn (GLuint, [*c]const GLchar) callconv(.C) GLint;
extern var glad_glGetFragDataIndex: PFNGLGETFRAGDATAINDEXPROC;
const PFNGLGENSAMPLERSPROC = ?*const fn (GLsizei, [*c]GLuint) callconv(.C) void;
extern var glad_glGenSamplers: PFNGLGENSAMPLERSPROC;
const PFNGLDELETESAMPLERSPROC = ?*const fn (GLsizei, [*c]const GLuint) callconv(.C) void;
extern var glad_glDeleteSamplers: PFNGLDELETESAMPLERSPROC;
const PFNGLISSAMPLERPROC = ?*const fn (GLuint) callconv(.C) GLboolean;
extern var glad_glIsSampler: PFNGLISSAMPLERPROC;
const PFNGLBINDSAMPLERPROC = ?*const fn (GLuint, GLuint) callconv(.C) void;
extern var glad_glBindSampler: PFNGLBINDSAMPLERPROC;
const PFNGLSAMPLERPARAMETERIPROC = ?*const fn (GLuint, GLenum, GLint) callconv(.C) void;
extern var glad_glSamplerParameteri: PFNGLSAMPLERPARAMETERIPROC;
const PFNGLSAMPLERPARAMETERIVPROC = ?*const fn (GLuint, GLenum, [*c]const GLint) callconv(.C) void;
extern var glad_glSamplerParameteriv: PFNGLSAMPLERPARAMETERIVPROC;
const PFNGLSAMPLERPARAMETERFPROC = ?*const fn (GLuint, GLenum, GLfloat) callconv(.C) void;
extern var glad_glSamplerParameterf: PFNGLSAMPLERPARAMETERFPROC;
const PFNGLSAMPLERPARAMETERFVPROC = ?*const fn (GLuint, GLenum, [*c]const GLfloat) callconv(.C) void;
extern var glad_glSamplerParameterfv: PFNGLSAMPLERPARAMETERFVPROC;
const PFNGLSAMPLERPARAMETERIIVPROC = ?*const fn (GLuint, GLenum, [*c]const GLint) callconv(.C) void;
extern var glad_glSamplerParameterIiv: PFNGLSAMPLERPARAMETERIIVPROC;
const PFNGLSAMPLERPARAMETERIUIVPROC = ?*const fn (GLuint, GLenum, [*c]const GLuint) callconv(.C) void;
extern var glad_glSamplerParameterIuiv: PFNGLSAMPLERPARAMETERIUIVPROC;
const PFNGLGETSAMPLERPARAMETERIVPROC = ?*const fn (GLuint, GLenum, [*c]GLint) callconv(.C) void;
extern var glad_glGetSamplerParameteriv: PFNGLGETSAMPLERPARAMETERIVPROC;
const PFNGLGETSAMPLERPARAMETERIIVPROC = ?*const fn (GLuint, GLenum, [*c]GLint) callconv(.C) void;
extern var glad_glGetSamplerParameterIiv: PFNGLGETSAMPLERPARAMETERIIVPROC;
const PFNGLGETSAMPLERPARAMETERFVPROC = ?*const fn (GLuint, GLenum, [*c]GLfloat) callconv(.C) void;
extern var glad_glGetSamplerParameterfv: PFNGLGETSAMPLERPARAMETERFVPROC;
const PFNGLGETSAMPLERPARAMETERIUIVPROC = ?*const fn (GLuint, GLenum, [*c]GLuint) callconv(.C) void;
extern var glad_glGetSamplerParameterIuiv: PFNGLGETSAMPLERPARAMETERIUIVPROC;
const PFNGLQUERYCOUNTERPROC = ?*const fn (GLuint, GLenum) callconv(.C) void;
extern var glad_glQueryCounter: PFNGLQUERYCOUNTERPROC;
const PFNGLGETQUERYOBJECTI64VPROC = ?*const fn (GLuint, GLenum, [*c]GLint64) callconv(.C) void;
extern var glad_glGetQueryObjecti64v: PFNGLGETQUERYOBJECTI64VPROC;
const PFNGLGETQUERYOBJECTUI64VPROC = ?*const fn (GLuint, GLenum, [*c]GLuint64) callconv(.C) void;
extern var glad_glGetQueryObjectui64v: PFNGLGETQUERYOBJECTUI64VPROC;
const PFNGLVERTEXATTRIBDIVISORPROC = ?*const fn (GLuint, GLuint) callconv(.C) void;
extern var glad_glVertexAttribDivisor: PFNGLVERTEXATTRIBDIVISORPROC;
const PFNGLVERTEXATTRIBP1UIPROC = ?*const fn (GLuint, GLenum, GLboolean, GLuint) callconv(.C) void;
extern var glad_glVertexAttribP1ui: PFNGLVERTEXATTRIBP1UIPROC;
const PFNGLVERTEXATTRIBP1UIVPROC = ?*const fn (GLuint, GLenum, GLboolean, [*c]const GLuint) callconv(.C) void;
extern var glad_glVertexAttribP1uiv: PFNGLVERTEXATTRIBP1UIVPROC;
const PFNGLVERTEXATTRIBP2UIPROC = ?*const fn (GLuint, GLenum, GLboolean, GLuint) callconv(.C) void;
extern var glad_glVertexAttribP2ui: PFNGLVERTEXATTRIBP2UIPROC;
const PFNGLVERTEXATTRIBP2UIVPROC = ?*const fn (GLuint, GLenum, GLboolean, [*c]const GLuint) callconv(.C) void;
extern var glad_glVertexAttribP2uiv: PFNGLVERTEXATTRIBP2UIVPROC;
const PFNGLVERTEXATTRIBP3UIPROC = ?*const fn (GLuint, GLenum, GLboolean, GLuint) callconv(.C) void;
extern var glad_glVertexAttribP3ui: PFNGLVERTEXATTRIBP3UIPROC;
const PFNGLVERTEXATTRIBP3UIVPROC = ?*const fn (GLuint, GLenum, GLboolean, [*c]const GLuint) callconv(.C) void;
extern var glad_glVertexAttribP3uiv: PFNGLVERTEXATTRIBP3UIVPROC;
const PFNGLVERTEXATTRIBP4UIPROC = ?*const fn (GLuint, GLenum, GLboolean, GLuint) callconv(.C) void;
extern var glad_glVertexAttribP4ui: PFNGLVERTEXATTRIBP4UIPROC;
const PFNGLVERTEXATTRIBP4UIVPROC = ?*const fn (GLuint, GLenum, GLboolean, [*c]const GLuint) callconv(.C) void;
extern var glad_glVertexAttribP4uiv: PFNGLVERTEXATTRIBP4UIVPROC;
const PFNGLVERTEXP2UIPROC = ?*const fn (GLenum, GLuint) callconv(.C) void;
extern var glad_glVertexP2ui: PFNGLVERTEXP2UIPROC;
const PFNGLVERTEXP2UIVPROC = ?*const fn (GLenum, [*c]const GLuint) callconv(.C) void;
extern var glad_glVertexP2uiv: PFNGLVERTEXP2UIVPROC;
const PFNGLVERTEXP3UIPROC = ?*const fn (GLenum, GLuint) callconv(.C) void;
extern var glad_glVertexP3ui: PFNGLVERTEXP3UIPROC;
const PFNGLVERTEXP3UIVPROC = ?*const fn (GLenum, [*c]const GLuint) callconv(.C) void;
extern var glad_glVertexP3uiv: PFNGLVERTEXP3UIVPROC;
const PFNGLVERTEXP4UIPROC = ?*const fn (GLenum, GLuint) callconv(.C) void;
extern var glad_glVertexP4ui: PFNGLVERTEXP4UIPROC;
const PFNGLVERTEXP4UIVPROC = ?*const fn (GLenum, [*c]const GLuint) callconv(.C) void;
extern var glad_glVertexP4uiv: PFNGLVERTEXP4UIVPROC;
const PFNGLTEXCOORDP1UIPROC = ?*const fn (GLenum, GLuint) callconv(.C) void;
extern var glad_glTexCoordP1ui: PFNGLTEXCOORDP1UIPROC;
const PFNGLTEXCOORDP1UIVPROC = ?*const fn (GLenum, [*c]const GLuint) callconv(.C) void;
extern var glad_glTexCoordP1uiv: PFNGLTEXCOORDP1UIVPROC;
const PFNGLTEXCOORDP2UIPROC = ?*const fn (GLenum, GLuint) callconv(.C) void;
extern var glad_glTexCoordP2ui: PFNGLTEXCOORDP2UIPROC;
const PFNGLTEXCOORDP2UIVPROC = ?*const fn (GLenum, [*c]const GLuint) callconv(.C) void;
extern var glad_glTexCoordP2uiv: PFNGLTEXCOORDP2UIVPROC;
const PFNGLTEXCOORDP3UIPROC = ?*const fn (GLenum, GLuint) callconv(.C) void;
extern var glad_glTexCoordP3ui: PFNGLTEXCOORDP3UIPROC;
const PFNGLTEXCOORDP3UIVPROC = ?*const fn (GLenum, [*c]const GLuint) callconv(.C) void;
extern var glad_glTexCoordP3uiv: PFNGLTEXCOORDP3UIVPROC;
const PFNGLTEXCOORDP4UIPROC = ?*const fn (GLenum, GLuint) callconv(.C) void;
extern var glad_glTexCoordP4ui: PFNGLTEXCOORDP4UIPROC;
const PFNGLTEXCOORDP4UIVPROC = ?*const fn (GLenum, [*c]const GLuint) callconv(.C) void;
extern var glad_glTexCoordP4uiv: PFNGLTEXCOORDP4UIVPROC;
const PFNGLMULTITEXCOORDP1UIPROC = ?*const fn (GLenum, GLenum, GLuint) callconv(.C) void;
extern var glad_glMultiTexCoordP1ui: PFNGLMULTITEXCOORDP1UIPROC;
const PFNGLMULTITEXCOORDP1UIVPROC = ?*const fn (GLenum, GLenum, [*c]const GLuint) callconv(.C) void;
extern var glad_glMultiTexCoordP1uiv: PFNGLMULTITEXCOORDP1UIVPROC;
const PFNGLMULTITEXCOORDP2UIPROC = ?*const fn (GLenum, GLenum, GLuint) callconv(.C) void;
extern var glad_glMultiTexCoordP2ui: PFNGLMULTITEXCOORDP2UIPROC;
const PFNGLMULTITEXCOORDP2UIVPROC = ?*const fn (GLenum, GLenum, [*c]const GLuint) callconv(.C) void;
extern var glad_glMultiTexCoordP2uiv: PFNGLMULTITEXCOORDP2UIVPROC;
const PFNGLMULTITEXCOORDP3UIPROC = ?*const fn (GLenum, GLenum, GLuint) callconv(.C) void;
extern var glad_glMultiTexCoordP3ui: PFNGLMULTITEXCOORDP3UIPROC;
const PFNGLMULTITEXCOORDP3UIVPROC = ?*const fn (GLenum, GLenum, [*c]const GLuint) callconv(.C) void;
extern var glad_glMultiTexCoordP3uiv: PFNGLMULTITEXCOORDP3UIVPROC;
const PFNGLMULTITEXCOORDP4UIPROC = ?*const fn (GLenum, GLenum, GLuint) callconv(.C) void;
extern var glad_glMultiTexCoordP4ui: PFNGLMULTITEXCOORDP4UIPROC;
const PFNGLMULTITEXCOORDP4UIVPROC = ?*const fn (GLenum, GLenum, [*c]const GLuint) callconv(.C) void;
extern var glad_glMultiTexCoordP4uiv: PFNGLMULTITEXCOORDP4UIVPROC;
const PFNGLNORMALP3UIPROC = ?*const fn (GLenum, GLuint) callconv(.C) void;
extern var glad_glNormalP3ui: PFNGLNORMALP3UIPROC;
const PFNGLNORMALP3UIVPROC = ?*const fn (GLenum, [*c]const GLuint) callconv(.C) void;
extern var glad_glNormalP3uiv: PFNGLNORMALP3UIVPROC;
const PFNGLCOLORP3UIPROC = ?*const fn (GLenum, GLuint) callconv(.C) void;
extern var glad_glColorP3ui: PFNGLCOLORP3UIPROC;
const PFNGLCOLORP3UIVPROC = ?*const fn (GLenum, [*c]const GLuint) callconv(.C) void;
extern var glad_glColorP3uiv: PFNGLCOLORP3UIVPROC;
const PFNGLCOLORP4UIPROC = ?*const fn (GLenum, GLuint) callconv(.C) void;
extern var glad_glColorP4ui: PFNGLCOLORP4UIPROC;
const PFNGLCOLORP4UIVPROC = ?*const fn (GLenum, [*c]const GLuint) callconv(.C) void;
extern var glad_glColorP4uiv: PFNGLCOLORP4UIVPROC;
const PFNGLSECONDARYCOLORP3UIPROC = ?*const fn (GLenum, GLuint) callconv(.C) void;
extern var glad_glSecondaryColorP3ui: PFNGLSECONDARYCOLORP3UIPROC;
const PFNGLSECONDARYCOLORP3UIVPROC = ?*const fn (GLenum, [*c]const GLuint) callconv(.C) void;
extern var glad_glSecondaryColorP3uiv: PFNGLSECONDARYCOLORP3UIVPROC;
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
const UINT32_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0xffffffff, .hex);
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
    _ = &val;
    return (INT_LEAST8_MAX - INT_LEAST8_MAX) + val;
}
inline fn INT16_C(val: anytype) @TypeOf((INT_LEAST16_MAX - INT_LEAST16_MAX) + val) {
    _ = &val;
    return (INT_LEAST16_MAX - INT_LEAST16_MAX) + val;
}
inline fn INT32_C(val: anytype) @TypeOf((INT_LEAST32_MAX - INT_LEAST32_MAX) + val) {
    _ = &val;
    return (INT_LEAST32_MAX - INT_LEAST32_MAX) + val;
}
const INT64_C = @import("std").zig.c_translation.Macros.LL_SUFFIX;
inline fn UINT8_C(val: anytype) @TypeOf(val) {
    _ = &val;
    return val;
}
inline fn UINT16_C(val: anytype) @TypeOf(val) {
    _ = &val;
    return val;
}
const UINT32_C = @import("std").zig.c_translation.Macros.U_SUFFIX;
const UINT64_C = @import("std").zig.c_translation.Macros.ULL_SUFFIX;
const INTMAX_C = @import("std").zig.c_translation.Macros.LL_SUFFIX;
const UINTMAX_C = @import("std").zig.c_translation.Macros.ULL_SUFFIX;
pub const KHRONOS_SUPPORT_INT64 = @as(c_int, 1);
pub const KHRONOS_SUPPORT_FLOAT = @as(c_int, 1);
pub const KHRONOS_MAX_ENUM = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x7FFFFFFF, .hex);
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
pub const GL_POLYGON_OFFSET_FILL = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8037, .hex);
pub const GL_POLYGON_OFFSET_FACTOR = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8038, .hex);
pub const GL_TEXTURE_BINDING_1D = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8068, .hex);
pub const GL_TEXTURE_BINDING_2D = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8069, .hex);
pub const GL_TEXTURE_INTERNAL_FORMAT = @as(c_int, 0x1003);
pub const GL_TEXTURE_RED_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x805C, .hex);
pub const GL_TEXTURE_GREEN_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x805D, .hex);
pub const GL_TEXTURE_BLUE_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x805E, .hex);
pub const GL_TEXTURE_ALPHA_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x805F, .hex);
pub const GL_DOUBLE = @as(c_int, 0x140A);
pub const GL_PROXY_TEXTURE_1D = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8063, .hex);
pub const GL_PROXY_TEXTURE_2D = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8064, .hex);
pub const GL_R3_G3_B2 = @as(c_int, 0x2A10);
pub const GL_RGB4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x804F, .hex);
pub const GL_RGB5 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8050, .hex);
pub const GL_RGB8 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8051, .hex);
pub const GL_RGB10 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8052, .hex);
pub const GL_RGB12 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8053, .hex);
pub const GL_RGB16 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8054, .hex);
pub const GL_RGBA2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8055, .hex);
pub const GL_RGBA4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8056, .hex);
pub const GL_RGB5_A1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8057, .hex);
pub const GL_RGBA8 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8058, .hex);
pub const GL_RGB10_A2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8059, .hex);
pub const GL_RGBA12 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x805A, .hex);
pub const GL_RGBA16 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x805B, .hex);
pub const GL_UNSIGNED_BYTE_3_3_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8032, .hex);
pub const GL_UNSIGNED_SHORT_4_4_4_4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8033, .hex);
pub const GL_UNSIGNED_SHORT_5_5_5_1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8034, .hex);
pub const GL_UNSIGNED_INT_8_8_8_8 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8035, .hex);
pub const GL_UNSIGNED_INT_10_10_10_2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8036, .hex);
pub const GL_TEXTURE_BINDING_3D = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x806A, .hex);
pub const GL_PACK_SKIP_IMAGES = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x806B, .hex);
pub const GL_PACK_IMAGE_HEIGHT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x806C, .hex);
pub const GL_UNPACK_SKIP_IMAGES = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x806D, .hex);
pub const GL_UNPACK_IMAGE_HEIGHT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x806E, .hex);
pub const GL_TEXTURE_3D = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x806F, .hex);
pub const GL_PROXY_TEXTURE_3D = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8070, .hex);
pub const GL_TEXTURE_DEPTH = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8071, .hex);
pub const GL_TEXTURE_WRAP_R = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8072, .hex);
pub const GL_MAX_3D_TEXTURE_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8073, .hex);
pub const GL_UNSIGNED_BYTE_2_3_3_REV = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8362, .hex);
pub const GL_UNSIGNED_SHORT_5_6_5 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8363, .hex);
pub const GL_UNSIGNED_SHORT_5_6_5_REV = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8364, .hex);
pub const GL_UNSIGNED_SHORT_4_4_4_4_REV = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8365, .hex);
pub const GL_UNSIGNED_SHORT_1_5_5_5_REV = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8366, .hex);
pub const GL_UNSIGNED_INT_8_8_8_8_REV = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8367, .hex);
pub const GL_UNSIGNED_INT_2_10_10_10_REV = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8368, .hex);
pub const GL_BGR = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80E0, .hex);
pub const GL_BGRA = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80E1, .hex);
pub const GL_MAX_ELEMENTS_VERTICES = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80E8, .hex);
pub const GL_MAX_ELEMENTS_INDICES = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80E9, .hex);
pub const GL_CLAMP_TO_EDGE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x812F, .hex);
pub const GL_TEXTURE_MIN_LOD = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x813A, .hex);
pub const GL_TEXTURE_MAX_LOD = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x813B, .hex);
pub const GL_TEXTURE_BASE_LEVEL = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x813C, .hex);
pub const GL_TEXTURE_MAX_LEVEL = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x813D, .hex);
pub const GL_SMOOTH_POINT_SIZE_RANGE = @as(c_int, 0x0B12);
pub const GL_SMOOTH_POINT_SIZE_GRANULARITY = @as(c_int, 0x0B13);
pub const GL_SMOOTH_LINE_WIDTH_RANGE = @as(c_int, 0x0B22);
pub const GL_SMOOTH_LINE_WIDTH_GRANULARITY = @as(c_int, 0x0B23);
pub const GL_ALIASED_LINE_WIDTH_RANGE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x846E, .hex);
pub const GL_TEXTURE0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84C0, .hex);
pub const GL_TEXTURE1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84C1, .hex);
pub const GL_TEXTURE2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84C2, .hex);
pub const GL_TEXTURE3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84C3, .hex);
pub const GL_TEXTURE4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84C4, .hex);
pub const GL_TEXTURE5 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84C5, .hex);
pub const GL_TEXTURE6 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84C6, .hex);
pub const GL_TEXTURE7 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84C7, .hex);
pub const GL_TEXTURE8 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84C8, .hex);
pub const GL_TEXTURE9 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84C9, .hex);
pub const GL_TEXTURE10 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84CA, .hex);
pub const GL_TEXTURE11 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84CB, .hex);
pub const GL_TEXTURE12 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84CC, .hex);
pub const GL_TEXTURE13 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84CD, .hex);
pub const GL_TEXTURE14 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84CE, .hex);
pub const GL_TEXTURE15 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84CF, .hex);
pub const GL_TEXTURE16 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84D0, .hex);
pub const GL_TEXTURE17 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84D1, .hex);
pub const GL_TEXTURE18 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84D2, .hex);
pub const GL_TEXTURE19 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84D3, .hex);
pub const GL_TEXTURE20 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84D4, .hex);
pub const GL_TEXTURE21 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84D5, .hex);
pub const GL_TEXTURE22 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84D6, .hex);
pub const GL_TEXTURE23 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84D7, .hex);
pub const GL_TEXTURE24 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84D8, .hex);
pub const GL_TEXTURE25 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84D9, .hex);
pub const GL_TEXTURE26 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84DA, .hex);
pub const GL_TEXTURE27 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84DB, .hex);
pub const GL_TEXTURE28 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84DC, .hex);
pub const GL_TEXTURE29 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84DD, .hex);
pub const GL_TEXTURE30 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84DE, .hex);
pub const GL_TEXTURE31 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84DF, .hex);
pub const GL_ACTIVE_TEXTURE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84E0, .hex);
pub const GL_MULTISAMPLE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x809D, .hex);
pub const GL_SAMPLE_ALPHA_TO_COVERAGE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x809E, .hex);
pub const GL_SAMPLE_ALPHA_TO_ONE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x809F, .hex);
pub const GL_SAMPLE_COVERAGE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80A0, .hex);
pub const GL_SAMPLE_BUFFERS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80A8, .hex);
pub const GL_SAMPLES = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80A9, .hex);
pub const GL_SAMPLE_COVERAGE_VALUE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80AA, .hex);
pub const GL_SAMPLE_COVERAGE_INVERT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80AB, .hex);
pub const GL_TEXTURE_CUBE_MAP = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8513, .hex);
pub const GL_TEXTURE_BINDING_CUBE_MAP = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8514, .hex);
pub const GL_TEXTURE_CUBE_MAP_POSITIVE_X = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8515, .hex);
pub const GL_TEXTURE_CUBE_MAP_NEGATIVE_X = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8516, .hex);
pub const GL_TEXTURE_CUBE_MAP_POSITIVE_Y = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8517, .hex);
pub const GL_TEXTURE_CUBE_MAP_NEGATIVE_Y = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8518, .hex);
pub const GL_TEXTURE_CUBE_MAP_POSITIVE_Z = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8519, .hex);
pub const GL_TEXTURE_CUBE_MAP_NEGATIVE_Z = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x851A, .hex);
pub const GL_PROXY_TEXTURE_CUBE_MAP = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x851B, .hex);
pub const GL_MAX_CUBE_MAP_TEXTURE_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x851C, .hex);
pub const GL_COMPRESSED_RGB = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84ED, .hex);
pub const GL_COMPRESSED_RGBA = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84EE, .hex);
pub const GL_TEXTURE_COMPRESSION_HINT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84EF, .hex);
pub const GL_TEXTURE_COMPRESSED_IMAGE_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x86A0, .hex);
pub const GL_TEXTURE_COMPRESSED = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x86A1, .hex);
pub const GL_NUM_COMPRESSED_TEXTURE_FORMATS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x86A2, .hex);
pub const GL_COMPRESSED_TEXTURE_FORMATS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x86A3, .hex);
pub const GL_CLAMP_TO_BORDER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x812D, .hex);
pub const GL_BLEND_DST_RGB = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80C8, .hex);
pub const GL_BLEND_SRC_RGB = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80C9, .hex);
pub const GL_BLEND_DST_ALPHA = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80CA, .hex);
pub const GL_BLEND_SRC_ALPHA = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80CB, .hex);
pub const GL_POINT_FADE_THRESHOLD_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8128, .hex);
pub const GL_DEPTH_COMPONENT16 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x81A5, .hex);
pub const GL_DEPTH_COMPONENT24 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x81A6, .hex);
pub const GL_DEPTH_COMPONENT32 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x81A7, .hex);
pub const GL_MIRRORED_REPEAT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8370, .hex);
pub const GL_MAX_TEXTURE_LOD_BIAS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84FD, .hex);
pub const GL_TEXTURE_LOD_BIAS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8501, .hex);
pub const GL_INCR_WRAP = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8507, .hex);
pub const GL_DECR_WRAP = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8508, .hex);
pub const GL_TEXTURE_DEPTH_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x884A, .hex);
pub const GL_TEXTURE_COMPARE_MODE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x884C, .hex);
pub const GL_TEXTURE_COMPARE_FUNC = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x884D, .hex);
pub const GL_BLEND_COLOR = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8005, .hex);
pub const GL_BLEND_EQUATION = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8009, .hex);
pub const GL_CONSTANT_COLOR = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8001, .hex);
pub const GL_ONE_MINUS_CONSTANT_COLOR = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8002, .hex);
pub const GL_CONSTANT_ALPHA = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8003, .hex);
pub const GL_ONE_MINUS_CONSTANT_ALPHA = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8004, .hex);
pub const GL_FUNC_ADD = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8006, .hex);
pub const GL_FUNC_REVERSE_SUBTRACT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x800B, .hex);
pub const GL_FUNC_SUBTRACT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x800A, .hex);
pub const GL_MIN = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8007, .hex);
pub const GL_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8008, .hex);
pub const GL_BUFFER_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8764, .hex);
pub const GL_BUFFER_USAGE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8765, .hex);
pub const GL_QUERY_COUNTER_BITS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8864, .hex);
pub const GL_CURRENT_QUERY = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8865, .hex);
pub const GL_QUERY_RESULT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8866, .hex);
pub const GL_QUERY_RESULT_AVAILABLE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8867, .hex);
pub const GL_ARRAY_BUFFER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8892, .hex);
pub const GL_ELEMENT_ARRAY_BUFFER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8893, .hex);
pub const GL_ARRAY_BUFFER_BINDING = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8894, .hex);
pub const GL_ELEMENT_ARRAY_BUFFER_BINDING = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8895, .hex);
pub const GL_VERTEX_ATTRIB_ARRAY_BUFFER_BINDING = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x889F, .hex);
pub const GL_READ_ONLY = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x88B8, .hex);
pub const GL_WRITE_ONLY = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x88B9, .hex);
pub const GL_READ_WRITE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x88BA, .hex);
pub const GL_BUFFER_ACCESS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x88BB, .hex);
pub const GL_BUFFER_MAPPED = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x88BC, .hex);
pub const GL_BUFFER_MAP_POINTER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x88BD, .hex);
pub const GL_STREAM_DRAW = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x88E0, .hex);
pub const GL_STREAM_READ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x88E1, .hex);
pub const GL_STREAM_COPY = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x88E2, .hex);
pub const GL_STATIC_DRAW = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x88E4, .hex);
pub const GL_STATIC_READ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x88E5, .hex);
pub const GL_STATIC_COPY = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x88E6, .hex);
pub const GL_DYNAMIC_DRAW = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x88E8, .hex);
pub const GL_DYNAMIC_READ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x88E9, .hex);
pub const GL_DYNAMIC_COPY = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x88EA, .hex);
pub const GL_SAMPLES_PASSED = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8914, .hex);
pub const GL_SRC1_ALPHA = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8589, .hex);
pub const GL_BLEND_EQUATION_RGB = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8009, .hex);
pub const GL_VERTEX_ATTRIB_ARRAY_ENABLED = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8622, .hex);
pub const GL_VERTEX_ATTRIB_ARRAY_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8623, .hex);
pub const GL_VERTEX_ATTRIB_ARRAY_STRIDE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8624, .hex);
pub const GL_VERTEX_ATTRIB_ARRAY_TYPE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8625, .hex);
pub const GL_CURRENT_VERTEX_ATTRIB = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8626, .hex);
pub const GL_VERTEX_PROGRAM_POINT_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8642, .hex);
pub const GL_VERTEX_ATTRIB_ARRAY_POINTER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8645, .hex);
pub const GL_STENCIL_BACK_FUNC = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8800, .hex);
pub const GL_STENCIL_BACK_FAIL = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8801, .hex);
pub const GL_STENCIL_BACK_PASS_DEPTH_FAIL = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8802, .hex);
pub const GL_STENCIL_BACK_PASS_DEPTH_PASS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8803, .hex);
pub const GL_MAX_DRAW_BUFFERS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8824, .hex);
pub const GL_DRAW_BUFFER0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8825, .hex);
pub const GL_DRAW_BUFFER1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8826, .hex);
pub const GL_DRAW_BUFFER2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8827, .hex);
pub const GL_DRAW_BUFFER3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8828, .hex);
pub const GL_DRAW_BUFFER4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8829, .hex);
pub const GL_DRAW_BUFFER5 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x882A, .hex);
pub const GL_DRAW_BUFFER6 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x882B, .hex);
pub const GL_DRAW_BUFFER7 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x882C, .hex);
pub const GL_DRAW_BUFFER8 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x882D, .hex);
pub const GL_DRAW_BUFFER9 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x882E, .hex);
pub const GL_DRAW_BUFFER10 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x882F, .hex);
pub const GL_DRAW_BUFFER11 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8830, .hex);
pub const GL_DRAW_BUFFER12 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8831, .hex);
pub const GL_DRAW_BUFFER13 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8832, .hex);
pub const GL_DRAW_BUFFER14 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8833, .hex);
pub const GL_DRAW_BUFFER15 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8834, .hex);
pub const GL_BLEND_EQUATION_ALPHA = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x883D, .hex);
pub const GL_MAX_VERTEX_ATTRIBS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8869, .hex);
pub const GL_VERTEX_ATTRIB_ARRAY_NORMALIZED = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x886A, .hex);
pub const GL_MAX_TEXTURE_IMAGE_UNITS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8872, .hex);
pub const GL_FRAGMENT_SHADER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B30, .hex);
pub const GL_VERTEX_SHADER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B31, .hex);
pub const GL_MAX_FRAGMENT_UNIFORM_COMPONENTS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B49, .hex);
pub const GL_MAX_VERTEX_UNIFORM_COMPONENTS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B4A, .hex);
pub const GL_MAX_VARYING_FLOATS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B4B, .hex);
pub const GL_MAX_VERTEX_TEXTURE_IMAGE_UNITS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B4C, .hex);
pub const GL_MAX_COMBINED_TEXTURE_IMAGE_UNITS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B4D, .hex);
pub const GL_SHADER_TYPE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B4F, .hex);
pub const GL_FLOAT_VEC2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B50, .hex);
pub const GL_FLOAT_VEC3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B51, .hex);
pub const GL_FLOAT_VEC4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B52, .hex);
pub const GL_INT_VEC2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B53, .hex);
pub const GL_INT_VEC3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B54, .hex);
pub const GL_INT_VEC4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B55, .hex);
pub const GL_BOOL = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B56, .hex);
pub const GL_BOOL_VEC2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B57, .hex);
pub const GL_BOOL_VEC3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B58, .hex);
pub const GL_BOOL_VEC4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B59, .hex);
pub const GL_FLOAT_MAT2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B5A, .hex);
pub const GL_FLOAT_MAT3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B5B, .hex);
pub const GL_FLOAT_MAT4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B5C, .hex);
pub const GL_SAMPLER_1D = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B5D, .hex);
pub const GL_SAMPLER_2D = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B5E, .hex);
pub const GL_SAMPLER_3D = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B5F, .hex);
pub const GL_SAMPLER_CUBE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B60, .hex);
pub const GL_SAMPLER_1D_SHADOW = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B61, .hex);
pub const GL_SAMPLER_2D_SHADOW = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B62, .hex);
pub const GL_DELETE_STATUS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B80, .hex);
pub const GL_COMPILE_STATUS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B81, .hex);
pub const GL_LINK_STATUS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B82, .hex);
pub const GL_VALIDATE_STATUS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B83, .hex);
pub const GL_INFO_LOG_LENGTH = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B84, .hex);
pub const GL_ATTACHED_SHADERS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B85, .hex);
pub const GL_ACTIVE_UNIFORMS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B86, .hex);
pub const GL_ACTIVE_UNIFORM_MAX_LENGTH = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B87, .hex);
pub const GL_SHADER_SOURCE_LENGTH = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B88, .hex);
pub const GL_ACTIVE_ATTRIBUTES = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B89, .hex);
pub const GL_ACTIVE_ATTRIBUTE_MAX_LENGTH = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B8A, .hex);
pub const GL_FRAGMENT_SHADER_DERIVATIVE_HINT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B8B, .hex);
pub const GL_SHADING_LANGUAGE_VERSION = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B8C, .hex);
pub const GL_CURRENT_PROGRAM = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B8D, .hex);
pub const GL_POINT_SPRITE_COORD_ORIGIN = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CA0, .hex);
pub const GL_LOWER_LEFT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CA1, .hex);
pub const GL_UPPER_LEFT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CA2, .hex);
pub const GL_STENCIL_BACK_REF = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CA3, .hex);
pub const GL_STENCIL_BACK_VALUE_MASK = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CA4, .hex);
pub const GL_STENCIL_BACK_WRITEMASK = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CA5, .hex);
pub const GL_PIXEL_PACK_BUFFER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x88EB, .hex);
pub const GL_PIXEL_UNPACK_BUFFER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x88EC, .hex);
pub const GL_PIXEL_PACK_BUFFER_BINDING = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x88ED, .hex);
pub const GL_PIXEL_UNPACK_BUFFER_BINDING = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x88EF, .hex);
pub const GL_FLOAT_MAT2x3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B65, .hex);
pub const GL_FLOAT_MAT2x4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B66, .hex);
pub const GL_FLOAT_MAT3x2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B67, .hex);
pub const GL_FLOAT_MAT3x4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B68, .hex);
pub const GL_FLOAT_MAT4x2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B69, .hex);
pub const GL_FLOAT_MAT4x3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B6A, .hex);
pub const GL_SRGB = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C40, .hex);
pub const GL_SRGB8 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C41, .hex);
pub const GL_SRGB_ALPHA = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C42, .hex);
pub const GL_SRGB8_ALPHA8 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C43, .hex);
pub const GL_COMPRESSED_SRGB = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C48, .hex);
pub const GL_COMPRESSED_SRGB_ALPHA = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C49, .hex);
pub const GL_COMPARE_REF_TO_TEXTURE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x884E, .hex);
pub const GL_CLIP_DISTANCE0 = @as(c_int, 0x3000);
pub const GL_CLIP_DISTANCE1 = @as(c_int, 0x3001);
pub const GL_CLIP_DISTANCE2 = @as(c_int, 0x3002);
pub const GL_CLIP_DISTANCE3 = @as(c_int, 0x3003);
pub const GL_CLIP_DISTANCE4 = @as(c_int, 0x3004);
pub const GL_CLIP_DISTANCE5 = @as(c_int, 0x3005);
pub const GL_CLIP_DISTANCE6 = @as(c_int, 0x3006);
pub const GL_CLIP_DISTANCE7 = @as(c_int, 0x3007);
pub const GL_MAX_CLIP_DISTANCES = @as(c_int, 0x0D32);
pub const GL_MAJOR_VERSION = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x821B, .hex);
pub const GL_MINOR_VERSION = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x821C, .hex);
pub const GL_NUM_EXTENSIONS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x821D, .hex);
pub const GL_CONTEXT_FLAGS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x821E, .hex);
pub const GL_COMPRESSED_RED = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8225, .hex);
pub const GL_COMPRESSED_RG = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8226, .hex);
pub const GL_CONTEXT_FLAG_FORWARD_COMPATIBLE_BIT = @as(c_int, 0x00000001);
pub const GL_RGBA32F = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8814, .hex);
pub const GL_RGB32F = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8815, .hex);
pub const GL_RGBA16F = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x881A, .hex);
pub const GL_RGB16F = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x881B, .hex);
pub const GL_VERTEX_ATTRIB_ARRAY_INTEGER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x88FD, .hex);
pub const GL_MAX_ARRAY_TEXTURE_LAYERS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x88FF, .hex);
pub const GL_MIN_PROGRAM_TEXEL_OFFSET = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8904, .hex);
pub const GL_MAX_PROGRAM_TEXEL_OFFSET = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8905, .hex);
pub const GL_CLAMP_READ_COLOR = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x891C, .hex);
pub const GL_FIXED_ONLY = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x891D, .hex);
pub const GL_MAX_VARYING_COMPONENTS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B4B, .hex);
pub const GL_TEXTURE_1D_ARRAY = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C18, .hex);
pub const GL_PROXY_TEXTURE_1D_ARRAY = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C19, .hex);
pub const GL_TEXTURE_2D_ARRAY = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C1A, .hex);
pub const GL_PROXY_TEXTURE_2D_ARRAY = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C1B, .hex);
pub const GL_TEXTURE_BINDING_1D_ARRAY = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C1C, .hex);
pub const GL_TEXTURE_BINDING_2D_ARRAY = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C1D, .hex);
pub const GL_R11F_G11F_B10F = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C3A, .hex);
pub const GL_UNSIGNED_INT_10F_11F_11F_REV = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C3B, .hex);
pub const GL_RGB9_E5 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C3D, .hex);
pub const GL_UNSIGNED_INT_5_9_9_9_REV = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C3E, .hex);
pub const GL_TEXTURE_SHARED_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C3F, .hex);
pub const GL_TRANSFORM_FEEDBACK_VARYING_MAX_LENGTH = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C76, .hex);
pub const GL_TRANSFORM_FEEDBACK_BUFFER_MODE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C7F, .hex);
pub const GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_COMPONENTS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C80, .hex);
pub const GL_TRANSFORM_FEEDBACK_VARYINGS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C83, .hex);
pub const GL_TRANSFORM_FEEDBACK_BUFFER_START = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C84, .hex);
pub const GL_TRANSFORM_FEEDBACK_BUFFER_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C85, .hex);
pub const GL_PRIMITIVES_GENERATED = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C87, .hex);
pub const GL_TRANSFORM_FEEDBACK_PRIMITIVES_WRITTEN = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C88, .hex);
pub const GL_RASTERIZER_DISCARD = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C89, .hex);
pub const GL_MAX_TRANSFORM_FEEDBACK_INTERLEAVED_COMPONENTS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C8A, .hex);
pub const GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_ATTRIBS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C8B, .hex);
pub const GL_INTERLEAVED_ATTRIBS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C8C, .hex);
pub const GL_SEPARATE_ATTRIBS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C8D, .hex);
pub const GL_TRANSFORM_FEEDBACK_BUFFER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C8E, .hex);
pub const GL_TRANSFORM_FEEDBACK_BUFFER_BINDING = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C8F, .hex);
pub const GL_RGBA32UI = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8D70, .hex);
pub const GL_RGB32UI = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8D71, .hex);
pub const GL_RGBA16UI = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8D76, .hex);
pub const GL_RGB16UI = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8D77, .hex);
pub const GL_RGBA8UI = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8D7C, .hex);
pub const GL_RGB8UI = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8D7D, .hex);
pub const GL_RGBA32I = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8D82, .hex);
pub const GL_RGB32I = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8D83, .hex);
pub const GL_RGBA16I = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8D88, .hex);
pub const GL_RGB16I = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8D89, .hex);
pub const GL_RGBA8I = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8D8E, .hex);
pub const GL_RGB8I = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8D8F, .hex);
pub const GL_RED_INTEGER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8D94, .hex);
pub const GL_GREEN_INTEGER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8D95, .hex);
pub const GL_BLUE_INTEGER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8D96, .hex);
pub const GL_RGB_INTEGER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8D98, .hex);
pub const GL_RGBA_INTEGER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8D99, .hex);
pub const GL_BGR_INTEGER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8D9A, .hex);
pub const GL_BGRA_INTEGER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8D9B, .hex);
pub const GL_SAMPLER_1D_ARRAY = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8DC0, .hex);
pub const GL_SAMPLER_2D_ARRAY = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8DC1, .hex);
pub const GL_SAMPLER_1D_ARRAY_SHADOW = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8DC3, .hex);
pub const GL_SAMPLER_2D_ARRAY_SHADOW = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8DC4, .hex);
pub const GL_SAMPLER_CUBE_SHADOW = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8DC5, .hex);
pub const GL_UNSIGNED_INT_VEC2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8DC6, .hex);
pub const GL_UNSIGNED_INT_VEC3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8DC7, .hex);
pub const GL_UNSIGNED_INT_VEC4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8DC8, .hex);
pub const GL_INT_SAMPLER_1D = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8DC9, .hex);
pub const GL_INT_SAMPLER_2D = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8DCA, .hex);
pub const GL_INT_SAMPLER_3D = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8DCB, .hex);
pub const GL_INT_SAMPLER_CUBE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8DCC, .hex);
pub const GL_INT_SAMPLER_1D_ARRAY = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8DCE, .hex);
pub const GL_INT_SAMPLER_2D_ARRAY = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8DCF, .hex);
pub const GL_UNSIGNED_INT_SAMPLER_1D = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8DD1, .hex);
pub const GL_UNSIGNED_INT_SAMPLER_2D = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8DD2, .hex);
pub const GL_UNSIGNED_INT_SAMPLER_3D = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8DD3, .hex);
pub const GL_UNSIGNED_INT_SAMPLER_CUBE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8DD4, .hex);
pub const GL_UNSIGNED_INT_SAMPLER_1D_ARRAY = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8DD6, .hex);
pub const GL_UNSIGNED_INT_SAMPLER_2D_ARRAY = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8DD7, .hex);
pub const GL_QUERY_WAIT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8E13, .hex);
pub const GL_QUERY_NO_WAIT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8E14, .hex);
pub const GL_QUERY_BY_REGION_WAIT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8E15, .hex);
pub const GL_QUERY_BY_REGION_NO_WAIT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8E16, .hex);
pub const GL_BUFFER_ACCESS_FLAGS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x911F, .hex);
pub const GL_BUFFER_MAP_LENGTH = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x9120, .hex);
pub const GL_BUFFER_MAP_OFFSET = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x9121, .hex);
pub const GL_DEPTH_COMPONENT32F = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CAC, .hex);
pub const GL_DEPTH32F_STENCIL8 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CAD, .hex);
pub const GL_FLOAT_32_UNSIGNED_INT_24_8_REV = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8DAD, .hex);
pub const GL_INVALID_FRAMEBUFFER_OPERATION = @as(c_int, 0x0506);
pub const GL_FRAMEBUFFER_ATTACHMENT_COLOR_ENCODING = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8210, .hex);
pub const GL_FRAMEBUFFER_ATTACHMENT_COMPONENT_TYPE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8211, .hex);
pub const GL_FRAMEBUFFER_ATTACHMENT_RED_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8212, .hex);
pub const GL_FRAMEBUFFER_ATTACHMENT_GREEN_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8213, .hex);
pub const GL_FRAMEBUFFER_ATTACHMENT_BLUE_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8214, .hex);
pub const GL_FRAMEBUFFER_ATTACHMENT_ALPHA_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8215, .hex);
pub const GL_FRAMEBUFFER_ATTACHMENT_DEPTH_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8216, .hex);
pub const GL_FRAMEBUFFER_ATTACHMENT_STENCIL_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8217, .hex);
pub const GL_FRAMEBUFFER_DEFAULT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8218, .hex);
pub const GL_FRAMEBUFFER_UNDEFINED = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8219, .hex);
pub const GL_DEPTH_STENCIL_ATTACHMENT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x821A, .hex);
pub const GL_MAX_RENDERBUFFER_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84E8, .hex);
pub const GL_DEPTH_STENCIL = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84F9, .hex);
pub const GL_UNSIGNED_INT_24_8 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84FA, .hex);
pub const GL_DEPTH24_STENCIL8 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x88F0, .hex);
pub const GL_TEXTURE_STENCIL_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x88F1, .hex);
pub const GL_TEXTURE_RED_TYPE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C10, .hex);
pub const GL_TEXTURE_GREEN_TYPE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C11, .hex);
pub const GL_TEXTURE_BLUE_TYPE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C12, .hex);
pub const GL_TEXTURE_ALPHA_TYPE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C13, .hex);
pub const GL_TEXTURE_DEPTH_TYPE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C16, .hex);
pub const GL_UNSIGNED_NORMALIZED = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C17, .hex);
pub const GL_FRAMEBUFFER_BINDING = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CA6, .hex);
pub const GL_DRAW_FRAMEBUFFER_BINDING = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CA6, .hex);
pub const GL_RENDERBUFFER_BINDING = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CA7, .hex);
pub const GL_READ_FRAMEBUFFER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CA8, .hex);
pub const GL_DRAW_FRAMEBUFFER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CA9, .hex);
pub const GL_READ_FRAMEBUFFER_BINDING = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CAA, .hex);
pub const GL_RENDERBUFFER_SAMPLES = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CAB, .hex);
pub const GL_FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CD0, .hex);
pub const GL_FRAMEBUFFER_ATTACHMENT_OBJECT_NAME = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CD1, .hex);
pub const GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CD2, .hex);
pub const GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CD3, .hex);
pub const GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LAYER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CD4, .hex);
pub const GL_FRAMEBUFFER_COMPLETE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CD5, .hex);
pub const GL_FRAMEBUFFER_INCOMPLETE_ATTACHMENT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CD6, .hex);
pub const GL_FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CD7, .hex);
pub const GL_FRAMEBUFFER_INCOMPLETE_DRAW_BUFFER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CDB, .hex);
pub const GL_FRAMEBUFFER_INCOMPLETE_READ_BUFFER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CDC, .hex);
pub const GL_FRAMEBUFFER_UNSUPPORTED = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CDD, .hex);
pub const GL_MAX_COLOR_ATTACHMENTS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CDF, .hex);
pub const GL_COLOR_ATTACHMENT0 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CE0, .hex);
pub const GL_COLOR_ATTACHMENT1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CE1, .hex);
pub const GL_COLOR_ATTACHMENT2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CE2, .hex);
pub const GL_COLOR_ATTACHMENT3 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CE3, .hex);
pub const GL_COLOR_ATTACHMENT4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CE4, .hex);
pub const GL_COLOR_ATTACHMENT5 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CE5, .hex);
pub const GL_COLOR_ATTACHMENT6 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CE6, .hex);
pub const GL_COLOR_ATTACHMENT7 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CE7, .hex);
pub const GL_COLOR_ATTACHMENT8 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CE8, .hex);
pub const GL_COLOR_ATTACHMENT9 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CE9, .hex);
pub const GL_COLOR_ATTACHMENT10 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CEA, .hex);
pub const GL_COLOR_ATTACHMENT11 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CEB, .hex);
pub const GL_COLOR_ATTACHMENT12 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CEC, .hex);
pub const GL_COLOR_ATTACHMENT13 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CED, .hex);
pub const GL_COLOR_ATTACHMENT14 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CEE, .hex);
pub const GL_COLOR_ATTACHMENT15 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CEF, .hex);
pub const GL_COLOR_ATTACHMENT16 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CF0, .hex);
pub const GL_COLOR_ATTACHMENT17 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CF1, .hex);
pub const GL_COLOR_ATTACHMENT18 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CF2, .hex);
pub const GL_COLOR_ATTACHMENT19 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CF3, .hex);
pub const GL_COLOR_ATTACHMENT20 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CF4, .hex);
pub const GL_COLOR_ATTACHMENT21 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CF5, .hex);
pub const GL_COLOR_ATTACHMENT22 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CF6, .hex);
pub const GL_COLOR_ATTACHMENT23 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CF7, .hex);
pub const GL_COLOR_ATTACHMENT24 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CF8, .hex);
pub const GL_COLOR_ATTACHMENT25 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CF9, .hex);
pub const GL_COLOR_ATTACHMENT26 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CFA, .hex);
pub const GL_COLOR_ATTACHMENT27 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CFB, .hex);
pub const GL_COLOR_ATTACHMENT28 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CFC, .hex);
pub const GL_COLOR_ATTACHMENT29 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CFD, .hex);
pub const GL_COLOR_ATTACHMENT30 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CFE, .hex);
pub const GL_COLOR_ATTACHMENT31 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8CFF, .hex);
pub const GL_DEPTH_ATTACHMENT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8D00, .hex);
pub const GL_STENCIL_ATTACHMENT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8D20, .hex);
pub const GL_FRAMEBUFFER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8D40, .hex);
pub const GL_RENDERBUFFER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8D41, .hex);
pub const GL_RENDERBUFFER_WIDTH = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8D42, .hex);
pub const GL_RENDERBUFFER_HEIGHT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8D43, .hex);
pub const GL_RENDERBUFFER_INTERNAL_FORMAT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8D44, .hex);
pub const GL_STENCIL_INDEX1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8D46, .hex);
pub const GL_STENCIL_INDEX4 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8D47, .hex);
pub const GL_STENCIL_INDEX8 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8D48, .hex);
pub const GL_STENCIL_INDEX16 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8D49, .hex);
pub const GL_RENDERBUFFER_RED_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8D50, .hex);
pub const GL_RENDERBUFFER_GREEN_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8D51, .hex);
pub const GL_RENDERBUFFER_BLUE_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8D52, .hex);
pub const GL_RENDERBUFFER_ALPHA_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8D53, .hex);
pub const GL_RENDERBUFFER_DEPTH_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8D54, .hex);
pub const GL_RENDERBUFFER_STENCIL_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8D55, .hex);
pub const GL_FRAMEBUFFER_INCOMPLETE_MULTISAMPLE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8D56, .hex);
pub const GL_MAX_SAMPLES = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8D57, .hex);
pub const GL_FRAMEBUFFER_SRGB = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8DB9, .hex);
pub const GL_HALF_FLOAT = @as(c_int, 0x140B);
pub const GL_MAP_READ_BIT = @as(c_int, 0x0001);
pub const GL_MAP_WRITE_BIT = @as(c_int, 0x0002);
pub const GL_MAP_INVALIDATE_RANGE_BIT = @as(c_int, 0x0004);
pub const GL_MAP_INVALIDATE_BUFFER_BIT = @as(c_int, 0x0008);
pub const GL_MAP_FLUSH_EXPLICIT_BIT = @as(c_int, 0x0010);
pub const GL_MAP_UNSYNCHRONIZED_BIT = @as(c_int, 0x0020);
pub const GL_COMPRESSED_RED_RGTC1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8DBB, .hex);
pub const GL_COMPRESSED_SIGNED_RED_RGTC1 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8DBC, .hex);
pub const GL_COMPRESSED_RG_RGTC2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8DBD, .hex);
pub const GL_COMPRESSED_SIGNED_RG_RGTC2 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8DBE, .hex);
pub const GL_RG = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8227, .hex);
pub const GL_RG_INTEGER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8228, .hex);
pub const GL_R8 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8229, .hex);
pub const GL_R16 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x822A, .hex);
pub const GL_RG8 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x822B, .hex);
pub const GL_RG16 = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x822C, .hex);
pub const GL_R16F = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x822D, .hex);
pub const GL_R32F = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x822E, .hex);
pub const GL_RG16F = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x822F, .hex);
pub const GL_RG32F = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8230, .hex);
pub const GL_R8I = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8231, .hex);
pub const GL_R8UI = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8232, .hex);
pub const GL_R16I = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8233, .hex);
pub const GL_R16UI = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8234, .hex);
pub const GL_R32I = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8235, .hex);
pub const GL_R32UI = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8236, .hex);
pub const GL_RG8I = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8237, .hex);
pub const GL_RG8UI = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8238, .hex);
pub const GL_RG16I = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8239, .hex);
pub const GL_RG16UI = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x823A, .hex);
pub const GL_RG32I = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x823B, .hex);
pub const GL_RG32UI = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x823C, .hex);
pub const GL_VERTEX_ARRAY_BINDING = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x85B5, .hex);
pub const GL_SAMPLER_2D_RECT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B63, .hex);
pub const GL_SAMPLER_2D_RECT_SHADOW = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8B64, .hex);
pub const GL_SAMPLER_BUFFER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8DC2, .hex);
pub const GL_INT_SAMPLER_2D_RECT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8DCD, .hex);
pub const GL_INT_SAMPLER_BUFFER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8DD0, .hex);
pub const GL_UNSIGNED_INT_SAMPLER_2D_RECT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8DD5, .hex);
pub const GL_UNSIGNED_INT_SAMPLER_BUFFER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8DD8, .hex);
pub const GL_TEXTURE_BUFFER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C2A, .hex);
pub const GL_MAX_TEXTURE_BUFFER_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C2B, .hex);
pub const GL_TEXTURE_BINDING_BUFFER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C2C, .hex);
pub const GL_TEXTURE_BUFFER_DATA_STORE_BINDING = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C2D, .hex);
pub const GL_TEXTURE_RECTANGLE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84F5, .hex);
pub const GL_TEXTURE_BINDING_RECTANGLE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84F6, .hex);
pub const GL_PROXY_TEXTURE_RECTANGLE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84F7, .hex);
pub const GL_MAX_RECTANGLE_TEXTURE_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x84F8, .hex);
pub const GL_R8_SNORM = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8F94, .hex);
pub const GL_RG8_SNORM = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8F95, .hex);
pub const GL_RGB8_SNORM = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8F96, .hex);
pub const GL_RGBA8_SNORM = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8F97, .hex);
pub const GL_R16_SNORM = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8F98, .hex);
pub const GL_RG16_SNORM = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8F99, .hex);
pub const GL_RGB16_SNORM = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8F9A, .hex);
pub const GL_RGBA16_SNORM = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8F9B, .hex);
pub const GL_SIGNED_NORMALIZED = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8F9C, .hex);
pub const GL_PRIMITIVE_RESTART = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8F9D, .hex);
pub const GL_PRIMITIVE_RESTART_INDEX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8F9E, .hex);
pub const GL_COPY_READ_BUFFER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8F36, .hex);
pub const GL_COPY_WRITE_BUFFER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8F37, .hex);
pub const GL_UNIFORM_BUFFER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8A11, .hex);
pub const GL_UNIFORM_BUFFER_BINDING = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8A28, .hex);
pub const GL_UNIFORM_BUFFER_START = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8A29, .hex);
pub const GL_UNIFORM_BUFFER_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8A2A, .hex);
pub const GL_MAX_VERTEX_UNIFORM_BLOCKS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8A2B, .hex);
pub const GL_MAX_GEOMETRY_UNIFORM_BLOCKS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8A2C, .hex);
pub const GL_MAX_FRAGMENT_UNIFORM_BLOCKS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8A2D, .hex);
pub const GL_MAX_COMBINED_UNIFORM_BLOCKS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8A2E, .hex);
pub const GL_MAX_UNIFORM_BUFFER_BINDINGS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8A2F, .hex);
pub const GL_MAX_UNIFORM_BLOCK_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8A30, .hex);
pub const GL_MAX_COMBINED_VERTEX_UNIFORM_COMPONENTS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8A31, .hex);
pub const GL_MAX_COMBINED_GEOMETRY_UNIFORM_COMPONENTS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8A32, .hex);
pub const GL_MAX_COMBINED_FRAGMENT_UNIFORM_COMPONENTS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8A33, .hex);
pub const GL_UNIFORM_BUFFER_OFFSET_ALIGNMENT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8A34, .hex);
pub const GL_ACTIVE_UNIFORM_BLOCK_MAX_NAME_LENGTH = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8A35, .hex);
pub const GL_ACTIVE_UNIFORM_BLOCKS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8A36, .hex);
pub const GL_UNIFORM_TYPE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8A37, .hex);
pub const GL_UNIFORM_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8A38, .hex);
pub const GL_UNIFORM_NAME_LENGTH = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8A39, .hex);
pub const GL_UNIFORM_BLOCK_INDEX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8A3A, .hex);
pub const GL_UNIFORM_OFFSET = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8A3B, .hex);
pub const GL_UNIFORM_ARRAY_STRIDE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8A3C, .hex);
pub const GL_UNIFORM_MATRIX_STRIDE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8A3D, .hex);
pub const GL_UNIFORM_IS_ROW_MAJOR = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8A3E, .hex);
pub const GL_UNIFORM_BLOCK_BINDING = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8A3F, .hex);
pub const GL_UNIFORM_BLOCK_DATA_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8A40, .hex);
pub const GL_UNIFORM_BLOCK_NAME_LENGTH = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8A41, .hex);
pub const GL_UNIFORM_BLOCK_ACTIVE_UNIFORMS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8A42, .hex);
pub const GL_UNIFORM_BLOCK_ACTIVE_UNIFORM_INDICES = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8A43, .hex);
pub const GL_UNIFORM_BLOCK_REFERENCED_BY_VERTEX_SHADER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8A44, .hex);
pub const GL_UNIFORM_BLOCK_REFERENCED_BY_GEOMETRY_SHADER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8A45, .hex);
pub const GL_UNIFORM_BLOCK_REFERENCED_BY_FRAGMENT_SHADER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8A46, .hex);
pub const GL_INVALID_INDEX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xFFFFFFFF, .hex);
pub const GL_CONTEXT_CORE_PROFILE_BIT = @as(c_int, 0x00000001);
pub const GL_CONTEXT_COMPATIBILITY_PROFILE_BIT = @as(c_int, 0x00000002);
pub const GL_LINES_ADJACENCY = @as(c_int, 0x000A);
pub const GL_LINE_STRIP_ADJACENCY = @as(c_int, 0x000B);
pub const GL_TRIANGLES_ADJACENCY = @as(c_int, 0x000C);
pub const GL_TRIANGLE_STRIP_ADJACENCY = @as(c_int, 0x000D);
pub const GL_PROGRAM_POINT_SIZE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8642, .hex);
pub const GL_MAX_GEOMETRY_TEXTURE_IMAGE_UNITS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C29, .hex);
pub const GL_FRAMEBUFFER_ATTACHMENT_LAYERED = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8DA7, .hex);
pub const GL_FRAMEBUFFER_INCOMPLETE_LAYER_TARGETS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8DA8, .hex);
pub const GL_GEOMETRY_SHADER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8DD9, .hex);
pub const GL_GEOMETRY_VERTICES_OUT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8916, .hex);
pub const GL_GEOMETRY_INPUT_TYPE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8917, .hex);
pub const GL_GEOMETRY_OUTPUT_TYPE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8918, .hex);
pub const GL_MAX_GEOMETRY_UNIFORM_COMPONENTS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8DDF, .hex);
pub const GL_MAX_GEOMETRY_OUTPUT_VERTICES = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8DE0, .hex);
pub const GL_MAX_GEOMETRY_TOTAL_OUTPUT_COMPONENTS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8DE1, .hex);
pub const GL_MAX_VERTEX_OUTPUT_COMPONENTS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x9122, .hex);
pub const GL_MAX_GEOMETRY_INPUT_COMPONENTS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x9123, .hex);
pub const GL_MAX_GEOMETRY_OUTPUT_COMPONENTS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x9124, .hex);
pub const GL_MAX_FRAGMENT_INPUT_COMPONENTS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x9125, .hex);
pub const GL_CONTEXT_PROFILE_MASK = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x9126, .hex);
pub const GL_DEPTH_CLAMP = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x864F, .hex);
pub const GL_QUADS_FOLLOW_PROVOKING_VERTEX_CONVENTION = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8E4C, .hex);
pub const GL_FIRST_VERTEX_CONVENTION = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8E4D, .hex);
pub const GL_LAST_VERTEX_CONVENTION = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8E4E, .hex);
pub const GL_PROVOKING_VERTEX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8E4F, .hex);
pub const GL_TEXTURE_CUBE_MAP_SEAMLESS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x884F, .hex);
pub const GL_MAX_SERVER_WAIT_TIMEOUT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x9111, .hex);
pub const GL_OBJECT_TYPE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x9112, .hex);
pub const GL_SYNC_CONDITION = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x9113, .hex);
pub const GL_SYNC_STATUS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x9114, .hex);
pub const GL_SYNC_FLAGS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x9115, .hex);
pub const GL_SYNC_FENCE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x9116, .hex);
pub const GL_SYNC_GPU_COMMANDS_COMPLETE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x9117, .hex);
pub const GL_UNSIGNALED = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x9118, .hex);
pub const GL_SIGNALED = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x9119, .hex);
pub const GL_ALREADY_SIGNALED = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x911A, .hex);
pub const GL_TIMEOUT_EXPIRED = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x911B, .hex);
pub const GL_CONDITION_SATISFIED = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x911C, .hex);
pub const GL_WAIT_FAILED = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x911D, .hex);
pub const GL_TIMEOUT_IGNORED = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xFFFFFFFFFFFFFFFF, .hex);
pub const GL_SYNC_FLUSH_COMMANDS_BIT = @as(c_int, 0x00000001);
pub const GL_SAMPLE_POSITION = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8E50, .hex);
pub const GL_SAMPLE_MASK = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8E51, .hex);
pub const GL_SAMPLE_MASK_VALUE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8E52, .hex);
pub const GL_MAX_SAMPLE_MASK_WORDS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8E59, .hex);
pub const GL_TEXTURE_2D_MULTISAMPLE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x9100, .hex);
pub const GL_PROXY_TEXTURE_2D_MULTISAMPLE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x9101, .hex);
pub const GL_TEXTURE_2D_MULTISAMPLE_ARRAY = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x9102, .hex);
pub const GL_PROXY_TEXTURE_2D_MULTISAMPLE_ARRAY = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x9103, .hex);
pub const GL_TEXTURE_BINDING_2D_MULTISAMPLE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x9104, .hex);
pub const GL_TEXTURE_BINDING_2D_MULTISAMPLE_ARRAY = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x9105, .hex);
pub const GL_TEXTURE_SAMPLES = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x9106, .hex);
pub const GL_TEXTURE_FIXED_SAMPLE_LOCATIONS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x9107, .hex);
pub const GL_SAMPLER_2D_MULTISAMPLE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x9108, .hex);
pub const GL_INT_SAMPLER_2D_MULTISAMPLE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x9109, .hex);
pub const GL_UNSIGNED_INT_SAMPLER_2D_MULTISAMPLE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x910A, .hex);
pub const GL_SAMPLER_2D_MULTISAMPLE_ARRAY = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x910B, .hex);
pub const GL_INT_SAMPLER_2D_MULTISAMPLE_ARRAY = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x910C, .hex);
pub const GL_UNSIGNED_INT_SAMPLER_2D_MULTISAMPLE_ARRAY = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x910D, .hex);
pub const GL_MAX_COLOR_TEXTURE_SAMPLES = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x910E, .hex);
pub const GL_MAX_DEPTH_TEXTURE_SAMPLES = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x910F, .hex);
pub const GL_MAX_INTEGER_SAMPLES = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x9110, .hex);
pub const GL_VERTEX_ATTRIB_ARRAY_DIVISOR = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x88FE, .hex);
pub const GL_SRC1_COLOR = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x88F9, .hex);
pub const GL_ONE_MINUS_SRC1_COLOR = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x88FA, .hex);
pub const GL_ONE_MINUS_SRC1_ALPHA = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x88FB, .hex);
pub const GL_MAX_DUAL_SOURCE_DRAW_BUFFERS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x88FC, .hex);
pub const GL_ANY_SAMPLES_PASSED = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8C2F, .hex);
pub const GL_SAMPLER_BINDING = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8919, .hex);
pub const GL_RGB10_A2UI = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x906F, .hex);
pub const GL_TEXTURE_SWIZZLE_R = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8E42, .hex);
pub const GL_TEXTURE_SWIZZLE_G = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8E43, .hex);
pub const GL_TEXTURE_SWIZZLE_B = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8E44, .hex);
pub const GL_TEXTURE_SWIZZLE_A = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8E45, .hex);
pub const GL_TEXTURE_SWIZZLE_RGBA = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8E46, .hex);
pub const GL_TIME_ELAPSED = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x88BF, .hex);
pub const GL_TIMESTAMP = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8E28, .hex);
pub const GL_INT_2_10_10_10_REV = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8D9F, .hex);
pub const GL_VERSION_1_0 = @as(c_int, 1);
pub inline fn glCullFace(arg_3: GLenum) void {
    return glad_glCullFace.?(arg_3);
}
pub inline fn glFrontFace(arg_4: GLenum) void {
    return glad_glFrontFace.?(arg_4);
}
pub inline fn glHint(arg_5: GLenum, arg_6: GLenum) void {
    return glad_glHint.?(arg_5, arg_6);
}
pub inline fn glLineWidth(arg_7: GLfloat) void {
    return glad_glLineWidth.?(arg_7);
}
pub inline fn glPointSize(arg_8: GLfloat) void {
    return glad_glPointSize.?(arg_8);
}
pub inline fn glPolygonMode(arg_9: GLenum, arg_10: GLenum) void {
    return glad_glPolygonMode.?(arg_9, arg_10);
}
pub inline fn glScissor(arg_11: GLint, arg_12: GLint, arg_13: GLsizei, arg_14: GLsizei) void {
    return glad_glScissor.?(arg_11, arg_12, arg_13, arg_14);
}
pub inline fn glTexParameterf(arg_15: GLenum, arg_16: GLenum, arg_17: GLfloat) void {
    return glad_glTexParameterf.?(arg_15, arg_16, arg_17);
}
pub inline fn glTexParameterfv(arg_18: GLenum, arg_19: GLenum, arg_20: [*c]const GLfloat) void {
    return glad_glTexParameterfv.?(arg_18, arg_19, arg_20);
}
pub inline fn glTexParameteri(arg_21: GLenum, arg_22: GLenum, arg_23: GLint) void {
    return glad_glTexParameteri.?(arg_21, arg_22, arg_23);
}
pub inline fn glTexParameteriv(arg_24: GLenum, arg_25: GLenum, arg_26: [*c]const GLint) void {
    return glad_glTexParameteriv.?(arg_24, arg_25, arg_26);
}
pub inline fn glTexImage1D(arg_27: GLenum, arg_28: GLint, arg_29: GLint, arg_30: GLsizei, arg_31: GLint, arg_32: GLenum, arg_33: GLenum, arg_34: ?*const anyopaque) void {
    return glad_glTexImage1D.?(arg_27, arg_28, arg_29, arg_30, arg_31, arg_32, arg_33, arg_34);
}
pub inline fn glTexImage2D(arg_35: GLenum, arg_36: GLint, arg_37: GLint, arg_38: GLsizei, arg_39: GLsizei, arg_40: GLint, arg_41: GLenum, arg_42: GLenum, arg_43: ?*const anyopaque) void {
    return glad_glTexImage2D.?(arg_35, arg_36, arg_37, arg_38, arg_39, arg_40, arg_41, arg_42, arg_43);
}
pub inline fn glDrawBuffer(arg_44: GLenum) void {
    return glad_glDrawBuffer.?(arg_44);
}
pub inline fn glClear(arg_45: GLbitfield) void {
    return glad_glClear.?(arg_45);
}
pub inline fn glClearColor(arg_46: GLfloat, arg_47: GLfloat, arg_48: GLfloat, arg_49: GLfloat) void {
    return glad_glClearColor.?(arg_46, arg_47, arg_48, arg_49);
}
pub inline fn glClearStencil(arg_50: GLint) void {
    return glad_glClearStencil.?(arg_50);
}
pub inline fn glClearDepth(arg_51: GLdouble) void {
    return glad_glClearDepth.?(arg_51);
}
pub inline fn glStencilMask(arg_52: GLuint) void {
    return glad_glStencilMask.?(arg_52);
}
pub inline fn glColorMask(arg_53: GLboolean, arg_54: GLboolean, arg_55: GLboolean, arg_56: GLboolean) void {
    return glad_glColorMask.?(arg_53, arg_54, arg_55, arg_56);
}
pub inline fn glDepthMask(arg_57: GLboolean) void {
    return glad_glDepthMask.?(arg_57);
}
pub inline fn glDisable(arg_58: GLenum) void {
    return glad_glDisable.?(arg_58);
}
pub inline fn glEnable(arg_59: GLenum) void {
    return glad_glEnable.?(arg_59);
}
pub inline fn glFinish() void {
    return glad_glFinish.?();
}
pub inline fn glFlush() void {
    return glad_glFlush.?();
}
pub inline fn glBlendFunc(arg_60: GLenum, arg_61: GLenum) void {
    return glad_glBlendFunc.?(arg_60, arg_61);
}
pub inline fn glLogicOp(arg_62: GLenum) void {
    return glad_glLogicOp.?(arg_62);
}
pub inline fn glStencilFunc(arg_63: GLenum, arg_64: GLint, arg_65: GLuint) void {
    return glad_glStencilFunc.?(arg_63, arg_64, arg_65);
}
pub inline fn glStencilOp(arg_66: GLenum, arg_67: GLenum, arg_68: GLenum) void {
    return glad_glStencilOp.?(arg_66, arg_67, arg_68);
}
pub inline fn glDepthFunc(arg_69: GLenum) void {
    return glad_glDepthFunc.?(arg_69);
}
pub inline fn glPixelStoref(arg_70: GLenum, arg_71: GLfloat) void {
    return glad_glPixelStoref.?(arg_70, arg_71);
}
pub inline fn glPixelStorei(arg_72: GLenum, arg_73: GLint) void {
    return glad_glPixelStorei.?(arg_72, arg_73);
}
pub inline fn glReadBuffer(arg_74: GLenum) void {
    return glad_glReadBuffer.?(arg_74);
}
pub inline fn glReadPixels(arg_75: GLint, arg_76: GLint, arg_77: GLsizei, arg_78: GLsizei, arg_79: GLenum, arg_80: GLenum, arg_81: ?*anyopaque) void {
    return glad_glReadPixels.?(arg_75, arg_76, arg_77, arg_78, arg_79, arg_80, arg_81);
}
pub inline fn glGetBooleanv(arg_82: GLenum, arg_83: [*c]GLboolean) void {
    return glad_glGetBooleanv.?(arg_82, arg_83);
}
pub inline fn glGetDoublev(arg_84: GLenum, arg_85: [*c]GLdouble) void {
    return glad_glGetDoublev.?(arg_84, arg_85);
}
pub inline fn glGetError() GLenum {
    return glad_glGetError.?();
}
pub inline fn glGetFloatv(arg_86: GLenum, arg_87: [*c]GLfloat) void {
    return glad_glGetFloatv.?(arg_86, arg_87);
}
pub inline fn glGetIntegerv(arg_88: GLenum, arg_89: [*c]GLint) void {
    return glad_glGetIntegerv.?(arg_88, arg_89);
}
pub inline fn glGetString(arg_90: GLenum) [*c]const GLubyte {
    return glad_glGetString.?(arg_90);
}
pub inline fn glGetTexImage(arg_91: GLenum, arg_92: GLint, arg_93: GLenum, arg_94: GLenum, arg_95: ?*anyopaque) void {
    return glad_glGetTexImage.?(arg_91, arg_92, arg_93, arg_94, arg_95);
}
pub inline fn glGetTexParameterfv(arg_96: GLenum, arg_97: GLenum, arg_98: [*c]GLfloat) void {
    return glad_glGetTexParameterfv.?(arg_96, arg_97, arg_98);
}
pub inline fn glGetTexParameteriv(arg_99: GLenum, arg_100: GLenum, arg_101: [*c]GLint) void {
    return glad_glGetTexParameteriv.?(arg_99, arg_100, arg_101);
}
pub inline fn glGetTexLevelParameterfv(arg_102: GLenum, arg_103: GLint, arg_104: GLenum, arg_105: [*c]GLfloat) void {
    return glad_glGetTexLevelParameterfv.?(arg_102, arg_103, arg_104, arg_105);
}
pub inline fn glGetTexLevelParameteriv(arg_106: GLenum, arg_107: GLint, arg_108: GLenum, arg_109: [*c]GLint) void {
    return glad_glGetTexLevelParameteriv.?(arg_106, arg_107, arg_108, arg_109);
}
pub inline fn glIsEnabled(arg_110: GLenum) GLboolean {
    return glad_glIsEnabled.?(arg_110);
}
pub inline fn glDepthRange(arg_111: GLdouble, arg_112: GLdouble) void {
    return glad_glDepthRange.?(arg_111, arg_112);
}
pub inline fn glViewport(arg_113: GLint, arg_114: GLint, arg_115: GLsizei, arg_116: GLsizei) void {
    return glad_glViewport.?(arg_113, arg_114, arg_115, arg_116);
}
pub const GL_VERSION_1_1 = @as(c_int, 1);
pub inline fn glDrawArrays(arg_117: GLenum, arg_118: GLint, arg_119: GLsizei) void {
    return glad_glDrawArrays.?(arg_117, arg_118, arg_119);
}
pub inline fn glDrawElements(arg_120: GLenum, arg_121: GLsizei, arg_122: GLenum, arg_123: ?*const anyopaque) void {
    return glad_glDrawElements.?(arg_120, arg_121, arg_122, arg_123);
}
pub inline fn glPolygonOffset(arg_124: GLfloat, arg_125: GLfloat) void {
    return glad_glPolygonOffset.?(arg_124, arg_125);
}
pub inline fn glCopyTexImage1D(arg_126: GLenum, arg_127: GLint, arg_128: GLenum, arg_129: GLint, arg_130: GLint, arg_131: GLsizei, arg_132: GLint) void {
    return glad_glCopyTexImage1D.?(arg_126, arg_127, arg_128, arg_129, arg_130, arg_131, arg_132);
}
pub inline fn glCopyTexImage2D(arg_133: GLenum, arg_134: GLint, arg_135: GLenum, arg_136: GLint, arg_137: GLint, arg_138: GLsizei, arg_139: GLsizei, arg_140: GLint) void {
    return glad_glCopyTexImage2D.?(arg_133, arg_134, arg_135, arg_136, arg_137, arg_138, arg_139, arg_140);
}
pub inline fn glCopyTexSubImage1D(arg_141: GLenum, arg_142: GLint, arg_143: GLint, arg_144: GLint, arg_145: GLint, arg_146: GLsizei) void {
    return glad_glCopyTexSubImage1D.?(arg_141, arg_142, arg_143, arg_144, arg_145, arg_146);
}
pub inline fn glCopyTexSubImage2D(arg_147: GLenum, arg_148: GLint, arg_149: GLint, arg_150: GLint, arg_151: GLint, arg_152: GLint, arg_153: GLsizei, arg_154: GLsizei) void {
    return glad_glCopyTexSubImage2D.?(arg_147, arg_148, arg_149, arg_150, arg_151, arg_152, arg_153, arg_154);
}
pub inline fn glTexSubImage1D(arg_155: GLenum, arg_156: GLint, arg_157: GLint, arg_158: GLsizei, arg_159: GLenum, arg_160: GLenum, arg_161: ?*const anyopaque) void {
    return glad_glTexSubImage1D.?(arg_155, arg_156, arg_157, arg_158, arg_159, arg_160, arg_161);
}
pub inline fn glTexSubImage2D(arg_162: GLenum, arg_163: GLint, arg_164: GLint, arg_165: GLint, arg_166: GLsizei, arg_167: GLsizei, arg_168: GLenum, arg_169: GLenum, arg_170: ?*const anyopaque) void {
    return glad_glTexSubImage2D.?(arg_162, arg_163, arg_164, arg_165, arg_166, arg_167, arg_168, arg_169, arg_170);
}
pub inline fn glBindTexture(arg_171: GLenum, arg_172: GLuint) void {
    return glad_glBindTexture.?(arg_171, arg_172);
}
pub inline fn glDeleteTextures(arg_173: GLsizei, arg_174: [*c]const GLuint) void {
    return glad_glDeleteTextures.?(arg_173, arg_174);
}
pub inline fn glGenTextures(arg_175: GLsizei, arg_176: [*c]GLuint) void {
    return glad_glGenTextures.?(arg_175, arg_176);
}
pub inline fn glIsTexture(arg_177: GLuint) GLboolean {
    return glad_glIsTexture.?(arg_177);
}
pub const GL_VERSION_1_2 = @as(c_int, 1);
pub inline fn glDrawRangeElements(arg_178: GLenum, arg_179: GLuint, arg_180: GLuint, arg_181: GLsizei, arg_182: GLenum, arg_183: ?*const anyopaque) void {
    return glad_glDrawRangeElements.?(arg_178, arg_179, arg_180, arg_181, arg_182, arg_183);
}
pub inline fn glTexImage3D(arg_184: GLenum, arg_185: GLint, arg_186: GLint, arg_187: GLsizei, arg_188: GLsizei, arg_189: GLsizei, arg_190: GLint, arg_191: GLenum, arg_192: GLenum, arg_193: ?*const anyopaque) void {
    return glad_glTexImage3D.?(arg_184, arg_185, arg_186, arg_187, arg_188, arg_189, arg_190, arg_191, arg_192, arg_193);
}
pub inline fn glTexSubImage3D(arg_194: GLenum, arg_195: GLint, arg_196: GLint, arg_197: GLint, arg_198: GLint, arg_199: GLsizei, arg_200: GLsizei, arg_201: GLsizei, arg_202: GLenum, arg_203: GLenum, arg_204: ?*const anyopaque) void {
    return glad_glTexSubImage3D.?(arg_194, arg_195, arg_196, arg_197, arg_198, arg_199, arg_200, arg_201, arg_202, arg_203, arg_204);
}
pub inline fn glCopyTexSubImage3D(arg_205: GLenum, arg_206: GLint, arg_207: GLint, arg_208: GLint, arg_209: GLint, arg_210: GLint, arg_211: GLint, arg_212: GLsizei, arg_213: GLsizei) void {
    return glad_glCopyTexSubImage3D.?(arg_205, arg_206, arg_207, arg_208, arg_209, arg_210, arg_211, arg_212, arg_213);
}
pub const GL_VERSION_1_3 = @as(c_int, 1);
pub inline fn glActiveTexture(arg_214: GLenum) void {
    return glad_glActiveTexture.?(arg_214);
}
pub inline fn glSampleCoverage(arg_215: GLfloat, arg_216: GLboolean) void {
    return glad_glSampleCoverage.?(arg_215, arg_216);
}
pub inline fn glCompressedTexImage3D(arg_217: GLenum, arg_218: GLint, arg_219: GLenum, arg_220: GLsizei, arg_221: GLsizei, arg_222: GLsizei, arg_223: GLint, arg_224: GLsizei, arg_225: ?*const anyopaque) void {
    return glad_glCompressedTexImage3D.?(arg_217, arg_218, arg_219, arg_220, arg_221, arg_222, arg_223, arg_224, arg_225);
}
pub inline fn glCompressedTexImage2D(arg_226: GLenum, arg_227: GLint, arg_228: GLenum, arg_229: GLsizei, arg_230: GLsizei, arg_231: GLint, arg_232: GLsizei, arg_233: ?*const anyopaque) void {
    return glad_glCompressedTexImage2D.?(arg_226, arg_227, arg_228, arg_229, arg_230, arg_231, arg_232, arg_233);
}
pub inline fn glCompressedTexImage1D(arg_234: GLenum, arg_235: GLint, arg_236: GLenum, arg_237: GLsizei, arg_238: GLint, arg_239: GLsizei, arg_240: ?*const anyopaque) void {
    return glad_glCompressedTexImage1D.?(arg_234, arg_235, arg_236, arg_237, arg_238, arg_239, arg_240);
}
pub inline fn glCompressedTexSubImage3D(arg_241: GLenum, arg_242: GLint, arg_243: GLint, arg_244: GLint, arg_245: GLint, arg_246: GLsizei, arg_247: GLsizei, arg_248: GLsizei, arg_249: GLenum, arg_250: GLsizei, arg_251: ?*const anyopaque) void {
    return glad_glCompressedTexSubImage3D.?(arg_241, arg_242, arg_243, arg_244, arg_245, arg_246, arg_247, arg_248, arg_249, arg_250, arg_251);
}
pub inline fn glCompressedTexSubImage2D(arg_252: GLenum, arg_253: GLint, arg_254: GLint, arg_255: GLint, arg_256: GLsizei, arg_257: GLsizei, arg_258: GLenum, arg_259: GLsizei, arg_260: ?*const anyopaque) void {
    return glad_glCompressedTexSubImage2D.?(arg_252, arg_253, arg_254, arg_255, arg_256, arg_257, arg_258, arg_259, arg_260);
}
pub inline fn glCompressedTexSubImage1D(arg_261: GLenum, arg_262: GLint, arg_263: GLint, arg_264: GLsizei, arg_265: GLenum, arg_266: GLsizei, arg_267: ?*const anyopaque) void {
    return glad_glCompressedTexSubImage1D.?(arg_261, arg_262, arg_263, arg_264, arg_265, arg_266, arg_267);
}
pub inline fn glGetCompressedTexImage(arg_268: GLenum, arg_269: GLint, arg_270: ?*anyopaque) void {
    return glad_glGetCompressedTexImage.?(arg_268, arg_269, arg_270);
}
pub const GL_VERSION_1_4 = @as(c_int, 1);
pub inline fn glBlendFuncSeparate(arg_271: GLenum, arg_272: GLenum, arg_273: GLenum, arg_274: GLenum) void {
    return glad_glBlendFuncSeparate.?(arg_271, arg_272, arg_273, arg_274);
}
pub inline fn glMultiDrawArrays(arg_275: GLenum, arg_276: [*c]const GLint, arg_277: [*c]const GLsizei, arg_278: GLsizei) void {
    return glad_glMultiDrawArrays.?(arg_275, arg_276, arg_277, arg_278);
}
pub inline fn glMultiDrawElements(arg_279: GLenum, arg_280: [*c]const GLsizei, arg_281: GLenum, arg_282: [*c]const ?*const anyopaque, arg_283: GLsizei) void {
    return glad_glMultiDrawElements.?(arg_279, arg_280, arg_281, arg_282, arg_283);
}
pub inline fn glPointParameterf(arg_284: GLenum, arg_285: GLfloat) void {
    return glad_glPointParameterf.?(arg_284, arg_285);
}
pub inline fn glPointParameterfv(arg_286: GLenum, arg_287: [*c]const GLfloat) void {
    return glad_glPointParameterfv.?(arg_286, arg_287);
}
pub inline fn glPointParameteri(arg_288: GLenum, arg_289: GLint) void {
    return glad_glPointParameteri.?(arg_288, arg_289);
}
pub inline fn glPointParameteriv(arg_290: GLenum, arg_291: [*c]const GLint) void {
    return glad_glPointParameteriv.?(arg_290, arg_291);
}
pub inline fn glBlendColor(arg_292: GLfloat, arg_293: GLfloat, arg_294: GLfloat, arg_295: GLfloat) void {
    return glad_glBlendColor.?(arg_292, arg_293, arg_294, arg_295);
}
pub inline fn glBlendEquation(arg_296: GLenum) void {
    return glad_glBlendEquation.?(arg_296);
}
pub const GL_VERSION_1_5 = @as(c_int, 1);
pub inline fn glGenQueries(arg_297: GLsizei, arg_298: [*c]GLuint) void {
    return glad_glGenQueries.?(arg_297, arg_298);
}
pub inline fn glDeleteQueries(arg_299: GLsizei, arg_300: [*c]const GLuint) void {
    return glad_glDeleteQueries.?(arg_299, arg_300);
}
pub inline fn glIsQuery(arg_301: GLuint) GLboolean {
    return glad_glIsQuery.?(arg_301);
}
pub inline fn glBeginQuery(arg_302: GLenum, arg_303: GLuint) void {
    return glad_glBeginQuery.?(arg_302, arg_303);
}
pub inline fn glEndQuery(arg_304: GLenum) void {
    return glad_glEndQuery.?(arg_304);
}
pub inline fn glGetQueryiv(arg_305: GLenum, arg_306: GLenum, arg_307: [*c]GLint) void {
    return glad_glGetQueryiv.?(arg_305, arg_306, arg_307);
}
pub inline fn glGetQueryObjectiv(arg_308: GLuint, arg_309: GLenum, arg_310: [*c]GLint) void {
    return glad_glGetQueryObjectiv.?(arg_308, arg_309, arg_310);
}
pub inline fn glGetQueryObjectuiv(arg_311: GLuint, arg_312: GLenum, arg_313: [*c]GLuint) void {
    return glad_glGetQueryObjectuiv.?(arg_311, arg_312, arg_313);
}
pub inline fn glBindBuffer(arg_314: GLenum, arg_315: GLuint) void {
    return glad_glBindBuffer.?(arg_314, arg_315);
}
pub inline fn glDeleteBuffers(arg_316: GLsizei, arg_317: [*c]const GLuint) void {
    return glad_glDeleteBuffers.?(arg_316, arg_317);
}
pub inline fn glGenBuffers(arg_318: GLsizei, arg_319: [*c]GLuint) void {
    return glad_glGenBuffers.?(arg_318, arg_319);
}
pub inline fn glIsBuffer(arg_320: GLuint) GLboolean {
    return glad_glIsBuffer.?(arg_320);
}
pub inline fn glBufferData(arg_321: GLenum, arg_322: GLsizeiptr, arg_323: ?*const anyopaque, arg_324: GLenum) void {
    return glad_glBufferData.?(arg_321, arg_322, arg_323, arg_324);
}
pub inline fn glBufferSubData(arg_325: GLenum, arg_326: GLintptr, arg_327: GLsizeiptr, arg_328: ?*const anyopaque) void {
    return glad_glBufferSubData.?(arg_325, arg_326, arg_327, arg_328);
}
pub inline fn glGetBufferSubData(arg_329: GLenum, arg_330: GLintptr, arg_331: GLsizeiptr, arg_332: ?*anyopaque) void {
    return glad_glGetBufferSubData.?(arg_329, arg_330, arg_331, arg_332);
}
pub inline fn glMapBuffer(arg_333: GLenum, arg_334: GLenum) ?*anyopaque {
    return glad_glMapBuffer.?(arg_333, arg_334);
}
pub inline fn glUnmapBuffer(arg_335: GLenum) GLboolean {
    return glad_glUnmapBuffer.?(arg_335);
}
pub inline fn glGetBufferParameteriv(arg_336: GLenum, arg_337: GLenum, arg_338: [*c]GLint) void {
    return glad_glGetBufferParameteriv.?(arg_336, arg_337, arg_338);
}
pub inline fn glGetBufferPointerv(arg_339: GLenum, arg_340: GLenum, arg_341: [*c]?*anyopaque) void {
    return glad_glGetBufferPointerv.?(arg_339, arg_340, arg_341);
}
pub const GL_VERSION_2_0 = @as(c_int, 1);
pub inline fn glBlendEquationSeparate(arg_342: GLenum, arg_343: GLenum) void {
    return glad_glBlendEquationSeparate.?(arg_342, arg_343);
}
pub inline fn glDrawBuffers(arg_344: GLsizei, arg_345: [*c]const GLenum) void {
    return glad_glDrawBuffers.?(arg_344, arg_345);
}
pub inline fn glStencilOpSeparate(arg_346: GLenum, arg_347: GLenum, arg_348: GLenum, arg_349: GLenum) void {
    return glad_glStencilOpSeparate.?(arg_346, arg_347, arg_348, arg_349);
}
pub inline fn glStencilFuncSeparate(arg_350: GLenum, arg_351: GLenum, arg_352: GLint, arg_353: GLuint) void {
    return glad_glStencilFuncSeparate.?(arg_350, arg_351, arg_352, arg_353);
}
pub inline fn glStencilMaskSeparate(arg_354: GLenum, arg_355: GLuint) void {
    return glad_glStencilMaskSeparate.?(arg_354, arg_355);
}
pub inline fn glAttachShader(arg_356: GLuint, arg_357: GLuint) void {
    return glad_glAttachShader.?(arg_356, arg_357);
}
pub inline fn glBindAttribLocation(arg_358: GLuint, arg_359: GLuint, arg_360: [*c]const GLchar) void {
    return glad_glBindAttribLocation.?(arg_358, arg_359, arg_360);
}
pub inline fn glCompileShader(arg_361: GLuint) void {
    return glad_glCompileShader.?(arg_361);
}
pub inline fn glCreateProgram() GLuint {
    return glad_glCreateProgram.?();
}
pub inline fn glCreateShader(arg_362: GLenum) GLuint {
    return glad_glCreateShader.?(arg_362);
}
pub inline fn glDeleteProgram(arg_363: GLuint) void {
    return glad_glDeleteProgram.?(arg_363);
}
pub inline fn glDeleteShader(arg_364: GLuint) void {
    return glad_glDeleteShader.?(arg_364);
}
pub inline fn glDetachShader(arg_365: GLuint, arg_366: GLuint) void {
    return glad_glDetachShader.?(arg_365, arg_366);
}
pub inline fn glDisableVertexAttribArray(arg_367: GLuint) void {
    return glad_glDisableVertexAttribArray.?(arg_367);
}
pub inline fn glEnableVertexAttribArray(arg_368: GLuint) void {
    return glad_glEnableVertexAttribArray.?(arg_368);
}
pub inline fn glGetActiveAttrib(arg_369: GLuint, arg_370: GLuint, arg_371: GLsizei, arg_372: [*c]GLsizei, arg_373: [*c]GLint, arg_374: [*c]GLenum, arg_375: [*c]GLchar) void {
    return glad_glGetActiveAttrib.?(arg_369, arg_370, arg_371, arg_372, arg_373, arg_374, arg_375);
}
pub inline fn glGetActiveUniform(arg_376: GLuint, arg_377: GLuint, arg_378: GLsizei, arg_379: [*c]GLsizei, arg_380: [*c]GLint, arg_381: [*c]GLenum, arg_382: [*c]GLchar) void {
    return glad_glGetActiveUniform.?(arg_376, arg_377, arg_378, arg_379, arg_380, arg_381, arg_382);
}
pub inline fn glGetAttachedShaders(arg_383: GLuint, arg_384: GLsizei, arg_385: [*c]GLsizei, arg_386: [*c]GLuint) void {
    return glad_glGetAttachedShaders.?(arg_383, arg_384, arg_385, arg_386);
}
pub inline fn glGetAttribLocation(arg_387: GLuint, arg_388: [*c]const GLchar) GLint {
    return glad_glGetAttribLocation.?(arg_387, arg_388);
}
pub inline fn glGetProgramiv(arg_389: GLuint, arg_390: GLenum, arg_391: [*c]GLint) void {
    return glad_glGetProgramiv.?(arg_389, arg_390, arg_391);
}
pub inline fn glGetProgramInfoLog(arg_392: GLuint, arg_393: GLsizei, arg_394: [*c]GLsizei, arg_395: [*c]GLchar) void {
    return glad_glGetProgramInfoLog.?(arg_392, arg_393, arg_394, arg_395);
}
pub inline fn glGetShaderiv(arg_396: GLuint, arg_397: GLenum, arg_398: [*c]GLint) void {
    return glad_glGetShaderiv.?(arg_396, arg_397, arg_398);
}
pub inline fn glGetShaderInfoLog(arg_399: GLuint, arg_400: GLsizei, arg_401: [*c]GLsizei, arg_402: [*c]GLchar) void {
    return glad_glGetShaderInfoLog.?(arg_399, arg_400, arg_401, arg_402);
}
pub inline fn glGetShaderSource(arg_403: GLuint, arg_404: GLsizei, arg_405: [*c]GLsizei, arg_406: [*c]GLchar) void {
    return glad_glGetShaderSource.?(arg_403, arg_404, arg_405, arg_406);
}
pub inline fn glGetUniformLocation(arg_407: GLuint, arg_408: [*c]const GLchar) GLint {
    return glad_glGetUniformLocation.?(arg_407, arg_408);
}
pub inline fn glGetUniformfv(arg_409: GLuint, arg_410: GLint, arg_411: [*c]GLfloat) void {
    return glad_glGetUniformfv.?(arg_409, arg_410, arg_411);
}
pub inline fn glGetUniformiv(arg_412: GLuint, arg_413: GLint, arg_414: [*c]GLint) void {
    return glad_glGetUniformiv.?(arg_412, arg_413, arg_414);
}
pub inline fn glGetVertexAttribdv(arg_415: GLuint, arg_416: GLenum, arg_417: [*c]GLdouble) void {
    return glad_glGetVertexAttribdv.?(arg_415, arg_416, arg_417);
}
pub inline fn glGetVertexAttribfv(arg_418: GLuint, arg_419: GLenum, arg_420: [*c]GLfloat) void {
    return glad_glGetVertexAttribfv.?(arg_418, arg_419, arg_420);
}
pub inline fn glGetVertexAttribiv(arg_421: GLuint, arg_422: GLenum, arg_423: [*c]GLint) void {
    return glad_glGetVertexAttribiv.?(arg_421, arg_422, arg_423);
}
pub inline fn glGetVertexAttribPointerv(arg_424: GLuint, arg_425: GLenum, arg_426: [*c]?*anyopaque) void {
    return glad_glGetVertexAttribPointerv.?(arg_424, arg_425, arg_426);
}
pub inline fn glIsProgram(arg_427: GLuint) GLboolean {
    return glad_glIsProgram.?(arg_427);
}
pub inline fn glIsShader(arg_428: GLuint) GLboolean {
    return glad_glIsShader.?(arg_428);
}
pub inline fn glLinkProgram(arg_429: GLuint) void {
    return glad_glLinkProgram.?(arg_429);
}
pub inline fn glShaderSource(arg_430: GLuint, arg_431: GLsizei, arg_432: [*c]const [*c]const GLchar, arg_433: [*c]const GLint) void {
    return glad_glShaderSource.?(arg_430, arg_431, arg_432, arg_433);
}
pub inline fn glUseProgram(arg_434: GLuint) void {
    return glad_glUseProgram.?(arg_434);
}
pub inline fn glUniform1f(arg_435: GLint, arg_436: GLfloat) void {
    return glad_glUniform1f.?(arg_435, arg_436);
}
pub inline fn glUniform2f(arg_437: GLint, arg_438: GLfloat, arg_439: GLfloat) void {
    return glad_glUniform2f.?(arg_437, arg_438, arg_439);
}
pub inline fn glUniform3f(arg_440: GLint, arg_441: GLfloat, arg_442: GLfloat, arg_443: GLfloat) void {
    return glad_glUniform3f.?(arg_440, arg_441, arg_442, arg_443);
}
pub inline fn glUniform4f(arg_444: GLint, arg_445: GLfloat, arg_446: GLfloat, arg_447: GLfloat, arg_448: GLfloat) void {
    return glad_glUniform4f.?(arg_444, arg_445, arg_446, arg_447, arg_448);
}
pub inline fn glUniform1i(arg_449: GLint, arg_450: GLint) void {
    return glad_glUniform1i.?(arg_449, arg_450);
}
pub inline fn glUniform2i(arg_451: GLint, arg_452: GLint, arg_453: GLint) void {
    return glad_glUniform2i.?(arg_451, arg_452, arg_453);
}
pub inline fn glUniform3i(arg_454: GLint, arg_455: GLint, arg_456: GLint, arg_457: GLint) void {
    return glad_glUniform3i.?(arg_454, arg_455, arg_456, arg_457);
}
pub inline fn glUniform4i(arg_458: GLint, arg_459: GLint, arg_460: GLint, arg_461: GLint, arg_462: GLint) void {
    return glad_glUniform4i.?(arg_458, arg_459, arg_460, arg_461, arg_462);
}
pub inline fn glUniform1fv(arg_463: GLint, arg_464: GLsizei, arg_465: [*c]const GLfloat) void {
    return glad_glUniform1fv.?(arg_463, arg_464, arg_465);
}
pub inline fn glUniform2fv(arg_466: GLint, arg_467: GLsizei, arg_468: [*c]const GLfloat) void {
    return glad_glUniform2fv.?(arg_466, arg_467, arg_468);
}
pub inline fn glUniform3fv(arg_469: GLint, arg_470: GLsizei, arg_471: [*c]const GLfloat) void {
    return glad_glUniform3fv.?(arg_469, arg_470, arg_471);
}
pub inline fn glUniform4fv(arg_472: GLint, arg_473: GLsizei, arg_474: [*c]const GLfloat) void {
    return glad_glUniform4fv.?(arg_472, arg_473, arg_474);
}
pub inline fn glUniform1iv(arg_475: GLint, arg_476: GLsizei, arg_477: [*c]const GLint) void {
    return glad_glUniform1iv.?(arg_475, arg_476, arg_477);
}
pub inline fn glUniform2iv(arg_478: GLint, arg_479: GLsizei, arg_480: [*c]const GLint) void {
    return glad_glUniform2iv.?(arg_478, arg_479, arg_480);
}
pub inline fn glUniform3iv(arg_481: GLint, arg_482: GLsizei, arg_483: [*c]const GLint) void {
    return glad_glUniform3iv.?(arg_481, arg_482, arg_483);
}
pub inline fn glUniform4iv(arg_484: GLint, arg_485: GLsizei, arg_486: [*c]const GLint) void {
    return glad_glUniform4iv.?(arg_484, arg_485, arg_486);
}
pub inline fn glUniformMatrix2fv(arg_487: GLint, arg_488: GLsizei, arg_489: GLboolean, arg_490: [*c]const GLfloat) void {
    return glad_glUniformMatrix2fv.?(arg_487, arg_488, arg_489, arg_490);
}
pub inline fn glUniformMatrix3fv(arg_491: GLint, arg_492: GLsizei, arg_493: GLboolean, arg_494: [*c]const GLfloat) void {
    return glad_glUniformMatrix3fv.?(arg_491, arg_492, arg_493, arg_494);
}
pub inline fn glUniformMatrix4fv(arg_495: GLint, arg_496: GLsizei, arg_497: GLboolean, arg_498: [*c]const GLfloat) void {
    return glad_glUniformMatrix4fv.?(arg_495, arg_496, arg_497, arg_498);
}
pub inline fn glValidateProgram(arg_499: GLuint) void {
    return glad_glValidateProgram.?(arg_499);
}
pub inline fn glVertexAttrib1d(arg_500: GLuint, arg_501: GLdouble) void {
    return glad_glVertexAttrib1d.?(arg_500, arg_501);
}
pub inline fn glVertexAttrib1dv(arg_502: GLuint, arg_503: [*c]const GLdouble) void {
    return glad_glVertexAttrib1dv.?(arg_502, arg_503);
}
pub inline fn glVertexAttrib1f(arg_504: GLuint, arg_505: GLfloat) void {
    return glad_glVertexAttrib1f.?(arg_504, arg_505);
}
pub inline fn glVertexAttrib1fv(arg_506: GLuint, arg_507: [*c]const GLfloat) void {
    return glad_glVertexAttrib1fv.?(arg_506, arg_507);
}
pub inline fn glVertexAttrib1s(arg_508: GLuint, arg_509: GLshort) void {
    return glad_glVertexAttrib1s.?(arg_508, arg_509);
}
pub inline fn glVertexAttrib1sv(arg_510: GLuint, arg_511: [*c]const GLshort) void {
    return glad_glVertexAttrib1sv.?(arg_510, arg_511);
}
pub inline fn glVertexAttrib2d(arg_512: GLuint, arg_513: GLdouble, arg_514: GLdouble) void {
    return glad_glVertexAttrib2d.?(arg_512, arg_513, arg_514);
}
pub inline fn glVertexAttrib2dv(arg_515: GLuint, arg_516: [*c]const GLdouble) void {
    return glad_glVertexAttrib2dv.?(arg_515, arg_516);
}
pub inline fn glVertexAttrib2f(arg_517: GLuint, arg_518: GLfloat, arg_519: GLfloat) void {
    return glad_glVertexAttrib2f.?(arg_517, arg_518, arg_519);
}
pub inline fn glVertexAttrib2fv(arg_520: GLuint, arg_521: [*c]const GLfloat) void {
    return glad_glVertexAttrib2fv.?(arg_520, arg_521);
}
pub inline fn glVertexAttrib2s(arg_522: GLuint, arg_523: GLshort, arg_524: GLshort) void {
    return glad_glVertexAttrib2s.?(arg_522, arg_523, arg_524);
}
pub inline fn glVertexAttrib2sv(arg_525: GLuint, arg_526: [*c]const GLshort) void {
    return glad_glVertexAttrib2sv.?(arg_525, arg_526);
}
pub inline fn glVertexAttrib3d(arg_527: GLuint, arg_528: GLdouble, arg_529: GLdouble, arg_530: GLdouble) void {
    return glad_glVertexAttrib3d.?(arg_527, arg_528, arg_529, arg_530);
}
pub inline fn glVertexAttrib3dv(arg_531: GLuint, arg_532: [*c]const GLdouble) void {
    return glad_glVertexAttrib3dv.?(arg_531, arg_532);
}
pub inline fn glVertexAttrib3f(arg_533: GLuint, arg_534: GLfloat, arg_535: GLfloat, arg_536: GLfloat) void {
    return glad_glVertexAttrib3f.?(arg_533, arg_534, arg_535, arg_536);
}
pub inline fn glVertexAttrib3fv(arg_537: GLuint, arg_538: [*c]const GLfloat) void {
    return glad_glVertexAttrib3fv.?(arg_537, arg_538);
}
pub inline fn glVertexAttrib3s(arg_539: GLuint, arg_540: GLshort, arg_541: GLshort, arg_542: GLshort) void {
    return glad_glVertexAttrib3s.?(arg_539, arg_540, arg_541, arg_542);
}
pub inline fn glVertexAttrib3sv(arg_543: GLuint, arg_544: [*c]const GLshort) void {
    return glad_glVertexAttrib3sv.?(arg_543, arg_544);
}
pub inline fn glVertexAttrib4Nbv(arg_545: GLuint, arg_546: [*c]const GLbyte) void {
    return glad_glVertexAttrib4Nbv.?(arg_545, arg_546);
}
pub inline fn glVertexAttrib4Niv(arg_547: GLuint, arg_548: [*c]const GLint) void {
    return glad_glVertexAttrib4Niv.?(arg_547, arg_548);
}
pub inline fn glVertexAttrib4Nsv(arg_549: GLuint, arg_550: [*c]const GLshort) void {
    return glad_glVertexAttrib4Nsv.?(arg_549, arg_550);
}
pub inline fn glVertexAttrib4Nub(arg_551: GLuint, arg_552: GLubyte, arg_553: GLubyte, arg_554: GLubyte, arg_555: GLubyte) void {
    return glad_glVertexAttrib4Nub.?(arg_551, arg_552, arg_553, arg_554, arg_555);
}
pub inline fn glVertexAttrib4Nubv(arg_556: GLuint, arg_557: [*c]const GLubyte) void {
    return glad_glVertexAttrib4Nubv.?(arg_556, arg_557);
}
pub inline fn glVertexAttrib4Nuiv(arg_558: GLuint, arg_559: [*c]const GLuint) void {
    return glad_glVertexAttrib4Nuiv.?(arg_558, arg_559);
}
pub inline fn glVertexAttrib4Nusv(arg_560: GLuint, arg_561: [*c]const GLushort) void {
    return glad_glVertexAttrib4Nusv.?(arg_560, arg_561);
}
pub inline fn glVertexAttrib4bv(arg_562: GLuint, arg_563: [*c]const GLbyte) void {
    return glad_glVertexAttrib4bv.?(arg_562, arg_563);
}
pub inline fn glVertexAttrib4d(arg_564: GLuint, arg_565: GLdouble, arg_566: GLdouble, arg_567: GLdouble, arg_568: GLdouble) void {
    return glad_glVertexAttrib4d.?(arg_564, arg_565, arg_566, arg_567, arg_568);
}
pub inline fn glVertexAttrib4dv(arg_569: GLuint, arg_570: [*c]const GLdouble) void {
    return glad_glVertexAttrib4dv.?(arg_569, arg_570);
}
pub inline fn glVertexAttrib4f(arg_571: GLuint, arg_572: GLfloat, arg_573: GLfloat, arg_574: GLfloat, arg_575: GLfloat) void {
    return glad_glVertexAttrib4f.?(arg_571, arg_572, arg_573, arg_574, arg_575);
}
pub inline fn glVertexAttrib4fv(arg_576: GLuint, arg_577: [*c]const GLfloat) void {
    return glad_glVertexAttrib4fv.?(arg_576, arg_577);
}
pub inline fn glVertexAttrib4iv(arg_578: GLuint, arg_579: [*c]const GLint) void {
    return glad_glVertexAttrib4iv.?(arg_578, arg_579);
}
pub inline fn glVertexAttrib4s(arg_580: GLuint, arg_581: GLshort, arg_582: GLshort, arg_583: GLshort, arg_584: GLshort) void {
    return glad_glVertexAttrib4s.?(arg_580, arg_581, arg_582, arg_583, arg_584);
}
pub inline fn glVertexAttrib4sv(arg_585: GLuint, arg_586: [*c]const GLshort) void {
    return glad_glVertexAttrib4sv.?(arg_585, arg_586);
}
pub inline fn glVertexAttrib4ubv(arg_587: GLuint, arg_588: [*c]const GLubyte) void {
    return glad_glVertexAttrib4ubv.?(arg_587, arg_588);
}
pub inline fn glVertexAttrib4uiv(arg_589: GLuint, arg_590: [*c]const GLuint) void {
    return glad_glVertexAttrib4uiv.?(arg_589, arg_590);
}
pub inline fn glVertexAttrib4usv(arg_591: GLuint, arg_592: [*c]const GLushort) void {
    return glad_glVertexAttrib4usv.?(arg_591, arg_592);
}
pub inline fn glVertexAttribPointer(arg_593: GLuint, arg_594: GLint, arg_595: GLenum, arg_596: GLboolean, arg_597: GLsizei, arg_598: ?*const anyopaque) void {
    return glad_glVertexAttribPointer.?(arg_593, arg_594, arg_595, arg_596, arg_597, arg_598);
}
pub const GL_VERSION_2_1 = @as(c_int, 1);
pub inline fn glUniformMatrix2x3fv(arg_599: GLint, arg_600: GLsizei, arg_601: GLboolean, arg_602: [*c]const GLfloat) void {
    return glad_glUniformMatrix2x3fv.?(arg_599, arg_600, arg_601, arg_602);
}
pub inline fn glUniformMatrix3x2fv(arg_603: GLint, arg_604: GLsizei, arg_605: GLboolean, arg_606: [*c]const GLfloat) void {
    return glad_glUniformMatrix3x2fv.?(arg_603, arg_604, arg_605, arg_606);
}
pub inline fn glUniformMatrix2x4fv(arg_607: GLint, arg_608: GLsizei, arg_609: GLboolean, arg_610: [*c]const GLfloat) void {
    return glad_glUniformMatrix2x4fv.?(arg_607, arg_608, arg_609, arg_610);
}
pub inline fn glUniformMatrix4x2fv(arg_611: GLint, arg_612: GLsizei, arg_613: GLboolean, arg_614: [*c]const GLfloat) void {
    return glad_glUniformMatrix4x2fv.?(arg_611, arg_612, arg_613, arg_614);
}
pub inline fn glUniformMatrix3x4fv(arg_615: GLint, arg_616: GLsizei, arg_617: GLboolean, arg_618: [*c]const GLfloat) void {
    return glad_glUniformMatrix3x4fv.?(arg_615, arg_616, arg_617, arg_618);
}
pub inline fn glUniformMatrix4x3fv(arg_619: GLint, arg_620: GLsizei, arg_621: GLboolean, arg_622: [*c]const GLfloat) void {
    return glad_glUniformMatrix4x3fv.?(arg_619, arg_620, arg_621, arg_622);
}
pub const GL_VERSION_3_0 = @as(c_int, 1);
pub inline fn glColorMaski(arg_623: GLuint, arg_624: GLboolean, arg_625: GLboolean, arg_626: GLboolean, arg_627: GLboolean) void {
    return glad_glColorMaski.?(arg_623, arg_624, arg_625, arg_626, arg_627);
}
pub inline fn glGetBooleani_v(arg_628: GLenum, arg_629: GLuint, arg_630: [*c]GLboolean) void {
    return glad_glGetBooleani_v.?(arg_628, arg_629, arg_630);
}
pub inline fn glGetIntegeri_v(arg_631: GLenum, arg_632: GLuint, arg_633: [*c]GLint) void {
    return glad_glGetIntegeri_v.?(arg_631, arg_632, arg_633);
}
pub inline fn glEnablei(arg_634: GLenum, arg_635: GLuint) void {
    return glad_glEnablei.?(arg_634, arg_635);
}
pub inline fn glDisablei(arg_636: GLenum, arg_637: GLuint) void {
    return glad_glDisablei.?(arg_636, arg_637);
}
pub inline fn glIsEnabledi(arg_638: GLenum, arg_639: GLuint) GLboolean {
    return glad_glIsEnabledi.?(arg_638, arg_639);
}
pub inline fn glBeginTransformFeedback(arg_640: GLenum) void {
    return glad_glBeginTransformFeedback.?(arg_640);
}
pub inline fn glEndTransformFeedback() void {
    return glad_glEndTransformFeedback.?();
}
pub inline fn glBindBufferRange(arg_641: GLenum, arg_642: GLuint, arg_643: GLuint, arg_644: GLintptr, arg_645: GLsizeiptr) void {
    return glad_glBindBufferRange.?(arg_641, arg_642, arg_643, arg_644, arg_645);
}
pub inline fn glBindBufferBase(arg_646: GLenum, arg_647: GLuint, arg_648: GLuint) void {
    return glad_glBindBufferBase.?(arg_646, arg_647, arg_648);
}
pub inline fn glTransformFeedbackVaryings(arg_649: GLuint, arg_650: GLsizei, arg_651: [*c]const [*c]const GLchar, arg_652: GLenum) void {
    return glad_glTransformFeedbackVaryings.?(arg_649, arg_650, arg_651, arg_652);
}
pub inline fn glGetTransformFeedbackVarying(arg_653: GLuint, arg_654: GLuint, arg_655: GLsizei, arg_656: [*c]GLsizei, arg_657: [*c]GLsizei, arg_658: [*c]GLenum, arg_659: [*c]GLchar) void {
    return glad_glGetTransformFeedbackVarying.?(arg_653, arg_654, arg_655, arg_656, arg_657, arg_658, arg_659);
}
pub inline fn glClampColor(arg_660: GLenum, arg_661: GLenum) void {
    return glad_glClampColor.?(arg_660, arg_661);
}
pub inline fn glBeginConditionalRender(arg_662: GLuint, arg_663: GLenum) void {
    return glad_glBeginConditionalRender.?(arg_662, arg_663);
}
pub inline fn glEndConditionalRender() void {
    return glad_glEndConditionalRender.?();
}
pub inline fn glVertexAttribIPointer(arg_664: GLuint, arg_665: GLint, arg_666: GLenum, arg_667: GLsizei, arg_668: ?*const anyopaque) void {
    return glad_glVertexAttribIPointer.?(arg_664, arg_665, arg_666, arg_667, arg_668);
}
pub inline fn glGetVertexAttribIiv(arg_669: GLuint, arg_670: GLenum, arg_671: [*c]GLint) void {
    return glad_glGetVertexAttribIiv.?(arg_669, arg_670, arg_671);
}
pub inline fn glGetVertexAttribIuiv(arg_672: GLuint, arg_673: GLenum, arg_674: [*c]GLuint) void {
    return glad_glGetVertexAttribIuiv.?(arg_672, arg_673, arg_674);
}
pub inline fn glVertexAttribI1i(arg_675: GLuint, arg_676: GLint) void {
    return glad_glVertexAttribI1i.?(arg_675, arg_676);
}
pub inline fn glVertexAttribI2i(arg_677: GLuint, arg_678: GLint, arg_679: GLint) void {
    return glad_glVertexAttribI2i.?(arg_677, arg_678, arg_679);
}
pub inline fn glVertexAttribI3i(arg_680: GLuint, arg_681: GLint, arg_682: GLint, arg_683: GLint) void {
    return glad_glVertexAttribI3i.?(arg_680, arg_681, arg_682, arg_683);
}
pub inline fn glVertexAttribI4i(arg_684: GLuint, arg_685: GLint, arg_686: GLint, arg_687: GLint, arg_688: GLint) void {
    return glad_glVertexAttribI4i.?(arg_684, arg_685, arg_686, arg_687, arg_688);
}
pub inline fn glVertexAttribI1ui(arg_689: GLuint, arg_690: GLuint) void {
    return glad_glVertexAttribI1ui.?(arg_689, arg_690);
}
pub inline fn glVertexAttribI2ui(arg_691: GLuint, arg_692: GLuint, arg_693: GLuint) void {
    return glad_glVertexAttribI2ui.?(arg_691, arg_692, arg_693);
}
pub inline fn glVertexAttribI3ui(arg_694: GLuint, arg_695: GLuint, arg_696: GLuint, arg_697: GLuint) void {
    return glad_glVertexAttribI3ui.?(arg_694, arg_695, arg_696, arg_697);
}
pub inline fn glVertexAttribI4ui(arg_698: GLuint, arg_699: GLuint, arg_700: GLuint, arg_701: GLuint, arg_702: GLuint) void {
    return glad_glVertexAttribI4ui.?(arg_698, arg_699, arg_700, arg_701, arg_702);
}
pub inline fn glVertexAttribI1iv(arg_703: GLuint, arg_704: [*c]const GLint) void {
    return glad_glVertexAttribI1iv.?(arg_703, arg_704);
}
pub inline fn glVertexAttribI2iv(arg_705: GLuint, arg_706: [*c]const GLint) void {
    return glad_glVertexAttribI2iv.?(arg_705, arg_706);
}
pub inline fn glVertexAttribI3iv(arg_707: GLuint, arg_708: [*c]const GLint) void {
    return glad_glVertexAttribI3iv.?(arg_707, arg_708);
}
pub inline fn glVertexAttribI4iv(arg_709: GLuint, arg_710: [*c]const GLint) void {
    return glad_glVertexAttribI4iv.?(arg_709, arg_710);
}
pub inline fn glVertexAttribI1uiv(arg_711: GLuint, arg_712: [*c]const GLuint) void {
    return glad_glVertexAttribI1uiv.?(arg_711, arg_712);
}
pub inline fn glVertexAttribI2uiv(arg_713: GLuint, arg_714: [*c]const GLuint) void {
    return glad_glVertexAttribI2uiv.?(arg_713, arg_714);
}
pub inline fn glVertexAttribI3uiv(arg_715: GLuint, arg_716: [*c]const GLuint) void {
    return glad_glVertexAttribI3uiv.?(arg_715, arg_716);
}
pub inline fn glVertexAttribI4uiv(arg_717: GLuint, arg_718: [*c]const GLuint) void {
    return glad_glVertexAttribI4uiv.?(arg_717, arg_718);
}
pub inline fn glVertexAttribI4bv(arg_719: GLuint, arg_720: [*c]const GLbyte) void {
    return glad_glVertexAttribI4bv.?(arg_719, arg_720);
}
pub inline fn glVertexAttribI4sv(arg_721: GLuint, arg_722: [*c]const GLshort) void {
    return glad_glVertexAttribI4sv.?(arg_721, arg_722);
}
pub inline fn glVertexAttribI4ubv(arg_723: GLuint, arg_724: [*c]const GLubyte) void {
    return glad_glVertexAttribI4ubv.?(arg_723, arg_724);
}
pub inline fn glVertexAttribI4usv(arg_725: GLuint, arg_726: [*c]const GLushort) void {
    return glad_glVertexAttribI4usv.?(arg_725, arg_726);
}
pub inline fn glGetUniformuiv(arg_727: GLuint, arg_728: GLint, arg_729: [*c]GLuint) void {
    return glad_glGetUniformuiv.?(arg_727, arg_728, arg_729);
}
pub inline fn glBindFragDataLocation(arg_730: GLuint, arg_731: GLuint, arg_732: [*c]const GLchar) void {
    return glad_glBindFragDataLocation.?(arg_730, arg_731, arg_732);
}
pub inline fn glGetFragDataLocation(arg_733: GLuint, arg_734: [*c]const GLchar) GLint {
    return glad_glGetFragDataLocation.?(arg_733, arg_734);
}
pub inline fn glUniform1ui(arg_735: GLint, arg_736: GLuint) void {
    return glad_glUniform1ui.?(arg_735, arg_736);
}
pub inline fn glUniform2ui(arg_737: GLint, arg_738: GLuint, arg_739: GLuint) void {
    return glad_glUniform2ui.?(arg_737, arg_738, arg_739);
}
pub inline fn glUniform3ui(arg_740: GLint, arg_741: GLuint, arg_742: GLuint, arg_743: GLuint) void {
    return glad_glUniform3ui.?(arg_740, arg_741, arg_742, arg_743);
}
pub inline fn glUniform4ui(arg_744: GLint, arg_745: GLuint, arg_746: GLuint, arg_747: GLuint, arg_748: GLuint) void {
    return glad_glUniform4ui.?(arg_744, arg_745, arg_746, arg_747, arg_748);
}
pub inline fn glUniform1uiv(arg_749: GLint, arg_750: GLsizei, arg_751: [*c]const GLuint) void {
    return glad_glUniform1uiv.?(arg_749, arg_750, arg_751);
}
pub inline fn glUniform2uiv(arg_752: GLint, arg_753: GLsizei, arg_754: [*c]const GLuint) void {
    return glad_glUniform2uiv.?(arg_752, arg_753, arg_754);
}
pub inline fn glUniform3uiv(arg_755: GLint, arg_756: GLsizei, arg_757: [*c]const GLuint) void {
    return glad_glUniform3uiv.?(arg_755, arg_756, arg_757);
}
pub inline fn glUniform4uiv(arg_758: GLint, arg_759: GLsizei, arg_760: [*c]const GLuint) void {
    return glad_glUniform4uiv.?(arg_758, arg_759, arg_760);
}
pub inline fn glTexParameterIiv(arg_761: GLenum, arg_762: GLenum, arg_763: [*c]const GLint) void {
    return glad_glTexParameterIiv.?(arg_761, arg_762, arg_763);
}
pub inline fn glTexParameterIuiv(arg_764: GLenum, arg_765: GLenum, arg_766: [*c]const GLuint) void {
    return glad_glTexParameterIuiv.?(arg_764, arg_765, arg_766);
}
pub inline fn glGetTexParameterIiv(arg_767: GLenum, arg_768: GLenum, arg_769: [*c]GLint) void {
    return glad_glGetTexParameterIiv.?(arg_767, arg_768, arg_769);
}
pub inline fn glGetTexParameterIuiv(arg_770: GLenum, arg_771: GLenum, arg_772: [*c]GLuint) void {
    return glad_glGetTexParameterIuiv.?(arg_770, arg_771, arg_772);
}
pub inline fn glClearBufferiv(arg_773: GLenum, arg_774: GLint, arg_775: [*c]const GLint) void {
    return glad_glClearBufferiv.?(arg_773, arg_774, arg_775);
}
pub inline fn glClearBufferuiv(arg_776: GLenum, arg_777: GLint, arg_778: [*c]const GLuint) void {
    return glad_glClearBufferuiv.?(arg_776, arg_777, arg_778);
}
pub inline fn glClearBufferfv(arg_779: GLenum, arg_780: GLint, arg_781: [*c]const GLfloat) void {
    return glad_glClearBufferfv.?(arg_779, arg_780, arg_781);
}
pub inline fn glClearBufferfi(arg_782: GLenum, arg_783: GLint, arg_784: GLfloat, arg_785: GLint) void {
    return glad_glClearBufferfi.?(arg_782, arg_783, arg_784, arg_785);
}
pub inline fn glGetStringi(arg_786: GLenum, arg_787: GLuint) [*c]const GLubyte {
    return glad_glGetStringi.?(arg_786, arg_787);
}
pub inline fn glIsRenderbuffer(arg_788: GLuint) GLboolean {
    return glad_glIsRenderbuffer.?(arg_788);
}
pub inline fn glBindRenderbuffer(arg_789: GLenum, arg_790: GLuint) void {
    return glad_glBindRenderbuffer.?(arg_789, arg_790);
}
pub inline fn glDeleteRenderbuffers(arg_791: GLsizei, arg_792: [*c]const GLuint) void {
    return glad_glDeleteRenderbuffers.?(arg_791, arg_792);
}
pub inline fn glGenRenderbuffers(arg_793: GLsizei, arg_794: [*c]GLuint) void {
    return glad_glGenRenderbuffers.?(arg_793, arg_794);
}
pub inline fn glRenderbufferStorage(arg_795: GLenum, arg_796: GLenum, arg_797: GLsizei, arg_798: GLsizei) void {
    return glad_glRenderbufferStorage.?(arg_795, arg_796, arg_797, arg_798);
}
pub inline fn glGetRenderbufferParameteriv(arg_799: GLenum, arg_800: GLenum, arg_801: [*c]GLint) void {
    return glad_glGetRenderbufferParameteriv.?(arg_799, arg_800, arg_801);
}
pub inline fn glIsFramebuffer(arg_802: GLuint) GLboolean {
    return glad_glIsFramebuffer.?(arg_802);
}
pub inline fn glBindFramebuffer(arg_803: GLenum, arg_804: GLuint) void {
    return glad_glBindFramebuffer.?(arg_803, arg_804);
}
pub inline fn glDeleteFramebuffers(arg_805: GLsizei, arg_806: [*c]const GLuint) void {
    return glad_glDeleteFramebuffers.?(arg_805, arg_806);
}
pub inline fn glGenFramebuffers(arg_807: GLsizei, arg_808: [*c]GLuint) void {
    return glad_glGenFramebuffers.?(arg_807, arg_808);
}
pub inline fn glCheckFramebufferStatus(arg_809: GLenum) GLenum {
    return glad_glCheckFramebufferStatus.?(arg_809);
}
pub inline fn glFramebufferTexture1D(arg_810: GLenum, arg_811: GLenum, arg_812: GLenum, arg_813: GLuint, arg_814: GLint) void {
    return glad_glFramebufferTexture1D.?(arg_810, arg_811, arg_812, arg_813, arg_814);
}
pub inline fn glFramebufferTexture2D(arg_815: GLenum, arg_816: GLenum, arg_817: GLenum, arg_818: GLuint, arg_819: GLint) void {
    return glad_glFramebufferTexture2D.?(arg_815, arg_816, arg_817, arg_818, arg_819);
}
pub inline fn glFramebufferTexture3D(arg_820: GLenum, arg_821: GLenum, arg_822: GLenum, arg_823: GLuint, arg_824: GLint, arg_825: GLint) void {
    return glad_glFramebufferTexture3D.?(arg_820, arg_821, arg_822, arg_823, arg_824, arg_825);
}
pub inline fn glFramebufferRenderbuffer(arg_826: GLenum, arg_827: GLenum, arg_828: GLenum, arg_829: GLuint) void {
    return glad_glFramebufferRenderbuffer.?(arg_826, arg_827, arg_828, arg_829);
}
pub inline fn glGetFramebufferAttachmentParameteriv(arg_830: GLenum, arg_831: GLenum, arg_832: GLenum, arg_833: [*c]GLint) void {
    return glad_glGetFramebufferAttachmentParameteriv.?(arg_830, arg_831, arg_832, arg_833);
}
pub inline fn glGenerateMipmap(arg_834: GLenum) void {
    return glad_glGenerateMipmap.?(arg_834);
}
pub inline fn glBlitFramebuffer(arg_835: GLint, arg_836: GLint, arg_837: GLint, arg_838: GLint, arg_839: GLint, arg_840: GLint, arg_841: GLint, arg_842: GLint, arg_843: GLbitfield, arg_844: GLenum) void {
    return glad_glBlitFramebuffer.?(arg_835, arg_836, arg_837, arg_838, arg_839, arg_840, arg_841, arg_842, arg_843, arg_844);
}
pub inline fn glRenderbufferStorageMultisample(arg_845: GLenum, arg_846: GLsizei, arg_847: GLenum, arg_848: GLsizei, arg_849: GLsizei) void {
    return glad_glRenderbufferStorageMultisample.?(arg_845, arg_846, arg_847, arg_848, arg_849);
}
pub inline fn glFramebufferTextureLayer(arg_850: GLenum, arg_851: GLenum, arg_852: GLuint, arg_853: GLint, arg_854: GLint) void {
    return glad_glFramebufferTextureLayer.?(arg_850, arg_851, arg_852, arg_853, arg_854);
}
pub inline fn glMapBufferRange(arg_855: GLenum, arg_856: GLintptr, arg_857: GLsizeiptr, arg_858: GLbitfield) ?*anyopaque {
    return glad_glMapBufferRange.?(arg_855, arg_856, arg_857, arg_858);
}
pub inline fn glFlushMappedBufferRange(arg_859: GLenum, arg_860: GLintptr, arg_861: GLsizeiptr) void {
    return glad_glFlushMappedBufferRange.?(arg_859, arg_860, arg_861);
}
pub inline fn glBindVertexArray(arg_862: GLuint) void {
    return glad_glBindVertexArray.?(arg_862);
}
pub inline fn glDeleteVertexArrays(arg_863: GLsizei, arg_864: [*c]const GLuint) void {
    return glad_glDeleteVertexArrays.?(arg_863, arg_864);
}
pub inline fn glGenVertexArrays(arg_865: GLsizei, arg_866: [*c]GLuint) void {
    return glad_glGenVertexArrays.?(arg_865, arg_866);
}
pub inline fn glIsVertexArray(arg_867: GLuint) GLboolean {
    return glad_glIsVertexArray.?(arg_867);
}
pub const GL_VERSION_3_1 = @as(c_int, 1);
pub inline fn glDrawArraysInstanced(arg_868: GLenum, arg_869: GLint, arg_870: GLsizei, arg_871: GLsizei) void {
    return glad_glDrawArraysInstanced.?(arg_868, arg_869, arg_870, arg_871);
}
pub inline fn glDrawElementsInstanced(arg_872: GLenum, arg_873: GLsizei, arg_874: GLenum, arg_875: ?*const anyopaque, arg_876: GLsizei) void {
    return glad_glDrawElementsInstanced.?(arg_872, arg_873, arg_874, arg_875, arg_876);
}
pub inline fn glTexBuffer(arg_877: GLenum, arg_878: GLenum, arg_879: GLuint) void {
    return glad_glTexBuffer.?(arg_877, arg_878, arg_879);
}
pub inline fn glPrimitiveRestartIndex(arg_880: GLuint) void {
    return glad_glPrimitiveRestartIndex.?(arg_880);
}
pub inline fn glCopyBufferSubData(arg_881: GLenum, arg_882: GLenum, arg_883: GLintptr, arg_884: GLintptr, arg_885: GLsizeiptr) void {
    return glad_glCopyBufferSubData.?(arg_881, arg_882, arg_883, arg_884, arg_885);
}
pub inline fn glGetUniformIndices(arg_886: GLuint, arg_887: GLsizei, arg_888: [*c]const [*c]const GLchar, arg_889: [*c]GLuint) void {
    return glad_glGetUniformIndices.?(arg_886, arg_887, arg_888, arg_889);
}
pub inline fn glGetActiveUniformsiv(arg_890: GLuint, arg_891: GLsizei, arg_892: [*c]const GLuint, arg_893: GLenum, arg_894: [*c]GLint) void {
    return glad_glGetActiveUniformsiv.?(arg_890, arg_891, arg_892, arg_893, arg_894);
}
pub inline fn glGetActiveUniformName(arg_895: GLuint, arg_896: GLuint, arg_897: GLsizei, arg_898: [*c]GLsizei, arg_899: [*c]GLchar) void {
    return glad_glGetActiveUniformName.?(arg_895, arg_896, arg_897, arg_898, arg_899);
}
pub inline fn glGetUniformBlockIndex(arg_900: GLuint, arg_901: [*c]const GLchar) GLuint {
    return glad_glGetUniformBlockIndex.?(arg_900, arg_901);
}
pub inline fn glGetActiveUniformBlockiv(arg_902: GLuint, arg_903: GLuint, arg_904: GLenum, arg_905: [*c]GLint) void {
    return glad_glGetActiveUniformBlockiv.?(arg_902, arg_903, arg_904, arg_905);
}
pub inline fn glGetActiveUniformBlockName(arg_906: GLuint, arg_907: GLuint, arg_908: GLsizei, arg_909: [*c]GLsizei, arg_910: [*c]GLchar) void {
    return glad_glGetActiveUniformBlockName.?(arg_906, arg_907, arg_908, arg_909, arg_910);
}
pub inline fn glUniformBlockBinding(arg_911: GLuint, arg_912: GLuint, arg_913: GLuint) void {
    return glad_glUniformBlockBinding.?(arg_911, arg_912, arg_913);
}
pub const GL_VERSION_3_2 = @as(c_int, 1);
pub inline fn glDrawElementsBaseVertex(arg_914: GLenum, arg_915: GLsizei, arg_916: GLenum, arg_917: ?*const anyopaque, arg_918: GLint) void {
    return glad_glDrawElementsBaseVertex.?(arg_914, arg_915, arg_916, arg_917, arg_918);
}
pub inline fn glDrawRangeElementsBaseVertex(arg_919: GLenum, arg_920: GLuint, arg_921: GLuint, arg_922: GLsizei, arg_923: GLenum, arg_924: ?*const anyopaque, arg_925: GLint) void {
    return glad_glDrawRangeElementsBaseVertex.?(arg_919, arg_920, arg_921, arg_922, arg_923, arg_924, arg_925);
}
pub inline fn glDrawElementsInstancedBaseVertex(arg_926: GLenum, arg_927: GLsizei, arg_928: GLenum, arg_929: ?*const anyopaque, arg_930: GLsizei, arg_931: GLint) void {
    return glad_glDrawElementsInstancedBaseVertex.?(arg_926, arg_927, arg_928, arg_929, arg_930, arg_931);
}
pub inline fn glMultiDrawElementsBaseVertex(arg_932: GLenum, arg_933: [*c]const GLsizei, arg_934: GLenum, arg_935: [*c]const ?*const anyopaque, arg_936: GLsizei, arg_937: [*c]const GLint) void {
    return glad_glMultiDrawElementsBaseVertex.?(arg_932, arg_933, arg_934, arg_935, arg_936, arg_937);
}
pub inline fn glProvokingVertex(arg_938: GLenum) void {
    return glad_glProvokingVertex.?(arg_938);
}
pub inline fn glFenceSync(arg_939: GLenum, arg_940: GLbitfield) GLsync {
    return glad_glFenceSync.?(arg_939, arg_940);
}
pub inline fn glIsSync(arg_941: GLsync) GLboolean {
    return glad_glIsSync.?(arg_941);
}
pub inline fn glDeleteSync(arg_942: GLsync) void {
    return glad_glDeleteSync.?(arg_942);
}
pub inline fn glClientWaitSync(arg_943: GLsync, arg_944: GLbitfield, arg_945: GLuint64) GLenum {
    return glad_glClientWaitSync.?(arg_943, arg_944, arg_945);
}
pub inline fn glWaitSync(arg_946: GLsync, arg_947: GLbitfield, arg_948: GLuint64) void {
    return glad_glWaitSync.?(arg_946, arg_947, arg_948);
}
pub inline fn glGetInteger64v(arg_949: GLenum, arg_950: [*c]GLint64) void {
    return glad_glGetInteger64v.?(arg_949, arg_950);
}
pub inline fn glGetSynciv(arg_951: GLsync, arg_952: GLenum, arg_953: GLsizei, arg_954: [*c]GLsizei, arg_955: [*c]GLint) void {
    return glad_glGetSynciv.?(arg_951, arg_952, arg_953, arg_954, arg_955);
}
pub inline fn glGetInteger64i_v(arg_956: GLenum, arg_957: GLuint, arg_958: [*c]GLint64) void {
    return glad_glGetInteger64i_v.?(arg_956, arg_957, arg_958);
}
pub inline fn glGetBufferParameteri64v(arg_959: GLenum, arg_960: GLenum, arg_961: [*c]GLint64) void {
    return glad_glGetBufferParameteri64v.?(arg_959, arg_960, arg_961);
}
pub inline fn glFramebufferTexture(arg_962: GLenum, arg_963: GLenum, arg_964: GLuint, arg_965: GLint) void {
    return glad_glFramebufferTexture.?(arg_962, arg_963, arg_964, arg_965);
}
pub inline fn glTexImage2DMultisample(arg_966: GLenum, arg_967: GLsizei, arg_968: GLenum, arg_969: GLsizei, arg_970: GLsizei, arg_971: GLboolean) void {
    return glad_glTexImage2DMultisample.?(arg_966, arg_967, arg_968, arg_969, arg_970, arg_971);
}
pub inline fn glTexImage3DMultisample(arg_972: GLenum, arg_973: GLsizei, arg_974: GLenum, arg_975: GLsizei, arg_976: GLsizei, arg_977: GLsizei, arg_978: GLboolean) void {
    return glad_glTexImage3DMultisample.?(arg_972, arg_973, arg_974, arg_975, arg_976, arg_977, arg_978);
}
pub inline fn glGetMultisamplefv(arg_979: GLenum, arg_980: GLuint, arg_981: [*c]GLfloat) void {
    return glad_glGetMultisamplefv.?(arg_979, arg_980, arg_981);
}
pub inline fn glSampleMaski(arg_982: GLuint, arg_983: GLbitfield) void {
    return glad_glSampleMaski.?(arg_982, arg_983);
}
pub const GL_VERSION_3_3 = @as(c_int, 1);
pub inline fn glBindFragDataLocationIndexed(arg_984: GLuint, arg_985: GLuint, arg_986: GLuint, arg_987: [*c]const GLchar) void {
    return glad_glBindFragDataLocationIndexed.?(arg_984, arg_985, arg_986, arg_987);
}
pub inline fn glGetFragDataIndex(arg_988: GLuint, arg_989: [*c]const GLchar) GLint {
    return glad_glGetFragDataIndex.?(arg_988, arg_989);
}
pub inline fn glGenSamplers(arg_990: GLsizei, arg_991: [*c]GLuint) void {
    return glad_glGenSamplers.?(arg_990, arg_991);
}
pub inline fn glDeleteSamplers(arg_992: GLsizei, arg_993: [*c]const GLuint) void {
    return glad_glDeleteSamplers.?(arg_992, arg_993);
}
pub inline fn glIsSampler(arg_994: GLuint) GLboolean {
    return glad_glIsSampler.?(arg_994);
}
pub inline fn glBindSampler(arg_995: GLuint, arg_996: GLuint) void {
    return glad_glBindSampler.?(arg_995, arg_996);
}
pub inline fn glSamplerParameteri(arg_997: GLuint, arg_998: GLenum, arg_999: GLint) void {
    return glad_glSamplerParameteri.?(arg_997, arg_998, arg_999);
}
pub inline fn glSamplerParameteriv(arg_1000: GLuint, arg_1001: GLenum, arg_1002: [*c]const GLint) void {
    return glad_glSamplerParameteriv.?(arg_1000, arg_1001, arg_1002);
}
pub inline fn glSamplerParameterf(arg_1003: GLuint, arg_1004: GLenum, arg_1005: GLfloat) void {
    return glad_glSamplerParameterf.?(arg_1003, arg_1004, arg_1005);
}
pub inline fn glSamplerParameterfv(arg_1006: GLuint, arg_1007: GLenum, arg_1008: [*c]const GLfloat) void {
    return glad_glSamplerParameterfv.?(arg_1006, arg_1007, arg_1008);
}
pub inline fn glSamplerParameterIiv(arg_1009: GLuint, arg_1010: GLenum, arg_1011: [*c]const GLint) void {
    return glad_glSamplerParameterIiv.?(arg_1009, arg_1010, arg_1011);
}
pub inline fn glSamplerParameterIuiv(arg_1012: GLuint, arg_1013: GLenum, arg_1014: [*c]const GLuint) void {
    return glad_glSamplerParameterIuiv.?(arg_1012, arg_1013, arg_1014);
}
pub inline fn glGetSamplerParameteriv(arg_1015: GLuint, arg_1016: GLenum, arg_1017: [*c]GLint) void {
    return glad_glGetSamplerParameteriv.?(arg_1015, arg_1016, arg_1017);
}
pub inline fn glGetSamplerParameterIiv(arg_1018: GLuint, arg_1019: GLenum, arg_1020: [*c]GLint) void {
    return glad_glGetSamplerParameterIiv.?(arg_1018, arg_1019, arg_1020);
}
pub inline fn glGetSamplerParameterfv(arg_1021: GLuint, arg_1022: GLenum, arg_1023: [*c]GLfloat) void {
    return glad_glGetSamplerParameterfv.?(arg_1021, arg_1022, arg_1023);
}
pub inline fn glGetSamplerParameterIuiv(arg_1024: GLuint, arg_1025: GLenum, arg_1026: [*c]GLuint) void {
    return glad_glGetSamplerParameterIuiv.?(arg_1024, arg_1025, arg_1026);
}
pub inline fn glQueryCounter(arg_1027: GLuint, arg_1028: GLenum) void {
    return glad_glQueryCounter.?(arg_1027, arg_1028);
}
pub inline fn glGetQueryObjecti64v(arg_1029: GLuint, arg_1030: GLenum, arg_1031: [*c]GLint64) void {
    return glad_glGetQueryObjecti64v.?(arg_1029, arg_1030, arg_1031);
}
pub inline fn glGetQueryObjectui64v(arg_1032: GLuint, arg_1033: GLenum, arg_1034: [*c]GLuint64) void {
    return glad_glGetQueryObjectui64v.?(arg_1032, arg_1033, arg_1034);
}
pub inline fn glVertexAttribDivisor(arg_1035: GLuint, arg_1036: GLuint) void {
    return glad_glVertexAttribDivisor.?(arg_1035, arg_1036);
}
pub inline fn glVertexAttribP1ui(arg_1037: GLuint, arg_1038: GLenum, arg_1039: GLboolean, arg_1040: GLuint) void {
    return glad_glVertexAttribP1ui.?(arg_1037, arg_1038, arg_1039, arg_1040);
}
pub inline fn glVertexAttribP1uiv(arg_1041: GLuint, arg_1042: GLenum, arg_1043: GLboolean, arg_1044: [*c]const GLuint) void {
    return glad_glVertexAttribP1uiv.?(arg_1041, arg_1042, arg_1043, arg_1044);
}
pub inline fn glVertexAttribP2ui(arg_1045: GLuint, arg_1046: GLenum, arg_1047: GLboolean, arg_1048: GLuint) void {
    return glad_glVertexAttribP2ui.?(arg_1045, arg_1046, arg_1047, arg_1048);
}
pub inline fn glVertexAttribP2uiv(arg_1049: GLuint, arg_1050: GLenum, arg_1051: GLboolean, arg_1052: [*c]const GLuint) void {
    return glad_glVertexAttribP2uiv.?(arg_1049, arg_1050, arg_1051, arg_1052);
}
pub inline fn glVertexAttribP3ui(arg_1053: GLuint, arg_1054: GLenum, arg_1055: GLboolean, arg_1056: GLuint) void {
    return glad_glVertexAttribP3ui.?(arg_1053, arg_1054, arg_1055, arg_1056);
}
pub inline fn glVertexAttribP3uiv(arg_1057: GLuint, arg_1058: GLenum, arg_1059: GLboolean, arg_1060: [*c]const GLuint) void {
    return glad_glVertexAttribP3uiv.?(arg_1057, arg_1058, arg_1059, arg_1060);
}
pub inline fn glVertexAttribP4ui(arg_1061: GLuint, arg_1062: GLenum, arg_1063: GLboolean, arg_1064: GLuint) void {
    return glad_glVertexAttribP4ui.?(arg_1061, arg_1062, arg_1063, arg_1064);
}
pub inline fn glVertexAttribP4uiv(arg_1065: GLuint, arg_1066: GLenum, arg_1067: GLboolean, arg_1068: [*c]const GLuint) void {
    return glad_glVertexAttribP4uiv.?(arg_1065, arg_1066, arg_1067, arg_1068);
}
pub inline fn glVertexP2ui(arg_1069: GLenum, arg_1070: GLuint) void {
    return glad_glVertexP2ui.?(arg_1069, arg_1070);
}
pub inline fn glVertexP2uiv(arg_1071: GLenum, arg_1072: [*c]const GLuint) void {
    return glad_glVertexP2uiv.?(arg_1071, arg_1072);
}
pub inline fn glVertexP3ui(arg_1073: GLenum, arg_1074: GLuint) void {
    return glad_glVertexP3ui.?(arg_1073, arg_1074);
}
pub inline fn glVertexP3uiv(arg_1075: GLenum, arg_1076: [*c]const GLuint) void {
    return glad_glVertexP3uiv.?(arg_1075, arg_1076);
}
pub inline fn glVertexP4ui(arg_1077: GLenum, arg_1078: GLuint) void {
    return glad_glVertexP4ui.?(arg_1077, arg_1078);
}
pub inline fn glVertexP4uiv(arg_1079: GLenum, arg_1080: [*c]const GLuint) void {
    return glad_glVertexP4uiv.?(arg_1079, arg_1080);
}
pub inline fn glTexCoordP1ui(arg_1081: GLenum, arg_1082: GLuint) void {
    return glad_glTexCoordP1ui.?(arg_1081, arg_1082);
}
pub inline fn glTexCoordP1uiv(arg_1083: GLenum, arg_1084: [*c]const GLuint) void {
    return glad_glTexCoordP1uiv.?(arg_1083, arg_1084);
}
pub inline fn glTexCoordP2ui(arg_1085: GLenum, arg_1086: GLuint) void {
    return glad_glTexCoordP2ui.?(arg_1085, arg_1086);
}
pub inline fn glTexCoordP2uiv(arg_1087: GLenum, arg_1088: [*c]const GLuint) void {
    return glad_glTexCoordP2uiv.?(arg_1087, arg_1088);
}
pub inline fn glTexCoordP3ui(arg_1089: GLenum, arg_1090: GLuint) void {
    return glad_glTexCoordP3ui.?(arg_1089, arg_1090);
}
pub inline fn glTexCoordP3uiv(arg_1091: GLenum, arg_1092: [*c]const GLuint) void {
    return glad_glTexCoordP3uiv.?(arg_1091, arg_1092);
}
pub inline fn glTexCoordP4ui(arg_1093: GLenum, arg_1094: GLuint) void {
    return glad_glTexCoordP4ui.?(arg_1093, arg_1094);
}
pub inline fn glTexCoordP4uiv(arg_1095: GLenum, arg_1096: [*c]const GLuint) void {
    return glad_glTexCoordP4uiv.?(arg_1095, arg_1096);
}
pub inline fn glMultiTexCoordP1ui(arg_1097: GLenum, arg_1098: GLenum, arg_1099: GLuint) void {
    return glad_glMultiTexCoordP1ui.?(arg_1097, arg_1098, arg_1099);
}
pub inline fn glMultiTexCoordP1uiv(arg_1100: GLenum, arg_1101: GLenum, arg_1102: [*c]const GLuint) void {
    return glad_glMultiTexCoordP1uiv.?(arg_1100, arg_1101, arg_1102);
}
pub inline fn glMultiTexCoordP2ui(arg_1103: GLenum, arg_1104: GLenum, arg_1105: GLuint) void {
    return glad_glMultiTexCoordP2ui.?(arg_1103, arg_1104, arg_1105);
}
pub inline fn glMultiTexCoordP2uiv(arg_1106: GLenum, arg_1107: GLenum, arg_1108: [*c]const GLuint) void {
    return glad_glMultiTexCoordP2uiv.?(arg_1106, arg_1107, arg_1108);
}
pub inline fn glMultiTexCoordP3ui(arg_1109: GLenum, arg_1110: GLenum, arg_1111: GLuint) void {
    return glad_glMultiTexCoordP3ui.?(arg_1109, arg_1110, arg_1111);
}
pub inline fn glMultiTexCoordP3uiv(arg_1112: GLenum, arg_1113: GLenum, arg_1114: [*c]const GLuint) void {
    return glad_glMultiTexCoordP3uiv.?(arg_1112, arg_1113, arg_1114);
}
pub inline fn glMultiTexCoordP4ui(arg_1115: GLenum, arg_1116: GLenum, arg_1117: GLuint) void {
    return glad_glMultiTexCoordP4ui.?(arg_1115, arg_1116, arg_1117);
}
pub inline fn glMultiTexCoordP4uiv(arg_1118: GLenum, arg_1119: GLenum, arg_1120: [*c]const GLuint) void {
    return glad_glMultiTexCoordP4uiv.?(arg_1118, arg_1119, arg_1120);
}
pub inline fn glNormalP3ui(arg_1121: GLenum, arg_1122: GLuint) void {
    return glad_glNormalP3ui.?(arg_1121, arg_1122);
}
pub inline fn glNormalP3uiv(arg_1123: GLenum, arg_1124: [*c]const GLuint) void {
    return glad_glNormalP3uiv.?(arg_1123, arg_1124);
}
pub inline fn glColorP3ui(arg_1125: GLenum, arg_1126: GLuint) void {
    return glad_glColorP3ui.?(arg_1125, arg_1126);
}
pub inline fn glColorP3uiv(arg_1127: GLenum, arg_1128: [*c]const GLuint) void {
    return glad_glColorP3uiv.?(arg_1127, arg_1128);
}
pub inline fn glColorP4ui(arg_1129: GLenum, arg_1130: GLuint) void {
    return glad_glColorP4ui.?(arg_1129, arg_1130);
}
pub inline fn glColorP4uiv(arg_1131: GLenum, arg_1132: [*c]const GLuint) void {
    return glad_glColorP4uiv.?(arg_1131, arg_1132);
}
pub inline fn glSecondaryColorP3ui(arg_1133: GLenum, arg_1134: GLuint) void {
    return glad_glSecondaryColorP3ui.?(arg_1133, arg_1134);
}
pub inline fn glSecondaryColorP3uiv(arg_1135: GLenum, arg_1136: [*c]const GLuint) void {
    return glad_glSecondaryColorP3uiv.?(arg_1135, arg_1136);
}
