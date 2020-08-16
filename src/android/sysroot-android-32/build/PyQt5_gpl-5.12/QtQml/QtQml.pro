TEMPLATE = lib
CONFIG += warn_on exceptions_off staticlib hide_symbols
QT += qml
CONFIG += release
CONFIG -= android_install
TARGET = QtQml
target.path = /media/art/data/SourceCode/UBUCON/src/sysroot-android-32/lib/python3.7/site-packages/PyQt5
INSTALLS += target
DEFINES += SIP_PROTECTED_IS_PUBLIC protected=public
INCLUDEPATH += .
INCLUDEPATH += /media/art/data/SourceCode/UBUCON/src/sysroot-android-32/include/python3.7
DEFINES += Py_LIMITED_API=0x03040000
INCLUDEPATH += ../qpy/QtQml
HEADERS = sipAPIQtQml.h ../qpy/QtQml/qpyqml_api.h ../qpy/QtQml/qpyqml_listdata.h ../qpy/QtQml/qpyqmllistproperty.h ../qpy/QtQml/qpyqmllistpropertywrapper.h ../qpy/QtQml/qpyqmlobject.h ../qpy/QtQml/qpyqmlsingletonobject.h ../qpy/QtQml/qpyqmlvalidator.h
SOURCES = sipQtQmlpart0.cpp sipQtQmlpart1.cpp ../qpy/QtQml/qpyqml_listdata.cpp ../qpy/QtQml/qpyqml_post_init.cpp ../qpy/QtQml/qpyqml_qjsvalue.cpp ../qpy/QtQml/qpyqml_register_singleton_type.cpp ../qpy/QtQml/qpyqml_register_type.cpp ../qpy/QtQml/qpyqmllistproperty.cpp ../qpy/QtQml/qpyqmllistpropertywrapper.cpp ../qpy/QtQml/qpyqmlobject.cpp ../qpy/QtQml/qpyqmlsingletonobject.cpp ../qpy/QtQml/qpyqmlvalidator.cpp
