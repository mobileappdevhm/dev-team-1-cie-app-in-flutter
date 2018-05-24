import 'package:cie_team1/presenter/timetablePresenter.dart';
import 'package:cie_team1/widgets/timeTableItem.dart';
import 'package:flutter/material.dart';

class TimeTable extends StatefulWidget {
  final TimeTablePresenter timeTablePresenter;

  TimeTable(this.timeTablePresenter);

  @override
  State<StatefulWidget> createState() {
    return new TimeTableState(timeTablePresenter);
  }
}

class TimeTableState extends State<TimeTable> {
  final TimeTablePresenter timeTablePresenter;
  String today = "Mo";
  TimeTableState(this.timeTablePresenter);

  @override
  Widget build(BuildContext context) {
    try {
      return new ListView.builder(
        //itemBuilder: (context, index){return new ListTile(title: new Text('${timeTablePresenter.getCoursesByDay(today)[index]}'),);},
        itemBuilder: (BuildContext context, index) => new TimeTableItem(timeTablePresenter,index),
        itemCount: timeTablePresenter.getCurrentCourses().length,
        //itemCount:  timeTablePresenter.getCoursesByDay(today).length,
        //itemCount:  timeTablePresenter.getCoursesByDay().length,
      );
    } catch (e) {
      print("CourseList.dart: " + e.toString());
      return new Text("No Courses found!");
    }
  }
}