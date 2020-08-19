import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tradewind/ui/views/authentication/sign_in/login_page.dart';
import 'package:tradewind/ui/views/forecast.dart';

class AuthService {
  //Handle Authentication
  handleAuth() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
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
    return FirebaseAuth.instance.authStateChanges();
  }

  bool isSignedIn() => FirebaseAuth.instance.currentUser != null ? true : false;

  //Sign Out
  signOut() {
    FirebaseAuth.instance.signOut();
  }

  //Sign in
  signIn(email, password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}
