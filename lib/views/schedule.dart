import 'package:cie_team1/model/course/course.dart';
import 'package:cie_team1/presenter/timeTablePresenter.dart';
import 'package:cie_team1/widgets/timeTableItem.dart';
import 'package:flutter/material.dart';

class Schedule extends StatelessWidget {
  TimeTablePresenter timeTablePresenter = new TimeTablePresenter();

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemBuilder: (BuildContext context, int index) =>
          _getTimeTableSpecificDay(WeekdayUtility.intToWeekday(index)),
      itemCount: 5,
    );
  }

  Widget _getTimeTableSpecificDay(Weekday weekday) {
    // Get lectures at day an receive timeTableEntry for day
    List<Lecture> lectureList = timeTablePresenter.getLecturesOfWeekday(
        weekday);
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

// Split Lectures into weekdays. One expandable tile per weekday
class TimeTableEntry extends StatelessWidget {
  final List<Lecture> children;
  final Weekday weekday;

  TimeTableEntry(this.children, this.weekday);

  Widget _buildTile(List<Lecture> children, Weekday weekday) {
    List<Widget> childrenWidgets = new List<Widget>();

    // Add a new item vor each child lecture
    children.forEach((c) => childrenWidgets.add(new TimeTableEntryItem(c)));

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
}