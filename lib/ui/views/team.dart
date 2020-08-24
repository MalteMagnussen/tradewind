import 'package:flutter/material.dart';
import 'package:tradewind/app/constants/colors.dart';
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
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    TradewindColors.primaryColor,
                    TradewindColors.accentColor,
                  ],
                ),
              ),
              child: TeamView(),
            ),
          ],
        ),
      ),
    );
  }
}
