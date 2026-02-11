import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCPM4DLFqBh72ngQgwlZvnO8zIg4Fewe9w",
            authDomain: "csc305-3dd01.firebaseapp.com",
            projectId: "csc305-3dd01",
            storageBucket: "csc305-3dd01.firebasestorage.app",
            messagingSenderId: "1026720646278",
            appId: "1:1026720646278:web:54b5f3224ec7df549e7d07",
            measurementId: "G-1T7RFZLFRK"));
  } else {
    await Firebase.initializeApp();
  }
}
