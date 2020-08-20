import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tradewind/ui/views/authentication/sign_in/login_page.dart';
import 'package:tradewind/ui/views/forecast.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Handle Authentication
  handleAuth() {
    return StreamBuilder(
      stream: _auth.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Forecast();
        } else {
          return LoginPage();
        }
      },
    );
  }

  Stream<User> get user {
    return _auth.authStateChanges();
  }

  bool isSignedIn() => _auth.currentUser != null ? true : false;

  //Sign Out
  signOut() {
    _auth.signOut();
  }

  //Sign in
  signIn(email, password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}
