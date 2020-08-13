import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
    this.drawer,
  }) : super(key: key);

  final Widget drawer;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: widget.drawer,
      appBar: AppBar(
        title: Text('Tradewind'),
      ),
      body: Center(child: Image.asset('assets/images/sidebar-0.jpg')),
    );
  }
}
