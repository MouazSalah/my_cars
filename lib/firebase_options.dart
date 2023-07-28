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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAELyb9pCJSLzE2pXx6r49FVs1GV6yah_A',
    appId: '1:379058802151:android:f90ed1d37ba6a738ef4142',
    messagingSenderId: '379058802151',
    projectId: 'flutter-login-demo-9a5d5',
    storageBucket: 'flutter-login-demo-9a5d5.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDQ3MKiYsYCqKnc99preBpRXG8pu-oP_IY',
    appId: '1:379058802151:ios:10c456fa80ffdbe0ef4142',
    messagingSenderId: '379058802151',
    projectId: 'flutter-login-demo-9a5d5',
    storageBucket: 'flutter-login-demo-9a5d5.appspot.com',
    androidClientId: '379058802151-7nj1udk5qbp3kjbrkgqjpm61eumusqqc.apps.googleusercontent.com',
    iosClientId: '379058802151-oaiqqgcmb50ldoipgolsf2ertcnjp2tj.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterApplication1',
  );
}
