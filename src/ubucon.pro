TEMPLATE = app
TARGET = ubucon
QT += quick quickcontrols2 core 
CONFIG += c++11

SOURCES += \
    ubucon.cpp \
    backend.cpp \
    menu.cpp \
    plugin.cpp \
    menumodel.cpp

HEADERS += \
    backend.h \
    menu.h \
    plugin.h \
    menumodel.h

RESOURCES += \
    ubucon.qml \
    Home.qml \
    icons/ubucon/index.theme \
    icons/ubucon/20x20/back.png \
    icons/ubucon/20x20/drawer.png \
    icons/ubucon/20x20/menu.png \
    icons/ubucon/20x20@2/back.png \
    icons/ubucon/20x20@2/drawer.png \
    icons/ubucon/20x20@2/menu.png \
    icons/ubucon/20x20@3/back.png \
    icons/ubucon/20x20@3/drawer.png \
    icons/ubucon/20x20@3/menu.png \
    icons/ubucon/20x20@4/back.png \
    icons/ubucon/20x20@4/drawer.png \
    icons/ubucon/20x20@4/menu.png \
    images/logo.png

target.path = $$PWD/quickcontrols2/ubucon
INSTALLS += target

CONFIG += qmltypes
QML_IMPORT_NAME = at.crowdware.backend
QML_IMPORT_MAJOR_VERSION = 1

android {
    DEFINES += ANDROID
    QT += androidextras
    ANDROID_VERSION_CODE = "1"
    ANDROID_VERSION_NAME = "1.0.0"
    ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
    #OTHER_FILES += \
    #    android/src/com/lasconic/QShareUtils.java
    
    #SOURCES += \
    #    android/androidshareutils.cpp
        

    #HEADERS += \
    #    android/androidshareutils.h

    DISTFILES += \
        android/AndroidManifest.xml \
        android/build.gradle \
        android/res/values/libs.xml
}