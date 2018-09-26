import 'package:cie_app/model/course/details/appointment.dart';
import 'package:cie_app/model/course/details/campus.dart';
import 'package:cie_app/utils/cieStyle.dart';
import 'package:cie_app/utils/staticVariables.dart';
import 'package:flutter/material.dart';

class TimeTableItem extends StatelessWidget {
  static const double WIDTH_FIRST_COLUMN = 69.0;
  static const double WIDTH_SECOND_COLUMN = 45.0;
  static const double WIDTH_THIRD_COLUMN = 95.0;

  final Appointment appointment;

  TimeTableItem(this.appointment);

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
                  appointment.parent.name,
                  style: CiEStyle.getCoursesTitleStyle(context),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ],
          ),
          new Padding(
            padding: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 2.5),
          ),
        ],
      ),
      subtitle: new Container(
        child: new Column(
          children: <Widget>[
            appointment.parent.blocked
                ? new Row(
                    children: <Widget>[
                      new Expanded(
                        child: new Text(
                          StaticVariables.COURSE_INFO_BLOCKED,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          textAlign: TextAlign.left,
                          style: CiEStyle.getCourseBlockedTextStyle(),
                        ),
                      ),
                    ],
                  )
                : new Row(),
            new Padding(
              padding: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 2.5),
            ),
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
                          StaticVariables.CAMPUS,
                          style: CiEStyle.getTimeTableListMediumGray(),
                        ),
                      ),
                      new Text(
                        CampusUtility.getCampusAsString(
                            appointment.getCampus()),
                        style: CiEStyle.getTimeTableListVariable(),
                      ),
                    ],
                  ),
                ),
                new Container(
                  width: WIDTH_SECOND_COLUMN,
                  child: new Text(
                    StaticVariables.TIME,
                    style: CiEStyle.getTimeTableListMediumGray(),
                    textAlign: TextAlign.start,
                  ),
                ),
                new Container(
                  width: WIDTH_THIRD_COLUMN,
                  child: new Text(
                    appointment.timeBegin.toString() +
                        "-" +
                        appointment.timeEnd.toString(),
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
                        child: new Text(StaticVariables.LECTURER),
                      ),
                      new Expanded(
                          child: new Text(
                        appointment.parent.getNamesOfLecturers(),
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
                    StaticVariables.ROOM,
                    style: CiEStyle.getTimeTableListMediumGray(),
                    textAlign: TextAlign.start,
                  ),
                ),
                new Container(
                  width: WIDTH_THIRD_COLUMN,
                  child: new Text(
                    //TODO do not use first value every time
                    appointment.parent.locations[0].number,
                    style: CiEStyle.getTimeTableListVariable(),
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
            new Row(
              children: <Widget>[],
            ),
            new Padding(padding: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 15.0))
          ],
        ),
      ),
    );
  }
}
