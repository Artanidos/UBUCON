TEMPLATE = lib
CONFIG += warn_on exceptions_off staticlib hide_symbols
QT -= gui
CONFIG += release
CONFIG -= android_install
TARGET = QtCore
target.path = /media/art/data/SourceCode/UBUCON/src/sysroot-android-32/lib/python3.7/site-packages/PyQt5
INSTALLS += target
DEFINES += SIP_PROTECTED_IS_PUBLIC protected=public
INCLUDEPATH += .
INCLUDEPATH += /media/art/data/SourceCode/UBUCON/src/sysroot-android-32/include/python3.7
DEFINES += Py_LIMITED_API=0x03040000
INCLUDEPATH += ../qpy/QtCore
HEADERS = sipAPIQtCore.h ../qpy/QtCore/qpycore_api.h ../qpy/QtCore/qpycore_chimera.h ../qpy/QtCore/qpycore_classinfo.h ../qpy/QtCore/qpycore_enums_flags.h ../qpy/QtCore/qpycore_event_handlers.h ../qpy/QtCore/qpycore_misc.h ../qpy/QtCore/qpycore_namespace.h ../qpy/QtCore/qpycore_objectified_strings.h ../qpy/QtCore/qpycore_public_api.h ../qpy/QtCore/qpycore_pyqtboundsignal.h ../qpy/QtCore/qpycore_pyqtmethodproxy.h ../qpy/QtCore/qpycore_pyqtproperty.h ../qpy/QtCore/qpycore_pyqtpyobject.h ../qpy/QtCore/qpycore_pyqtsignal.h ../qpy/QtCore/qpycore_pyqtslot.h ../qpy/QtCore/qpycore_pyqtslotproxy.h ../qpy/QtCore/qpycore_qmetaobjectbuilder.h ../qpy/QtCore/qpycore_qobject_helpers.h ../qpy/QtCore/qpycore_types.h
SOURCES = qpycore_post_init.cpp sipQtCorepart0.cpp sipQtCorepart1.cpp ../qpy/QtCore/qpycore_chimera.cpp ../qpy/QtCore/qpycore_chimera_signature.cpp ../qpy/QtCore/qpycore_chimera_storage.cpp ../qpy/QtCore/qpycore_classinfo.cpp ../qpy/QtCore/qpycore_decorators.cpp ../qpy/QtCore/qpycore_enums_flags.cpp ../qpy/QtCore/qpycore_event_handlers.cpp ../qpy/QtCore/qpycore_init.cpp ../qpy/QtCore/qpycore_misc.cpp ../qpy/QtCore/qpycore_public_api.cpp ../qpy/QtCore/qpycore_pyqtboundsignal.cpp ../qpy/QtCore/qpycore_pyqtconfigure.cpp ../qpy/QtCore/qpycore_pyqtmethodproxy.cpp ../qpy/QtCore/qpycore_pyqtproperty.cpp ../qpy/QtCore/qpycore_pyqtpyobject.cpp ../qpy/QtCore/qpycore_pyqtsignal.cpp ../qpy/QtCore/qpycore_pyqtslot.cpp ../qpy/QtCore/qpycore_pyqtslotproxy.cpp ../qpy/QtCore/qpycore_qjsonvalue.cpp ../qpy/QtCore/qpycore_qmessagelogger.cpp ../qpy/QtCore/qpycore_qmetaobject.cpp ../qpy/QtCore/qpycore_qmetaobject_helpers.cpp ../qpy/QtCore/qpycore_qobject_getattr.cpp ../qpy/QtCore/qpycore_qobject_helpers.cpp ../qpy/QtCore/qpycore_qstring.cpp ../qpy/QtCore/qpycore_qt_conf.cpp ../qpy/QtCore/qpycore_qvariant.cpp ../qpy/QtCore/qpycore_qvariant_value.cpp ../qpy/QtCore/qpycore_qvariantmap.cpp ../qpy/QtCore/qpycore_types.cpp
