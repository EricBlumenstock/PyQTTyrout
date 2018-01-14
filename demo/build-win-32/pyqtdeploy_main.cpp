// Py_BUILD_CORE/HAVE_STD_ATOMIC conflict workaround.
#include <pyconfig.h>
#undef HAVE_STD_ATOMIC

#include <Python.h>
#include <QtGlobal>


extern "C" PyObject *PyInit__heapq(void);
extern "C" PyObject *PyInit__winapi(void);
extern "C" PyObject *PyInit_math(void);
extern "C" PyObject *PyInit_msvcrt(void);
extern "C" PyObject *PyInit_select(void);
extern "C" PyObject *PyInit_time(void);

static struct _inittab extension_modules[] = {
    {"_heapq", PyInit__heapq},
    {"_winapi", PyInit__winapi},
    {"math", PyInit_math},
    {"msvcrt", PyInit_msvcrt},
    {"select", PyInit_select},
    {"time", PyInit_time},
    {NULL, NULL}
};


#include <windows.h>

extern int pyqtdeploy_start(int argc, wchar_t **w_argv,
        struct _inittab *extension_modules, const char *main_module,
        const char *entry_point, const char **path_dirs);

int main(int argc, char **)
{
    LPWSTR *w_argv = CommandLineToArgvW(GetCommandLineW(), &argc);

    return pyqtdeploy_start(argc, w_argv, extension_modules, "__main__", NULL, NULL);
}
