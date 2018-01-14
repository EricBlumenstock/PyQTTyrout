# Generated for win-32 and Python v3.6.4.

TEMPLATE = app

QT -= gui
CONFIG += warn_off console

RESOURCES = \
    resources/pyqtdeploy.qrc

DEFINES += PYQTDEPLOY_FROZEN_MAIN PYQTDEPLOY_OPTIMIZED
DEFINES += Py_BUILD_CORE

INCLUDEPATH += C:/Users/ericb/Desktop/PyQTTyrout/demo/sysroot-win-32/include/python3.6
INCLUDEPATH += C:/Users/ericb/Desktop/PyQTTyrout/demo/sysroot-win-32/src/Python-3.6.4/Modules

SOURCES = pyqtdeploy_main.cpp pyqtdeploy_start.cpp pdytools_module.cpp
SOURCES += C:/Users/ericb/Desktop/PyQTTyrout/demo/sysroot-win-32/src/Python-3.6.4/Modules/_heapqmodule.c
SOURCES += C:/Users/ericb/Desktop/PyQTTyrout/demo/sysroot-win-32/src/Python-3.6.4/Modules/_math.c
SOURCES += C:/Users/ericb/Desktop/PyQTTyrout/demo/sysroot-win-32/src/Python-3.6.4/Modules/_winapi.c
SOURCES += C:/Users/ericb/Desktop/PyQTTyrout/demo/sysroot-win-32/src/Python-3.6.4/Modules/mathmodule.c
SOURCES += C:/Users/ericb/Desktop/PyQTTyrout/demo/sysroot-win-32/src/Python-3.6.4/Modules/selectmodule.c
SOURCES += C:/Users/ericb/Desktop/PyQTTyrout/demo/sysroot-win-32/src/Python-3.6.4/Modules/timemodule.c
SOURCES += C:/Users/ericb/Desktop/PyQTTyrout/demo/sysroot-win-32/src/Python-3.6.4/PC/msvcrtmodule.c

HEADERS = pyqtdeploy_version.h frozen_bootstrap.h frozen_bootstrap_external.h frozen_main.h

LIBS += -LC:/Users/ericb/Desktop/PyQTTyrout/demo/sysroot-win-32/lib
LIBS += -lpython36

PDY_DLL = C:/Users/ericb/Desktop/PyQTTyrout/demo/sysroot-win-32/lib/DLLs3.6/python36.dll
exists($$PDY_DLL) {
    CONFIG(debug, debug|release) {
        QMAKE_POST_LINK += $(COPY_FILE) $$shell_path($$PDY_DLL) $$shell_path($$OUT_PWD/debug) &
    } else {
        QMAKE_POST_LINK += $(COPY_FILE) $$shell_path($$PDY_DLL) $$shell_path($$OUT_PWD/release) &
    }
}

PDY_DLL = C:/Users/ericb/Desktop/PyQTTyrout/demo/sysroot-win-32/lib/DLLs3.6/vcruntime140.dll
exists($$PDY_DLL) {
    CONFIG(debug, debug|release) {
        QMAKE_POST_LINK += $(COPY_FILE) $$shell_path($$PDY_DLL) $$shell_path($$OUT_PWD/debug) &
    } else {
        QMAKE_POST_LINK += $(COPY_FILE) $$shell_path($$PDY_DLL) $$shell_path($$OUT_PWD/release) &
    }
}

PDY_DLL = C:/Users/ericb/Desktop/PyQTTyrout/demo/sysroot-win-32/lib/DLLs3.6/select.pyd
exists($$PDY_DLL) {
    CONFIG(debug, debug|release) {
        QMAKE_POST_LINK += $(COPY_FILE) $$shell_path($$PDY_DLL) $$shell_path($$OUT_PWD/debug) &
    } else {
        QMAKE_POST_LINK += $(COPY_FILE) $$shell_path($$PDY_DLL) $$shell_path($$OUT_PWD/release) &
    }
}

cython.name = Cython compiler
cython.input = CYTHONSOURCES
cython.output = ${QMAKE_FILE_BASE}.c
cython.variable_out = GENERATED_SOURCES
cython.commands = cython ${QMAKE_FILE_IN} -o ${QMAKE_FILE_OUT}

QMAKE_EXTRA_COMPILERS += cython

linux-* {
    LIBS += -lutil -ldl
}

win32 {
    masm.input = MASMSOURCES
    masm.output = ${QMAKE_FILE_BASE}.obj

    contains(QMAKE_TARGET.arch, x86_64) {
        masm.name = MASM64 compiler
        masm.commands = ml64 /Fo ${QMAKE_FILE_OUT} /c ${QMAKE_FILE_IN}
    } else {
        masm.name = MASM compiler
        masm.commands = ml /Fo ${QMAKE_FILE_OUT} /c ${QMAKE_FILE_IN}
    }

    QMAKE_EXTRA_COMPILERS += masm

    LIBS += -lshlwapi -ladvapi32 -lshell32 -luser32 -lws2_32 -lole32 -loleaut32
    DEFINES += MS_WINDOWS _WIN32_WINNT=Py_WINVER NTDDI_VERSION=Py_NTDDI WINVER=Py_WINVER

    # This is added from the qmake spec files but clashes with _pickle.c.
    DEFINES -= UNICODE
}

macx {
    LIBS += -framework SystemConfiguration -framework CoreFoundation
}
