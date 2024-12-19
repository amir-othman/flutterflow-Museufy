import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDDs5DEcNQWvFcBq30Zxh4l6FJhFSbwIt0",
            authDomain: "futur-musum-p7oyv0.firebaseapp.com",
            projectId: "futur-musum-p7oyv0",
            storageBucket: "futur-musum-p7oyv0.firebasestorage.app",
            messagingSenderId: "810177203156",
            appId: "1:810177203156:web:73484c83d19833c04ce441"));
  } else {
    await Firebase.initializeApp();
  }
}
