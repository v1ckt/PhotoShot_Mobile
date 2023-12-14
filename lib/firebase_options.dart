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
        return macos;
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
    apiKey: 'AIzaSyAYm_leGCPuRMXF5ObXCZJm3cduHFSpR7E',
    appId: '1:93182552978:web:9b74096ffbe430cbd46f4b',
    messagingSenderId: '93182552978',
    projectId: 'photoshot-e464d',
    authDomain: 'photoshot-e464d.firebaseapp.com',
    storageBucket: 'photoshot-e464d.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDFQNeGMas2e_E4aR1Rq6cT_PfQue3h248',
    appId: '1:93182552978:android:c9b3c4f0a4c2346fd46f4b',
    messagingSenderId: '93182552978',
    projectId: 'photoshot-e464d',
    storageBucket: 'photoshot-e464d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBNLXEwgZo9EHyAs1GWiCznmoLx_b4kqyY',
    appId: '1:93182552978:ios:4d172562da471bc3d46f4b',
    messagingSenderId: '93182552978',
    projectId: 'photoshot-e464d',
    storageBucket: 'photoshot-e464d.appspot.com',
    iosBundleId: 'com.example.photoshot',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBNLXEwgZo9EHyAs1GWiCznmoLx_b4kqyY',
    appId: '1:93182552978:ios:0d238868cf11d59dd46f4b',
    messagingSenderId: '93182552978',
    projectId: 'photoshot-e464d',
    storageBucket: 'photoshot-e464d.appspot.com',
    iosBundleId: 'com.example.photoshot.RunnerTests',
  );
}
