import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/core/app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyC3YXZOrGtiPMfHOdX2RczYQuKBYgGRpmc",
          appId: "1:439301023925:web:fa61a3cda32da85a0a36fc",
          messagingSenderId: "439301023925",
          projectId: "instagram-clone-90af9",
          authDomain: "instagram-clone-90af9.firebaseapp.com",
          storageBucket: "instagram-clone-90af9.appspot.com"),
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(const AppWidget());
}
