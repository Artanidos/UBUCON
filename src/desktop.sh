mkdir build-desktop
cd build-desktop
/Users/art/qt/5.12.3/clang_64/bin/qmake ../ubucon.pro
make
make install INSTALL_ROOT=/Users/art/SourceCode/UBUCON/src/build-desktop/
cd ..