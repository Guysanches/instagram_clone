import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'storage_service.dart';

class AutheticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> signUpUser({
    required String username,
    required String email,
    required String password,
    required String biography,
    required Uint8List photoFile,
  }) async {
    String result = "Some error occurred";
    try {
      if (username.isNotEmpty ||
          email.isNotEmpty ||
          password.isNotEmpty ||
          biography.isNotEmpty) {
        UserCredential userCredential = await _firebaseAuth
            .createUserWithEmailAndPassword(email: email, password: password);

        String photoURL = await StorageService()
            .uploadImageToStorage('profilePics', photoFile, false);

        await _firestore.collection('users').doc(userCredential.user!.uid).set({
          'username': username,
          'email': email,
          'password': password,
          'biography': biography,
          'followers': [],
          'following': [],
          'photoURL': photoURL,
        });
        result = 'success';
      }
    } catch (e) {
      result = e.toString();
    }

    return result;
  }

  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String result = 'some error occurred';

    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);

        result = 'success';
      } else {
        result = 'Please enter all the fields';
      }
    } catch (e) {
      result = e.toString();
    }
    return result;
  }
}
