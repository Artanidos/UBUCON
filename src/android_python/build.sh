export ANDROID_NDK_ROOT=/Users/art/Library/Android/sdk/ndk
export ANDROID_NDK_PLATFORM=android-28
export ANDROID_SDK_ROOT=/Users/art/Library/Android/sdk
pyrcc5 main.qrc -o lib/main_rc.py
python3 build.py --target android-32 --installed-qt-dir /Users/art/Qt/5.12.3  --verbose --source-dir ./../../SourcesAndroid

#--no-sysroot