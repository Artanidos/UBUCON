TEMPLATE = app
TARGET = sip
CONFIG -= qt app_bundle
CONFIG += warn_on exceptions_off console release

# Work around QTBUG-39300.
CONFIG -= android_install

target.path = /usr/bin
INSTALLS += target

SOURCES = /media/art/data/SourceCode/UBUCON/src/sysroot-android-32/build/sip-module/sip-4.19.15/sipgen/parser.c /media/art/data/SourceCode/UBUCON/src/sysroot-android-32/build/sip-module/sip-4.19.15/sipgen/extracts.c /media/art/data/SourceCode/UBUCON/src/sysroot-android-32/build/sip-module/sip-4.19.15/sipgen/lexer.c /media/art/data/SourceCode/UBUCON/src/sysroot-android-32/build/sip-module/sip-4.19.15/sipgen/transform.c /media/art/data/SourceCode/UBUCON/src/sysroot-android-32/build/sip-module/sip-4.19.15/sipgen/heap.c /media/art/data/SourceCode/UBUCON/src/sysroot-android-32/build/sip-module/sip-4.19.15/sipgen/export.c /media/art/data/SourceCode/UBUCON/src/sysroot-android-32/build/sip-module/sip-4.19.15/sipgen/gencode.c /media/art/data/SourceCode/UBUCON/src/sysroot-android-32/build/sip-module/sip-4.19.15/sipgen/main.c /media/art/data/SourceCode/UBUCON/src/sysroot-android-32/build/sip-module/sip-4.19.15/sipgen/type_hints.c

HEADERS = /media/art/data/SourceCode/UBUCON/src/sysroot-android-32/build/sip-module/sip-4.19.15/sipgen/sip.h /media/art/data/SourceCode/UBUCON/src/sysroot-android-32/build/sip-module/sip-4.19.15/sipgen/parser.h
