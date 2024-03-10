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
    // apiKey: 'AIzaSyDHLN3x-d4EirijrdPATyjXAxDccbfi9nw',
    apiKey: 'AIzaSyBR8c-9zcgmVSEliFicRuU2OhnzHqXnGc4', // older
    // appId: '1:89042802662:android:6ca04d0669287d3c7aa827',
    appId: '1:852788491165:web:5fc2f03bc854a8c96ab574', // older
    // messagingSenderId: '89042802662',
    messagingSenderId: '852788491165', // older
    // projectId: 'facebook-clone-60aa6',
    projectId: 'facebook-clone-d35c7', // older
    // authDomain: 'facebook-clone-60aa6.appspot.com',
    authDomain: 'facebook-clone-d35c7.firebaseapp.com', // older
    // storageBucket: 'facebook-clone-60aa6.appspot.com',
    storageBucket: 'facebook-clone-d35c7.appspot.com', // older
    measurementId: 'G-S7LFF481C9', // older
  );

  static const FirebaseOptions android = FirebaseOptions(
    // // Newer
    // apiKey: 'AIzaSyDHLN3x-d4EirijrdPATyjXAxDccbfi9nw',
    // appId: '1:89042802662:android:6ca04d0669287d3c7aa827',
    // messagingSenderId: '89042802662',
    // projectId: 'facebook-clone-60aa6',
    // storageBucket: 'facebook-clone-60aa6.appspot.com',
    apiKey: 'AIzaSyC-UQrx582MIQFWOGNN9tfAr0nkDnd6nTU',
    appId: '1:852788491165:android:028cbd7bbabeadc36ab574',
    messagingSenderId: '852788491165',
    projectId: 'facebook-clone-d35c7',
    storageBucket: 'facebook-clone-d35c7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCfo70UUsJFiVjiOun5GYDDip-VMkO5hXE',
    appId: '1:852788491165:ios:2d64d7d926f8ad576ab574',
    messagingSenderId: '852788491165',
    projectId: 'facebook-clone-d35c7',
    storageBucket: 'facebook-clone-d35c7.appspot.com',
    iosClientId:
        '852788491165-7pgkn1471rha752r17gmp13bujhj186n.apps.googleusercontent.com',
    iosBundleId: 'com.codehq.facebookClone',
  );
}