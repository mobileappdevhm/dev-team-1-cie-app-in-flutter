import 'package:cie_app/generic/genericAlert.dart';
import 'package:cie_app/generic/genericIcon.dart';
import 'package:cie_app/model/course/details/appointment.dart';
import 'package:cie_app/model/course/details/weekday.dart';
import 'package:cie_app/presenter/courseListPresenter.dart';
import 'package:cie_app/utils/analytics.dart';
import 'package:cie_app/utils/cieColor.dart';
import 'package:cie_app/utils/cieStyle.dart';
import 'package:cie_app/utils/staticVariables.dart';
import 'package:cie_app/widgets/timeTableItem.dart';
import 'package:flutter/material.dart';

class Schedule extends StatefulWidget {
  final CourseListPresenter courseListPresenter;

  Schedule(this.courseListPresenter);

  @override
  _ScheduleState createState() => new _ScheduleState(courseListPresenter);
}

class _ScheduleState extends State<Schedule> {
  CourseListPresenter courseListPresenter;

  _ScheduleState(this.courseListPresenter);

  @override
  void initState() {
    super.initState();
    setState(() {
      Analytics.setCurrentScreen("schedule_screen");
    });
  }

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
    List<Appointment> lectureList =
        courseListPresenter.getFavouriteAppointmentsOfWeekday(weekday);
    return new TimeTableEntry(lectureList, weekday, courseListPresenter);
  }
}

// Displays one Entry. If the entry has children then it's displayed
// with an ExpansionTile.

class TimeTableEntryItem extends StatelessWidget {
  final Appointment appointment;

  TimeTableEntryItem(this.appointment);

  Widget _buildTile(Appointment lecture) {
    return new TimeTableItem(lecture);
  }

  @override
  Widget build(BuildContext context) {
    return _buildTile(appointment);
  }
}

class TimeTableEntry extends StatelessWidget {
  final List<Appointment> children;
  final Weekday weekday;
  final CourseListPresenter courseListPresenter;

  TimeTableEntry(this.children, this.weekday, this.courseListPresenter);

  @override
  Widget build(BuildContext context) {
    //return _buildTile(children, weekday);
    List<Widget> childrenWidgets = new List<Widget>();

    // Add a new item for each child lecture
    for (int i = 0; i < children.length; i++) {
      childrenWidgets.add(new TimeTableEntryItem(children.elementAt(i)));
      // If there exists another lecture in the list, determine if there is
      // enough time to commute to the specified campus location
      if (i + 1 < children.length) {
        Appointment appointmentOne = children.elementAt(i);
        Appointment appointmentTwo = children.elementAt(i + 1);
        if (courseListPresenter
            .checkIfConflictsOtherFavoriteLecture(children.elementAt(i))) {
          childrenWidgets.add(new FlatButton(
              onPressed: () => GenericAlert.confirmDialog(
                  context,
                  StaticVariables.TIME_CONFLICT_MESSAGE,
                  courseListPresenter.constructSchedulingConflictText(
                      appointmentOne, appointmentTwo)),
              child: GenericIcon.buildGenericConflictIcon(
                  StaticVariables.TIME_CONFLICT_MESSAGE)));
        }
      }
    }
    if (childrenWidgets.length > 0) {
      return new ExpansionTile(
        initiallyExpanded: true,
        title: new Text(WeekdayUtility.getWeekdayAsLongString(weekday),
            style: new TextStyle(fontWeight: FontWeight.w500)),
        children: childrenWidgets.length == 0
            ? [
                new Container(
                    padding: new EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                    alignment: Alignment.topLeft,
                    child: new Text(
                      "No class",
                      textAlign: TextAlign.start,
                    ))
              ]
            : childrenWidgets,
      );
    }
    return noClassHeader("- No class on " +
        WeekdayUtility.getWeekdayAsLongString(weekday) +
        " -");
  }
}

Widget noClassHeader(String text) {
  return new Container(
    alignment: Alignment.center,
    child: new Text(
      text,
      style: CiEStyle.getTimeTableListMediumGray(),
    ),
  );
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
