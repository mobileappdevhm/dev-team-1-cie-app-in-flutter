import 'dart:async';

import 'package:cie_team1/utils/analytics.dart';
import 'package:cie_team1/utils/cieColor.dart';
import 'package:cie_team1/utils/cieStyle.dart';
import 'package:cie_team1/utils/staticVariables.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PrivacyPage extends StatefulWidget {
  PrivacyPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _PrivacyPageState createState() => new _PrivacyPageState();
}

class _PrivacyPageState extends State<PrivacyPage> {
  bool changeLanguage = false;
  String privacyPolicyText = '';
  String privacyButtonText = '';

  initState() {
    super.initState();
    Analytics.setCurrentScreen("privacy_policy_screen");
  }

  @override
  Widget build(BuildContext context) {
    if (changeLanguage) {
      privacyPolicyText = StaticVariables.PRIVACY_TEXT_GERMAN;
      privacyButtonText = StaticVariables.CHANGE_TO_ENGLISH;
    } else {
      privacyPolicyText = StaticVariables.PRIVACY_TEXT_ENGLISH;
      privacyButtonText = StaticVariables.CHANGE_TO_GERMAN;
    }
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Privacy Policy",
          style: CiEStyle.getAppBarTitleStyle(context),
        ),
        elevation: CiEStyle.getAppBarElevation(context),
        backgroundColor: CiEColor.red,
      ),
      body: new Center(
        child: new Padding(
          padding: const EdgeInsets.all(25.0),
          child: new Column(
            children: <Widget>[
              new Expanded(
                flex: 1,
                child: new SingleChildScrollView(
                    child: new Text(
                  privacyPolicyText,
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
                          child: new FlatButton(
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
                            onPressed: () => _onContactInternationalOffice(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  new Container(
                    child: new RaisedButton(
                      onPressed: _toggleLanguage,
                      shape: new RoundedRectangleBorder(
                          borderRadius: CiEStyle.getButtonBorderRadius()),
                      color: CiEColor.red,
                      child: new Text(
                        privacyButtonText,
                        style: CiEStyle.getSettingsPrivacyStyle(),
                      ),
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

  Future _onContactInternationalOffice() async {
    if (await canLaunch(StaticVariables.internationalOfficeEmail)) {
      await launch(StaticVariables.internationalOfficeEmail);
    } else {
      throw 'Could not launch $StaticVariables.internationalOfficeEmail';
    }
  }

  void _toggleLanguage() {
    setState(() {
      this.changeLanguage = !changeLanguage;
    });
  }
}
