import 'package:cie_app/presenter/currentUserPresenter.dart';
import 'package:cie_app/utils/cieColor.dart';
import 'package:cie_app/utils/cieStyle.dart';
import 'package:cie_app/utils/staticVariables.dart';
import 'package:cie_app/widgets/prevCourseList.dart';
import 'package:flutter/material.dart';

class TakenCourses extends StatefulWidget {
  TakenCourses({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _TakenCoursesState createState() => new _TakenCoursesState();
}

class _TakenCoursesState extends State<TakenCourses> {
  static CurrentUserPresenter currentUserPresenter =
      new CurrentUserPresenter(_voidCallback, Flavor.PROD);
  int credits = currentUserPresenter.getTotalCredits();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(
            StaticVariables.TAKEN_COURSES,
            style: CiEStyle.getAppBarTitleStyle(context),
          ),
          elevation: CiEStyle.getAppBarElevation(context),
          backgroundColor: CiEColor.red,
        ),
        body: new Center(
          child: new Column(
            children: <Widget>[
              new Row(
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.only(
                        top: 20.0, bottom: 8.0, left: 16.0),
                    child: new Text(
                        StaticVariables.TOTAL_OF +
                            " " +
                            credits.toString() +
                            " " +
                            StaticVariables.ECTS,
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

  static void _voidCallback(bool didChange) {}
}
