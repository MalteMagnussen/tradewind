import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tradewind/components/pill_button.dart';
import 'package:url_launcher/url_launcher.dart';

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
    return IntrinsicHeight(
      child: Container(
        height: 400,
        width: MediaQuery.of(context).size.width * 0.30,
        child: Card(
          elevation: 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(text, style: Theme.of(context).textTheme.bodyText1),
              ),
              TradewindButton(
                email, // TODO - https://stackoverflow.com/questions/58704973/mailto-link-for-flutter-for-web
                () async {
                  try {
                    await launch(email);
                  } catch (e) {
                    await Clipboard.setData(
                      ClipboardData(
                        text: email,
                      ),
                    );
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content:
                            Text('Copied email: $email to your Clipboard.'),
                      ),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
