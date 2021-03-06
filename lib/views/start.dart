import 'dart:convert';

import 'package:cie_app/model/user/user.dart';
import 'package:cie_app/utils/analytics.dart';
import 'package:cie_app/utils/cieColor.dart';
import 'package:cie_app/utils/cieStyle.dart';
import 'package:cie_app/utils/dataManager.dart';
import 'package:cie_app/utils/routes.dart';
import 'package:cie_app/utils/staticVariables.dart';
import 'package:cie_app/widgets/CiEAnimation.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  _WelcomePageState createState() => new _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with SingleTickerProviderStateMixin {
  _WelcomePageState();

  AnimationController controller;
  Animation<double> animation;

  @override
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

    Analytics.setCurrentScreen("start_screen");
  }

  @override
  dispose() {
    super.dispose();
    controller.dispose();
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
            StaticVariables.COURSES_IN_ENGLISH,
            style: new TextStyle(
                fontSize: 30.0, color: CiEColor.red, letterSpacing: 2.0),
          ),
          new Container(
            padding: const EdgeInsets.all(25.0),
            child: new FlatButton(
              color: CiEStyle.getLogoutButtonColor(),
              shape: new RoundedRectangleBorder(
                  borderRadius: CiEStyle.getButtonBorderRadius()),
              onPressed: () => _startClick(),
              child: new Text(
                StaticVariables.START_BUTTON_START,
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

  void _startClick() {
    DataManager.getResource(DataManager.LOCAL_USER_SETTINGS).then((String val) {
      //check if user settings are available and not empty
      if (val != null && val.isNotEmpty) {
        //encode json string and fill builder
        dynamic settings = json.decode(val);
        var builder = UserBuilder.fromJson(settings);
        //check if user is valid by first and last name not null
        if (builder.firstName != null && builder.lastName != null) {
          //if valid user was stored previously redirect to tabs
          Navigator.of(context).pushReplacementNamed(Routes.TabPages);
          //return is dirty but seems to be necessary
          return;
        }
      }
      //if user settings were not stored, not available or there was no valid user redirect to login
      Navigator.pushReplacementNamed(context, Routes.Login);
    });
  }
}
