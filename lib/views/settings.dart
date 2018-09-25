import 'dart:async';
import 'dart:convert';

import 'package:cie_app/generic/genericShowInstruction.dart';
import 'package:cie_app/model/user/user.dart';
import 'package:cie_app/presenter/courseListPresenter.dart';
import 'package:cie_app/presenter/currentUserPresenter.dart';
import 'package:cie_app/utils/analytics.dart';
import 'package:cie_app/utils/cieColor.dart';
import 'package:cie_app/utils/cieStyle.dart';
import 'package:cie_app/utils/dataManager.dart';
import 'package:cie_app/utils/routes.dart';
import 'package:cie_app/utils/staticVariables.dart';
import 'package:cie_app/utils/utility.dart';
import 'package:cie_app/views/takenCourses.dart';
import 'package:cie_app/widgets/privacyPage.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Settings extends StatefulWidget {
  final CurrentUserPresenter currentUserPresenter;
  final CourseListPresenter courseListPresenter;

  Settings(this.currentUserPresenter, this.courseListPresenter);

  @override
  _SettingsState createState() =>
      new _SettingsState(currentUserPresenter, courseListPresenter);
}

class _SettingsState extends State<Settings> {
  final CurrentUserPresenter currentUserPresenter;
  final CourseListPresenter courseListPresenter;

  int credits = 0;
  int engCredits = 0;
  bool isMetricsEnabled = false;
  bool isLoggedIn = false;

  _SettingsState(this.currentUserPresenter, this.courseListPresenter);

  @override
  void initState() {
    super.initState();
    currentUserPresenter.loadUserSettingsFromMemory();
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
                          onPressed: () =>
                              _toggleIntroduction(context, courseListPresenter),
                          shape: new RoundedRectangleBorder(
                              borderRadius: CiEStyle.getButtonBorderRadius()),
                          color: CiEColor.red,
                          child: new Text(StaticVariables.SHOW_INSTRUCTIONS,
                              style: CiEStyle.getSettingsLogoutStyle()),
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
                          onPressed: () => Utility.tryLaunch(StaticVariables.MAILTO_INTERNATIONAL_OFFICE),
                        ),
                      ],
                    ),
                    new Divider(),
                  ],
                )),
                new FutureBuilder(
                    future: DataManager.getResource(
                        DataManager.LOCAL_TAKEN_COURSES),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        List<dynamic> takenCourses = json.decode(snapshot.data);
                        credits = _countEcts(takenCourses);
                      }
                      return new Container(
                        padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                        child: new Row(children: <Widget>[
                          new Expanded(
                              child: new Text(
                            StaticVariables.CIE_CERTIFICATE,
                            style: CiEStyle.getSettingsStyle(),
                          )),
                          new Text("$credits /15",
                              style: CiEStyle.getSettingsStyle()),
                        ]),
                      );
                    }),
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
                  ]),
                ),
                new LinearProgressIndicator(value: engCredits / 15),
                /* This causes overload on horizontal screen */

                new GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) =>
                                new TakenCourses(currentUserPresenter)));
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
            ),
          ),
        ),
      ),
    );
  }

  int _countEcts(List<dynamic> takenCourses) {
    var count = 0;
    for (var course in takenCourses) {
      count += course['ects'].round();
    }
    return count;
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
    DataManager.writeToFile(DataManager.LOCAL_USER_SETTINGS, data).then((f) {
      Navigator.of(context).pushReplacementNamed(Routes.Login);
    });
  }

  void _togglePrivacyPage(BuildContext context) {
    Navigator.push(context,
        new MaterialPageRoute(builder: (context) => new PrivacyPage()));
  }

  Widget buildUserMetricsWidget() {
    return new ListTile(
      title: isMetricsEnabled
          ? new Text(StaticVariables.METRICS_ENABLED,
              style: CiEStyle.getSettingsEnabledStyle())
          : new Text(StaticVariables.METRICS_DISABLED,
              style: CiEStyle.getSettingsDisabledStyle()),
      trailing: new Switch(
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
    );
  }

  void _toggleIntroduction(
      BuildContext context, CourseListPresenter courseListPresenter) {
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
                      GenericShowInstruction.showInstructions(
                          context, true, courseListPresenter)
                    ],
                  ),
                )));
  }
}
