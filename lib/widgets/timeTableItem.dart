import 'package:cie_team1/presenter/timeTablePresenter.dart';
import 'package:cie_team1/utils/cieStyle.dart';
import 'package:flutter/material.dart';

class TimeTableItem extends StatefulWidget {

  final TimeTablePresenter timeTablePresenter;
  final int id;

  TimeTableItem.ScheduleItem(this.timeTablePresenter, this.id);

  @override
  State<StatefulWidget> createState() {
    return new TimeTableItemState(timeTablePresenter, id);
  }
}

class TimeTableItemState extends State<TimeTableItem> {
  Icon availabilityIcon;
  final int id;
  final TimeTablePresenter timeTablePresenter;

  TimeTableItemState(this.timeTablePresenter, this.id);


  @override
  Widget build(BuildContext context) {
    return new ListTile(
      leading: availabilityIcon,
      title: new Row (
          children: <Widget>[
            new Text(
              timeTablePresenter.getTitle(id),
              style: CiEStyle.getCoursesTitleStyle(),
            ),
            new Text(
              " - " + timeTablePresenter.getProfessorName(id),
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
                        "Location: ",
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
                ),new Text(" " + timeTablePresenter.getTime(id),
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
                        " " + timeTablePresenter.getWeekday(id),
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

