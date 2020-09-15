TEMPLATE = app
TARGET = ubucon
QT += quick quickcontrols2

SOURCES += \
    ubucon.cpp

RESOURCES += \
    ubucon.qml \
    gui/Test.qml \
    gui/Feed.qml \
    gui/Searchpanel.qml \
    gui/Menubar.qml \
    gui/Home.qml \
    qtquickcontrols2.conf \
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
    images/arrow.png \
    images/logo.png \
    images/cuddle.jpeg \
    images/natur.jpg \
    images/ubuntu_banner.png \
    images/search.png \
    images/notify.png \
    images/home.png \
    images/chat.png \
    images/profile.png \

target.path = $$PWD/quickcontrols2/ubucon
INSTALLS += target


android {
    ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android

    DISTFILES += \
        android/AndroidManifest.xml \
        android/build.gradle \
        android/res/values/libs.xml
}