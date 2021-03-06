import 'package:cie_app/utils/routes.dart';
import 'package:cie_app/views/start.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of our application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return new MaterialApp(
      title: 'CiE',
      theme: new ThemeData(
        dividerColor: Colors.transparent,
        primarySwatch: Colors.red,
      ),
      debugShowCheckedModeBanner: false,
      home: new WelcomePage(),
      routes: Routes.getRoutes(),
    );
  }
}
