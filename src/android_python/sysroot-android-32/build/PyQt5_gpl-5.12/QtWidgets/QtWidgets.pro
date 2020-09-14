TEMPLATE = lib
CONFIG += warn_on exceptions_off staticlib hide_symbols
QT += widgets
CONFIG += release
CONFIG -= android_install
TARGET = QtWidgets
target.path = /media/art/data/SourceCode/UBUCON/src/sysroot-android-32/lib/python3.7/site-packages/PyQt5
INSTALLS += target
DEFINES += SIP_PROTECTED_IS_PUBLIC protected=public
INCLUDEPATH += .
INCLUDEPATH += /media/art/data/SourceCode/UBUCON/src/sysroot-android-32/include/python3.7
DEFINES += Py_LIMITED_API=0x03040000
INCLUDEPATH += ../qpy/QtWidgets
HEADERS = sipAPIQtWidgets.h ../qpy/QtWidgets/qpywidgets_api.h ../qpy/QtWidgets/qpywidgets_chimera_helpers.h
SOURCES = sipQtWidgetspart0.cpp sipQtWidgetspart1.cpp ../qpy/QtWidgets/qpywidgets_chimera_helpers.cpp ../qpy/QtWidgets/qpywidgets_post_init.cpp
