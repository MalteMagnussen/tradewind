import 'package:flutter/material.dart';
import 'package:tradewind/app/constants/strings.dart';
import 'package:tradewind/app/services/firebase_auth_service.dart';
import 'package:tradewind/components/pill_button.dart';

class SignOutButton extends StatelessWidget {
  const SignOutButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TradewindButton(Strings.signOut, AuthService().signOut()),
    );
  }
}
