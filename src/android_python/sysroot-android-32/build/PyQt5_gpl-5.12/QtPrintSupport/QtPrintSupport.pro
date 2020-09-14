TEMPLATE = lib
CONFIG += warn_on exceptions_off staticlib hide_symbols
QT += printsupport
CONFIG += release
CONFIG -= android_install
TARGET = QtPrintSupport
target.path = /media/art/data/SourceCode/UBUCON/src/sysroot-android-32/lib/python3.7/site-packages/PyQt5
INSTALLS += target
DEFINES += SIP_PROTECTED_IS_PUBLIC protected=public
INCLUDEPATH += .
INCLUDEPATH += /media/art/data/SourceCode/UBUCON/src/sysroot-android-32/include/python3.7
HEADERS = sipAPIQtPrintSupport.h
SOURCES = sipQtPrintSupportpart0.cpp
