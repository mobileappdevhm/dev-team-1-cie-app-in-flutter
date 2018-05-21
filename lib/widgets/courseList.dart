import 'package:cie_team1/model/course.dart';
import 'package:cie_team1/presenter/courseListPresenter.dart';
import 'package:cie_team1/widgets/courseListItem.dart';
import 'package:flutter/material.dart';

class CourseList extends StatefulWidget {
  // Stateful because then this class can be used for favourites as well.
  final CourseListPresenter courseListPresenter;

  CourseList(this.courseListPresenter);

  @override
  State<StatefulWidget> createState() {
    return new CourseListState(courseListPresenter);
  }
}

class CourseListState extends State<CourseList> {
  final CourseListPresenter courseListPresenter;

  CourseListState(this.courseListPresenter);

  @override
  Widget build(BuildContext context) {
    try {
      return new ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
        new CourseListItem(courseListPresenter, index),
        itemCount: courseListPresenter.courses.length,
      );
    } catch (e) {
      print("CourseList.dart: " + e.toString());
      return new Text("No Courses found!");
    }
  }
}