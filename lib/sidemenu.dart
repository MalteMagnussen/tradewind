import 'package:flutter/material.dart';
import 'package:tradewind/homepage.dart';
import 'package:tradewind/team.dart';

class Sidemenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.indigo),
            child: Text('Tradewind',
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .merge(TextStyle(color: Colors.white))),
          ),
          ListTile(
            leading: Icon(Icons.toys),
            title: Text('Home'),
            onTap: () => Navigator.pushNamed(
              context,
              '/',
            ),
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('Team'),
            onTap: () => Navigator.pushNamed(
              context,
              '/team',
            ),
          ),
          AboutListTile(
            applicationName: 'Tradewind',
            applicationVersion: '0.1',
            applicationLegalese: 'Tradewind 2020',
          )
        ],
      ),
    );
  }
}
