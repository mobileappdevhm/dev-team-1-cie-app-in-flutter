import 'package:cie_team1/presenter/weeklyTimetablePresenter.dart';
import 'package:cie_team1/widgets/timeTable.dart';
import 'package:flutter/material.dart';

class Schedule extends StatelessWidget {
  WeeklyTimeTablePresenter weeklyTimeTablePresenter;

  @override
  void initState() {
    weeklyTimeTablePresenter = new WeeklyTimeTablePresenter();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Column(
          children: <Widget>[
            new Text("Today"),
            //new TimeTable(timeTablePresenter), //Todo: Today's schedule
            new Text("Weekly"),
            new TimeTable(weeklyTimeTablePresenter),
          ],
        )
    );
  }
}
