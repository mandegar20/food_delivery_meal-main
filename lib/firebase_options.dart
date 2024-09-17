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
    apiKey: 'AIzaSyDGDjqd62A60DjbJHCZFyWD13YzaQDFdWs',
    appId: '1:366939802103:web:97aef24be130311b7386f2',
    messagingSenderId: '366939802103',
    projectId: 'artgallery-b26d7',
    authDomain: 'artgallery-b26d7.firebaseapp.com',
    databaseURL: 'https://artgallery-b26d7-default-rtdb.firebaseio.com',
    storageBucket: 'artgallery-b26d7.appspot.com',
    measurementId: 'G-YLY7LCZXCM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCwqD_pKdaOE0Bi6LyQsg5JN16z8JCgvH0',
    appId: '1:366939802103:android:a24e0c0e7c18a1fe7386f2',
    messagingSenderId: '366939802103',
    projectId: 'artgallery-b26d7',
    databaseURL: 'https://artgallery-b26d7-default-rtdb.firebaseio.com',
    storageBucket: 'artgallery-b26d7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCFRy9gK-2z91xJT3gcsArllqIdREQpLRQ',
    appId: '1:366939802103:ios:234263c5e313ebfa7386f2',
    messagingSenderId: '366939802103',
    projectId: 'artgallery-b26d7',
    databaseURL: 'https://artgallery-b26d7-default-rtdb.firebaseio.com',
    storageBucket: 'artgallery-b26d7.appspot.com',
    iosBundleId: 'com.codeforany.foodDelivery',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCFRy9gK-2z91xJT3gcsArllqIdREQpLRQ',
    appId: '1:366939802103:ios:e6c4bff40eced79b7386f2',
    messagingSenderId: '366939802103',
    projectId: 'artgallery-b26d7',
    databaseURL: 'https://artgallery-b26d7-default-rtdb.firebaseio.com',
    storageBucket: 'artgallery-b26d7.appspot.com',
    iosBundleId: 'com.codeforany.foodDelivery.RunnerTests',
  );
}
