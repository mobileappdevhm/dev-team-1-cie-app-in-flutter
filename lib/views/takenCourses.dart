import 'package:cie_team1/generated/i18n.dart';
import 'package:cie_team1/presenter/currentUserPresenter.dart';
import 'package:cie_team1/utils/cieColor.dart';
import 'package:cie_team1/utils/cieStyle.dart';
import 'package:cie_team1/widgets/prevCourseList.dart';
import 'package:flutter/material.dart';

class TakenCourses extends StatefulWidget {
  TakenCourses({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _TakenCoursesState createState() => new _TakenCoursesState();
}

class _TakenCoursesState extends State<TakenCourses> {
  static CurrentUserPresenter currentUserPresenter = new CurrentUserPresenter();
  int credits = currentUserPresenter.getTotalCredits();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(
            S.of(context).settings_label_takenCourses,
            style: CiEStyle.getAppBarTitleStyle(context),
          ),
          elevation: CiEStyle.getAppBarElevation(context),
          backgroundColor: CiEColor.lightGray,
        ),
        body: new Center(
          child: new Column(
            children: <Widget>[
              new Row(
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.only(
                        top: 32.0, bottom: 8.0, left: 16.0),
                    child: new Text(
                        S.of(context).settings_label_totalOf +
                            " " +
                            credits.toString() +
                            " " +
                            S.of(context).settings_label_ects,
                        style: CiEStyle.getSettingsStyle()),
                  )
                ],
              ),
              new Divider(),
              new Expanded(child: new PrevCourseList(currentUserPresenter))
            ],
          ),
        ));
  }
}
