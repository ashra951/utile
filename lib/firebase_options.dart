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
    apiKey: 'AIzaSyDV5MmBsdqZ0s2Kf0QmNW98EHzvgHE_kP0',
    appId: '1:662453332636:web:4bdd261d16759340fa1b59',
    messagingSenderId: '662453332636',
    projectId: 'untitled9-42409',
    authDomain: 'untitled9-42409.firebaseapp.com',
    storageBucket: 'untitled9-42409.appspot.com',
    measurementId: 'G-V6VQP1HNLQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBgYSnlmFqQA6Rx0P6lG9qeU0DojwWX-6E',
    appId: '1:662453332636:android:7dee3d8402bd5fe6fa1b59',
    messagingSenderId: '662453332636',
    projectId: 'untitled9-42409',
    storageBucket: 'untitled9-42409.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAPah1VxCFhTfHcP7ZYWN0_S5BVLSmmOuY',
    appId: '1:662453332636:ios:6a72b071c4cf6292fa1b59',
    messagingSenderId: '662453332636',
    projectId: 'untitled9-42409',
    storageBucket: 'untitled9-42409.appspot.com',
    iosClientId: '662453332636-ulvkosbveadenb7bhglrd2uria2hvma4.apps.googleusercontent.com',
    iosBundleId: 'com.example.untitled9',
  );
}
