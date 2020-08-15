import 'package:flutter/material.dart';
import 'package:tradewind/utility/utility.dart';

class TeamMember extends StatelessWidget {
  final String image;
  final String text;
  final String email;

  const TeamMember({
    Key key,
    this.image,
    this.text,
    this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.30,
      height: MediaQuery.of(context).size.height * 0.5,
      child: Card(
        elevation: 3,
        child: Column(
          children: [
            Container(
              height: 200,
              width: 200,
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage: NetworkImage(image),
                ),
              ),
            ),
            Divider(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(text, style: Theme.of(context).textTheme.bodyText1),
              ),
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: Text(
                email,
                style: Theme.of(context).textTheme.button.merge(
                      TextStyle(
                        color: Colors.white,
                      ),
                    ),
              ),
              color: Theme.of(context).colorScheme.secondary,
              onPressed: () => Utility.launchURL(email),
            )
          ],
        ),
      ),
    );
  }
}
