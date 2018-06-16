import 'dart:async';

import 'package:cie_team1/generic/genericIcon.dart';
import 'package:cie_team1/model/course/course.dart';
import 'package:cie_team1/presenter/timeTablePresenter.dart';
import 'package:cie_team1/utils/cieColor.dart';
import 'package:cie_team1/utils/schedulingUtility.dart';
import 'package:cie_team1/utils/staticVariables.dart';
import 'package:cie_team1/widgets/timeTableItem.dart';
import 'package:flutter/material.dart';
import 'package:cie_team1/utils/cieStyle.dart';
import 'package:cie_team1/utils/staticVariables.dart';

class Schedule extends StatelessWidget {
  TimeTablePresenter timeTablePresenter = new TimeTablePresenter();

  @override
  Widget build(BuildContext context) {
    List<Widget> children = new List<Widget>();

    children.add(new ScheduleDivider("Today"));
    children.add(_getTimeTableSpecificDay(WeekdayUtility.getCurrentWeekday()));

    children.add(new ScheduleDivider("Weekly"));
    // monday -> friday
    for (int i = 0; i <= 4; i++) {
      children.add(_getTimeTableSpecificDay(WeekdayUtility.intToWeekday(i)));
    }

    return new ListView(
      children: children,
    );

  }

  Widget _getTimeTableSpecificDay(Weekday weekday) {
    // Get lectures at day an receive timeTableEntry for day
    List<Lecture> lectureList =
        timeTablePresenter.getLecturesOfWeekday(weekday);
    return new TimeTableEntry(lectureList, weekday);
  }
}

// Displays one Entry. If the entry has children then it's displayed
// with an ExpansionTile.
class TimeTableEntryItem extends StatelessWidget {
  final Lecture lecture;

  TimeTableEntryItem(this.lecture);

  Widget _buildTile(Lecture lecture) {
    return new TimeTableItem(lecture);
  }

  @override
  Widget build(BuildContext context) {
    return _buildTile(lecture);
  }
}
class TimeTableEntry extends StatefulWidget {
  final List<Lecture> children;
  final Weekday weekday;
  TimeTableEntry(this.children, this.weekday);
  @override
  _TimeTableEntryState createState() => new _TimeTableEntryState(children,weekday);
}

class _TimeTableEntryState extends State<TimeTableEntry> {

// Split Lectures into weekdays. One expandable tile per weekday
//class TimeTableEntry extends StatelessWidget {
  final List<Lecture> children;
  final Weekday weekday;

  _TimeTableEntryState(this.children, this.weekday);

  Widget _buildTile(List<Lecture> children, Weekday weekday) {
    List<Widget> childrenWidgets = new List<Widget>();

    // Add a new item for each child lecture
    for (int i = 0; i < children.length; i++) {
      childrenWidgets.add(new TimeTableEntryItem(children.elementAt(i)));
      // If there exists another lecture in the list, determine if there is
      // enough time to commute to the specified campus location
      if (i + 1 < children.length) {
        Lecture lectureOne = children.elementAt(i);
        Lecture lectureTwo = children.elementAt(i + 1);
<<<<<<< HEAD
        if (SchedulingUtility.isCloseTime(
            lectureOne.endDayTime, lectureTwo.startDayTime) &&
            SchedulingUtility.isFarCampus(
                lectureOne.campus, lectureTwo.campus)) {
          childrenWidgets.add(new FlatButton(
            //add(
            //padding: new EdgeInsets.all(1.0),
              onPressed: _popup,
              child: GenericIcon
                  .buildGenericConflictIcon(
                  StaticVariables.TIME_CONFLICT_MESSAGE)));
=======
        if (SchedulingUtility.isSchedulingConflict(lectureOne.endDayTime, lectureTwo.startDayTime, lectureOne.campus, lectureTwo.campus)) {
          childrenWidgets.add(GenericIcon
              .buildGenericConflictIcon(StaticVariables.TIME_CONFLICT_MESSAGE));
>>>>>>> master
        }
      }
    }

    return new ExpansionTile(
      initiallyExpanded: true,
      title: new Text(WeekdayUtility.getWeekdayAsString(weekday)),
      children: childrenWidgets,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTile(children, weekday);
  }

  void _popup() {
      confirmDialog1(context).then((bool value){
        print("value is $value");
      });
  }
}
// divider for lectures (weekly / today)
class ScheduleDivider extends StatelessWidget {
  final String _heading;

  const ScheduleDivider(this._heading);

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      title: new Column(
        children: <Widget>[
          new Padding(padding: new EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0)),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _getSpacing(new EdgeInsets.fromLTRB(5.0, 0.0, 15.0, 0.0)),
              new Container(
                child: new Padding(
                    padding: new EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                    child: new Text(_heading)),
              ),
              _getSpacing(new EdgeInsets.fromLTRB(5.0, 0.0, 15.0, 0.0)),
            ],
          ),
          new Padding(padding: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0)),
        ],
      ),
    );
  }

  //Draws a line
  Widget _getSpacing(EdgeInsets padding) {
    return new Expanded(
        child: new Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        new Container(
          child: new Padding(
            padding: padding,
            child: new Container(
              decoration: new BoxDecoration(
                  border: new Border.all(color: CiEColor.gray)),
            ),
          ),
        )
      ],
    ));
  }
}


Future<bool> confirmDialog1(BuildContext context) {
  return showDialog<bool>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return new AlertDialog(
          title: const Text(StaticVariables.ALERT_TIMECONFLICT_ACKNOWLEDGE,
        ),
          actions: <Widget>[
            new FlatButton(
              child: const Text(StaticVariables.ALERT_OK),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),

          ],
        );
      });
}
