import 'package:cie_team1/presenter/weeklyTimetablePresenter.dart';
import 'package:cie_team1/utils/cieStyle.dart';
import 'package:flutter/material.dart';

class TimeTableItem extends StatefulWidget {

  final WeeklyTimeTablePresenter timeTablePresenter;
  final int id;

  TimeTableItem.ScheduleItem(this.timeTablePresenter, this.id);

  @override
  State<StatefulWidget> createState() {
    return new TimeTableItemState(timeTablePresenter, id);
  }
}

class TimeTableItemState extends State<TimeTableItem> {
  final int id;
  final WeeklyTimeTablePresenter timeTablePresenter;

  TimeTableItemState(this.timeTablePresenter, this.id);


  @override
  Widget build(BuildContext context) {
    Icon availabilityIcon;
    double iconSize = CiEStyle.getCoursesListIconSize();

      return new ListTile(
        leading: availabilityIcon,
        title: new Text(timeTablePresenter.getTitle(id),
          style: CiEStyle.getCoursesTitleStyle(),),
        //subtitle: new Row(
        //  children: <Widget>[
        //    new Padding (
        //      padding: new EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
        //      child: new Text("FK " + timeTablePresenter.getFaculty(id),
        //        style: CiEStyle.getCoursesListFacultyStyle(),),
        //    ),
        //    new Text(timeTablePresenter.getStartTime(id),
        //      style: CiEStyle.getCoursesListTimeStyle(),),
        //    new Text("-" + timeTablePresenter.getEndTime(id),
        //      style: CiEStyle.getCoursesListTimeStyle(),),
        //  ],
        //),
      );
  }
}



