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
    apiKey: 'AIzaSyDlg1yB-s80k7LM5_y273ZsM6UnbxU63h0',
    appId: '1:267632933517:web:3c2f081adc254ea4bc40c4',
    messagingSenderId: '267632933517',
    projectId: 'tmspro-e42d7',
    authDomain: 'tmspro-e42d7.firebaseapp.com',
    databaseURL: 'https://tmspro-e42d7-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'tmspro-e42d7.appspot.com',
    measurementId: 'G-B3W63F552R',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDsGCJvvRJONnTn0vZnLGbbCRnl50GPoDs',
    appId: '1:267632933517:android:909f202d319f0875bc40c4',
    messagingSenderId: '267632933517',
    projectId: 'tmspro-e42d7',
    databaseURL: 'https://tmspro-e42d7-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'tmspro-e42d7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAhgDaqCGA93-PpdBmkWZbQ7gOQZJmi-DI',
    appId: '1:267632933517:ios:439b0fc945694bf2bc40c4',
    messagingSenderId: '267632933517',
    projectId: 'tmspro-e42d7',
    databaseURL: 'https://tmspro-e42d7-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'tmspro-e42d7.appspot.com',
    iosBundleId: 'com.example.tms',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAhgDaqCGA93-PpdBmkWZbQ7gOQZJmi-DI',
    appId: '1:267632933517:ios:3e9b859306f63259bc40c4',
    messagingSenderId: '267632933517',
    projectId: 'tmspro-e42d7',
    databaseURL: 'https://tmspro-e42d7-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'tmspro-e42d7.appspot.com',
    iosBundleId: 'com.example.tms.RunnerTests',
  );
}
