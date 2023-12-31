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
    apiKey: 'AIzaSyA4BVi1BXC3z6hRepgVKdC7QE-RE7GWGII',
    appId: '1:941229815007:web:66d809d9272480dad3656a',
    messagingSenderId: '941229815007',
    projectId: 'fir-test-a932e',
    authDomain: 'fir-test-a932e.firebaseapp.com',
    storageBucket: 'fir-test-a932e.appspot.com',
    measurementId: 'G-XCW8SQE8TY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA7LpykUqSDALPpy_Fob1sSPO6BwwD-WAQ',
    appId: '1:941229815007:android:70283523096a2504d3656a',
    messagingSenderId: '941229815007',
    projectId: 'fir-test-a932e',
    storageBucket: 'fir-test-a932e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCytoWFlZLAg-MHr4vPUyzeKOByYezmzBM',
    appId: '1:941229815007:ios:2301a1f9ade332aed3656a',
    messagingSenderId: '941229815007',
    projectId: 'fir-test-a932e',
    storageBucket: 'fir-test-a932e.appspot.com',
    iosClientId: '941229815007-qbnu8jukvoqur3lktac3g01felm4ddno.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseTest',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCytoWFlZLAg-MHr4vPUyzeKOByYezmzBM',
    appId: '1:941229815007:ios:c2ac1af866d2728dd3656a',
    messagingSenderId: '941229815007',
    projectId: 'fir-test-a932e',
    storageBucket: 'fir-test-a932e.appspot.com',
    iosClientId: '941229815007-f2937gnqft4chipt1m4tkng7hpi4t5ib.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseTest.RunnerTests',
  );
}
