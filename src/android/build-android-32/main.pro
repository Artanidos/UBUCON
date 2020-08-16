# Generated for android-32 and Python v3.7.2.

TEMPLATE = app

QT += sensors quick androidextras network widgets bluetooth svg quickwidgets qml
CONFIG += warn_off

QMAKE_CFLAGS += -std=c99

RESOURCES = \
    resources/pyqtdeploy.qrc

DEFINES += PYQTDEPLOY_FROZEN_MAIN PYQTDEPLOY_OPTIMIZED

INCLUDEPATH += /media/art/data/SourceCode/UBUCON/src/android/sysroot-android-32/include
INCLUDEPATH += /media/art/data/SourceCode/UBUCON/src/android/sysroot-android-32/include/python3.7
INCLUDEPATH += /media/art/data/SourceCode/UBUCON/src/android/sysroot-android-32/src/Python-3.7.2/Modules
INCLUDEPATH += /media/art/data/SourceCode/UBUCON/src/android/sysroot-android-32/src/Python-3.7.2/Modules/_blake2
INCLUDEPATH += /media/art/data/SourceCode/UBUCON/src/android/sysroot-android-32/src/Python-3.7.2/Modules/_sha3

SOURCES = pyqtdeploy_main.cpp pyqtdeploy_start.cpp pdytools_module.cpp
SOURCES += /media/art/data/SourceCode/UBUCON/src/android/sysroot-android-32/src/Python-3.7.2/Modules/_abc.c
SOURCES += /media/art/data/SourceCode/UBUCON/src/android/sysroot-android-32/src/Python-3.7.2/Modules/_bisectmodule.c
SOURCES += /media/art/data/SourceCode/UBUCON/src/android/sysroot-android-32/src/Python-3.7.2/Modules/_blake2/blake2b_impl.c
SOURCES += /media/art/data/SourceCode/UBUCON/src/android/sysroot-android-32/src/Python-3.7.2/Modules/_blake2/blake2module.c
SOURCES += /media/art/data/SourceCode/UBUCON/src/android/sysroot-android-32/src/Python-3.7.2/Modules/_blake2/blake2s_impl.c
SOURCES += /media/art/data/SourceCode/UBUCON/src/android/sysroot-android-32/src/Python-3.7.2/Modules/_datetimemodule.c
SOURCES += /media/art/data/SourceCode/UBUCON/src/android/sysroot-android-32/src/Python-3.7.2/Modules/_hashopenssl.c
SOURCES += /media/art/data/SourceCode/UBUCON/src/android/sysroot-android-32/src/Python-3.7.2/Modules/_heapqmodule.c
SOURCES += /media/art/data/SourceCode/UBUCON/src/android/sysroot-android-32/src/Python-3.7.2/Modules/_json.c
SOURCES += /media/art/data/SourceCode/UBUCON/src/android/sysroot-android-32/src/Python-3.7.2/Modules/_math.c
SOURCES += /media/art/data/SourceCode/UBUCON/src/android/sysroot-android-32/src/Python-3.7.2/Modules/_pickle.c
SOURCES += /media/art/data/SourceCode/UBUCON/src/android/sysroot-android-32/src/Python-3.7.2/Modules/_posixsubprocess.c
SOURCES += /media/art/data/SourceCode/UBUCON/src/android/sysroot-android-32/src/Python-3.7.2/Modules/_queuemodule.c
SOURCES += /media/art/data/SourceCode/UBUCON/src/android/sysroot-android-32/src/Python-3.7.2/Modules/_randommodule.c
SOURCES += /media/art/data/SourceCode/UBUCON/src/android/sysroot-android-32/src/Python-3.7.2/Modules/_sha3/sha3module.c
SOURCES += /media/art/data/SourceCode/UBUCON/src/android/sysroot-android-32/src/Python-3.7.2/Modules/_ssl.c
SOURCES += /media/art/data/SourceCode/UBUCON/src/android/sysroot-android-32/src/Python-3.7.2/Modules/_struct.c
SOURCES += /media/art/data/SourceCode/UBUCON/src/android/sysroot-android-32/src/Python-3.7.2/Modules/binascii.c
SOURCES += /media/art/data/SourceCode/UBUCON/src/android/sysroot-android-32/src/Python-3.7.2/Modules/mathmodule.c
SOURCES += /media/art/data/SourceCode/UBUCON/src/android/sysroot-android-32/src/Python-3.7.2/Modules/selectmodule.c
SOURCES += /media/art/data/SourceCode/UBUCON/src/android/sysroot-android-32/src/Python-3.7.2/Modules/socketmodule.c
SOURCES += /media/art/data/SourceCode/UBUCON/src/android/sysroot-android-32/src/Python-3.7.2/Modules/termios.c
SOURCES += /media/art/data/SourceCode/UBUCON/src/android/sysroot-android-32/src/Python-3.7.2/Modules/zlibmodule.c

HEADERS = pyqtdeploy_version.h frozen_bootstrap.h frozen_bootstrap_external.h frozen_main.h

LIBS += -L/media/art/data/SourceCode/UBUCON/src/android/sysroot-android-32/lib
LIBS += -L/media/art/data/SourceCode/UBUCON/src/android/sysroot-android-32/lib/python3.7/site-packages/PyQt5
LIBS += -lQt
LIBS += -lQtAndroidExtras
LIBS += -lQtBluetooth
LIBS += -lQtCore
LIBS += -lQtGui
LIBS += -lQtNetwork
LIBS += -lQtQml
LIBS += -lQtQuick
LIBS += -lQtQuickWidgets
LIBS += -lQtSensors
LIBS += -lQtSvg
LIBS += -lQtWidgets
LIBS += -lcrypto
LIBS += -lpython3.7
LIBS += -lsip
LIBS += -lssl
LIBS += -lz

ANDROID_EXTRA_LIBS += /media/art/data/SourceCode/UBUCON/src/android/sysroot-android-32/lib/libssl.so /media/art/data/SourceCode/UBUCON/src/android/sysroot-android-32/lib/libcrypto.so

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

    LIBS += -lshlwapi -ladvapi32 -lshell32 -luser32 -lws2_32 -lole32 -loleaut32 -lversion
    DEFINES += MS_WINDOWS _WIN32_WINNT=Py_WINVER NTDDI_VERSION=Py_NTDDI WINVER=Py_WINVER

    # This is added from the qmake spec files but clashes with _pickle.c.
    DEFINES -= UNICODE
}

macx {
    LIBS += -framework SystemConfiguration -framework CoreFoundation
}

contains(ANDROID_TARGET_ARCH, armeabi-v7a) {
ANDROID_PACKAGE_SOURCE_DIR = /media/art/data/SourceCode/UBUCON/src/android/android
}