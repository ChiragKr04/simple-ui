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
    apiKey: 'AIzaSyCj3RRj-bVmuBaaRhsUC7y0mMP-L6OD4DY',
    appId: '1:652541548017:web:a373cbf6708b523d012050',
    messagingSenderId: '652541548017',
    projectId: 'test-a5db5',
    authDomain: 'test-a5db5.firebaseapp.com',
    databaseURL: 'https://test-a5db5-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'test-a5db5.appspot.com',
    measurementId: 'G-0JS80X3YSC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCSQsh-9Nk9LHjo39WCxIsGRhXjlQK1hHg',
    appId: '1:652541548017:android:fafe823a053e00dc012050',
    messagingSenderId: '652541548017',
    projectId: 'test-a5db5',
    databaseURL: 'https://test-a5db5-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'test-a5db5.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAiTIqEcC22KwiRLjsLBIOlj68aP_k9jzg',
    appId: '1:652541548017:ios:6d45a2e5223bae71012050',
    messagingSenderId: '652541548017',
    projectId: 'test-a5db5',
    databaseURL: 'https://test-a5db5-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'test-a5db5.appspot.com',
    iosClientId: '652541548017-39daqglvsuu6eiojd1g1na22j7u2s198.apps.googleusercontent.com',
    iosBundleId: 'com.example.mezcreen',
  );
}
