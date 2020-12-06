TARGET = qtrest
QT = core network widgets

HEADERS += main.h
SOURCES += \
    main.cpp

CONFIG += c++11 console
CONFIG -= app_bundle

# install
target.path = /Users/art/SourceCode/UBUCON/qtrest
INSTALLS += target
