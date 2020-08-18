import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:tradewind/app/services/firebase_auth_service.dart';

class SignInViewModel extends ChangeNotifier {
  SignInViewModel(this.locator);

  final Locator locator;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> signInAnonymously() async {
    _setLoading();
    await locator<FirebaseAuthService>().signInWithGoogle();
    _setNotLoading();
  }

  void _setLoading() {
    _isLoading = true;
    notifyListeners();
  }

  void _setNotLoading() {
    _isLoading = false;
    notifyListeners();
  }
}
