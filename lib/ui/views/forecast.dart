import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tradewind/ui/views/authentication/sign_in/login_page.dart';
import 'package:tradewind/ui/views/navigation/appbar.dart';
import 'package:tradewind/ui/views/navigation/sidemenu.dart';

class Forecast extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    if (user != null) {
      return Scaffold(
        drawer: Sidemenu(),
        appBar: TradewindAppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text('You are logged in'),
            ),
          ],
        ),
      );
    } else {
      return Scaffold(
        drawer: Sidemenu(),
        appBar: TradewindAppBar(),
        body: LoginPage(),
      );
    }
  }
}
