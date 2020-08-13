import 'package:flutter/material.dart';
import 'package:tradewind/components/team_member.dart';
import 'package:tradewind/sidemenu.dart';

class Team extends StatelessWidget {
  final Widget drawer;
  const Team({
    Key key,
    this.drawer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer,
      appBar: AppBar(
        title: Text('Team Tradewind'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TeamMember(
              email: 'august_zachariae@hotmail.com',
              image: 'https://i.imgur.com/FrcY2kd.jpg',
              text:
                  'Sustainable energy engineer educated at Technical University of Denmark. August began his career doing electricity price forecasting and economic feasibility studies in Copenhagen. August will use his skills in the field to make electricity price projections and production forecasts.',
            ),
            TeamMember(
              email: 'stokholm@space.dtu',
              text:
                  'As an educated electrical engineer from the Technical University of Denmark working at the space institute at the university. Andreas has had plenty of experience working with big data from satellites.',
              image: 'https://i.imgur.com/b9y2su1.jpg',
            ),
            TeamMember(
              email: 'maltehviidmagnussen@gmail.com',
              text:
                  'As a top student at Copenhagen Business Academy studying Computer Science, Malte maintains Tradewinds’ IT-systems and websites.',
              image: 'https://i.imgur.com/wuMvSe5.png',
            )
          ],
        ),
      ),
    );
  }
}
