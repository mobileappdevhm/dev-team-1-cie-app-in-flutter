import 'package:cie_team1/presenter/timeTableImplementations/todayTimetablePresenter.dart';
import 'package:cie_team1/presenter/timeTableImplementations/weeklyTimetablePresenter.dart';
import 'package:cie_team1/presenter/timeTablePresenter.dart';
import 'package:cie_team1/utils/cieColor.dart';
import 'package:cie_team1/utils/cieStyle.dart';
import 'package:cie_team1/widgets/timeTable.dart';
import 'package:flutter/material.dart';

class Schedule extends StatelessWidget {


  //@override
  //void initState() {
  //  weeklyTimeTablePresenter = new WeeklyTimeTablePresenter();
  //  todayTimeTablePresenter = new TodayTimeTablePresenter();
  //}

  @override
  Widget build(BuildContext context) {
    TimeTablePresenter weeklyTimeTablePresenter = new WeeklyTimeTablePresenter();
    TimeTablePresenter todayTimeTablePresenter = new TodayTimeTablePresenter();

    return new Scaffold(
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new ScheduleDivider("Today"),
          new TimeTable(todayTimeTablePresenter),
          new ScheduleDivider("Weekly"),
          new TimeTable(weeklyTimeTablePresenter),
        ],
      ),
    );
  }
}

class ScheduleDivider extends StatelessWidget {
  String _heading;

  ScheduleDivider(this._heading);

  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        new Expanded(
          child: new Padding(
            padding: new EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
            child: new Container(
              decoration: new BoxDecoration(
                  border: new Border.all(color: CiEColor.gray)
              ),
            ),
          ),
        ),
        new Padding(
            padding: new EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
            child: new Text(_heading,
                style: CiEStyle.getTimeTableSectionHeadingStyle())
        ),
        new Expanded(
          child: new Padding(
            padding: new EdgeInsets.fromLTRB(0.0, 0.0, 15.0, 0.0),
            child: new Container(
              decoration: new BoxDecoration(
                  border: new Border.all(color: CiEColor.gray)
              ),
            ),
          ),
        ),
      ],
    );
  }
}


