import 'package:cie_team1/utils/cieColor.dart';
import 'package:cie_team1/utils/cieStyle.dart';
import 'package:cie_team1/utils/routes.dart';
import 'package:cie_team1/utils/staticVariables.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Image.asset(StaticVariables.IMAGE_PATH + 'hm_logo.png'),
          new Padding(
            padding: new EdgeInsets.fromLTRB(0.0, 150.0, 0.0, 0.0),
          ),
          new Text(
            'Courses in English',
            style: new TextStyle(fontSize: 30.0, color: CiEColor.red),
          ),
          new Container(
            padding: const EdgeInsets.all(20.0),
            alignment: Alignment.center,
            child: new FlatButton(
              onPressed: () => Navigator.pushReplacementNamed(context, Routes.Login),
              color: CiEColor.red,
              shape: new RoundedRectangleBorder(borderRadius: CiEStyle.getButtonBorderRadius()),
              padding: new EdgeInsets.all(10.0),
              child: new Text(
                "Start",
                style: new TextStyle(color: Colors.white),
              ),
            ),
          ),
          new Padding(
            padding: new EdgeInsets.fromLTRB(0.0, 80.0, 0.0, 0.0),
          ),
        ],
      ),
    );
  }
}
