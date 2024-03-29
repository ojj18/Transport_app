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
    apiKey: 'AIzaSyAsEsP6WEq5B6QiD_sAQSwe3B4d2GR91uA',
    appId: '1:561627930490:web:3d5629c5b4c810569d40c3',
    messagingSenderId: '561627930490',
    projectId: 'slsoft',
    authDomain: 'slsoft.firebaseapp.com',
    databaseURL: 'https://slsoft-default-rtdb.firebaseio.com',
    storageBucket: 'slsoft.appspot.com',
    measurementId: 'G-K1CPN3SX16',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBouqBlfq3wrIzzNquJCLzxSiZmOZfAjRY',
    appId: '1:561627930490:android:70d4b39f20c9e2e29d40c3',
    messagingSenderId: '561627930490',
    projectId: 'slsoft',
    databaseURL: 'https://slsoft-default-rtdb.firebaseio.com',
    storageBucket: 'slsoft.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCXD2Qz1HXmrsG7AJ3zSSMiQHw7ICswggw',
    appId: '1:561627930490:ios:190cefd6897456479d40c3',
    messagingSenderId: '561627930490',
    projectId: 'slsoft',
    databaseURL: 'https://slsoft-default-rtdb.firebaseio.com',
    storageBucket: 'slsoft.appspot.com',
    iosClientId: '561627930490-7rb74bje2pg6es254jjcd71josh7994l.apps.googleusercontent.com',
    iosBundleId: 'com.example.transportApp',
  );
}
