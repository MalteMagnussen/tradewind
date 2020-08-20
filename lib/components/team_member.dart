import 'package:flutter/material.dart';

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
        height: 425,
        width: MediaQuery.of(context).size.width * 0.30,
        child: Card(
          elevation: 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
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
              Card(
                elevation: 6,
                margin: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 25.0,
                ),
                child: ListTile(
                  leading: Icon(Icons.email),
                  title: SelectableText(email,
                      style: Theme.of(context).textTheme.bodyText1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
