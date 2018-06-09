import 'package:cie_team1/utils/cieColor.dart';
import 'package:cie_team1/utils/cieStyle.dart';
import 'package:cie_team1/utils/routes.dart';
import 'package:cie_team1/widgets/CiEAnimation.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  _WelcomePageState createState() => new _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    animation = new CurvedAnimation(parent: controller, curve: Curves.easeIn);

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    controller.forward();
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new AnimatedLogo(animation: animation),
          new Padding(
            padding: new EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
          ),
          new Text(
            'Courses in English',
            style: new TextStyle(
                fontSize: 30.0, color: CiEColor.red, letterSpacing: 2.0),
          ),
          new Container(
            padding: const EdgeInsets.all(25.0),
            child: new FlatButton(
              color: CiEStyle.getLogoutButtonColor(),
              shape: new RoundedRectangleBorder(
                  borderRadius: CiEStyle.getButtonBorderRadius()),
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, Routes.Login),
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
