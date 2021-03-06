import 'package:flutter/material.dart';
import 'package:tradewind/app/services/firebase_auth_service.dart';
import 'package:tradewind/ui/views/authentication/sign_out/widgets/sign_out_button.dart';

// ignore: non_constant_identifier_names
AppBar TradewindAppBar(String title) {
  return AppBar(
    title: Text(title),
    actions: [
      AuthService().isSignedIn() ? SignOutButton() : Container(),
    ],
  );
}
