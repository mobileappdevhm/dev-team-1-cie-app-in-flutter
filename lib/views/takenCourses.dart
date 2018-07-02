import 'package:cie_team1/presenter/currentUserPresenter.dart';
import 'package:cie_team1/utils/cieColor.dart';
import 'package:cie_team1/utils/cieStyle.dart';
import 'package:cie_team1/utils/staticVariables.dart';
import 'package:cie_team1/widgets/prevCourseList.dart';
import 'package:cie_team1/views/addTakenCourses.dart';
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
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (context) => new AddTakenCourses()));
        },
      ),
        appBar: new AppBar(
          title: new Text(
            StaticVariables.TAKEN_COURSES,
            style: CiEStyle.getAppBarTitleStyle(context),
          ),
          elevation: CiEStyle.getAppBarElevation(context),
          backgroundColor: CiEColor.red,
          actions: <Widget>[
          ],
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
              new Expanded(child: new PrevCourseList(currentUserPresenter)),
            ],
          ),
        ));
  }

  static void _voidCallback(bool didChange) {}
}

class CourseHistory {
  static List<String> semesterList = [
    'SoSe2018',
    'WiSe2017',
    'SoSe2017',
    'WiSe2016',
    'SoSe2016',
    'WiSe2015',
    'SoSe2015',
    'WiSe2014',
    'SoSe2014',
  ];

}