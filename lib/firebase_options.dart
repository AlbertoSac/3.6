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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDo3-394kzFO3awzdvkfab5h0Na54jhnQw',
    appId: '1:749826646492:web:d686eaf7a1b9e6285cef19',
    messagingSenderId: '749826646492',
    projectId: 'flutter-f8365',
    authDomain: 'flutter-f8365.firebaseapp.com',
    storageBucket: 'flutter-f8365.appspot.com',
    measurementId: 'G-YLQ8EMTP2K',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBnbJGNHmdTHEb9xEqEDeUeX0GasqZAs5Y',
    appId: '1:749826646492:android:eea4c343fced19035cef19',
    messagingSenderId: '749826646492',
    projectId: 'flutter-f8365',
    storageBucket: 'flutter-f8365.appspot.com',
  );
}