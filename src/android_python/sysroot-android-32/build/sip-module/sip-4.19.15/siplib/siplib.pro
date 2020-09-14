TEMPLATE = lib
TARGET = sip
CONFIG -= qt
CONFIG += warn_on exceptions_off staticlib release

# Work around QTBUG-39300.
CONFIG -= android_install

INCLUDEPATH += /media/art/data/SourceCode/UBUCON/src/sysroot-android-32/include/python3.7

DEFINES += SIP_MODULE_NAME=PyQt5.sip

target.path = /media/art/data/SourceCode/UBUCON/src/sysroot-android-32/lib/python3.7/site-packages/PyQt5
INSTALLS += target

SOURCES = /media/art/data/SourceCode/UBUCON/src/sysroot-android-32/build/sip-module/sip-4.19.15/siplib/array.c /media/art/data/SourceCode/UBUCON/src/sysroot-android-32/build/sip-module/sip-4.19.15/siplib/voidptr.c /media/art/data/SourceCode/UBUCON/src/sysroot-android-32/build/sip-module/sip-4.19.15/siplib/qtlib.c /media/art/data/SourceCode/UBUCON/src/sysroot-android-32/build/sip-module/sip-4.19.15/siplib/int_convertors.c /media/art/data/SourceCode/UBUCON/src/sysroot-android-32/build/sip-module/sip-4.19.15/siplib/descriptors.c /media/art/data/SourceCode/UBUCON/src/sysroot-android-32/build/sip-module/sip-4.19.15/siplib/objmap.c /media/art/data/SourceCode/UBUCON/src/sysroot-android-32/build/sip-module/sip-4.19.15/siplib/threads.c /media/art/data/SourceCode/UBUCON/src/sysroot-android-32/build/sip-module/sip-4.19.15/siplib/siplib.c /media/art/data/SourceCode/UBUCON/src/sysroot-android-32/build/sip-module/sip-4.19.15/siplib/apiversions.c /media/art/data/SourceCode/UBUCON/src/sysroot-android-32/build/sip-module/sip-4.19.15/siplib/bool.cpp

HEADERS = /media/art/data/SourceCode/UBUCON/src/sysroot-android-32/build/sip-module/sip-4.19.15/siplib/sip.h /media/art/data/SourceCode/UBUCON/src/sysroot-android-32/build/sip-module/sip-4.19.15/siplib/sipint.h /media/art/data/SourceCode/UBUCON/src/sysroot-android-32/build/sip-module/sip-4.19.15/siplib/array.h
