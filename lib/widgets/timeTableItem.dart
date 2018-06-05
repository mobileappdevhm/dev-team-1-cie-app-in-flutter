import 'package:cie_team1/model/course/course.dart';
import 'package:cie_team1/utils/cieStyle.dart';
import 'package:flutter/material.dart';

class TimeTableItem extends StatelessWidget {
  final Lecture lecture;

  TimeTableItem(this.lecture);

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      title: new Row (
          children: <Widget>[
            new Text(
              lecture.course.name,
              style: CiEStyle.getCoursesTitleStyle(),
            ),
            new Text(
              " - " + lecture.course.professorName,
              style: CiEStyle.getTimeTableListMediumGray(),
            )
          ]
      ),
      subtitle:   new Container(
        child: new Column(
          children: <Widget>[
            new Row(
              children: <Widget>[
                new Container(
                  padding: new EdgeInsets.fromLTRB(0.0, 0.0, 100.0, 0.0),
                  child: new Row(
                    children: <Widget>[
                      new Text(
                        "Campus: ",
                        style: CiEStyle.getTimeTableListMediumGray(),
                      ),
                      new Text(
                        " ...",
                        style: CiEStyle.getTimeTableListVariable(),
                      ),
                    ],
                  ),
                ),
                new Text("Time: ",
                  style: CiEStyle.getTimeTableListMediumGray(),
                  textAlign: TextAlign.start,
                ),new Text(" " + lecture.startDayTime.toString() + "-" + lecture.endDayTime.toString(),
                  style: CiEStyle.getTimeTableListVariable(),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
            new Row(
              children: <Widget>[
                new Container(
                  padding: new EdgeInsets.fromLTRB(0.0, 0.0, 117.0, 0.0),
                  child: new Row(
                    children: <Widget>[
                      new Text(
                        "Day: ",
                        style: CiEStyle.getTimeTableListMediumGray(),
                      ),
                      new Text(
                        " " + WeekdayUtility.getWeekdayAsString(lecture.weekday),
                        style: CiEStyle.getTimeTableListVariable(),
                      ),
                    ],
                  ),
                ),
                new Text("Room: ",
                  style: CiEStyle.getTimeTableListMediumGray(),
                  textAlign: TextAlign.start,
                ),new Text(" ...",
                  style: CiEStyle.getTimeTableListVariable(),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ],
        ),
      ),

    );
  }

}