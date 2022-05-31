import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mindpeers_assigment/core/app_configs/constants.dart';
import 'package:mindpeers_assigment/core/app_configs/custom_error.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth;
  AuthService({required FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth;
  Future login({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw "Enter valid email or password";
      } else if (e.code == 'wrong-password') {
        debugPrint('Wrong password provided for that user.');
      } else if (e.code == 'network-request-failed') {
        throw "No internet connection";
      } else {
        throw e.code.toString();
      }
    }
  }

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }

  Future<UserStateEnum> getUserState() async {
    if (_firebaseAuth.currentUser == null) {
      return UserStateEnum.logout;
    } else {
      return UserStateEnum.login;
    }
  }
}
