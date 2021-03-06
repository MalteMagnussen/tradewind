import 'package:flutter/material.dart';

class Sidemenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // TODO - https://stackoverflow.com/questions/47951907/change-flutter-drawer-background-color
      // TODO - https://stackoverflow.com/questions/56620719/flutter-drawer-background-image
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
          ListTile(
            leading: Icon(Icons.desktop_windows),
            title: Text('Forecasting'),
            onTap: () => Navigator.pushNamed(
              context,
              '/forecast',
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
