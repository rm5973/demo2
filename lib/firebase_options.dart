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
    apiKey: 'AIzaSyC5UgfWDfwR8xDzQTAqk4hdVUUiY8jlgek',
    appId: '1:304351245458:web:8be4fd650f7dc764d7e24b',
    messagingSenderId: '304351245458',
    projectId: 'demo1-4ecdd',
    authDomain: 'demo1-4ecdd.firebaseapp.com',
    storageBucket: 'demo1-4ecdd.appspot.com',
    measurementId: 'G-C5VSE7SDSE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBC2tRH23003aweAUwvpEw9PGTR62AvFBY',
    appId: '1:304351245458:android:4f6db57a080f6110d7e24b',
    messagingSenderId: '304351245458',
    projectId: 'demo1-4ecdd',
    storageBucket: 'demo1-4ecdd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBEwnKke2xBX_2M8fiiTXjE0EsODOrFzu4',
    appId: '1:304351245458:ios:349a1b6f972517aed7e24b',
    messagingSenderId: '304351245458',
    projectId: 'demo1-4ecdd',
    storageBucket: 'demo1-4ecdd.appspot.com',
    iosClientId:
        '304351245458-5q67pq4d1csb4l1o1br1mk37eb0tiqfh.apps.googleusercontent.com',
    iosBundleId: 'com.example.demo1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBEwnKke2xBX_2M8fiiTXjE0EsODOrFzu4',
    appId: '1:304351245458:ios:ebd20f3880d638ced7e24b',
    messagingSenderId: '304351245458',
    projectId: 'demo1-4ecdd',
    storageBucket: 'demo1-4ecdd.appspot.com',
    iosClientId:
        '304351245458-ql0r93suki8ljjh63rinch62rlf9sc46.apps.googleusercontent.com',
    iosBundleId: 'com.example.demo1.RunnerTests',
  );
}
