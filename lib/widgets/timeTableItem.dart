import 'package:cie_team1/model/course/course.dart';
import 'package:cie_team1/utils/cieStyle.dart';
import 'package:flutter/material.dart';

class TimeTableItem extends StatelessWidget {
  static const double WIDTH_FIRST_COLUMN = 69.0;
  static const double WIDTH_SECOND_COLUMN = 45.0;
  static const double WIDTH_THIRD_COLUMN = 95.0;

  final Lecture lecture;

  TimeTableItem(this.lecture);

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      title: new Column(
        children: <Widget>[
          new Padding(padding: new EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0)),
          new Row(
            children: <Widget>[
              new Expanded(
                child: new Text(
                  lecture.course.name,
                  style: CiEStyle.getCoursesTitleStyle(context),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ],
          ),
          new Padding(
            padding: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
          ),
        ],
      ),
      subtitle: new Container(
        child: new Column(
          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new Expanded(
                  child: new Row(
                    children: <Widget>[
                      new Container(
                        //Static width to align values
                        width: WIDTH_FIRST_COLUMN,
                        child: new Text(
                          "Campus: ",
                          style: CiEStyle.getTimeTableListMediumGray(),
                        ),
                      ),
                      new Text(
                        CampusUtility.getCampusAsString(lecture.campus),
                        style: CiEStyle.getTimeTableListVariable(),
                      ),
                    ],
                  ),
                ),
                new Container(
                  width: WIDTH_SECOND_COLUMN,
                  child: new Text(
                    "Time: ",
                    style: CiEStyle.getTimeTableListMediumGray(),
                    textAlign: TextAlign.start,
                  ),
                ),
                new Container(
                  width: WIDTH_THIRD_COLUMN,
                  child: new Text(
                    " " +
                        lecture.startDayTime.toString() +
                        "-" +
                        lecture.endDayTime.toString(),
                    style: CiEStyle.getTimeTableListVariable(),
                    textAlign: TextAlign.start,
                  ),
                )
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new Expanded(
                  child: new Row(
                    children: <Widget>[
                      new Container(
                      width: WIDTH_FIRST_COLUMN,
                        child: new Text("Professor:"),
                      ),
                      new Expanded(
                      child: new Text(
                        lecture.course.professorName,
                        style: CiEStyle.getTimeTableListVariable(),
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                      ))
                    ],
                  ),
                ),
                new Container(
                  width: WIDTH_SECOND_COLUMN,
                  child: new Text(
                    "Room: ",
                    style: CiEStyle.getTimeTableListMediumGray(),
                    textAlign: TextAlign.start,
                  ),
                ),
                new Container(
                  width: WIDTH_THIRD_COLUMN,
                  child: new Text(
                    " " + lecture.room,
                    style: CiEStyle.getTimeTableListVariable(),
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
            new Row(
              children: <Widget>[
              ],
            ),
            new Padding(padding: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 15.0))
          ],
        ),
      ),
    );
  }
}
