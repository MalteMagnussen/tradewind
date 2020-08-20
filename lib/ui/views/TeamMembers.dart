import 'package:flutter/material.dart';
import 'package:tradewind/app/constants/strings.dart';
import 'package:tradewind/components/team_member.dart';

class TeamView extends StatelessWidget {
  const TeamView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // ignore: non_constant_identifier_names
        final TeamMembers = [
          TeamMember(
            email: TradewindStrings.augustEmail,
            text: TradewindStrings.augustDescription,
            image: TradewindStrings.augustImage,
          ),
          TeamMember(
            email: TradewindStrings.andreasEmail,
            text: TradewindStrings.andreasDescription,
            image: TradewindStrings.andreasImage,
          ),
          TeamMember(
            email: TradewindStrings.malteEmail,
            text: TradewindStrings.malteDescription,
            image: TradewindStrings.malteImage,
          )
        ];
        if (constraints.maxWidth < 957) {
          return ListView.separated(
            itemCount: TeamMembers.length,
            padding: EdgeInsets.all(10.0),
            separatorBuilder: (context, index) => SizedBox(
              height: 20,
            ),
            itemBuilder: (context, index) => TeamMembers[index],
          );
        } else {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: TeamMembers,
          );
        }
      },
    );
  }
}
