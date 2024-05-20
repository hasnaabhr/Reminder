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
    apiKey: 'AIzaSyBVvaiKb2iQmaMQJIMPlX31xpKWd0kUFGc',
    appId: '1:983265412094:android:7334abf06ca550ad08f6af',
    messagingSenderId: '983265412094',
    projectId: 'medisync-80e70',
    storageBucket: 'medisync-80e70.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyABabhql_JtudZZV0cbsEJqbujryrsoAvc',
    appId: '1:983265412094:ios:bd306a22f2a28b0a08f6af',
    messagingSenderId: '983265412094',
    projectId: 'medisync-80e70',
    storageBucket: 'medisync-80e70.appspot.com',
    androidClientId: '983265412094-cnekae34tbkgofonust2hfrminv1bm7h.apps.googleusercontent.com',
    iosClientId: '983265412094-lnm5usrq3udj34f02sq6s24390p5fosm.apps.googleusercontent.com',
    iosBundleId: 'health.mymeds.app.mymedsApp',
  );
}
