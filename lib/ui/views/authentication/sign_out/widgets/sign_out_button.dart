import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tradewind/app/constants/strings.dart';
import 'package:tradewind/app/services/firebase_auth_service.dart';

class SignOutButton extends StatelessWidget {
  const SignOutButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        context.read<FirebaseAuthService>().signOut();
      },
      child: Text(Strings.signOut),
    );
  }
}
