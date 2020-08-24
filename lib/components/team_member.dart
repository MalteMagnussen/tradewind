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
    return Container(
      height: 450,
      width: 400,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 2,
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
                elevation: 3,
                margin: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 25.0,
                ),
                child: Container(
                  width: 350,
                  child: ListTile(
                    leading: Icon(Icons.email),
                    title: SelectableText(email,
                        style: Theme.of(context).textTheme.bodyText1),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
