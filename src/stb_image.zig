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
const struct__iobuf = extern struct {
    _ptr: [*c]u8,
    _cnt: c_int,
    _base: [*c]u8,
    _flag: c_int,
    _file: c_int,
    _charbuf: c_int,
    _bufsiz: c_int,
    _tmpfname: [*c]u8,
};
const FILE = struct__iobuf;
const _off_t = c_long;
const off32_t = c_long;
const _off64_t = c_longlong;
const off64_t = c_longlong;
const off_t = off32_t;
extern fn __acrt_iob_func(index: c_uint) [*c]FILE;
extern fn __iob_func() [*c]FILE;
const fpos_t = c_longlong;
extern fn __mingw_sscanf(noalias _Src: [*c]const u8, noalias _Format: [*c]const u8, ...) c_int;
extern fn __mingw_vsscanf(noalias _Str: [*c]const u8, noalias Format: [*c]const u8, argp: va_list) c_int;
extern fn __mingw_scanf(noalias _Format: [*c]const u8, ...) c_int;
extern fn __mingw_vscanf(noalias Format: [*c]const u8, argp: va_list) c_int;
extern fn __mingw_fscanf(noalias _File: [*c]FILE, noalias _Format: [*c]const u8, ...) c_int;
extern fn __mingw_vfscanf(noalias fp: [*c]FILE, noalias Format: [*c]const u8, argp: va_list) c_int;
extern fn __mingw_vsnprintf(noalias _DstBuf: [*c]u8, _MaxCount: usize, noalias _Format: [*c]const u8, _ArgList: va_list) c_int;
extern fn __mingw_snprintf(noalias s: [*c]u8, n: usize, noalias format: [*c]const u8, ...) c_int;
const __mingw_printf = @compileError("unable to resolve function type TypeClass.MacroQualified"); // C:\zig\lib\zig\libc\include\any-windows-any\stdio.h:170:15
const __mingw_vprintf = @compileError("unable to resolve function type TypeClass.MacroQualified"); // C:\zig\lib\zig\libc\include\any-windows-any\stdio.h:173:15
const __mingw_fprintf = @compileError("unable to resolve function type TypeClass.MacroQualified"); // C:\zig\lib\zig\libc\include\any-windows-any\stdio.h:176:15
const __mingw_vfprintf = @compileError("unable to resolve function type TypeClass.MacroQualified"); // C:\zig\lib\zig\libc\include\any-windows-any\stdio.h:179:15
const __mingw_sprintf = @compileError("unable to resolve function type TypeClass.MacroQualified"); // C:\zig\lib\zig\libc\include\any-windows-any\stdio.h:182:15
const __mingw_vsprintf = @compileError("unable to resolve function type TypeClass.MacroQualified"); // C:\zig\lib\zig\libc\include\any-windows-any\stdio.h:185:15
const __mingw_asprintf = @compileError("unable to resolve function type TypeClass.MacroQualified"); // C:\zig\lib\zig\libc\include\any-windows-any\stdio.h:188:15
const __mingw_vasprintf = @compileError("unable to resolve function type TypeClass.MacroQualified"); // C:\zig\lib\zig\libc\include\any-windows-any\stdio.h:191:15
extern fn __ms_sscanf(noalias _Src: [*c]const u8, noalias _Format: [*c]const u8, ...) c_int;
extern fn __ms_scanf(noalias _Format: [*c]const u8, ...) c_int;
extern fn __ms_fscanf(noalias _File: [*c]FILE, noalias _Format: [*c]const u8, ...) c_int;
const __ms_printf = @compileError("unable to resolve function type TypeClass.MacroQualified"); // C:\zig\lib\zig\libc\include\any-windows-any\stdio.h:205:15
const __ms_vprintf = @compileError("unable to resolve function type TypeClass.MacroQualified"); // C:\zig\lib\zig\libc\include\any-windows-any\stdio.h:208:15
const __ms_fprintf = @compileError("unable to resolve function type TypeClass.MacroQualified"); // C:\zig\lib\zig\libc\include\any-windows-any\stdio.h:211:15
const __ms_vfprintf = @compileError("unable to resolve function type TypeClass.MacroQualified"); // C:\zig\lib\zig\libc\include\any-windows-any\stdio.h:214:15
const __ms_sprintf = @compileError("unable to resolve function type TypeClass.MacroQualified"); // C:\zig\lib\zig\libc\include\any-windows-any\stdio.h:217:15
const __ms_vsprintf = @compileError("unable to resolve function type TypeClass.MacroQualified"); // C:\zig\lib\zig\libc\include\any-windows-any\stdio.h:220:15
// C:\zig\lib\zig\libc\include\any-windows-any\stdio.h:276:5: warning: TODO unable to translate variadic function, demoted to extern
extern fn sscanf(__source: [*c]const u8, __format: [*c]const u8, ...) c_int; // C:\zig\lib\zig\libc\include\any-windows-any\stdio.h:287:5: warning: TODO unable to translate variadic function, demoted to extern
extern fn scanf(__format: [*c]const u8, ...) c_int; // C:\zig\lib\zig\libc\include\any-windows-any\stdio.h:298:5: warning: TODO unable to translate variadic function, demoted to extern
extern fn fscanf(__stream: [*c]FILE, __format: [*c]const u8, ...) c_int;
fn vsscanf(arg___source: [*c]const u8, arg___format: [*c]const u8, arg___local_argv: __builtin_va_list) callconv(.C) c_int {
    var __source = arg___source;
    var __format = arg___format;
    var __local_argv = arg___local_argv;
    return __mingw_vsscanf(__source, __format, __local_argv);
}
fn vscanf(arg___format: [*c]const u8, arg___local_argv: __builtin_va_list) callconv(.C) c_int {
    var __format = arg___format;
    var __local_argv = arg___local_argv;
    return __mingw_vfscanf(__acrt_iob_func(@bitCast(c_uint, @as(c_int, 0))), __format, __local_argv);
}
fn vfscanf(arg___stream: [*c]FILE, arg___format: [*c]const u8, arg___local_argv: __builtin_va_list) callconv(.C) c_int {
    var __stream = arg___stream;
    var __format = arg___format;
    var __local_argv = arg___local_argv;
    return __mingw_vfscanf(__stream, __format, __local_argv);
} // C:\zig\lib\zig\libc\include\any-windows-any\stdio.h:343:5: warning: TODO unable to translate variadic function, demoted to extern
extern fn fprintf(__stream: [*c]FILE, __format: [*c]const u8, ...) c_int; // C:\zig\lib\zig\libc\include\any-windows-any\stdio.h:354:5: warning: TODO unable to translate variadic function, demoted to extern
extern fn printf(__format: [*c]const u8, ...) c_int; // C:\zig\lib\zig\libc\include\any-windows-any\stdio.h:382:5: warning: TODO unable to translate variadic function, demoted to extern
extern fn sprintf(__stream: [*c]u8, __format: [*c]const u8, ...) c_int;
fn vfprintf(arg___stream: [*c]FILE, arg___format: [*c]const u8, arg___local_argv: __builtin_va_list) callconv(.C) c_int {
    var __stream = arg___stream;
    var __format = arg___format;
    var __local_argv = arg___local_argv;
    return __mingw_vfprintf(__stream, __format, __local_argv);
}
fn vprintf(arg___format: [*c]const u8, arg___local_argv: __builtin_va_list) callconv(.C) c_int {
    var __format = arg___format;
    var __local_argv = arg___local_argv;
    return __mingw_vfprintf(__acrt_iob_func(@bitCast(c_uint, @as(c_int, 1))), __format, __local_argv);
}
fn vsprintf(arg___stream: [*c]u8, arg___format: [*c]const u8, arg___local_argv: __builtin_va_list) callconv(.C) c_int {
    var __stream = arg___stream;
    var __format = arg___format;
    var __local_argv = arg___local_argv;
    return __mingw_vsprintf(__stream, __format, __local_argv);
} // C:\zig\lib\zig\libc\include\any-windows-any\stdio.h:437:5: warning: TODO unable to translate variadic function, demoted to extern
extern fn snprintf(__stream: [*c]u8, __n: usize, __format: [*c]const u8, ...) c_int;
fn vsnprintf(arg___stream: [*c]u8, arg___n: usize, arg___format: [*c]const u8, arg___local_argv: __builtin_va_list) callconv(.C) c_int {
    var __stream = arg___stream;
    var __n = arg___n;
    var __format = arg___format;
    var __local_argv = arg___local_argv;
    return __mingw_vsnprintf(__stream, __n, __format, __local_argv);
}
extern fn _filbuf(_File: [*c]FILE) c_int;
extern fn _flsbuf(_Ch: c_int, _File: [*c]FILE) c_int;
extern fn _fsopen(_Filename: [*c]const u8, _Mode: [*c]const u8, _ShFlag: c_int) [*c]FILE;
extern fn clearerr(_File: [*c]FILE) void;
extern fn fclose(_File: [*c]FILE) c_int;
extern fn _fcloseall() c_int;
extern fn _fdopen(_FileHandle: c_int, _Mode: [*c]const u8) [*c]FILE;
extern fn feof(_File: [*c]FILE) c_int;
extern fn ferror(_File: [*c]FILE) c_int;
extern fn fflush(_File: [*c]FILE) c_int;
extern fn fgetc(_File: [*c]FILE) c_int;
extern fn _fgetchar() c_int;
extern fn fgetpos(noalias _File: [*c]FILE, noalias _Pos: [*c]fpos_t) c_int;
extern fn fgetpos64(noalias _File: [*c]FILE, noalias _Pos: [*c]fpos_t) c_int;
extern fn fgets(noalias _Buf: [*c]u8, _MaxCount: c_int, noalias _File: [*c]FILE) [*c]u8;
extern fn _fileno(_File: [*c]FILE) c_int;
extern fn _tempnam(_DirName: [*c]const u8, _FilePrefix: [*c]const u8) [*c]u8;
extern fn _flushall() c_int;
extern fn fopen(_Filename: [*c]const u8, _Mode: [*c]const u8) [*c]FILE;
extern fn fopen64(noalias filename: [*c]const u8, noalias mode: [*c]const u8) [*c]FILE;
extern fn fputc(_Ch: c_int, _File: [*c]FILE) c_int;
extern fn _fputchar(_Ch: c_int) c_int;
extern fn fputs(noalias _Str: [*c]const u8, noalias _File: [*c]FILE) c_int;
extern fn fread(_DstBuf: ?*c_void, _ElementSize: c_ulonglong, _Count: c_ulonglong, _File: [*c]FILE) c_ulonglong;
extern fn freopen(noalias _Filename: [*c]const u8, noalias _Mode: [*c]const u8, noalias _File: [*c]FILE) [*c]FILE;
extern fn fsetpos(_File: [*c]FILE, _Pos: [*c]const fpos_t) c_int;
extern fn fsetpos64(_File: [*c]FILE, _Pos: [*c]const fpos_t) c_int;
extern fn fseek(_File: [*c]FILE, _Offset: c_long, _Origin: c_int) c_int;
extern fn ftell(_File: [*c]FILE) c_long;
extern fn _fseeki64(_File: [*c]FILE, _Offset: c_longlong, _Origin: c_int) c_int;
extern fn _ftelli64(_File: [*c]FILE) c_longlong;
extern fn fseeko64(stream: [*c]FILE, offset: _off64_t, whence: c_int) c_int;
extern fn fseeko(stream: [*c]FILE, offset: _off_t, whence: c_int) c_int;
extern fn ftello(stream: [*c]FILE) _off_t;
extern fn ftello64(stream: [*c]FILE) _off64_t;
extern fn fwrite(_Str: ?*const c_void, _Size: c_ulonglong, _Count: c_ulonglong, _File: [*c]FILE) c_ulonglong;
extern fn getc(_File: [*c]FILE) c_int;
extern fn getchar() c_int;
extern fn _getmaxstdio() c_int;
extern fn gets(_Buffer: [*c]u8) [*c]u8;
extern fn _getw(_File: [*c]FILE) c_int;
extern fn perror(_ErrMsg: [*c]const u8) void;
extern fn _pclose(_File: [*c]FILE) c_int;
extern fn _popen(_Command: [*c]const u8, _Mode: [*c]const u8) [*c]FILE;
extern fn putc(_Ch: c_int, _File: [*c]FILE) c_int;
extern fn putchar(_Ch: c_int) c_int;
extern fn puts(_Str: [*c]const u8) c_int;
extern fn _putw(_Word: c_int, _File: [*c]FILE) c_int;
extern fn remove(_Filename: [*c]const u8) c_int;
extern fn rename(_OldFilename: [*c]const u8, _NewFilename: [*c]const u8) c_int;
extern fn _unlink(_Filename: [*c]const u8) c_int;
extern fn unlink(_Filename: [*c]const u8) c_int;
extern fn rewind(_File: [*c]FILE) void;
extern fn _rmtmp() c_int;
extern fn setbuf(noalias _File: [*c]FILE, noalias _Buffer: [*c]u8) void;
extern fn _setmaxstdio(_Max: c_int) c_int;
extern fn _set_output_format(_Format: c_uint) c_uint;
extern fn _get_output_format() c_uint;
extern fn setvbuf(noalias _File: [*c]FILE, noalias _Buf: [*c]u8, _Mode: c_int, _Size: usize) c_int;
extern fn _scprintf(noalias _Format: [*c]const u8, ...) c_int;
extern fn _snscanf(noalias _Src: [*c]const u8, _MaxCount: usize, noalias _Format: [*c]const u8, ...) c_int;
extern fn tmpfile() [*c]FILE;
extern fn tmpnam(_Buffer: [*c]u8) [*c]u8;
extern fn ungetc(_Ch: c_int, _File: [*c]FILE) c_int;
extern fn _snprintf(noalias _Dest: [*c]u8, _Count: usize, noalias _Format: [*c]const u8, ...) c_int;
extern fn _vsnprintf(noalias _Dest: [*c]u8, _Count: usize, noalias _Format: [*c]const u8, _Args: va_list) c_int;
extern fn _vscprintf(noalias _Format: [*c]const u8, _ArgList: va_list) c_int;
extern fn _set_printf_count_output(_Value: c_int) c_int;
extern fn _get_printf_count_output() c_int;
extern fn __mingw_swscanf(noalias _Src: [*c]const wchar_t, noalias _Format: [*c]const wchar_t, ...) c_int;
extern fn __mingw_vswscanf(noalias _Str: [*c]const wchar_t, noalias Format: [*c]const wchar_t, argp: va_list) c_int;
extern fn __mingw_wscanf(noalias _Format: [*c]const wchar_t, ...) c_int;
extern fn __mingw_vwscanf(noalias Format: [*c]const wchar_t, argp: va_list) c_int;
extern fn __mingw_fwscanf(noalias _File: [*c]FILE, noalias _Format: [*c]const wchar_t, ...) c_int;
extern fn __mingw_vfwscanf(noalias fp: [*c]FILE, noalias Format: [*c]const wchar_t, argp: va_list) c_int;
extern fn __mingw_fwprintf(noalias _File: [*c]FILE, noalias _Format: [*c]const wchar_t, ...) c_int;
extern fn __mingw_wprintf(noalias _Format: [*c]const wchar_t, ...) c_int;
extern fn __mingw_vfwprintf(noalias _File: [*c]FILE, noalias _Format: [*c]const wchar_t, _ArgList: va_list) c_int;
extern fn __mingw_vwprintf(noalias _Format: [*c]const wchar_t, _ArgList: va_list) c_int;
extern fn __mingw_snwprintf(noalias s: [*c]wchar_t, n: usize, noalias format: [*c]const wchar_t, ...) c_int;
extern fn __mingw_vsnwprintf(noalias [*c]wchar_t, usize, noalias [*c]const wchar_t, va_list) c_int;
extern fn __mingw_swprintf(noalias [*c]wchar_t, noalias [*c]const wchar_t, ...) c_int;
extern fn __mingw_vswprintf(noalias [*c]wchar_t, noalias [*c]const wchar_t, va_list) c_int;
extern fn __ms_swscanf(noalias _Src: [*c]const wchar_t, noalias _Format: [*c]const wchar_t, ...) c_int;
extern fn __ms_wscanf(noalias _Format: [*c]const wchar_t, ...) c_int;
extern fn __ms_fwscanf(noalias _File: [*c]FILE, noalias _Format: [*c]const wchar_t, ...) c_int;
extern fn __ms_fwprintf(noalias _File: [*c]FILE, noalias _Format: [*c]const wchar_t, ...) c_int;
extern fn __ms_wprintf(noalias _Format: [*c]const wchar_t, ...) c_int;
extern fn __ms_vfwprintf(noalias _File: [*c]FILE, noalias _Format: [*c]const wchar_t, _ArgList: va_list) c_int;
extern fn __ms_vwprintf(noalias _Format: [*c]const wchar_t, _ArgList: va_list) c_int;
extern fn __ms_swprintf(noalias [*c]wchar_t, noalias [*c]const wchar_t, ...) c_int;
extern fn __ms_vswprintf(noalias [*c]wchar_t, noalias [*c]const wchar_t, va_list) c_int; // C:\zig\lib\zig\libc\include\any-windows-any\stdio.h:1024:5: warning: TODO unable to translate variadic function, demoted to extern
extern fn swscanf(__source: [*c]const wchar_t, __format: [*c]const wchar_t, ...) c_int; // C:\zig\lib\zig\libc\include\any-windows-any\stdio.h:1035:5: warning: TODO unable to translate variadic function, demoted to extern
extern fn wscanf(__format: [*c]const wchar_t, ...) c_int; // C:\zig\lib\zig\libc\include\any-windows-any\stdio.h:1046:5: warning: TODO unable to translate variadic function, demoted to extern
extern fn fwscanf(__stream: [*c]FILE, __format: [*c]const wchar_t, ...) c_int;
fn vswscanf(noalias arg___source: [*c]const wchar_t, noalias arg___format: [*c]const wchar_t, arg___local_argv: __builtin_va_list) callconv(.C) c_int {
    var __source = arg___source;
    var __format = arg___format;
    var __local_argv = arg___local_argv;
    return __mingw_vswscanf(__source, __format, __local_argv);
}
fn vwscanf(arg___format: [*c]const wchar_t, arg___local_argv: __builtin_va_list) callconv(.C) c_int {
    var __format = arg___format;
    var __local_argv = arg___local_argv;
    return __mingw_vfwscanf(__acrt_iob_func(@bitCast(c_uint, @as(c_int, 0))), __format, __local_argv);
}
fn vfwscanf(arg___stream: [*c]FILE, arg___format: [*c]const wchar_t, arg___local_argv: __builtin_va_list) callconv(.C) c_int {
    var __stream = arg___stream;
    var __format = arg___format;
    var __local_argv = arg___local_argv;
    return __mingw_vfwscanf(__stream, __format, __local_argv);
} // C:\zig\lib\zig\libc\include\any-windows-any\stdio.h:1082:5: warning: TODO unable to translate variadic function, demoted to extern
extern fn fwprintf(__stream: [*c]FILE, __format: [*c]const wchar_t, ...) c_int; // C:\zig\lib\zig\libc\include\any-windows-any\stdio.h:1093:5: warning: TODO unable to translate variadic function, demoted to extern
extern fn wprintf(__format: [*c]const wchar_t, ...) c_int;
fn vfwprintf(arg___stream: [*c]FILE, arg___format: [*c]const wchar_t, arg___local_argv: __builtin_va_list) callconv(.C) c_int {
    var __stream = arg___stream;
    var __format = arg___format;
    var __local_argv = arg___local_argv;
    return __mingw_vfwprintf(__stream, __format, __local_argv);
}
fn vwprintf(arg___format: [*c]const wchar_t, arg___local_argv: __builtin_va_list) callconv(.C) c_int {
    var __format = arg___format;
    var __local_argv = arg___local_argv;
    return __mingw_vfwprintf(__acrt_iob_func(@bitCast(c_uint, @as(c_int, 1))), __format, __local_argv);
} // C:\zig\lib\zig\libc\include\any-windows-any\stdio.h:1132:5: warning: TODO unable to translate variadic function, demoted to extern
extern fn snwprintf(__stream: [*c]wchar_t, __n: usize, __format: [*c]const wchar_t, ...) c_int;
fn vsnwprintf(arg___stream: [*c]wchar_t, arg___n: usize, arg___format: [*c]const wchar_t, arg___local_argv: __builtin_va_list) callconv(.C) c_int {
    var __stream = arg___stream;
    var __n = arg___n;
    var __format = arg___format;
    var __local_argv = arg___local_argv;
    return __mingw_vsnwprintf(__stream, __n, __format, __local_argv);
}
extern fn _wfsopen(_Filename: [*c]const wchar_t, _Mode: [*c]const wchar_t, _ShFlag: c_int) [*c]FILE;
extern fn fgetwc(_File: [*c]FILE) wint_t;
extern fn _fgetwchar() wint_t;
extern fn fputwc(_Ch: wchar_t, _File: [*c]FILE) wint_t;
extern fn _fputwchar(_Ch: wchar_t) wint_t;
extern fn getwc(_File: [*c]FILE) wint_t;
extern fn getwchar() wint_t;
extern fn putwc(_Ch: wchar_t, _File: [*c]FILE) wint_t;
extern fn putwchar(_Ch: wchar_t) wint_t;
extern fn ungetwc(_Ch: wint_t, _File: [*c]FILE) wint_t;
extern fn fgetws(noalias _Dst: [*c]wchar_t, _SizeInWords: c_int, noalias _File: [*c]FILE) [*c]wchar_t;
extern fn fputws(noalias _Str: [*c]const wchar_t, noalias _File: [*c]FILE) c_int;
extern fn _getws(_String: [*c]wchar_t) [*c]wchar_t;
extern fn _putws(_Str: [*c]const wchar_t) c_int;
extern fn _scwprintf(noalias _Format: [*c]const wchar_t, ...) c_int;
extern fn _swprintf_c(noalias _DstBuf: [*c]wchar_t, _SizeInWords: usize, noalias _Format: [*c]const wchar_t, ...) c_int;
extern fn _vswprintf_c(noalias _DstBuf: [*c]wchar_t, _SizeInWords: usize, noalias _Format: [*c]const wchar_t, _ArgList: va_list) c_int;
extern fn _snwprintf(noalias _Dest: [*c]wchar_t, _Count: usize, noalias _Format: [*c]const wchar_t, ...) c_int;
extern fn _vsnwprintf(noalias _Dest: [*c]wchar_t, _Count: usize, noalias _Format: [*c]const wchar_t, _Args: va_list) c_int;
extern fn _vscwprintf(noalias _Format: [*c]const wchar_t, _ArgList: va_list) c_int;
extern fn _swprintf(noalias _Dest: [*c]wchar_t, noalias _Format: [*c]const wchar_t, ...) c_int;
extern fn _vswprintf(noalias _Dest: [*c]wchar_t, noalias _Format: [*c]const wchar_t, _Args: va_list) c_int;
fn vswprintf(arg___stream: [*c]wchar_t, arg___count: usize, arg___format: [*c]const wchar_t, arg___local_argv: __builtin_va_list) callconv(.C) c_int {
    var __stream = arg___stream;
    var __count = arg___count;
    var __format = arg___format;
    var __local_argv = arg___local_argv;
    return vsnwprintf(__stream, __count, __format, __local_argv);
} // C:\zig\lib\zig\libc\include\any-windows-any\swprintf.inl:34:5: warning: TODO unable to translate variadic function, demoted to extern
extern fn swprintf(__stream: [*c]wchar_t, __count: usize, __format: [*c]const wchar_t, ...) c_int;
extern fn _wtempnam(_Directory: [*c]const wchar_t, _FilePrefix: [*c]const wchar_t) [*c]wchar_t;
extern fn _snwscanf(noalias _Src: [*c]const wchar_t, _MaxCount: usize, noalias _Format: [*c]const wchar_t, ...) c_int;
extern fn _wfdopen(_FileHandle: c_int, _Mode: [*c]const wchar_t) [*c]FILE;
extern fn _wfopen(noalias _Filename: [*c]const wchar_t, noalias _Mode: [*c]const wchar_t) [*c]FILE;
extern fn _wfreopen(noalias _Filename: [*c]const wchar_t, noalias _Mode: [*c]const wchar_t, noalias _OldFile: [*c]FILE) [*c]FILE;
extern fn _wperror(_ErrMsg: [*c]const wchar_t) void;
extern fn _wpopen(_Command: [*c]const wchar_t, _Mode: [*c]const wchar_t) [*c]FILE;
extern fn _wremove(_Filename: [*c]const wchar_t) c_int;
extern fn _wtmpnam(_Buffer: [*c]wchar_t) [*c]wchar_t;
extern fn _fgetwc_nolock(_File: [*c]FILE) wint_t;
extern fn _fputwc_nolock(_Ch: wchar_t, _File: [*c]FILE) wint_t;
extern fn _ungetwc_nolock(_Ch: wint_t, _File: [*c]FILE) wint_t;
extern fn _lock_file(_File: [*c]FILE) void;
extern fn _unlock_file(_File: [*c]FILE) void;
extern fn _fclose_nolock(_File: [*c]FILE) c_int;
extern fn _fflush_nolock(_File: [*c]FILE) c_int;
extern fn _fread_nolock(noalias _DstBuf: ?*c_void, _ElementSize: usize, _Count: usize, noalias _File: [*c]FILE) usize;
extern fn _fseek_nolock(_File: [*c]FILE, _Offset: c_long, _Origin: c_int) c_int;
extern fn _ftell_nolock(_File: [*c]FILE) c_long;
extern fn _fseeki64_nolock(_File: [*c]FILE, _Offset: c_longlong, _Origin: c_int) c_int;
extern fn _ftelli64_nolock(_File: [*c]FILE) c_longlong;
extern fn _fwrite_nolock(noalias _DstBuf: ?*const c_void, _Size: usize, _Count: usize, noalias _File: [*c]FILE) usize;
extern fn _ungetc_nolock(_Ch: c_int, _File: [*c]FILE) c_int;
extern fn tempnam(_Directory: [*c]const u8, _FilePrefix: [*c]const u8) [*c]u8;
extern fn fcloseall() c_int;
extern fn fdopen(_FileHandle: c_int, _Format: [*c]const u8) [*c]FILE;
extern fn fgetchar() c_int;
extern fn fileno(_File: [*c]FILE) c_int;
extern fn flushall() c_int;
extern fn fputchar(_Ch: c_int) c_int;
extern fn getw(_File: [*c]FILE) c_int;
extern fn putw(_Ch: c_int, _File: [*c]FILE) c_int;
extern fn rmtmp() c_int;
extern fn __mingw_str_wide_utf8(wptr: [*c]const wchar_t, mbptr: [*c][*c]u8, buflen: [*c]usize) c_int;
extern fn __mingw_str_utf8_wide(mbptr: [*c]const u8, wptr: [*c][*c]wchar_t, buflen: [*c]usize) c_int;
extern fn __mingw_str_free(ptr: ?*c_void) void;
extern fn _wspawnl(_Mode: c_int, _Filename: [*c]const wchar_t, _ArgList: [*c]const wchar_t, ...) isize;
extern fn _wspawnle(_Mode: c_int, _Filename: [*c]const wchar_t, _ArgList: [*c]const wchar_t, ...) isize;
extern fn _wspawnlp(_Mode: c_int, _Filename: [*c]const wchar_t, _ArgList: [*c]const wchar_t, ...) isize;
extern fn _wspawnlpe(_Mode: c_int, _Filename: [*c]const wchar_t, _ArgList: [*c]const wchar_t, ...) isize;
extern fn _wspawnv(_Mode: c_int, _Filename: [*c]const wchar_t, _ArgList: [*c]const [*c]const wchar_t) isize;
extern fn _wspawnve(_Mode: c_int, _Filename: [*c]const wchar_t, _ArgList: [*c]const [*c]const wchar_t, _Env: [*c]const [*c]const wchar_t) isize;
extern fn _wspawnvp(_Mode: c_int, _Filename: [*c]const wchar_t, _ArgList: [*c]const [*c]const wchar_t) isize;
extern fn _wspawnvpe(_Mode: c_int, _Filename: [*c]const wchar_t, _ArgList: [*c]const [*c]const wchar_t, _Env: [*c]const [*c]const wchar_t) isize;
extern fn _spawnv(_Mode: c_int, _Filename: [*c]const u8, _ArgList: [*c]const [*c]const u8) isize;
extern fn _spawnve(_Mode: c_int, _Filename: [*c]const u8, _ArgList: [*c]const [*c]const u8, _Env: [*c]const [*c]const u8) isize;
extern fn _spawnvp(_Mode: c_int, _Filename: [*c]const u8, _ArgList: [*c]const [*c]const u8) isize;
extern fn _spawnvpe(_Mode: c_int, _Filename: [*c]const u8, _ArgList: [*c]const [*c]const u8, _Env: [*c]const [*c]const u8) isize;
extern fn clearerr_s(_File: [*c]FILE) errno_t;
extern fn fread_s(_DstBuf: ?*c_void, _DstSize: usize, _ElementSize: usize, _Count: usize, _File: [*c]FILE) usize;
extern fn fprintf_s(_File: [*c]FILE, _Format: [*c]const u8, ...) c_int;
extern fn _fscanf_s_l(_File: [*c]FILE, _Format: [*c]const u8, _Locale: _locale_t, ...) c_int;
extern fn fscanf_s(_File: [*c]FILE, _Format: [*c]const u8, ...) c_int;
extern fn printf_s(_Format: [*c]const u8, ...) c_int;
extern fn _scanf_l(_Format: [*c]const u8, _Locale: _locale_t, ...) c_int;
extern fn _scanf_s_l(_Format: [*c]const u8, _Locale: _locale_t, ...) c_int;
extern fn scanf_s(_Format: [*c]const u8, ...) c_int;
extern fn _snprintf_c(_DstBuf: [*c]u8, _MaxCount: usize, _Format: [*c]const u8, ...) c_int;
extern fn _vsnprintf_c(_DstBuf: [*c]u8, _MaxCount: usize, _Format: [*c]const u8, _ArgList: va_list) c_int;
extern fn _fscanf_l(_File: [*c]FILE, _Format: [*c]const u8, _Locale: _locale_t, ...) c_int;
extern fn _sscanf_l(_Src: [*c]const u8, _Format: [*c]const u8, _Locale: _locale_t, ...) c_int;
extern fn _sscanf_s_l(_Src: [*c]const u8, _Format: [*c]const u8, _Locale: _locale_t, ...) c_int;
extern fn sscanf_s(_Src: [*c]const u8, _Format: [*c]const u8, ...) c_int;
extern fn _snscanf_s(_Src: [*c]const u8, _MaxCount: usize, _Format: [*c]const u8, ...) c_int;
extern fn _snscanf_l(_Src: [*c]const u8, _MaxCount: usize, _Format: [*c]const u8, _Locale: _locale_t, ...) c_int;
extern fn _snscanf_s_l(_Src: [*c]const u8, _MaxCount: usize, _Format: [*c]const u8, _Locale: _locale_t, ...) c_int;
extern fn vfprintf_s(_File: [*c]FILE, _Format: [*c]const u8, _ArgList: va_list) c_int;
extern fn vprintf_s(_Format: [*c]const u8, _ArgList: va_list) c_int;
extern fn vsnprintf_s(_DstBuf: [*c]u8, _DstSize: usize, _MaxCount: usize, _Format: [*c]const u8, _ArgList: va_list) c_int;
extern fn _vsnprintf_s(_DstBuf: [*c]u8, _DstSize: usize, _MaxCount: usize, _Format: [*c]const u8, _ArgList: va_list) c_int;
extern fn vsprintf_s(_DstBuf: [*c]u8, _Size: usize, _Format: [*c]const u8, _ArgList: va_list) c_int;
extern fn sprintf_s(_DstBuf: [*c]u8, _DstSize: usize, _Format: [*c]const u8, ...) c_int;
extern fn _snprintf_s(_DstBuf: [*c]u8, _DstSize: usize, _MaxCount: usize, _Format: [*c]const u8, ...) c_int;
extern fn _fprintf_p(_File: [*c]FILE, _Format: [*c]const u8, ...) c_int;
extern fn _printf_p(_Format: [*c]const u8, ...) c_int;
extern fn _sprintf_p(_Dst: [*c]u8, _MaxCount: usize, _Format: [*c]const u8, ...) c_int;
extern fn _vfprintf_p(_File: [*c]FILE, _Format: [*c]const u8, _ArgList: va_list) c_int;
extern fn _vprintf_p(_Format: [*c]const u8, _ArgList: va_list) c_int;
extern fn _vsprintf_p(_Dst: [*c]u8, _MaxCount: usize, _Format: [*c]const u8, _ArgList: va_list) c_int;
extern fn _scprintf_p(_Format: [*c]const u8, ...) c_int;
extern fn _vscprintf_p(_Format: [*c]const u8, _ArgList: va_list) c_int;
extern fn _printf_l(_Format: [*c]const u8, _Locale: _locale_t, ...) c_int;
extern fn _printf_p_l(_Format: [*c]const u8, _Locale: _locale_t, ...) c_int;
extern fn _vprintf_l(_Format: [*c]const u8, _Locale: _locale_t, _ArgList: va_list) c_int;
extern fn _vprintf_p_l(_Format: [*c]const u8, _Locale: _locale_t, _ArgList: va_list) c_int;
extern fn _fprintf_l(_File: [*c]FILE, _Format: [*c]const u8, _Locale: _locale_t, ...) c_int;
extern fn _fprintf_p_l(_File: [*c]FILE, _Format: [*c]const u8, _Locale: _locale_t, ...) c_int;
extern fn _vfprintf_l(_File: [*c]FILE, _Format: [*c]const u8, _Locale: _locale_t, _ArgList: va_list) c_int;
extern fn _vfprintf_p_l(_File: [*c]FILE, _Format: [*c]const u8, _Locale: _locale_t, _ArgList: va_list) c_int;
extern fn _sprintf_l(_DstBuf: [*c]u8, _Format: [*c]const u8, _Locale: _locale_t, ...) c_int;
extern fn _sprintf_p_l(_DstBuf: [*c]u8, _MaxCount: usize, _Format: [*c]const u8, _Locale: _locale_t, ...) c_int;
extern fn _vsprintf_l(_DstBuf: [*c]u8, _Format: [*c]const u8, _locale_t, _ArgList: va_list) c_int;
extern fn _vsprintf_p_l(_DstBuf: [*c]u8, _MaxCount: usize, _Format: [*c]const u8, _Locale: _locale_t, _ArgList: va_list) c_int;
extern fn _scprintf_l(_Format: [*c]const u8, _Locale: _locale_t, ...) c_int;
extern fn _scprintf_p_l(_Format: [*c]const u8, _Locale: _locale_t, ...) c_int;
extern fn _vscprintf_l(_Format: [*c]const u8, _Locale: _locale_t, _ArgList: va_list) c_int;
extern fn _vscprintf_p_l(_Format: [*c]const u8, _Locale: _locale_t, _ArgList: va_list) c_int;
extern fn _printf_s_l(_Format: [*c]const u8, _Locale: _locale_t, ...) c_int;
extern fn _vprintf_s_l(_Format: [*c]const u8, _Locale: _locale_t, _ArgList: va_list) c_int;
extern fn _fprintf_s_l(_File: [*c]FILE, _Format: [*c]const u8, _Locale: _locale_t, ...) c_int;
extern fn _vfprintf_s_l(_File: [*c]FILE, _Format: [*c]const u8, _Locale: _locale_t, _ArgList: va_list) c_int;
extern fn _sprintf_s_l(_DstBuf: [*c]u8, _DstSize: usize, _Format: [*c]const u8, _Locale: _locale_t, ...) c_int;
extern fn _vsprintf_s_l(_DstBuf: [*c]u8, _DstSize: usize, _Format: [*c]const u8, _Locale: _locale_t, _ArgList: va_list) c_int;
extern fn _snprintf_s_l(_DstBuf: [*c]u8, _DstSize: usize, _MaxCount: usize, _Format: [*c]const u8, _Locale: _locale_t, ...) c_int;
extern fn _vsnprintf_s_l(_DstBuf: [*c]u8, _DstSize: usize, _MaxCount: usize, _Format: [*c]const u8, _Locale: _locale_t, _ArgList: va_list) c_int;
extern fn _snprintf_l(_DstBuf: [*c]u8, _MaxCount: usize, _Format: [*c]const u8, _Locale: _locale_t, ...) c_int;
extern fn _snprintf_c_l(_DstBuf: [*c]u8, _MaxCount: usize, _Format: [*c]const u8, _Locale: _locale_t, ...) c_int;
extern fn _vsnprintf_l(_DstBuf: [*c]u8, _MaxCount: usize, _Format: [*c]const u8, _Locale: _locale_t, _ArgList: va_list) c_int;
extern fn _vsnprintf_c_l(_DstBuf: [*c]u8, _MaxCount: usize, [*c]const u8, _Locale: _locale_t, _ArgList: va_list) c_int;
extern fn fopen_s(_File: [*c][*c]FILE, _Filename: [*c]const u8, _Mode: [*c]const u8) errno_t;
extern fn freopen_s(_File: [*c][*c]FILE, _Filename: [*c]const u8, _Mode: [*c]const u8, _Stream: [*c]FILE) errno_t;
extern fn gets_s([*c]u8, rsize_t) [*c]u8;
extern fn tmpnam_s([*c]u8, rsize_t) errno_t;
extern fn _getws_s(_Str: [*c]wchar_t, _SizeInWords: usize) [*c]wchar_t;
extern fn fwprintf_s(_File: [*c]FILE, _Format: [*c]const wchar_t, ...) c_int;
extern fn wprintf_s(_Format: [*c]const wchar_t, ...) c_int;
extern fn vfwprintf_s(_File: [*c]FILE, _Format: [*c]const wchar_t, _ArgList: va_list) c_int;
extern fn vwprintf_s(_Format: [*c]const wchar_t, _ArgList: va_list) c_int;
extern fn vswprintf_s(_Dst: [*c]wchar_t, _SizeInWords: usize, _Format: [*c]const wchar_t, _ArgList: va_list) c_int;
extern fn swprintf_s(_Dst: [*c]wchar_t, _SizeInWords: usize, _Format: [*c]const wchar_t, ...) c_int;
extern fn _vsnwprintf_s(_DstBuf: [*c]wchar_t, _DstSizeInWords: usize, _MaxCount: usize, _Format: [*c]const wchar_t, _ArgList: va_list) c_int;
extern fn _snwprintf_s(_DstBuf: [*c]wchar_t, _DstSizeInWords: usize, _MaxCount: usize, _Format: [*c]const wchar_t, ...) c_int;
extern fn _wprintf_s_l(_Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
extern fn _vwprintf_s_l(_Format: [*c]const wchar_t, _Locale: _locale_t, _ArgList: va_list) c_int;
extern fn _fwprintf_s_l(_File: [*c]FILE, _Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
extern fn _vfwprintf_s_l(_File: [*c]FILE, _Format: [*c]const wchar_t, _Locale: _locale_t, _ArgList: va_list) c_int;
extern fn _swprintf_s_l(_DstBuf: [*c]wchar_t, _DstSize: usize, _Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
extern fn _vswprintf_s_l(_DstBuf: [*c]wchar_t, _DstSize: usize, _Format: [*c]const wchar_t, _Locale: _locale_t, _ArgList: va_list) c_int;
extern fn _snwprintf_s_l(_DstBuf: [*c]wchar_t, _DstSize: usize, _MaxCount: usize, _Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
extern fn _vsnwprintf_s_l(_DstBuf: [*c]wchar_t, _DstSize: usize, _MaxCount: usize, _Format: [*c]const wchar_t, _Locale: _locale_t, _ArgList: va_list) c_int;
extern fn _fwscanf_s_l(_File: [*c]FILE, _Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
extern fn fwscanf_s(_File: [*c]FILE, _Format: [*c]const wchar_t, ...) c_int;
extern fn _swscanf_s_l(_Src: [*c]const wchar_t, _Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
extern fn swscanf_s(_Src: [*c]const wchar_t, _Format: [*c]const wchar_t, ...) c_int;
extern fn _snwscanf_s(_Src: [*c]const wchar_t, _MaxCount: usize, _Format: [*c]const wchar_t, ...) c_int;
extern fn _snwscanf_s_l(_Src: [*c]const wchar_t, _MaxCount: usize, _Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
extern fn _wscanf_s_l(_Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
extern fn wscanf_s(_Format: [*c]const wchar_t, ...) c_int;
extern fn _wfopen_s(_File: [*c][*c]FILE, _Filename: [*c]const wchar_t, _Mode: [*c]const wchar_t) errno_t;
extern fn _wfreopen_s(_File: [*c][*c]FILE, _Filename: [*c]const wchar_t, _Mode: [*c]const wchar_t, _OldFile: [*c]FILE) errno_t;
extern fn _wtmpnam_s(_DstBuf: [*c]wchar_t, _SizeInWords: usize) errno_t;
extern fn _fwprintf_p(_File: [*c]FILE, _Format: [*c]const wchar_t, ...) c_int;
extern fn _wprintf_p(_Format: [*c]const wchar_t, ...) c_int;
extern fn _vfwprintf_p(_File: [*c]FILE, _Format: [*c]const wchar_t, _ArgList: va_list) c_int;
extern fn _vwprintf_p(_Format: [*c]const wchar_t, _ArgList: va_list) c_int;
extern fn _swprintf_p(_DstBuf: [*c]wchar_t, _MaxCount: usize, _Format: [*c]const wchar_t, ...) c_int;
extern fn _vswprintf_p(_DstBuf: [*c]wchar_t, _MaxCount: usize, _Format: [*c]const wchar_t, _ArgList: va_list) c_int;
extern fn _scwprintf_p(_Format: [*c]const wchar_t, ...) c_int;
extern fn _vscwprintf_p(_Format: [*c]const wchar_t, _ArgList: va_list) c_int;
extern fn _wprintf_l(_Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
extern fn _wprintf_p_l(_Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
extern fn _vwprintf_l(_Format: [*c]const wchar_t, _Locale: _locale_t, _ArgList: va_list) c_int;
extern fn _vwprintf_p_l(_Format: [*c]const wchar_t, _Locale: _locale_t, _ArgList: va_list) c_int;
extern fn _fwprintf_l(_File: [*c]FILE, _Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
extern fn _fwprintf_p_l(_File: [*c]FILE, _Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
extern fn _vfwprintf_l(_File: [*c]FILE, _Format: [*c]const wchar_t, _Locale: _locale_t, _ArgList: va_list) c_int;
extern fn _vfwprintf_p_l(_File: [*c]FILE, _Format: [*c]const wchar_t, _Locale: _locale_t, _ArgList: va_list) c_int;
extern fn _swprintf_c_l(_DstBuf: [*c]wchar_t, _MaxCount: usize, _Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
extern fn _swprintf_p_l(_DstBuf: [*c]wchar_t, _MaxCount: usize, _Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
extern fn _vswprintf_c_l(_DstBuf: [*c]wchar_t, _MaxCount: usize, _Format: [*c]const wchar_t, _Locale: _locale_t, _ArgList: va_list) c_int;
extern fn _vswprintf_p_l(_DstBuf: [*c]wchar_t, _MaxCount: usize, _Format: [*c]const wchar_t, _Locale: _locale_t, _ArgList: va_list) c_int;
extern fn _scwprintf_l(_Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
extern fn _scwprintf_p_l(_Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
extern fn _vscwprintf_p_l(_Format: [*c]const wchar_t, _Locale: _locale_t, _ArgList: va_list) c_int;
extern fn _snwprintf_l(_DstBuf: [*c]wchar_t, _MaxCount: usize, _Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
extern fn _vsnwprintf_l(_DstBuf: [*c]wchar_t, _MaxCount: usize, _Format: [*c]const wchar_t, _Locale: _locale_t, _ArgList: va_list) c_int;
extern fn __swprintf_l(_Dest: [*c]wchar_t, _Format: [*c]const wchar_t, _Plocinfo: _locale_t, ...) c_int;
extern fn __vswprintf_l(_Dest: [*c]wchar_t, _Format: [*c]const wchar_t, _Plocinfo: _locale_t, _Args: va_list) c_int;
extern fn _vscwprintf_l(_Format: [*c]const wchar_t, _Locale: _locale_t, _ArgList: va_list) c_int;
extern fn _fwscanf_l(_File: [*c]FILE, _Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
extern fn _swscanf_l(_Src: [*c]const wchar_t, _Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
extern fn _snwscanf_l(_Src: [*c]const wchar_t, _MaxCount: usize, _Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
extern fn _wscanf_l(_Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
extern fn _fread_nolock_s(_DstBuf: ?*c_void, _DstSize: usize, _ElementSize: usize, _Count: usize, _File: [*c]FILE) usize;
const enum_unnamed_2 = extern enum(c_int) {
    STBI_default = 0,
    STBI_grey = 1,
    STBI_grey_alpha = 2,
    STBI_rgb = 3,
    STBI_rgb_alpha = 4,
    _,
};
pub const STBI_default = @enumToInt(enum_unnamed_2.STBI_default);
pub const STBI_grey = @enumToInt(enum_unnamed_2.STBI_grey);
pub const STBI_grey_alpha = @enumToInt(enum_unnamed_2.STBI_grey_alpha);
pub const STBI_rgb = @enumToInt(enum_unnamed_2.STBI_rgb);
pub const STBI_rgb_alpha = @enumToInt(enum_unnamed_2.STBI_rgb_alpha);
extern fn _itow_s(_Val: c_int, _DstBuf: [*c]wchar_t, _SizeInWords: usize, _Radix: c_int) errno_t;
extern fn _ltow_s(_Val: c_long, _DstBuf: [*c]wchar_t, _SizeInWords: usize, _Radix: c_int) errno_t;
extern fn _ultow_s(_Val: c_ulong, _DstBuf: [*c]wchar_t, _SizeInWords: usize, _Radix: c_int) errno_t;
extern fn _wgetenv_s(_ReturnSize: [*c]usize, _DstBuf: [*c]wchar_t, _DstSizeInWords: usize, _VarName: [*c]const wchar_t) errno_t;
extern fn _wdupenv_s(_Buffer: [*c][*c]wchar_t, _BufferSizeInWords: [*c]usize, _VarName: [*c]const wchar_t) errno_t;
extern fn _i64tow_s(_Val: c_longlong, _DstBuf: [*c]wchar_t, _SizeInWords: usize, _Radix: c_int) errno_t;
extern fn _ui64tow_s(_Val: c_ulonglong, _DstBuf: [*c]wchar_t, _SizeInWords: usize, _Radix: c_int) errno_t;
extern fn _wmakepath_s(_PathResult: [*c]wchar_t, _SizeInWords: usize, _Drive: [*c]const wchar_t, _Dir: [*c]const wchar_t, _Filename: [*c]const wchar_t, _Ext: [*c]const wchar_t) errno_t;
extern fn _wputenv_s(_Name: [*c]const wchar_t, _Value: [*c]const wchar_t) errno_t;
extern fn _wsearchenv_s(_Filename: [*c]const wchar_t, _EnvVar: [*c]const wchar_t, _ResultPath: [*c]wchar_t, _SizeInWords: usize) errno_t;
extern fn _wsplitpath_s(_FullPath: [*c]const wchar_t, _Drive: [*c]wchar_t, _DriveSizeInWords: usize, _Dir: [*c]wchar_t, _DirSizeInWords: usize, _Filename: [*c]wchar_t, _FilenameSizeInWords: usize, _Ext: [*c]wchar_t, _ExtSizeInWords: usize) errno_t;
const _onexit_t = ?fn () callconv(.C) c_int;
const struct__div_t = extern struct {
    quot: c_int,
    rem: c_int,
};
const div_t = struct__div_t;
const struct__ldiv_t = extern struct {
    quot: c_long,
    rem: c_long,
};
const ldiv_t = struct__ldiv_t;
const _LDOUBLE = extern struct {
    ld: [10]u8,
};
const _CRT_DOUBLE = extern struct {
    x: f64,
};
const _CRT_FLOAT = extern struct {
    f: f32,
};
const _LONGDOUBLE = extern struct {
    x: c_longdouble,
};
const _LDBL12 = extern struct {
    ld12: [12]u8,
};
extern var __imp___mb_cur_max: [*c]c_int;
extern fn ___mb_cur_max_func() c_int;
const _purecall_handler = ?fn () callconv(.C) void;
extern fn _set_purecall_handler(_Handler: _purecall_handler) _purecall_handler;
extern fn _get_purecall_handler() _purecall_handler;
const _invalid_parameter_handler = ?fn ([*c]const wchar_t, [*c]const wchar_t, [*c]const wchar_t, c_uint, usize) callconv(.C) void;
extern fn _set_invalid_parameter_handler(_Handler: _invalid_parameter_handler) _invalid_parameter_handler;
extern fn _get_invalid_parameter_handler() _invalid_parameter_handler;
extern fn _errno() [*c]c_int;
extern fn _set_errno(_Value: c_int) errno_t;
extern fn _get_errno(_Value: [*c]c_int) errno_t;
extern fn __doserrno() [*c]c_ulong;
extern fn _set_doserrno(_Value: c_ulong) errno_t;
extern fn _get_doserrno(_Value: [*c]c_ulong) errno_t;
extern var _sys_errlist: [1][*c]u8;
extern var _sys_nerr: c_int;
extern fn __p___argv() [*c][*c][*c]u8;
extern fn __p__fmode() [*c]c_int;
extern fn _get_pgmptr(_Value: [*c][*c]u8) errno_t;
extern fn _get_wpgmptr(_Value: [*c][*c]wchar_t) errno_t;
extern fn _set_fmode(_Mode: c_int) errno_t;
extern fn _get_fmode(_PMode: [*c]c_int) errno_t;
extern var __imp___argc: [*c]c_int;
extern var __imp___argv: [*c][*c][*c]u8;
extern var __imp___wargv: [*c][*c][*c]wchar_t;
extern var __imp__environ: [*c][*c][*c]u8;
extern var __imp__wenviron: [*c][*c][*c]wchar_t;
extern var __imp__pgmptr: [*c][*c]u8;
extern var __imp__wpgmptr: [*c][*c]wchar_t;
extern var __imp__osplatform: [*c]c_uint;
extern var __imp__osver: [*c]c_uint;
extern var __imp__winver: [*c]c_uint;
extern var __imp__winmajor: [*c]c_uint;
extern var __imp__winminor: [*c]c_uint;
extern fn _get_osplatform(_Value: [*c]c_uint) errno_t;
extern fn _get_osver(_Value: [*c]c_uint) errno_t;
extern fn _get_winver(_Value: [*c]c_uint) errno_t;
extern fn _get_winmajor(_Value: [*c]c_uint) errno_t;
extern fn _get_winminor(_Value: [*c]c_uint) errno_t;
extern fn exit(_Code: c_int) noreturn;
extern fn _exit(_Code: c_int) noreturn;
fn _Exit(arg_status: c_int) callconv(.C) noreturn {
    var status = arg_status;
    _exit(status);
}
extern fn abort() noreturn;
extern fn _set_abort_behavior(_Flags: c_uint, _Mask: c_uint) c_uint;
extern fn abs(_X: c_int) c_int;
extern fn labs(_X: c_long) c_long; // C:\zig\lib\zig\libc\include\any-windows-any\stdlib.h:418:12: warning: TODO implement function '__builtin_llabs' in std.c.builtins
// C:\zig\lib\zig\libc\include\any-windows-any\stdlib.h:417:41: warning: unable to translate function, demoted to extern
extern fn _abs64(arg_x: c_longlong) callconv(.C) c_longlong;
extern fn atexit(?fn () callconv(.C) void) c_int;
extern fn atof(_String: [*c]const u8) f64;
extern fn _atof_l(_String: [*c]const u8, _Locale: _locale_t) f64;
extern fn atoi(_Str: [*c]const u8) c_int;
extern fn _atoi_l(_Str: [*c]const u8, _Locale: _locale_t) c_int;
extern fn atol(_Str: [*c]const u8) c_long;
extern fn _atol_l(_Str: [*c]const u8, _Locale: _locale_t) c_long;
extern fn bsearch(_Key: ?*const c_void, _Base: ?*const c_void, _NumOfElements: usize, _SizeOfElements: usize, _PtFuncCompare: ?fn (?*const c_void, ?*const c_void) callconv(.C) c_int) ?*c_void;
extern fn qsort(_Base: ?*c_void, _NumOfElements: usize, _SizeOfElements: usize, _PtFuncCompare: ?fn (?*const c_void, ?*const c_void) callconv(.C) c_int) void;
extern fn _byteswap_ushort(_Short: c_ushort) c_ushort;
extern fn _byteswap_ulong(_Long: c_ulong) c_ulong;
extern fn _byteswap_uint64(_Int64: c_ulonglong) c_ulonglong;
extern fn div(_Numerator: c_int, _Denominator: c_int) div_t;
extern fn getenv(_VarName: [*c]const u8) [*c]u8;
extern fn _itoa(_Value: c_int, _Dest: [*c]u8, _Radix: c_int) [*c]u8;
extern fn _i64toa(_Val: c_longlong, _DstBuf: [*c]u8, _Radix: c_int) [*c]u8;
extern fn _ui64toa(_Val: c_ulonglong, _DstBuf: [*c]u8, _Radix: c_int) [*c]u8;
extern fn _atoi64(_String: [*c]const u8) c_longlong;
extern fn _atoi64_l(_String: [*c]const u8, _Locale: _locale_t) c_longlong;
extern fn _strtoi64(_String: [*c]const u8, _EndPtr: [*c][*c]u8, _Radix: c_int) c_longlong;
extern fn _strtoi64_l(_String: [*c]const u8, _EndPtr: [*c][*c]u8, _Radix: c_int, _Locale: _locale_t) c_longlong;
extern fn _strtoui64(_String: [*c]const u8, _EndPtr: [*c][*c]u8, _Radix: c_int) c_ulonglong;
extern fn _strtoui64_l(_String: [*c]const u8, _EndPtr: [*c][*c]u8, _Radix: c_int, _Locale: _locale_t) c_ulonglong;
extern fn ldiv(_Numerator: c_long, _Denominator: c_long) ldiv_t;
extern fn _ltoa(_Value: c_long, _Dest: [*c]u8, _Radix: c_int) [*c]u8;
extern fn mblen(_Ch: [*c]const u8, _MaxCount: usize) c_int;
extern fn _mblen_l(_Ch: [*c]const u8, _MaxCount: usize, _Locale: _locale_t) c_int;
extern fn _mbstrlen(_Str: [*c]const u8) usize;
extern fn _mbstrlen_l(_Str: [*c]const u8, _Locale: _locale_t) usize;
extern fn _mbstrnlen(_Str: [*c]const u8, _MaxCount: usize) usize;
extern fn _mbstrnlen_l(_Str: [*c]const u8, _MaxCount: usize, _Locale: _locale_t) usize;
extern fn mbtowc(noalias _DstCh: [*c]wchar_t, noalias _SrcCh: [*c]const u8, _SrcSizeInBytes: usize) c_int;
extern fn _mbtowc_l(noalias _DstCh: [*c]wchar_t, noalias _SrcCh: [*c]const u8, _SrcSizeInBytes: usize, _Locale: _locale_t) c_int;
extern fn mbstowcs(noalias _Dest: [*c]wchar_t, noalias _Source: [*c]const u8, _MaxCount: usize) usize;
extern fn _mbstowcs_l(noalias _Dest: [*c]wchar_t, noalias _Source: [*c]const u8, _MaxCount: usize, _Locale: _locale_t) usize;
extern fn mkstemp(template_name: [*c]u8) c_int;
extern fn rand() c_int;
extern fn _set_error_mode(_Mode: c_int) c_int;
extern fn srand(_Seed: c_uint) void; // C:\zig\lib\zig\libc\include\any-windows-any\stdlib.h:480:18: warning: TODO implement translation of DeclStmt kind Function
// C:\zig\lib\zig\libc\include\any-windows-any\stdlib.h:478:32: warning: unable to translate function, demoted to extern
extern fn strtod(noalias arg__Str: [*c]const u8, noalias arg__EndPtr: [*c][*c]u8) callconv(.C) f64; // C:\zig\lib\zig\libc\include\any-windows-any\stdlib.h:487:17: warning: TODO implement translation of DeclStmt kind Function
// C:\zig\lib\zig\libc\include\any-windows-any\stdlib.h:485:31: warning: unable to translate function, demoted to extern
extern fn strtof(noalias arg__Str: [*c]const u8, noalias arg__EndPtr: [*c][*c]u8) callconv(.C) f32;
extern fn strtold([*c]const u8, [*c][*c]u8) c_longdouble;
extern fn __strtod(noalias [*c]const u8, noalias [*c][*c]u8) f64;
extern fn __mingw_strtof(noalias [*c]const u8, noalias [*c][*c]u8) f32;
extern fn __mingw_strtod(noalias [*c]const u8, noalias [*c][*c]u8) f64;
extern fn __mingw_strtold(noalias [*c]const u8, noalias [*c][*c]u8) c_longdouble;
extern fn _strtod_l(noalias _Str: [*c]const u8, noalias _EndPtr: [*c][*c]u8, _Locale: _locale_t) f64;
extern fn strtol(_Str: [*c]const u8, _EndPtr: [*c][*c]u8, _Radix: c_int) c_long;
extern fn _strtol_l(noalias _Str: [*c]const u8, noalias _EndPtr: [*c][*c]u8, _Radix: c_int, _Locale: _locale_t) c_long;
extern fn strtoul(_Str: [*c]const u8, _EndPtr: [*c][*c]u8, _Radix: c_int) c_ulong;
extern fn _strtoul_l(noalias _Str: [*c]const u8, noalias _EndPtr: [*c][*c]u8, _Radix: c_int, _Locale: _locale_t) c_ulong;
extern fn system(_Command: [*c]const u8) c_int;
extern fn _ultoa(_Value: c_ulong, _Dest: [*c]u8, _Radix: c_int) [*c]u8;
extern fn wctomb(_MbCh: [*c]u8, _WCh: wchar_t) c_int;
extern fn _wctomb_l(_MbCh: [*c]u8, _WCh: wchar_t, _Locale: _locale_t) c_int;
extern fn wcstombs(noalias _Dest: [*c]u8, noalias _Source: [*c]const wchar_t, _MaxCount: usize) usize;
extern fn _wcstombs_l(noalias _Dest: [*c]u8, noalias _Source: [*c]const wchar_t, _MaxCount: usize, _Locale: _locale_t) usize;
extern fn calloc(_NumOfElements: c_ulonglong, _SizeOfElements: c_ulonglong) ?*c_void;
extern fn free(_Memory: ?*c_void) void;
extern fn malloc(_Size: c_ulonglong) ?*c_void;
extern fn realloc(_Memory: ?*c_void, _NewSize: c_ulonglong) ?*c_void;
extern fn _recalloc(_Memory: ?*c_void, _Count: usize, _Size: usize) ?*c_void;
extern fn _aligned_free(_Memory: ?*c_void) void;
extern fn _aligned_malloc(_Size: usize, _Alignment: usize) ?*c_void;
extern fn _aligned_offset_malloc(_Size: usize, _Alignment: usize, _Offset: usize) ?*c_void;
extern fn _aligned_realloc(_Memory: ?*c_void, _Size: usize, _Alignment: usize) ?*c_void;
extern fn _aligned_recalloc(_Memory: ?*c_void, _Count: usize, _Size: usize, _Alignment: usize) ?*c_void;
extern fn _aligned_offset_realloc(_Memory: ?*c_void, _Size: usize, _Alignment: usize, _Offset: usize) ?*c_void;
extern fn _aligned_offset_recalloc(_Memory: ?*c_void, _Count: usize, _Size: usize, _Alignment: usize, _Offset: usize) ?*c_void;
extern fn _itow(_Value: c_int, _Dest: [*c]wchar_t, _Radix: c_int) [*c]wchar_t;
extern fn _ltow(_Value: c_long, _Dest: [*c]wchar_t, _Radix: c_int) [*c]wchar_t;
extern fn _ultow(_Value: c_ulong, _Dest: [*c]wchar_t, _Radix: c_int) [*c]wchar_t;
extern fn __mingw_wcstod(noalias _Str: [*c]const wchar_t, noalias _EndPtr: [*c][*c]wchar_t) f64;
extern fn __mingw_wcstof(noalias nptr: [*c]const wchar_t, noalias endptr: [*c][*c]wchar_t) f32;
extern fn __mingw_wcstold(noalias [*c]const wchar_t, noalias [*c][*c]wchar_t) c_longdouble;
fn wcstod(noalias arg__Str: [*c]const wchar_t, noalias arg__EndPtr: [*c][*c]wchar_t) callconv(.C) f64 {
    var _Str = arg__Str;
    var _EndPtr = arg__EndPtr;
    return __mingw_wcstod(_Str, _EndPtr);
}
fn wcstof(noalias arg__Str: [*c]const wchar_t, noalias arg__EndPtr: [*c][*c]wchar_t) callconv(.C) f32 {
    var _Str = arg__Str;
    var _EndPtr = arg__EndPtr;
    return __mingw_wcstof(_Str, _EndPtr);
}
extern fn wcstold(noalias [*c]const wchar_t, noalias [*c][*c]wchar_t) c_longdouble;
extern fn _wcstod_l(noalias _Str: [*c]const wchar_t, noalias _EndPtr: [*c][*c]wchar_t, _Locale: _locale_t) f64;
extern fn wcstol(noalias _Str: [*c]const wchar_t, noalias _EndPtr: [*c][*c]wchar_t, _Radix: c_int) c_long;
extern fn _wcstol_l(noalias _Str: [*c]const wchar_t, noalias _EndPtr: [*c][*c]wchar_t, _Radix: c_int, _Locale: _locale_t) c_long;
extern fn wcstoul(noalias _Str: [*c]const wchar_t, noalias _EndPtr: [*c][*c]wchar_t, _Radix: c_int) c_ulong;
extern fn _wcstoul_l(noalias _Str: [*c]const wchar_t, noalias _EndPtr: [*c][*c]wchar_t, _Radix: c_int, _Locale: _locale_t) c_ulong;
extern fn _wgetenv(_VarName: [*c]const wchar_t) [*c]wchar_t;
extern fn _wsystem(_Command: [*c]const wchar_t) c_int;
extern fn _wtof(_Str: [*c]const wchar_t) f64;
extern fn _wtof_l(_Str: [*c]const wchar_t, _Locale: _locale_t) f64;
extern fn _wtoi(_Str: [*c]const wchar_t) c_int;
extern fn _wtoi_l(_Str: [*c]const wchar_t, _Locale: _locale_t) c_int;
extern fn _wtol(_Str: [*c]const wchar_t) c_long;
extern fn _wtol_l(_Str: [*c]const wchar_t, _Locale: _locale_t) c_long;
extern fn _i64tow(_Val: c_longlong, _DstBuf: [*c]wchar_t, _Radix: c_int) [*c]wchar_t;
extern fn _ui64tow(_Val: c_ulonglong, _DstBuf: [*c]wchar_t, _Radix: c_int) [*c]wchar_t;
extern fn _wtoi64(_Str: [*c]const wchar_t) c_longlong;
extern fn _wtoi64_l(_Str: [*c]const wchar_t, _Locale: _locale_t) c_longlong;
extern fn _wcstoi64(_Str: [*c]const wchar_t, _EndPtr: [*c][*c]wchar_t, _Radix: c_int) c_longlong;
extern fn _wcstoi64_l(_Str: [*c]const wchar_t, _EndPtr: [*c][*c]wchar_t, _Radix: c_int, _Locale: _locale_t) c_longlong;
extern fn _wcstoui64(_Str: [*c]const wchar_t, _EndPtr: [*c][*c]wchar_t, _Radix: c_int) c_ulonglong;
extern fn _wcstoui64_l(_Str: [*c]const wchar_t, _EndPtr: [*c][*c]wchar_t, _Radix: c_int, _Locale: _locale_t) c_ulonglong;
extern fn _putenv(_EnvString: [*c]const u8) c_int;
extern fn _wputenv(_EnvString: [*c]const wchar_t) c_int;
extern fn _fullpath(_FullPath: [*c]u8, _Path: [*c]const u8, _SizeInBytes: usize) [*c]u8;
extern fn _ecvt(_Val: f64, _NumOfDigits: c_int, _PtDec: [*c]c_int, _PtSign: [*c]c_int) [*c]u8;
extern fn _fcvt(_Val: f64, _NumOfDec: c_int, _PtDec: [*c]c_int, _PtSign: [*c]c_int) [*c]u8;
extern fn _gcvt(_Val: f64, _NumOfDigits: c_int, _DstBuf: [*c]u8) [*c]u8;
extern fn _atodbl(_Result: [*c]_CRT_DOUBLE, _Str: [*c]u8) c_int;
extern fn _atoldbl(_Result: [*c]_LDOUBLE, _Str: [*c]u8) c_int;
extern fn _atoflt(_Result: [*c]_CRT_FLOAT, _Str: [*c]u8) c_int;
extern fn _atodbl_l(_Result: [*c]_CRT_DOUBLE, _Str: [*c]u8, _Locale: _locale_t) c_int;
extern fn _atoldbl_l(_Result: [*c]_LDOUBLE, _Str: [*c]u8, _Locale: _locale_t) c_int;
extern fn _atoflt_l(_Result: [*c]_CRT_FLOAT, _Str: [*c]u8, _Locale: _locale_t) c_int;
extern fn _lrotl(c_ulong, c_int) c_ulong;
extern fn _lrotr(c_ulong, c_int) c_ulong;
extern fn _makepath(_Path: [*c]u8, _Drive: [*c]const u8, _Dir: [*c]const u8, _Filename: [*c]const u8, _Ext: [*c]const u8) void;
extern fn _onexit(_Func: _onexit_t) _onexit_t;
extern fn _rotl64(_Val: c_ulonglong, _Shift: c_int) c_ulonglong;
extern fn _rotr64(Value: c_ulonglong, Shift: c_int) c_ulonglong;
extern fn _rotr(_Val: c_uint, _Shift: c_int) c_uint;
extern fn _rotl(_Val: c_uint, _Shift: c_int) c_uint;
extern fn _searchenv(_Filename: [*c]const u8, _EnvVar: [*c]const u8, _ResultPath: [*c]u8) void;
extern fn _splitpath(_FullPath: [*c]const u8, _Drive: [*c]u8, _Dir: [*c]u8, _Filename: [*c]u8, _Ext: [*c]u8) void;
extern fn _swab(_Buf1: [*c]u8, _Buf2: [*c]u8, _SizeInBytes: c_int) void;
extern fn _wfullpath(_FullPath: [*c]wchar_t, _Path: [*c]const wchar_t, _SizeInWords: usize) [*c]wchar_t;
extern fn _wmakepath(_ResultPath: [*c]wchar_t, _Drive: [*c]const wchar_t, _Dir: [*c]const wchar_t, _Filename: [*c]const wchar_t, _Ext: [*c]const wchar_t) void;
extern fn _wsearchenv(_Filename: [*c]const wchar_t, _EnvVar: [*c]const wchar_t, _ResultPath: [*c]wchar_t) void;
extern fn _wsplitpath(_FullPath: [*c]const wchar_t, _Drive: [*c]wchar_t, _Dir: [*c]wchar_t, _Filename: [*c]wchar_t, _Ext: [*c]wchar_t) void;
const _beep = @compileError("unable to resolve function type TypeClass.MacroQualified"); // C:\zig\lib\zig\libc\include\any-windows-any\stdlib.h:684:24
const _seterrormode = @compileError("unable to resolve function type TypeClass.MacroQualified"); // C:\zig\lib\zig\libc\include\any-windows-any\stdlib.h:686:24
const _sleep = @compileError("unable to resolve function type TypeClass.MacroQualified"); // C:\zig\lib\zig\libc\include\any-windows-any\stdlib.h:687:24
extern fn ecvt(_Val: f64, _NumOfDigits: c_int, _PtDec: [*c]c_int, _PtSign: [*c]c_int) [*c]u8;
extern fn fcvt(_Val: f64, _NumOfDec: c_int, _PtDec: [*c]c_int, _PtSign: [*c]c_int) [*c]u8;
extern fn gcvt(_Val: f64, _NumOfDigits: c_int, _DstBuf: [*c]u8) [*c]u8;
extern fn itoa(_Val: c_int, _DstBuf: [*c]u8, _Radix: c_int) [*c]u8;
extern fn ltoa(_Val: c_long, _DstBuf: [*c]u8, _Radix: c_int) [*c]u8;
extern fn putenv(_EnvString: [*c]const u8) c_int;
extern fn swab(_Buf1: [*c]u8, _Buf2: [*c]u8, _SizeInBytes: c_int) void;
extern fn ultoa(_Val: c_ulong, _Dstbuf: [*c]u8, _Radix: c_int) [*c]u8;
extern fn onexit(_Func: _onexit_t) _onexit_t;
const lldiv_t = extern struct {
    quot: c_longlong,
    rem: c_longlong,
};
extern fn lldiv(c_longlong, c_longlong) lldiv_t;
fn llabs(arg__j: c_longlong) callconv(.C) c_longlong {
    var _j = arg__j;
    return if (_j >= @bitCast(c_longlong, @as(c_longlong, @as(c_int, 0)))) _j else -_j;
}
extern fn strtoll([*c]const u8, [*c][*c]u8, c_int) c_longlong;
extern fn strtoull([*c]const u8, [*c][*c]u8, c_int) c_ulonglong;
fn atoll(arg__c: [*c]const u8) callconv(.C) c_longlong {
    var _c = arg__c;
    return _atoi64(_c);
}
fn wtoll(arg__w: [*c]const wchar_t) callconv(.C) c_longlong {
    var _w = arg__w;
    return _wtoi64(_w);
}
fn lltoa(arg__n: c_longlong, arg__c: [*c]u8, arg__i: c_int) callconv(.C) [*c]u8 {
    var _n = arg__n;
    var _c = arg__c;
    var _i = arg__i;
    return _i64toa(_n, _c, _i);
}
fn ulltoa(arg__n: c_ulonglong, arg__c: [*c]u8, arg__i: c_int) callconv(.C) [*c]u8 {
    var _n = arg__n;
    var _c = arg__c;
    var _i = arg__i;
    return _ui64toa(_n, _c, _i);
}
fn lltow(arg__n: c_longlong, arg__w: [*c]wchar_t, arg__i: c_int) callconv(.C) [*c]wchar_t {
    var _n = arg__n;
    var _w = arg__w;
    var _i = arg__i;
    return _i64tow(_n, _w, _i);
}
fn ulltow(arg__n: c_ulonglong, arg__w: [*c]wchar_t, arg__i: c_int) callconv(.C) [*c]wchar_t {
    var _n = arg__n;
    var _w = arg__w;
    var _i = arg__i;
    return _ui64tow(_n, _w, _i);
}
extern fn _dupenv_s(_PBuffer: [*c][*c]u8, _PBufferSizeInBytes: [*c]usize, _VarName: [*c]const u8) errno_t;
extern fn _itoa_s(_Value: c_int, _DstBuf: [*c]u8, _Size: usize, _Radix: c_int) errno_t;
extern fn _i64toa_s(_Val: c_longlong, _DstBuf: [*c]u8, _Size: usize, _Radix: c_int) errno_t;
extern fn _ui64toa_s(_Val: c_ulonglong, _DstBuf: [*c]u8, _Size: usize, _Radix: c_int) errno_t;
extern fn _ltoa_s(_Val: c_long, _DstBuf: [*c]u8, _Size: usize, _Radix: c_int) errno_t;
extern fn mbstowcs_s(_PtNumOfCharConverted: [*c]usize, _DstBuf: [*c]wchar_t, _SizeInWords: usize, _SrcBuf: [*c]const u8, _MaxCount: usize) errno_t;
extern fn _mbstowcs_s_l(_PtNumOfCharConverted: [*c]usize, _DstBuf: [*c]wchar_t, _SizeInWords: usize, _SrcBuf: [*c]const u8, _MaxCount: usize, _Locale: _locale_t) errno_t;
extern fn _ultoa_s(_Val: c_ulong, _DstBuf: [*c]u8, _Size: usize, _Radix: c_int) errno_t;
extern fn _wctomb_s_l(_SizeConverted: [*c]c_int, _MbCh: [*c]u8, _SizeInBytes: usize, _WCh: wchar_t, _Locale: _locale_t) errno_t;
extern fn wcstombs_s(_PtNumOfCharConverted: [*c]usize, _Dst: [*c]u8, _DstSizeInBytes: usize, _Src: [*c]const wchar_t, _MaxCountInBytes: usize) errno_t;
extern fn _wcstombs_s_l(_PtNumOfCharConverted: [*c]usize, _Dst: [*c]u8, _DstSizeInBytes: usize, _Src: [*c]const wchar_t, _MaxCountInBytes: usize, _Locale: _locale_t) errno_t;
extern fn _ecvt_s(_DstBuf: [*c]u8, _Size: usize, _Val: f64, _NumOfDights: c_int, _PtDec: [*c]c_int, _PtSign: [*c]c_int) errno_t;
extern fn _fcvt_s(_DstBuf: [*c]u8, _Size: usize, _Val: f64, _NumOfDec: c_int, _PtDec: [*c]c_int, _PtSign: [*c]c_int) errno_t;
extern fn _gcvt_s(_DstBuf: [*c]u8, _Size: usize, _Val: f64, _NumOfDigits: c_int) errno_t;
extern fn _makepath_s(_PathResult: [*c]u8, _Size: usize, _Drive: [*c]const u8, _Dir: [*c]const u8, _Filename: [*c]const u8, _Ext: [*c]const u8) errno_t;
extern fn _putenv_s(_Name: [*c]const u8, _Value: [*c]const u8) errno_t;
extern fn _searchenv_s(_Filename: [*c]const u8, _EnvVar: [*c]const u8, _ResultPath: [*c]u8, _SizeInBytes: usize) errno_t;
extern fn _splitpath_s(_FullPath: [*c]const u8, _Drive: [*c]u8, _DriveSize: usize, _Dir: [*c]u8, _DirSize: usize, _Filename: [*c]u8, _FilenameSize: usize, _Ext: [*c]u8, _ExtSize: usize) errno_t;
extern fn qsort_s(_Base: ?*c_void, _NumOfElements: usize, _SizeOfElements: usize, _PtFuncCompare: ?fn (?*c_void, ?*const c_void, ?*const c_void) callconv(.C) c_int, _Context: ?*c_void) void;
const struct__heapinfo = extern struct {
    _pentry: [*c]c_int,
    _size: usize,
    _useflag: c_int,
};
const _HEAPINFO = struct__heapinfo;
extern var _amblksiz: c_uint;
extern fn __mingw_aligned_malloc(_Size: usize, _Alignment: usize) ?*c_void;
extern fn __mingw_aligned_free(_Memory: ?*c_void) void;
extern fn __mingw_aligned_offset_realloc(_Memory: ?*c_void, _Size: usize, _Alignment: usize, _Offset: usize) ?*c_void;
extern fn __mingw_aligned_realloc(_Memory: ?*c_void, _Size: usize, _Offset: usize) ?*c_void;
extern fn _resetstkoflw() c_int;
extern fn _set_malloc_crt_max_wait(_NewValue: c_ulong) c_ulong;
extern fn _expand(_Memory: ?*c_void, _NewSize: usize) ?*c_void;
extern fn _msize(_Memory: ?*c_void) usize;
extern fn _get_sbh_threshold() usize;
extern fn _set_sbh_threshold(_NewValue: usize) c_int;
extern fn _set_amblksiz(_Value: usize) errno_t;
extern fn _get_amblksiz(_Value: [*c]usize) errno_t;
extern fn _heapadd(_Memory: ?*c_void, _Size: usize) c_int;
extern fn _heapchk() c_int;
extern fn _heapmin() c_int;
extern fn _heapset(_Fill: c_uint) c_int;
extern fn _heapwalk(_EntryInfo: [*c]_HEAPINFO) c_int;
extern fn _heapused(_Used: [*c]usize, _Commit: [*c]usize) usize;
extern fn _get_heap_handle() isize;
fn _MarkAllocaS(arg__Ptr: ?*c_void, arg__Marker: c_uint) callconv(.C) ?*c_void {
    var _Ptr = arg__Ptr;
    var _Marker = arg__Marker;
    if (_Ptr != null) {
        @ptrCast([*c]c_uint, @alignCast(@import("std").meta.alignment(c_uint), _Ptr)).?.* = _Marker;
        _Ptr = @ptrCast(?*c_void, @ptrCast([*c]u8, @alignCast(@import("std").meta.alignment(u8), _Ptr)) + @bitCast(usize, @intCast(isize, @as(c_int, 16))));
    }
    return _Ptr;
}
fn _freea(arg__Memory: ?*c_void) callconv(.C) void {
    var _Memory = arg__Memory;
    var _Marker: c_uint = undefined;
    if (_Memory != null) {
        _Memory = @ptrCast(?*c_void, @ptrCast([*c]u8, @alignCast(@import("std").meta.alignment(u8), _Memory)) - @bitCast(usize, @intCast(isize, @as(c_int, 16))));
        _Marker = @ptrCast([*c]c_uint, @alignCast(@import("std").meta.alignment(c_uint), _Memory)).?.*;
        if (_Marker == @bitCast(c_uint, @as(c_int, 56797))) {
            free(_Memory);
        }
    }
}
pub const stbi_uc = u8;
pub const stbi_us = c_ushort;
pub const stbi_io_callbacks = extern struct {
    read: ?fn (?*c_void, [*c]u8, c_int) callconv(.C) c_int,
    skip: ?fn (?*c_void, c_int) callconv(.C) void,
    eof: ?fn (?*c_void) callconv(.C) c_int,
};
pub extern fn stbi_load_from_memory(buffer: [*c]const stbi_uc, len: c_int, x: [*c]c_int, y: [*c]c_int, channels_in_file: [*c]c_int, desired_channels: c_int) [*c]stbi_uc;
pub extern fn stbi_load_from_callbacks(clbk: [*c]const stbi_io_callbacks, user: ?*c_void, x: [*c]c_int, y: [*c]c_int, channels_in_file: [*c]c_int, desired_channels: c_int) [*c]stbi_uc;
pub extern fn stbi_load(filename: [*c]const u8, x: [*c]c_int, y: [*c]c_int, channels_in_file: [*c]c_int, desired_channels: c_int) [*c]stbi_uc;
pub extern fn stbi_load_from_file(f: [*c]FILE, x: [*c]c_int, y: [*c]c_int, channels_in_file: [*c]c_int, desired_channels: c_int) [*c]stbi_uc;
pub extern fn stbi_load_gif_from_memory(buffer: [*c]const stbi_uc, len: c_int, delays: [*c][*c]c_int, x: [*c]c_int, y: [*c]c_int, z: [*c]c_int, comp: [*c]c_int, req_comp: c_int) [*c]stbi_uc;
pub extern fn stbi_load_16_from_memory(buffer: [*c]const stbi_uc, len: c_int, x: [*c]c_int, y: [*c]c_int, channels_in_file: [*c]c_int, desired_channels: c_int) [*c]stbi_us;
pub extern fn stbi_load_16_from_callbacks(clbk: [*c]const stbi_io_callbacks, user: ?*c_void, x: [*c]c_int, y: [*c]c_int, channels_in_file: [*c]c_int, desired_channels: c_int) [*c]stbi_us;
pub extern fn stbi_load_16(filename: [*c]const u8, x: [*c]c_int, y: [*c]c_int, channels_in_file: [*c]c_int, desired_channels: c_int) [*c]stbi_us;
pub extern fn stbi_load_from_file_16(f: [*c]FILE, x: [*c]c_int, y: [*c]c_int, channels_in_file: [*c]c_int, desired_channels: c_int) [*c]stbi_us;
pub extern fn stbi_loadf_from_memory(buffer: [*c]const stbi_uc, len: c_int, x: [*c]c_int, y: [*c]c_int, channels_in_file: [*c]c_int, desired_channels: c_int) [*c]f32;
pub extern fn stbi_loadf_from_callbacks(clbk: [*c]const stbi_io_callbacks, user: ?*c_void, x: [*c]c_int, y: [*c]c_int, channels_in_file: [*c]c_int, desired_channels: c_int) [*c]f32;
pub extern fn stbi_loadf(filename: [*c]const u8, x: [*c]c_int, y: [*c]c_int, channels_in_file: [*c]c_int, desired_channels: c_int) [*c]f32;
pub extern fn stbi_loadf_from_file(f: [*c]FILE, x: [*c]c_int, y: [*c]c_int, channels_in_file: [*c]c_int, desired_channels: c_int) [*c]f32;
pub extern fn stbi_hdr_to_ldr_gamma(gamma: f32) void;
pub extern fn stbi_hdr_to_ldr_scale(scale: f32) void;
pub extern fn stbi_ldr_to_hdr_gamma(gamma: f32) void;
pub extern fn stbi_ldr_to_hdr_scale(scale: f32) void;
pub extern fn stbi_is_hdr_from_callbacks(clbk: [*c]const stbi_io_callbacks, user: ?*c_void) c_int;
pub extern fn stbi_is_hdr_from_memory(buffer: [*c]const stbi_uc, len: c_int) c_int;
pub extern fn stbi_is_hdr(filename: [*c]const u8) c_int;
pub extern fn stbi_is_hdr_from_file(f: [*c]FILE) c_int;
pub extern fn stbi_failure_reason() [*c]const u8;
pub extern fn stbi_image_free(retval_from_stbi_load: ?*c_void) void;
pub extern fn stbi_info_from_memory(buffer: [*c]const stbi_uc, len: c_int, x: [*c]c_int, y: [*c]c_int, comp: [*c]c_int) c_int;
pub extern fn stbi_info_from_callbacks(clbk: [*c]const stbi_io_callbacks, user: ?*c_void, x: [*c]c_int, y: [*c]c_int, comp: [*c]c_int) c_int;
pub extern fn stbi_is_16_bit_from_memory(buffer: [*c]const stbi_uc, len: c_int) c_int;
pub extern fn stbi_is_16_bit_from_callbacks(clbk: [*c]const stbi_io_callbacks, user: ?*c_void) c_int;
pub extern fn stbi_info(filename: [*c]const u8, x: [*c]c_int, y: [*c]c_int, comp: [*c]c_int) c_int;
pub extern fn stbi_info_from_file(f: [*c]FILE, x: [*c]c_int, y: [*c]c_int, comp: [*c]c_int) c_int;
pub extern fn stbi_is_16_bit(filename: [*c]const u8) c_int;
pub extern fn stbi_is_16_bit_from_file(f: [*c]FILE) c_int;
pub extern fn stbi_set_unpremultiply_on_load(flag_true_if_should_unpremultiply: c_int) void;
pub extern fn stbi_convert_iphone_png_to_rgb(flag_true_if_should_convert: c_int) void;
pub extern fn stbi_set_flip_vertically_on_load(flag_true_if_should_flip: c_int) void;
pub extern fn stbi_set_flip_vertically_on_load_thread(flag_true_if_should_flip: c_int) void;
pub extern fn stbi_zlib_decode_malloc_guesssize(buffer: [*c]const u8, len: c_int, initial_size: c_int, outlen: [*c]c_int) [*c]u8;
pub extern fn stbi_zlib_decode_malloc_guesssize_headerflag(buffer: [*c]const u8, len: c_int, initial_size: c_int, outlen: [*c]c_int, parse_header: c_int) [*c]u8;
pub extern fn stbi_zlib_decode_malloc(buffer: [*c]const u8, len: c_int, outlen: [*c]c_int) [*c]u8;
pub extern fn stbi_zlib_decode_buffer(obuffer: [*c]u8, olen: c_int, ibuffer: [*c]const u8, ilen: c_int) c_int;
pub extern fn stbi_zlib_decode_noheader_malloc(buffer: [*c]const u8, len: c_int, outlen: [*c]c_int) [*c]u8;
pub extern fn stbi_zlib_decode_noheader_buffer(obuffer: [*c]u8, olen: c_int, ibuffer: [*c]const u8, ilen: c_int) c_int;
const __INTMAX_TYPE__ = @compileError("unable to translate C expr: unexpected token .Keyword_long"); // (no file):61:9
const __UINTMAX_TYPE__ = @compileError("unable to translate C expr: unexpected token .Keyword_long"); // (no file):65:9
const __PTRDIFF_TYPE__ = @compileError("unable to translate C expr: unexpected token .Keyword_long"); // (no file):72:9
const __INTPTR_TYPE__ = @compileError("unable to translate C expr: unexpected token .Keyword_long"); // (no file):76:9
const __SIZE_TYPE__ = @compileError("unable to translate C expr: unexpected token .Keyword_long"); // (no file):80:9
const __UINTPTR_TYPE__ = @compileError("unable to translate C expr: unexpected token .Keyword_long"); // (no file):95:9
const __INT64_TYPE__ = @compileError("unable to translate C expr: unexpected token .Keyword_long"); // (no file):159:9
const __UINT64_TYPE__ = @compileError("unable to translate C expr: unexpected token .Keyword_long"); // (no file):187:9
const __INT_LEAST64_TYPE__ = @compileError("unable to translate C expr: unexpected token .Keyword_long"); // (no file):225:9
const __UINT_LEAST64_TYPE__ = @compileError("unable to translate C expr: unexpected token .Keyword_long"); // (no file):229:9
const __INT_FAST64_TYPE__ = @compileError("unable to translate C expr: unexpected token .Keyword_long"); // (no file):265:9
const __UINT_FAST64_TYPE__ = @compileError("unable to translate C expr: unexpected token .Keyword_long"); // (no file):269:9
const __STRINGIFY = @compileError("unable to translate C expr: unexpected token .Hash"); // C:\zig\lib\zig\libc\include\any-windows-any/_mingw_mac.h:10:9
const __MINGW64_VERSION_STR = @compileError("unable to translate C expr: unexpected token .StringLiteral"); // C:\zig\lib\zig\libc\include\any-windows-any/_mingw_mac.h:26:9
const __MINGW_IMP_SYMBOL = @compileError("unable to translate C expr: unexpected token .HashHash"); // C:\zig\lib\zig\libc\include\any-windows-any/_mingw_mac.h:119:11
const __MINGW_IMP_LSYMBOL = @compileError("unable to translate C expr: unexpected token .HashHash"); // C:\zig\lib\zig\libc\include\any-windows-any/_mingw_mac.h:120:11
const __MINGW_LSYMBOL = @compileError("unable to translate C expr: unexpected token .HashHash"); // C:\zig\lib\zig\libc\include\any-windows-any/_mingw_mac.h:122:11
const __MINGW_POISON_NAME = @compileError("unable to translate C expr: unexpected token .HashHash"); // C:\zig\lib\zig\libc\include\any-windows-any/_mingw_mac.h:203:11
const __MSABI_LONG = @compileError("unable to translate C expr: unexpected token .HashHash"); // C:\zig\lib\zig\libc\include\any-windows-any/_mingw_mac.h:209:13
const __MINGW_ATTRIB_DEPRECATED_STR = @compileError("unable to translate C expr: unexpected token .Nl"); // C:\zig\lib\zig\libc\include\any-windows-any/_mingw_mac.h:247:11
const __mingw_ovr = @compileError("unable to translate C expr: unexpected token .Keyword_static"); // C:\zig\lib\zig\libc\include\any-windows-any/_mingw_mac.h:289:11
const __MINGW_CRT_NAME_CONCAT2 = @compileError("unable to translate C expr: unexpected token .Colon"); // C:\zig\lib\zig\libc\include\any-windows-any/_mingw_secapi.h:41:9
const __CRT_SECURE_CPP_OVERLOAD_STANDARD_NAMES_MEMORY_0_3_ = @compileError("unable to translate C expr: unexpected token .Identifier"); // C:\zig\lib\zig\libc\include\any-windows-any/_mingw_secapi.h:69:9
const __MINGW_IMPORT = @compileError("unable to translate C expr: unexpected token .Keyword_extern"); // C:\zig\lib\zig\libc\include\any-windows-any\_mingw.h:51:12
const __CRT_INLINE = @compileError("unable to translate C expr: unexpected token .Keyword_extern"); // C:\zig\lib\zig\libc\include\any-windows-any\_mingw.h:90:11
const __MINGW_INTRIN_INLINE = @compileError("unable to translate C expr: unexpected token .Keyword_extern"); // C:\zig\lib\zig\libc\include\any-windows-any\_mingw.h:97:9
const __MINGW_PRAGMA_PARAM = @compileError("unable to translate C expr: unexpected token .Nl"); // C:\zig\lib\zig\libc\include\any-windows-any\_mingw.h:215:9
const __MINGW_BROKEN_INTERFACE = @compileError("unable to translate C expr: expected ',' or ')'"); // C:\zig\lib\zig\libc\include\any-windows-any\_mingw.h:218:9
const __int64 = @compileError("unable to translate C expr: unexpected token .Keyword_long"); // C:\zig\lib\zig\libc\include\any-windows-any\_mingw.h:242:9
const __forceinline = @compileError("unable to translate C expr: unexpected token .Keyword_extern"); // C:\zig\lib\zig\libc\include\any-windows-any\_mingw.h:267:9
const _crt_va_start = @compileError("TODO implement function '__builtin_va_start' in std.c.builtins"); // C:\zig\lib\zig\libc\include\any-windows-any\vadefs.h:48:9
const _crt_va_arg = @compileError("TODO implement function '__builtin_va_arg' in std.c.builtins"); // C:\zig\lib\zig\libc\include\any-windows-any\vadefs.h:49:9
const _crt_va_end = @compileError("TODO implement function '__builtin_va_end' in std.c.builtins"); // C:\zig\lib\zig\libc\include\any-windows-any\vadefs.h:50:9
const _crt_va_copy = @compileError("TODO implement function '__builtin_va_copy' in std.c.builtins"); // C:\zig\lib\zig\libc\include\any-windows-any\vadefs.h:51:9
const __CRT_STRINGIZE = @compileError("unable to translate C expr: unexpected token .Hash"); // C:\zig\lib\zig\libc\include\any-windows-any\_mingw.h:286:9
const __CRT_WIDE = @compileError("unable to translate C expr: unexpected token .HashHash"); // C:\zig\lib\zig\libc\include\any-windows-any\_mingw.h:291:9
const _CRT_INSECURE_DEPRECATE_MEMORY = @compileError("unable to translate C expr: unexpected token .Nl"); // C:\zig\lib\zig\libc\include\any-windows-any\_mingw.h:353:9
const _CRT_INSECURE_DEPRECATE_GLOBALS = @compileError("unable to translate C expr: unexpected token .Nl"); // C:\zig\lib\zig\libc\include\any-windows-any\_mingw.h:357:9
const _CRT_OBSOLETE = @compileError("unable to translate C expr: unexpected token .Nl"); // C:\zig\lib\zig\libc\include\any-windows-any\_mingw.h:365:9
const _UNION_NAME = @compileError("unable to translate C expr: unexpected token .Nl"); // C:\zig\lib\zig\libc\include\any-windows-any\_mingw.h:476:9
const _STRUCT_NAME = @compileError("unable to translate C expr: unexpected token .Nl"); // C:\zig\lib\zig\libc\include\any-windows-any\_mingw.h:477:9
const __CRT_UUID_DECL = @compileError("unable to translate C expr: unexpected token .Nl"); // C:\zig\lib\zig\libc\include\any-windows-any\_mingw.h:564:9
const __DEFINE_CPP_OVERLOAD_SECURE_FUNC_0_0 = @compileError("unable to translate C expr: unexpected token .Nl"); // C:\zig\lib\zig\libc\include\any-windows-any\corecrt.h:267:9
const __DEFINE_CPP_OVERLOAD_SECURE_FUNC_0_1 = @compileError("unable to translate C expr: unexpected token .Nl"); // C:\zig\lib\zig\libc\include\any-windows-any\corecrt.h:268:9
const __DEFINE_CPP_OVERLOAD_SECURE_FUNC_0_2 = @compileError("unable to translate C expr: unexpected token .Nl"); // C:\zig\lib\zig\libc\include\any-windows-any\corecrt.h:269:9
const __DEFINE_CPP_OVERLOAD_SECURE_FUNC_0_3 = @compileError("unable to translate C expr: unexpected token .Nl"); // C:\zig\lib\zig\libc\include\any-windows-any\corecrt.h:270:9
const __DEFINE_CPP_OVERLOAD_SECURE_FUNC_0_4 = @compileError("unable to translate C expr: unexpected token .Nl"); // C:\zig\lib\zig\libc\include\any-windows-any\corecrt.h:271:9
const __DEFINE_CPP_OVERLOAD_SECURE_FUNC_1_1 = @compileError("unable to translate C expr: unexpected token .Nl"); // C:\zig\lib\zig\libc\include\any-windows-any\corecrt.h:272:9
const __DEFINE_CPP_OVERLOAD_SECURE_FUNC_1_2 = @compileError("unable to translate C expr: unexpected token .Nl"); // C:\zig\lib\zig\libc\include\any-windows-any\corecrt.h:273:9
const __DEFINE_CPP_OVERLOAD_SECURE_FUNC_1_3 = @compileError("unable to translate C expr: unexpected token .Nl"); // C:\zig\lib\zig\libc\include\any-windows-any\corecrt.h:274:9
const __DEFINE_CPP_OVERLOAD_SECURE_FUNC_2_0 = @compileError("unable to translate C expr: unexpected token .Nl"); // C:\zig\lib\zig\libc\include\any-windows-any\corecrt.h:275:9
const __DEFINE_CPP_OVERLOAD_SECURE_FUNC_0_1_ARGLIST = @compileError("unable to translate C expr: unexpected token .Nl"); // C:\zig\lib\zig\libc\include\any-windows-any\corecrt.h:276:9
const __DEFINE_CPP_OVERLOAD_SECURE_FUNC_0_2_ARGLIST = @compileError("unable to translate C expr: unexpected token .Nl"); // C:\zig\lib\zig\libc\include\any-windows-any\corecrt.h:277:9
const __DEFINE_CPP_OVERLOAD_SECURE_FUNC_SPLITPATH = @compileError("unable to translate C expr: unexpected token .Nl"); // C:\zig\lib\zig\libc\include\any-windows-any\corecrt.h:278:9
const __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_0 = @compileError("unable to translate C expr: expected ',' or ')'"); // C:\zig\lib\zig\libc\include\any-windows-any\corecrt.h:282:9
const __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // C:\zig\lib\zig\libc\include\any-windows-any\corecrt.h:284:9
const __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // C:\zig\lib\zig\libc\include\any-windows-any\corecrt.h:286:9
const __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // C:\zig\lib\zig\libc\include\any-windows-any\corecrt.h:288:9
const __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // C:\zig\lib\zig\libc\include\any-windows-any\corecrt.h:290:9
const __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_0_EX = @compileError("unable to translate C expr: unexpected token .Nl"); // C:\zig\lib\zig\libc\include\any-windows-any\corecrt.h:427:9
const __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_1_EX = @compileError("unable to translate C expr: unexpected token .Nl"); // C:\zig\lib\zig\libc\include\any-windows-any\corecrt.h:428:9
const __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_2_EX = @compileError("unable to translate C expr: unexpected token .Nl"); // C:\zig\lib\zig\libc\include\any-windows-any\corecrt.h:429:9
const __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_3_EX = @compileError("unable to translate C expr: unexpected token .Nl"); // C:\zig\lib\zig\libc\include\any-windows-any\corecrt.h:430:9
const __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_4_EX = @compileError("unable to translate C expr: unexpected token .Nl"); // C:\zig\lib\zig\libc\include\any-windows-any\corecrt.h:431:9
const __crt_typefix = @compileError("unable to translate C expr: unexpected token .Nl"); // C:\zig\lib\zig\libc\include\any-windows-any\corecrt.h:491:9
const _fgetc_nolock = @compileError("TODO unary inc/dec expr"); // C:\zig\lib\zig\libc\include\any-windows-any\stdio.h:1462:9
const _fputc_nolock = @compileError("TODO unary inc/dec expr"); // C:\zig\lib\zig\libc\include\any-windows-any\stdio.h:1463:9
const _STATIC_ASSERT = @compileError("unable to translate C expr: unexpected token .Keyword_extern"); // C:\zig\lib\zig\libc\include\any-windows-any\malloc.h:27:9
const _alloca = @compileError("TODO implement function '__builtin_alloca' in std.c.builtins"); // C:\zig\lib\zig\libc\include\any-windows-any\malloc.h:119:9
const alloca = @compileError("TODO implement function '__builtin_alloca' in std.c.builtins"); // C:\zig\lib\zig\libc\include\any-windows-any\malloc.h:185:9
const STBIDEF = @compileError("unable to translate C expr: unexpected token .Keyword_extern"); // stb_image.h:367:9
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
const _CRT_INTERNAL_PRINTF_LEGACY_VSPRINTF_NULL_TERMINATION = @as(c_ulonglong, 0x0001);
const _CRT_INTERNAL_PRINTF_STANDARD_SNPRINTF_BEHAVIOR = @as(c_ulonglong, 0x0002);
const _CRT_INTERNAL_PRINTF_LEGACY_WIDE_SPECIFIERS = @as(c_ulonglong, 0x0004);
const _CRT_INTERNAL_PRINTF_LEGACY_MSVCRT_COMPATIBILITY = @as(c_ulonglong, 0x0008);
const _CRT_INTERNAL_PRINTF_LEGACY_THREE_DIGIT_EXPONENTS = @as(c_ulonglong, 0x0010);
const _CRT_INTERNAL_SCANF_SECURECRT = @as(c_ulonglong, 0x0001);
const _CRT_INTERNAL_SCANF_LEGACY_WIDE_SPECIFIERS = @as(c_ulonglong, 0x0002);
const _CRT_INTERNAL_SCANF_LEGACY_MSVCRT_COMPATIBILITY = @as(c_ulonglong, 0x0004);
const _CRT_INTERNAL_LOCAL_PRINTF_OPTIONS = _CRT_INTERNAL_PRINTF_LEGACY_WIDE_SPECIFIERS;
const _CRT_INTERNAL_LOCAL_SCANF_OPTIONS = _CRT_INTERNAL_SCANF_LEGACY_WIDE_SPECIFIERS;
const BUFSIZ = @as(c_int, 512);
const _NFILE = _NSTREAM_;
const _NSTREAM_ = @as(c_int, 512);
const _IOB_ENTRIES = @as(c_int, 20);
const EOF = -@as(c_int, 1);
const _P_tmpdir = "\\";
const _wP_tmpdir = "\\";
const L_tmpnam = @import("std").meta.sizeof(_P_tmpdir) + @as(c_int, 12);
const SEEK_CUR = @as(c_int, 1);
const SEEK_END = @as(c_int, 2);
const SEEK_SET = @as(c_int, 0);
const STDIN_FILENO = @as(c_int, 0);
const STDOUT_FILENO = @as(c_int, 1);
const STDERR_FILENO = @as(c_int, 2);
const FILENAME_MAX = @as(c_int, 260);
const FOPEN_MAX = @as(c_int, 20);
const _SYS_OPEN = @as(c_int, 20);
const TMP_MAX = @as(c_int, 32767);
const NULL = @import("std").meta.cast(?*c_void, @as(c_int, 0));
const _iob = __iob_func();
inline fn _FPOSOFF(fp: anytype) c_long {
    return @import("std").meta.cast(c_long, fp);
}
const stdin = __acrt_iob_func(@as(c_int, 0));
const stdout = __acrt_iob_func(@as(c_int, 1));
const stderr = __acrt_iob_func(@as(c_int, 2));
const _IOREAD = @as(c_int, 0x0001);
const _IOWRT = @as(c_int, 0x0002);
const _IOFBF = @as(c_int, 0x0000);
const _IOLBF = @as(c_int, 0x0040);
const _IONBF = @as(c_int, 0x0004);
const _IOMYBUF = @as(c_int, 0x0008);
const _IOEOF = @as(c_int, 0x0010);
const _IOERR = @as(c_int, 0x0020);
const _IOSTRG = @as(c_int, 0x0040);
const _IORW = @as(c_int, 0x0080);
const _TWO_DIGIT_EXPONENT = @as(c_int, 0x1);
const __MINGW_PRINTF_FORMAT = printf;
const __MINGW_SCANF_FORMAT = scanf;
const __builtin_vsnprintf = __mingw_vsnprintf;
const __builtin_vsprintf = __mingw_vsprintf;
const popen = _popen;
const pclose = _pclose;
const WEOF = @import("std").meta.cast(wint_t, @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xFFFF, .hexadecimal));
const wpopen = _wpopen;
inline fn _putwc_nolock(_c: anytype, _stm: anytype) @TypeOf(_fputwc_nolock(_c, _stm)) {
    return _fputwc_nolock(_c, _stm);
}
inline fn _getwc_nolock(_c: anytype) @TypeOf(_fgetwc_nolock(_c)) {
    return _fgetwc_nolock(_c);
}
inline fn _getc_nolock(_stream: anytype) @TypeOf(_fgetc_nolock(_stream)) {
    return _fgetc_nolock(_stream);
}
inline fn _putc_nolock(_c: anytype, _stream: anytype) @TypeOf(_fputc_nolock(_c, _stream)) {
    return _fputc_nolock(_c, _stream);
}
inline fn _getchar_nolock() @TypeOf(_getc_nolock(stdin)) {
    return _getc_nolock(stdin);
}
inline fn _putchar_nolock(_c: anytype) @TypeOf(_putc_nolock(_c, stdout)) {
    return _putc_nolock(_c, stdout);
}
inline fn _getwchar_nolock() @TypeOf(_getwc_nolock(stdin)) {
    return _getwc_nolock(stdin);
}
inline fn _putwchar_nolock(_c: anytype) @TypeOf(_putwc_nolock(_c, stdout)) {
    return _putwc_nolock(_c, stdout);
}
const P_tmpdir = _P_tmpdir;
const SYS_OPEN = _SYS_OPEN;
const _P_WAIT = @as(c_int, 0);
const _P_NOWAIT = @as(c_int, 1);
const _OLD_P_OVERLAY = @as(c_int, 2);
const _P_NOWAITO = @as(c_int, 3);
const _P_DETACH = @as(c_int, 4);
const _P_OVERLAY = @as(c_int, 2);
const _WAIT_CHILD = @as(c_int, 0);
const _WAIT_GRANDCHILD = @as(c_int, 1);
const _SECIMP = __declspec(dllimport);
const L_tmpnam_s = L_tmpnam;
const TMP_MAX_S = TMP_MAX;
const STBI_VERSION = @as(c_int, 1);
const PATH_MAX = @as(c_int, 260);
const CHAR_BIT = @as(c_int, 8);
const SCHAR_MIN = -@as(c_int, 128);
const SCHAR_MAX = @as(c_int, 127);
const UCHAR_MAX = @as(c_int, 0xff);
const CHAR_MIN = SCHAR_MIN;
const CHAR_MAX = SCHAR_MAX;
const MB_LEN_MAX = @as(c_int, 5);
const SHRT_MIN = -@import("std").zig.c_translation.promoteIntLiteral(c_int, 32768, .decimal);
const SHRT_MAX = @as(c_int, 32767);
const USHRT_MAX = @as(c_uint, 0xffff);
const INT_MIN = -@import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal) - @as(c_int, 1);
const INT_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
const UINT_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0xffffffff, .hexadecimal);
const LONG_MIN = -@as(c_long, 2147483647) - @as(c_int, 1);
const LONG_MAX = @as(c_long, 2147483647);
const ULONG_MAX = @as(c_ulong, 0xffffffff);
const LLONG_MAX = @as(c_longlong, 9223372036854775807);
const LLONG_MIN = -@as(c_longlong, 9223372036854775807) - @as(c_int, 1);
const ULLONG_MAX = @as(c_ulonglong, 0xffffffffffffffff);
const _I8_MIN = -@as(c_int, 127) - @as(c_int, 1);
const _I8_MAX = @as(c_int, 127);
const _UI8_MAX = @as(c_uint, 0xff);
const _I16_MIN = -@as(c_int, 32767) - @as(c_int, 1);
const _I16_MAX = @as(c_int, 32767);
const _UI16_MAX = @as(c_uint, 0xffff);
const _I32_MIN = -@import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal) - @as(c_int, 1);
const _I32_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
const _UI32_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0xffffffff, .hexadecimal);
const LONG_LONG_MAX = @as(c_longlong, 9223372036854775807);
const LONG_LONG_MIN = -LONG_LONG_MAX - @as(c_int, 1);
const ULONG_LONG_MAX = (@as(c_ulonglong, 2) * LONG_LONG_MAX) + @as(c_ulonglong, 1);
const _I64_MIN = -@as(c_longlong, 9223372036854775807) - @as(c_int, 1);
const _I64_MAX = @as(c_longlong, 9223372036854775807);
const _UI64_MAX = @as(c_ulonglong, 0xffffffffffffffff);
const SIZE_MAX = _UI64_MAX;
const SSIZE_MAX = _I64_MAX;
const __USE_MINGW_STRTOX = @as(c_int, 1);
const EXIT_SUCCESS = @as(c_int, 0);
const EXIT_FAILURE = @as(c_int, 1);
const onexit_t = _onexit_t;
inline fn _PTR_LD(x: anytype) [*c]u8 {
    return @import("std").meta.cast([*c]u8, &x.*.ld);
}
const RAND_MAX = @as(c_int, 0x7fff);
const MB_CUR_MAX = ___mb_cur_max_func();
const __mb_cur_max = ___mb_cur_max_func();
inline fn __max(a: anytype, b: anytype) @TypeOf(if (a > b) a else b) {
    return if (a > b) a else b;
}
inline fn __min(a: anytype, b: anytype) @TypeOf(if (a < b) a else b) {
    return if (a < b) a else b;
}
const _MAX_PATH = @as(c_int, 260);
const _MAX_DRIVE = @as(c_int, 3);
const _MAX_DIR = @as(c_int, 256);
const _MAX_FNAME = @as(c_int, 256);
const _MAX_EXT = @as(c_int, 256);
const _OUT_TO_DEFAULT = @as(c_int, 0);
const _OUT_TO_STDERR = @as(c_int, 1);
const _OUT_TO_MSGBOX = @as(c_int, 2);
const _REPORT_ERRMODE = @as(c_int, 3);
const _WRITE_ABORT_MSG = @as(c_int, 0x1);
const _CALL_REPORTFAULT = @as(c_int, 0x2);
const _MAX_ENV = @as(c_int, 32767);
const errno = _errno().*;
const _doserrno = __doserrno().*;
const _fmode = __p__fmode().*;
const __argc = __MINGW_IMP_SYMBOL(__argc).*;
const __argv = __p___argv().*;
const __wargv = __MINGW_IMP_SYMBOL(__wargv).*;
const _environ = __MINGW_IMP_SYMBOL(_environ).*;
const _wenviron = __MINGW_IMP_SYMBOL(_wenviron).*;
const _pgmptr = __MINGW_IMP_SYMBOL(_pgmptr).*;
const _wpgmptr = __MINGW_IMP_SYMBOL(_wpgmptr).*;
const _osplatform = __MINGW_IMP_SYMBOL(_osplatform).*;
const _osver = __MINGW_IMP_SYMBOL(_osver).*;
const _winver = __MINGW_IMP_SYMBOL(_winver).*;
const _winmajor = __MINGW_IMP_SYMBOL(_winmajor).*;
const _winminor = __MINGW_IMP_SYMBOL(_winminor).*;
inline fn _countof(_Array: anytype) @TypeOf(@import("std").meta.sizeof(_Array) / @import("std").meta.sizeof(_Array[@as(c_int, 0)])) {
    return @import("std").meta.sizeof(_Array) / @import("std").meta.sizeof(_Array[@as(c_int, 0)]);
}
const _CVTBUFSIZE = @as(c_int, 309) + @as(c_int, 40);
const sys_errlist = _sys_errlist;
const sys_nerr = _sys_nerr;
const environ = _environ;
const _HEAP_MAXREQ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xFFFFFFFFFFFFFFE0, .hexadecimal);
const _HEAPEMPTY = -@as(c_int, 1);
const _HEAPOK = -@as(c_int, 2);
const _HEAPBADBEGIN = -@as(c_int, 3);
const _HEAPBADNODE = -@as(c_int, 4);
const _HEAPEND = -@as(c_int, 5);
const _HEAPBADPTR = -@as(c_int, 6);
const _FREEENTRY = @as(c_int, 0);
const _USEDENTRY = @as(c_int, 1);
inline fn _mm_free(a: anytype) @TypeOf(_aligned_free(a)) {
    return _aligned_free(a);
}
inline fn _mm_malloc(a: anytype, b: anytype) @TypeOf(_aligned_malloc(a, b)) {
    return _aligned_malloc(a, b);
}
const _MAX_WAIT_MALLOC_CRT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 60000, .decimal);
const _ALLOCA_S_THRESHOLD = @as(c_int, 1024);
const _ALLOCA_S_STACK_MARKER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xCCCC, .hexadecimal);
const _ALLOCA_S_HEAP_MARKER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xDDDD, .hexadecimal);
const _ALLOCA_S_MARKER_SIZE = @as(c_int, 16);
inline fn _malloca(size: anytype) @TypeOf(if ((size + _ALLOCA_S_MARKER_SIZE) <= _ALLOCA_S_THRESHOLD) _MarkAllocaS(_alloca(size + _ALLOCA_S_MARKER_SIZE), _ALLOCA_S_STACK_MARKER) else _MarkAllocaS(malloc(size + _ALLOCA_S_MARKER_SIZE), _ALLOCA_S_HEAP_MARKER)) {
    return if ((size + _ALLOCA_S_MARKER_SIZE) <= _ALLOCA_S_THRESHOLD) _MarkAllocaS(_alloca(size + _ALLOCA_S_MARKER_SIZE), _ALLOCA_S_STACK_MARKER) else _MarkAllocaS(malloc(size + _ALLOCA_S_MARKER_SIZE), _ALLOCA_S_HEAP_MARKER);
}
const tagLC_ID = struct_tagLC_ID;
const lconv = struct_lconv;
const __lc_time_data = struct___lc_time_data;
const threadlocaleinfostruct = struct_threadlocaleinfostruct;
const threadmbcinfostruct = struct_threadmbcinfostruct;
const localeinfo_struct = struct_localeinfo_struct;
const _iobuf = struct__iobuf;
const _div_t = struct__div_t;
const _ldiv_t = struct__ldiv_t;
const _heapinfo = struct__heapinfo;
