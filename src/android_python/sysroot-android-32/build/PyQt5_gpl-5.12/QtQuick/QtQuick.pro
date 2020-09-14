TEMPLATE = lib
CONFIG += warn_on exceptions_off staticlib hide_symbols
QT += quick
CONFIG += release
CONFIG -= android_install
TARGET = QtQuick
target.path = /media/art/data/SourceCode/UBUCON/src/sysroot-android-32/lib/python3.7/site-packages/PyQt5
INSTALLS += target
DEFINES += SIP_PROTECTED_IS_PUBLIC protected=public
INCLUDEPATH += .
INCLUDEPATH += /media/art/data/SourceCode/UBUCON/src/sysroot-android-32/include/python3.7
DEFINES += Py_LIMITED_API=0x03040000
INCLUDEPATH += ../qpy/QtQuick
HEADERS = sipAPIQtQuick.h ../qpy/QtQuick/qpyquick_api.h ../qpy/QtQuick/qpyquick_chimera_helpers.h ../qpy/QtQuick/qpyquick_register_type.h ../qpy/QtQuick/qpyquickframebufferobject.h ../qpy/QtQuick/qpyquickitem.h ../qpy/QtQuick/qpyquickpainteditem.h ../qpy/QtQuick/qpyquickview.h ../qpy/QtQuick/qpyquickwindow.h
SOURCES = sipQtQuickpart0.cpp sipQtQuickpart1.cpp ../qpy/QtQuick/qpyquick_chimera_helpers.cpp ../qpy/QtQuick/qpyquick_post_init.cpp ../qpy/QtQuick/qpyquick_register_type.cpp ../qpy/QtQuick/qpyquickframebufferobject.cpp ../qpy/QtQuick/qpyquickitem.cpp ../qpy/QtQuick/qpyquickpainteditem.cpp ../qpy/QtQuick/qpyquickview.cpp ../qpy/QtQuick/qpyquickwindow.cpp
