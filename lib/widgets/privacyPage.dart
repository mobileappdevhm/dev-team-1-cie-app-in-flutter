import 'package:cie_team1/utils/cieColor.dart';
import 'package:flutter/material.dart';
import 'package:cie_team1/utils/cieStyle.dart';

class PrivacyPage extends StatefulWidget {
  PrivacyPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _PrivacyPageState createState() => new _PrivacyPageState();
}

class _PrivacyPageState extends State<PrivacyPage> {
  @override
  Widget build(BuildContext context) {
    double iconSize = CiEStyle.getCourseDescriptionIconSize();

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Privacy Policy",
          style: CiEStyle.getAppBarTitleStyle(context),
        ),
        elevation: CiEStyle.getAppBarElevation(context),
        backgroundColor: CiEColor.lightGray,
      ),
      body: new Center(
        child: new Padding(
          padding: const EdgeInsets.all(25.0),
          child: new Column(
            children: <Widget>[
              new Expanded(
                child: new Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: new Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                          "Curabitur congue nisl porttitor enim tempor, nec venenatis nibh congue. "
                          "Donec congue eleifend libero, sit amet eleifend augue mattis quis. "
                          "Fusce in luctus dolor. Curabitur sodales tellus sit amet faucibus aliquet. "
                          "Cras eget congue diam. Maecenas aliquam tortor a lorem aliquam, ac pellentesque odio aliquam. "
                          "Morbi vulputate dolor mi, sit amet consectetur odio hendrerit eu. Aenean efficitur at nibh in placerat. "
                          "Vestibulum sodales metus eleifend metus malesuada commodo. "
                          "Vivamus eleifend, tellus non eleifend tempus, massa lorem commodo tellus, in condimentum elit eros vel dolor. "
                          "Donec tincidunt bibendum bibendum. "
                          "Praesent lectus leo, fringilla in mattis ut, semper at mauris. ",
                      style: new TextStyle(fontSize: 15.0),
                    )),
              ),
              new Row(
                children: <Widget>[
                  new Expanded(
                    child: new Column(
                      children: <Widget>[
                        new Padding(
                          padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                          child: new Row(
                            children: <Widget>[
                              new Icon(
                                const IconData(0xe0e1,
                                    fontFamily: 'MaterialIcons'),
                                size: 30.0,
                              ),
                              new Text(
                                "Contact",
                                style: new TextStyle(fontSize: 17.0),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}