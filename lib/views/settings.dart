import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cie_team1/utils/cieStyle.dart';
import 'package:cie_team1/widgets/prevCourseList.dart';
import 'package:cie_team1/presenter/currentUserPresenter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cie_team1/utils/staticVariables.dart';

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
    var assetsImage = new AssetImage(
        currentUserPresenter.getCurrentUserProfileDir());
    var profile = new Image(image: assetsImage, width: 100.0, height: 100.0,);

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
                          padding: const EdgeInsets.only(left: 0.0),
                          child: profile,
                        )
                      ],
                    )
                ),
                new Column(
                  children: <Widget>[
                    new Container(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: new Row(
                          children: <Widget>[
                            new Text(
                              'Logged in as ',
                              style: CiEStyle.getSettingsStyle(),
                            ),
                            new Text(
                              " " + currentUserPresenter.getFullName(),
                              style: CiEStyle.getSettingsInfoStyle(),
                            ),
                          ],
                        )
                    ),

                    //Todo: Implement logout

                    new RaisedButton(
                      onPressed: null,
                      shape: new RoundedRectangleBorder(
                          borderRadius: CiEStyle.getButtonBorderRadius()),
                      color: CiEStyle.getLogoutButtonColor(),
                      child: new Text(
                        "Log out", style: CiEStyle.getSettingsLogoutStyle(),),
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
                            "Status: ", style: CiEStyle.getSettingsStyle(),),
                          new Text(" " +
                              currentUserPresenter.getCurrentUserStatus() +
                              " student",
                            style: CiEStyle.getSettingsInfoStyle(),)
                        ],
                      ),
                    ),

                    new Row(
                      children: <Widget>[
                        new Text("Department: ",
                          style: CiEStyle.getSettingsStyle(),),
                        new Text(
                          " " + currentUserPresenter.getCurrentUserFaculty(),
                          style: CiEStyle.getSettingsInfoStyle(),),
                      ],
                    ),
                    new Divider(),
                  ],
                )
            ),

            new Container(
                padding: const EdgeInsets.only(top: 16.0),
                child: new Column(
                  children: <Widget>[
                    new Row(
                      children: <Widget>[
                        new Icon(Icons.mail_outline),
                        //Todo: Implement deep link
                        new FlatButton(
                          child: new Text(" Contact International Office",
                            style: CiEStyle.getSettingsContactStyle(),),
                          onPressed: _onContactInternationalOffice,
                        ),
                      ],
                    ),
                    new Divider(),
                  ],
                )
            ),

            new Container(
              padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
              child: new Row(
                  children: <Widget>[
                    new Expanded(child: new Text(
                      "Courses in English Certificate",
                      style: CiEStyle.getSettingsStyle(),)),
                    new Text(
                        "$credits /15", style: CiEStyle.getSettingsStyle()),
                    // Calculate ECTS/15 but one of the courses need to be from department 13
                  ]
              ),
            ),
            new LinearProgressIndicator(
              value: credits / 15,
            ),

            new Container(
              padding: const EdgeInsets.only(top: 20.0, bottom: 16.0),
              child: new Row(
                  children: <Widget>[
                    new Expanded(child: new Text(
                        "International Engineering Certificate",
                        style: CiEStyle.getSettingsStyle())),
                    new Text("$engCredits /15",
                        style: CiEStyle.getSettingsStyle()),
                    // Calculate ECTS of department 3 /15 with at least 2 ects from dep. 13
                  ]
              ),
            ),
            new LinearProgressIndicator(value: engCredits / 15),
            /* This causes overload on horizontal screen */
            new Padding(
              padding: const EdgeInsets.only(top: 32.0, bottom: 16.0),
              child: new Row(
                children: <Widget>[
                  new Expanded(child: new Text(
                      "Taken Courses", style: CiEStyle.getSettingsStyle())),
                ],
              ),
            ),

            new Flexible(
              child: new PrevCourseList(currentUserPresenter),
            ),
          ],
        ),
      ),
    ),
    );
  }

  Future _onContactInternationalOffice() async {
    if (await canLaunch (StaticVariables.internationalOfficeEmail) ) {
      await launch(StaticVariables.internationalOfficeEmail);
    } else {
      throw 'Could not launch $StaticVariables.internationalOfficeEmail';
    }
  }
}
