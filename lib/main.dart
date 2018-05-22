import 'package:cie_team1/views/start.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'CiE',
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      home: new WelcomePage(),
    );
  }
}
