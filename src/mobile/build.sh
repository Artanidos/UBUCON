export ANDROID_NDK_ROOT=/media/art/data/Android/Sdk/ndk-bundle
export ANDROID_NDK_PLATFORM=android-28
export ANDROID_SDK_ROOT=/media/art/data/Android/Sdk
mkdir build-project
cd build-project
/media/art/data/qt/5.12.3/android_armv7/bin/qmake ../ubucon.pro
make
make install INSTALL_ROOT=/media/art/data/SourceCode/UBUCON/src/mobile/build-project/
/media/art/data/qt/5.12.3/android_armv7/bin/androiddeployqt --input /media/art/data/SourceCode/UBUCON/src/mobile/build-project/android-libubucon.so-deployment-settings.json --output /media/art/data/SourceCode/UBUCON/src/mobile/build-project --android-platform android-28 --jdk /home/art/Software/jdk1.8.0_231/bin/java --gradle
cd ..