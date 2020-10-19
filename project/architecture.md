# Architecture

As the base we use Scuttlebut infrastukture. This project already has got a few pubs available and the protocoll is matured.

At the client side we use a QML client where we will render all messages using QML instead of HTML. This enables us to create dynamic apps with native widgets.

The feed may contain simple text, HTML and QML (including Javascript).

So we also do not have this browser war artefacts, where a developer has to code differently for all different browsers.

The app logic is able to call QML functions and from QML you can call the app logic via a bridge.

Today we will focus on an app for Android, which can be portet an tested on iPhone later.

Also we will build a client for Linux, Windows and Mac OS.

We can rely on the design for the Facebook app, because it would make it easier for the users to feel home.

The desktop app will have an advanced post editor, while on Android it will have lust basic functionality like text, images, emotes.



# Android services
Qt on Android: How to create an Android service using Qt
https://www.kdab.com/qt-android-create-android-service-using-qt/