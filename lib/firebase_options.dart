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
    apiKey: 'AIzaSyDNdPTfjMMinNewI8AwMviXNecaUDPTWwI',
    appId: '1:732901025114:web:3de6b113290f05d796ff63',
    messagingSenderId: '732901025114',
    projectId: 'flash-chat-dbcaa',
    authDomain: 'flash-chat-dbcaa.firebaseapp.com',
    storageBucket: 'flash-chat-dbcaa.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAq-SoZlpfkbhoxJQ1fcwLvqYmHO_yEuTo',
    appId: '1:732901025114:android:2b035b3c4799506f96ff63',
    messagingSenderId: '732901025114',
    projectId: 'flash-chat-dbcaa',
    storageBucket: 'flash-chat-dbcaa.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAO3E-G1bgtr7ma8AEWKvcW0YnUQ6NC7Yw',
    appId: '1:732901025114:ios:8fa48431b9e29bf896ff63',
    messagingSenderId: '732901025114',
    projectId: 'flash-chat-dbcaa',
    storageBucket: 'flash-chat-dbcaa.appspot.com',
    iosBundleId: 'com.example.letsChat',
  );
}
