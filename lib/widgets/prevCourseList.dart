import 'package:cie_team1/generated/i18n.dart';
import 'package:cie_team1/presenter/currentUserPresenter.dart';
import 'package:cie_team1/widgets/prevCourseListItem.dart';
import 'package:flutter/material.dart';

class PrevCourseList extends StatefulWidget {
  // Stateful because then this class can be used for favourites as well.
  final CurrentUserPresenter currentUserPresenter;

  PrevCourseList(this.currentUserPresenter);

  @override
  State<StatefulWidget> createState() {
    return new PrevCourseListState(currentUserPresenter);
  }
}

class PrevCourseListState extends State<PrevCourseList> {
  final CurrentUserPresenter currentUserPresenter;

  PrevCourseListState(this.currentUserPresenter);

  @override
  Widget build(BuildContext context) {
    try {
      return new ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            new PrevCourseListItem(currentUserPresenter, index),
        itemCount: currentUserPresenter.getPrevCourses().length,
      );
    } catch (e) {
      print("CourseList.dart: " + e.toString());
      return new Text(S.of(context).courses_list_noCoursesFound);
    }
  }
}
