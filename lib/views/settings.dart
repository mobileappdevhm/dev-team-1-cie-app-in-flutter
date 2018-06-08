import 'dart:async';

import 'package:cie_team1/generated/i18n.dart';
import 'package:cie_team1/presenter/currentUserPresenter.dart';
import 'package:cie_team1/utils/cieColor.dart';
import 'package:cie_team1/utils/cieStyle.dart';
import 'package:cie_team1/utils/routes.dart';
import 'package:cie_team1/views/takenCourses.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Settings extends StatefulWidget {
  Settings({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SettingsState createState() => new _SettingsState();
}

class _SettingsState extends State<Settings> {
  static CurrentUserPresenter currentUserPresenter = new CurrentUserPresenter();
  int credits = currentUserPresenter.getTotalCredits();
  int engCredits = currentUserPresenter.getDep3Credits();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Padding(
          padding: const EdgeInsets.all(16.0),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Row(
                children: <Widget>[
                  new Expanded(
                      child: new Row(
                    children: <Widget>[
                      new Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: const Icon(
                          Icons.person_outline,
                          size: 75.0,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  )),
                  new Column(
                    children: <Widget>[
                      new Container(
                          padding:
                              const EdgeInsets.only(bottom: 10.0, right: 10.0),
                          child: new Row(
                            children: <Widget>[
                              new Text(
                                S.of(context).settings_label_loggedInAs,
                                style: CiEStyle.getSettingsStyle(),
                              ),
                              new Text(
                                " " + currentUserPresenter.getFullName(),
                                style: CiEStyle.getSettingsInfoStyle(),
                              ),
                            ],
                          )),
                      new RaisedButton(
                        onPressed: () => _logout(context),
                        shape: new RoundedRectangleBorder(
                            borderRadius: CiEStyle.getButtonBorderRadius()),
                        color: CiEColor.red,
                        child: new Text(
                          S.of(context).settings_button_logout,
                          style: CiEStyle.getSettingsLogoutStyle(),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              new Container(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: new Column(
                    children: <Widget>[
                      new Container(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: new Row(
                          children: <Widget>[
                            new Text(
                              S.of(context).settings_label_loggedInAs + " : ",
                              style: CiEStyle.getSettingsStyle(),
                            ),
                            new Text(
                              " " + currentUserPresenter.getCurrentUserStatus(),
                              style: CiEStyle.getSettingsInfoStyle(),
                            )
                          ],
                        ),
                      ),
                      new Row(
                        children: <Widget>[
                          new Text(
                            S.of(context).settings_label_department + " : ",
                            style: CiEStyle.getSettingsStyle(),
                          ),
                          new Text(
                            " " + currentUserPresenter.getCurrentUserFaculty(),
                            style: CiEStyle.getSettingsInfoStyle(),
                          ),
                        ],
                      ),
                      new Divider(),
                    ],
                  )),
              new Container(
                  child: new Column(
                children: <Widget>[
                  new Row(
                    children: <Widget>[
                      new Icon(Icons.mail_outline),
                      new FlatButton(
                        child: new Text(
                          S.of(context).settings_contactInternationalOffice,
                          style: CiEStyle.getSettingsContactStyle(),
                        ),
                        onPressed: _onContactInternationalOffice,
                      ),
                    ],
                  ),
                  new Divider(),
                ],
              )),
              new Container(
                padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                child: new Row(children: <Widget>[
                  new Expanded(
                      child: new Text(
                    S.of(context).settings_cieCertificate,
                    style: CiEStyle.getSettingsStyle(),
                  )),
                  new Text("$credits /15", style: CiEStyle.getSettingsStyle()),
                  // Calculate ECTS/15 but one of the courses need to be from department 13
                ]),
              ),
              new LinearProgressIndicator(
                value: credits / 15,
              ),
              new Container(
                padding: const EdgeInsets.only(top: 20.0, bottom: 16.0),
                child: new Row(children: <Widget>[
                  new Expanded(
                      child: new Text(S.of(context).settings_ieCertificate,
                          style: CiEStyle.getSettingsStyle())),
                  new Text("$engCredits /15",
                      style: CiEStyle.getSettingsStyle()),
                  // Calculate ECTS of department 3 /15 with at least 2 ects from dep. 13
                ]),
              ),
              new LinearProgressIndicator(value: engCredits / 15),
              /* This causes overload on horizontal screen */

              new GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new TakenCourses()));
                },
                child: new Padding(
                  padding: const EdgeInsets.only(top: 32.0, bottom: 16.0),
                  child: new Row(
                    children: <Widget>[
                      new Expanded(
                          child: new Text(
                              S.of(context).settings_label_takenCourses,
                              style: CiEStyle.getSettingsStyle())),
                      new Icon(
                        Icons.keyboard_arrow_right,
                        color: CiEColor.gray,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future _onContactInternationalOffice() async {
    if (await canLaunch(S.of(context).settings_contactInternationalOffice)) {
      await launch(S.of(context).settings_contactInternationalOffice);
    } else {
      throw 'Could not launch $S.of(context).settings_contactInternationalOffice';
    }
  }

  void _logout(BuildContext context) {
    //TODO maybe some more things are required here later
    Navigator.pushReplacementNamed(context, Routes.Login);
  }
}
