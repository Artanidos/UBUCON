TEMPLATE = lib
CONFIG += warn_on exceptions_off staticlib hide_symbols
QT += svg
CONFIG += release
CONFIG -= android_install
TARGET = QtSvg
target.path = /media/art/data/SourceCode/UBUCON/src/sysroot-android-32/lib/python3.7/site-packages/PyQt5
INSTALLS += target
DEFINES += SIP_PROTECTED_IS_PUBLIC protected=public
INCLUDEPATH += .
INCLUDEPATH += /media/art/data/SourceCode/UBUCON/src/sysroot-android-32/include/python3.7
HEADERS = sipAPIQtSvg.h
SOURCES = sipQtSvgpart0.cpp sipQtSvgpart1.cpp
