TEMPLATE = lib
CONFIG += warn_on exceptions_off staticlib hide_symbols
CONFIG += release
CONFIG -= android_install
TARGET = QtGui
target.path = /media/art/data/SourceCode/UBUCON/src/sysroot-android-32/lib/python3.7/site-packages/PyQt5
INSTALLS += target
DEFINES += SIP_PROTECTED_IS_PUBLIC protected=public
INCLUDEPATH += .
INCLUDEPATH += /media/art/data/SourceCode/UBUCON/src/sysroot-android-32/include/python3.7
DEFINES += Py_LIMITED_API=0x03040000
INCLUDEPATH += ../qpy/QtGui
HEADERS = sipAPIQtGui.h ../qpy/QtGui/qpyopengl_api.h ../qpy/QtGui/qpyopengl_data_cache.h ../qpy/QtGui/qpyopengl_misc.h
SOURCES = sipQtGuipart0.cpp sipQtGuipart1.cpp ../qpy/QtGui/qpyopengl_add_constants.cpp ../qpy/QtGui/qpyopengl_array_convertors.cpp ../qpy/QtGui/qpyopengl_attribute_array.cpp ../qpy/QtGui/qpyopengl_data_cache.cpp ../qpy/QtGui/qpyopengl_get.cpp ../qpy/QtGui/qpyopengl_init.cpp ../qpy/QtGui/qpyopengl_uniform_value_array.cpp ../qpy/QtGui/qpyopengl_value_array.cpp ../qpy/QtGui/qpyopengl_version_functions.cpp
