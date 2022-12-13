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
    apiKey: 'AIzaSyCj1s2jSGeWgRSnmQ3gAwueBgWuUzhmb2Q',
    appId: '1:1001084791359:web:213c4643ad1e6ea087668a',
    messagingSenderId: '1001084791359',
    projectId: 'fir-course-kehnu',
    authDomain: 'fir-course-kehnu.firebaseapp.com',
    storageBucket: 'fir-course-kehnu.appspot.com',
    measurementId: 'G-7EKLN05BY0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyATwooS-znc422bOtP3GL5NOogHWHQwhHM',
    appId: '1:1001084791359:android:505c6c8807e4f23d87668a',
    messagingSenderId: '1001084791359',
    projectId: 'fir-course-kehnu',
    storageBucket: 'fir-course-kehnu.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDw7SnFej_D-Ecb-XrLk6rl1E6sWp6gon0',
    appId: '1:1001084791359:ios:e91a3d396686a6e187668a',
    messagingSenderId: '1001084791359',
    projectId: 'fir-course-kehnu',
    storageBucket: 'fir-course-kehnu.appspot.com',
    iosClientId: '1001084791359-ephijgsi1c06alqqfjkjg75imjs3ctot.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseCourse',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDw7SnFej_D-Ecb-XrLk6rl1E6sWp6gon0',
    appId: '1:1001084791359:ios:e91a3d396686a6e187668a',
    messagingSenderId: '1001084791359',
    projectId: 'fir-course-kehnu',
    storageBucket: 'fir-course-kehnu.appspot.com',
    iosClientId: '1001084791359-ephijgsi1c06alqqfjkjg75imjs3ctot.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseCourse',
  );
}
