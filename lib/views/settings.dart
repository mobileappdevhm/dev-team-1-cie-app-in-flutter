import 'dart:async';
import 'dart:convert';

import 'package:cie_team1/generic/genericShowInstruction.dart';
import 'package:cie_team1/model/user/user.dart';
import 'package:cie_team1/presenter/currentUserPresenter.dart';
import 'package:cie_team1/utils/analytics.dart';
import 'package:cie_team1/utils/cieColor.dart';
import 'package:cie_team1/utils/cieStyle.dart';
import 'package:cie_team1/utils/fileStore.dart';
import 'package:cie_team1/utils/routes.dart';
import 'package:cie_team1/utils/staticVariables.dart';
import 'package:cie_team1/views/takenCourses.dart';
import 'package:cie_team1/widgets/privacyPage.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Settings extends StatefulWidget {
  final CurrentUserPresenter currentUserPresenter;

  Settings(this.currentUserPresenter);

  @override
  _SettingsState createState() => new _SettingsState(currentUserPresenter);
}

class _SettingsState extends State<Settings> {
  final CurrentUserPresenter currentUserPresenter;
  int credits = 0;
  int engCredits = 0;
  bool isMetricsEnabled = false;
  bool isLoggedIn = false;

  _SettingsState(this.currentUserPresenter);

  @override
  void initState() {
    super.initState();
    currentUserPresenter.loadUserSettingsFromMemory();
    credits = currentUserPresenter.getTotalCredits();
    engCredits = currentUserPresenter.getDep3Credits();
    setState(() {
      if (currentUserPresenter.getCurrentUser().isMetricsEnabled != null) {
        isMetricsEnabled =
            (currentUserPresenter.getCurrentUser().isMetricsEnabled);
      }
      if (currentUserPresenter.getCurrentUser().isLoggedIn != null) {
        isLoggedIn = (currentUserPresenter.getCurrentUser().isLoggedIn);
      }
    });
    Analytics.setUserProperty(
        "department", currentUserPresenter.getCurrentUserFaculty());
    Analytics.setCurrentScreen("profile_screen");
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new SingleChildScrollView(
        child: new Center(
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
                            padding: const EdgeInsets.only(
                                bottom: 10.0, right: 10.0),
                            child: new Row(
                              children: <Widget>[
                                new Text(
                                  StaticVariables.LOGGED_IN_AS,
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
                          child: isLoggedIn == true
                              ? new Text(StaticVariables.LOGOUT_BUTTON,
                                  style: CiEStyle.getSettingsLogoutStyle())
                              : new Text(StaticVariables.LOGIN_BUTTON,
                                  style: CiEStyle.getSettingsLogoutStyle()),
                        ),
                        new Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                        ),
                        new RaisedButton(
                          onPressed: () => _togglePrivacyPage(context),
                          shape: new RoundedRectangleBorder(
                              borderRadius: CiEStyle.getButtonBorderRadius()),
                          color: CiEColor.red,
                          child: new Text(
                            StaticVariables.PRIVACY_BUTTON,
                            style: CiEStyle.getSettingsPrivacyStyle(),
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
                                  StaticVariables.STATUS + " : ",
                                  style: CiEStyle.getSettingsStyle(),
                                ),
                                new Text(
                                  " " +
                                      currentUserPresenter
                                          .getCurrentUserStatus(),
                                  style: CiEStyle.getSettingsInfoStyle(),
                                )
                              ],
                            )),
                        new Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                        ),
                        new Row(
                          children: <Widget>[
                            new Text(
                              StaticVariables.DEPARTMENT + " : ",
                              style: CiEStyle.getSettingsStyle(),
                            ),
                            new Text(
                              " " +
                                  currentUserPresenter.getCurrentUserFaculty(),
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
                            StaticVariables.CONTACT_OFFICE,
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
                      StaticVariables.CIE_CERTIFICATE,
                      style: CiEStyle.getSettingsStyle(),
                    )),
                    new Text("$credits /15",
                        style: CiEStyle.getSettingsStyle()),
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
                        child: new Text(StaticVariables.IE_CERTIFICATE,
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
                            child: new Text(StaticVariables.TAKEN_COURSES,
                                style: CiEStyle.getSettingsStyle())),
                        new Icon(
                          Icons.keyboard_arrow_right,
                          color: CiEColor.gray,
                        )
                      ],
                    ),
                  ),
                ),
                buildUserMetricsWidget(),
                new Padding(
                  padding: new EdgeInsets.only(top: 10.0),
                ),
                new RaisedButton(
                  onPressed: () => _toggleIntroduction(context),
                  shape: new RoundedRectangleBorder(
                      borderRadius: CiEStyle.getButtonBorderRadius()),
                  color: CiEColor.red,
                  child: new Text(StaticVariables.SHOW_INSTRUCTIONS,
                      style: CiEStyle.getSettingsLogoutStyle()),
                ),
              ],
            ),
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

  void _logout(BuildContext context) {
    var builder = new UserBuilder();
    User tempUserObj = builder
        .withFirstName(null)
        .withLastName(null)
        .withDepartment(null)
        .withIsLoggedIn(false)
        .withIsMetricsEnabled(isMetricsEnabled)
        .withDegree(null)
        .build();
    String data = json.encode(User.toJson(tempUserObj));
    FileStore.writeToFile(FileStore.USER_SETTINGS, data).then((f) {
      Navigator.of(context).pushReplacementNamed(Routes.Login);
    });
  }

  void _togglePrivacyPage(BuildContext context) {
    Navigator.push(context,
        new MaterialPageRoute(builder: (context) => new PrivacyPage()));
  }

  Widget buildUserMetricsWidget() {
    return new Row(
      children: <Widget>[
        new Switch(
          value: isMetricsEnabled,
          onChanged: (bool v) {
            setState(() {
              // Toggle in widget for faster render
              isMetricsEnabled = !isMetricsEnabled;
              // Turn Firebase Analytics tracking on
              Analytics.setAnalytics(isMetricsEnabled);
              // Toggle in 'cache'
              currentUserPresenter.toggleIsMetricsEnabled();
              // Save 'cache' locally
              currentUserPresenter.saveUserSettings();
            });
          },
        ),
        isMetricsEnabled
            ? new Text(StaticVariables.METRICS_ENABLED,
                style: CiEStyle.getSettingsEnabledStyle())
            : new Text(StaticVariables.METRICS_DISABLED,
                style: CiEStyle.getSettingsDisabledStyle()),
      ],
    );
  }

  void _toggleIntroduction(BuildContext context) {
    //track click on introduction
    Analytics.logEvent("settings_click", {"title": "introcuction"});

    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) => new Scaffold(
                appBar: new AppBar(
                  title: new Text(
                    StaticVariables.SHOW_INSTRUCTIONS,
                    style: CiEStyle.getAppBarTitleStyle(context),
                  ),
                  elevation: CiEStyle.getAppBarElevation(context),
                  backgroundColor: CiEColor.red,
                ),
                body: new Column(
                  children: <Widget>[
                    GenericShowInstruction
                        .showInstructions(null)
                  ],
                ),
            )
        ));
  }
}
