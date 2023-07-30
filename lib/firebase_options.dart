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
    apiKey: 'AIzaSyAdZxbZoW_De-fSBCaEmWdABb0wwx0vhH4',
    appId: '1:113883834826:web:d2a13cefde9fbcac644733',
    messagingSenderId: '113883834826',
    projectId: 'chat-app-3cc99',
    authDomain: 'chat-app-3cc99.firebaseapp.com',
    storageBucket: 'chat-app-3cc99.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDXSDbianQM9Z5vtr5FE4DxxQE93BAA4j8',
    appId: '1:113883834826:android:55c39eff5f165dda644733',
    messagingSenderId: '113883834826',
    projectId: 'chat-app-3cc99',
    storageBucket: 'chat-app-3cc99.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDjRPfvi6X4VHaY5z3b50us4494z2vihFc',
    appId: '1:113883834826:ios:0d5bd32670be84f6644733',
    messagingSenderId: '113883834826',
    projectId: 'chat-app-3cc99',
    storageBucket: 'chat-app-3cc99.appspot.com',
    iosClientId: '113883834826-7s60lko9cbql7db8m97tc7vpe0r0nlac.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatapp1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDjRPfvi6X4VHaY5z3b50us4494z2vihFc',
    appId: '1:113883834826:ios:0d5bd32670be84f6644733',
    messagingSenderId: '113883834826',
    projectId: 'chat-app-3cc99',
    storageBucket: 'chat-app-3cc99.appspot.com',
    iosClientId: '113883834826-7s60lko9cbql7db8m97tc7vpe0r0nlac.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatapp1',
  );
}
