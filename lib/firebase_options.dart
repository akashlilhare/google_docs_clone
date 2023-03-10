// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDHVukhJ-xKzG-D5FV0ANHfvMhwuJSWmHw',
    appId: '1:807133465102:web:f6a273dbbd7e2eaddf4a5f',
    messagingSenderId: '807133465102',
    projectId: 'docs-clone-210a8',
    authDomain: 'docs-clone-210a8.firebaseapp.com',
    storageBucket: 'docs-clone-210a8.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBOwoVgRE41yQE9ADWTyHhLf-_AmV9xP-s',
    appId: '1:807133465102:android:0431c7eca61590dedf4a5f',
    messagingSenderId: '807133465102',
    projectId: 'docs-clone-210a8',
    storageBucket: 'docs-clone-210a8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCdKYucb4ppD3JX7swHW9jukEtLczbBJ3w',
    appId: '1:807133465102:ios:13b99e5ac90fcdb2df4a5f',
    messagingSenderId: '807133465102',
    projectId: 'docs-clone-210a8',
    storageBucket: 'docs-clone-210a8.appspot.com',
    iosClientId: '807133465102-7l8t6ge9e0jcv83p0792ajg0tdjn6num.apps.googleusercontent.com',
    iosBundleId: 'com.akash.google.docs.googleDocsClone',
  );
}
