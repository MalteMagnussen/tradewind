import 'package:flutter/material.dart';
import 'package:tradewind/app/constants/colors.dart';
import 'package:tradewind/app/constants/text.dart';
import 'package:tradewind/ui/views/navigation/appbar.dart';
import 'package:tradewind/ui/views/navigation/sidemenu.dart';

import 'TeamMembers.dart';

class Team extends StatelessWidget {
  const Team({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String bullet = "\u2022 ";
    return Scaffold(
      drawer: Sidemenu(),
      appBar: TradewindAppBar('Team Tradewind'),
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: ListView(
          children: [
            gradientContainer(
              true,
              Column(
                children: [
                  TeamView(),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return Container(
                          width: 800,
                          height: 600,
                          child: Card(
                            child: Column(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 400,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                        'https://i.imgur.com/KXMTZ4K.jpg',
                                      ),
                                    ),
                                  ),
                                ),
                                ListTile(
                                  title: Text(
                                    'Meet the Team!',
                                    style: TextStyle(
                                      letterSpacing: 1.2,
                                      fontSize: 25,
                                    ),
                                  ),
                                ),
                                CardText(
                                  'Tradewind is founded by a team of 3.\nTwo engineers and a computer scientist.\nOur diverse background covers:',
                                ),
                                CardText(
                                  bullet + 'Energy system modelling',
                                ),
                                CardText(
                                  bullet + 'Satellite big data management',
                                ),
                                CardText(
                                  bullet + 'IT development',
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget CardText(String text) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
      ),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          text,
          textAlign: TextAlign.left,
          textDirection: TextDirection.ltr,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  Widget gradientContainer(bool whichWay, Widget child) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: whichWay ? Alignment.topLeft : Alignment.topRight,
          end: whichWay ? Alignment.bottomRight : Alignment.bottomLeft,
          colors: <Color>[
            whichWay
                ? TradewindColors.primaryColor
                : TradewindColors.accentColor,
            whichWay
                ? TradewindColors.accentColor
                : TradewindColors.primaryColor,
          ],
        ),
      ),
      child: child,
    );
  }
}
