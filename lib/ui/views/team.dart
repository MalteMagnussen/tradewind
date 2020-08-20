import 'package:flutter/material.dart';
import 'package:tradewind/ui/views/navigation/appbar.dart';
import 'package:tradewind/ui/views/navigation/sidemenu.dart';

import 'TeamMembers.dart';

class Team extends StatelessWidget {
  const Team({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidemenu(),
      appBar: TradewindAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: SafeArea(
          child: ListView(
            children: [
              TeamView(),
            ],
          ),
        ),
      ),
    );
  }
}
