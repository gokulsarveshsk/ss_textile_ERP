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
    apiKey: 'AIzaSyArGT1-tIerJBnYiPnztAGPmic0e3Q8Xvs',
    appId: '1:1034244009246:web:8ec83f076eaae23a83ad0f',
    messagingSenderId: '1034244009246',
    projectId: 'textile-6a9e0',
    authDomain: 'textile-6a9e0.firebaseapp.com',
    storageBucket: 'textile-6a9e0.appspot.com',
    measurementId: 'G-WBMVYEM662',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCKGD716v6RuQjWa5jWuVQl6B_5q3HXmeg',
    appId: '1:1034244009246:android:2258847083c657a083ad0f',
    messagingSenderId: '1034244009246',
    projectId: 'textile-6a9e0',
    storageBucket: 'textile-6a9e0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBB9MbkXth8G25Xo1wgKjAaSSo63F9HymA',
    appId: '1:1034244009246:ios:417f22c389969de083ad0f',
    messagingSenderId: '1034244009246',
    projectId: 'textile-6a9e0',
    storageBucket: 'textile-6a9e0.appspot.com',
    iosBundleId: 'com.example.ssTextile',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBB9MbkXth8G25Xo1wgKjAaSSo63F9HymA',
    appId: '1:1034244009246:ios:29b7abf7a134510283ad0f',
    messagingSenderId: '1034244009246',
    projectId: 'textile-6a9e0',
    storageBucket: 'textile-6a9e0.appspot.com',
    iosBundleId: 'com.example.ssTextile.RunnerTests',
  );
}
