export ANDROID_NDK_ROOT=/Users/art/Library/Android/sdk/ndk/19.2.5345600
export ANDROID_NDK_PLATFORM=android-28
export ANDROID_SDK_ROOT=/Users/art/Library/Android/sdk
mkdir build-android
cd build-android
/Users/art/qt/5.12.3/android_armv7/bin/qmake ../ubucon.pro
make
make install INSTALL_ROOT=/Users/art/SourceCode/UBUCON/src/build-android/
/Users/art/qt/5.12.3/android_armv7/bin/androiddeployqt --release --input /Users/art/SourceCode/UBUCON/src/build-android/android-libshift.so-deployment-settings.json --output /Users/art/SourceCode/UBUCON/src/build-android --android-platform android-28 --jdk /home/art/Software/jdk1.8.0_231/bin/java --gradle
cd ..
java -jar ../uber-apk-signer-1.2.1.jar --apks /Users/art/SourceCode/UBUCON/src/build-android/build/outputs/apk/release/build-android-release-unsigned.apk
mv /Users/art/SourceCode/UBUCON/src/build-android/build/outputs/apk/release/build-android-release-aligned-debugSigned.apk /Users/art/SourceCode/UBUCON/src/build-android/build/outputs/apk/release/ubucon-1.0.0-signed.apk