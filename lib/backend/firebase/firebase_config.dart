import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCb4BGn1kwYqatmuaK6L_BrInzWZgdMIgs",
            authDomain: "stracker-fa7c7.firebaseapp.com",
            projectId: "stracker-fa7c7",
            storageBucket: "stracker-fa7c7.appspot.com",
            messagingSenderId: "700302944427",
            appId: "1:700302944427:web:f18b4fcf6096cf49316fee",
            measurementId: "G-XSBHDGPQ71"));
  } else {
    await Firebase.initializeApp();
  }
}
