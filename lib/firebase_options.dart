import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
        return windows;
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
    apiKey: 'AIzaSyBWgs1opn0Ft9Uyq5TdSK5CAH8mUcDwAKI',
    appId: '1:138442330157:web:948c2adb55f8ebcd5f28a4',
    messagingSenderId: '138442330157',
    projectId: 'flutterproject-183e2',
    authDomain: 'flutterproject-183e2.firebaseapp.com',
    databaseURL: 'https://flutterproject-183e2-default-rtdb.firebaseio.com',
    storageBucket: 'flutterproject-183e2.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD4YQ1qNuRZb4QfALpACRSLeaLYJ5fP3Fg',
    appId: '1:138442330157:android:d667ace3c23cab645f28a4',
    messagingSenderId: '138442330157',
    projectId: 'flutterproject-183e2',
    databaseURL: 'https://flutterproject-183e2-default-rtdb.firebaseio.com',
    storageBucket: 'flutterproject-183e2.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAiy7ravwdV39GJE75fvuNi2rRtt84Umzo',
    appId: '1:138442330157:ios:3f0be71dfda42bbc5f28a4',
    messagingSenderId: '138442330157',
    projectId: 'flutterproject-183e2',
    databaseURL: 'https://flutterproject-183e2-default-rtdb.firebaseio.com',
    storageBucket: 'flutterproject-183e2.firebasestorage.app',
    iosBundleId: 'com.example.flutterApplication1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAiy7ravwdV39GJE75fvuNi2rRtt84Umzo',
    appId: '1:138442330157:ios:3f0be71dfda42bbc5f28a4',
    messagingSenderId: '138442330157',
    projectId: 'flutterproject-183e2',
    databaseURL: 'https://flutterproject-183e2-default-rtdb.firebaseio.com',
    storageBucket: 'flutterproject-183e2.firebasestorage.app',
    iosBundleId: 'com.example.flutterApplication1',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBWgs1opn0Ft9Uyq5TdSK5CAH8mUcDwAKI',
    appId: '1:138442330157:web:0c5bb958f867c16a5f28a4',
    messagingSenderId: '138442330157',
    projectId: 'flutterproject-183e2',
    authDomain: 'flutterproject-183e2.firebaseapp.com',
    databaseURL: 'https://flutterproject-183e2-default-rtdb.firebaseio.com',
    storageBucket: 'flutterproject-183e2.firebasestorage.app',
  );
}
