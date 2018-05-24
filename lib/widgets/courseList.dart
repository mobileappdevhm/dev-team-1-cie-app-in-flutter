import 'package:cie_team1/presenter/courseListPresenter.dart';
import 'package:cie_team1/widgets/courseListItem.dart';
import 'package:flutter/material.dart';

class CourseList extends StatefulWidget {
  // Stateful because then this class can be used for favourites as well.
  final CourseListPresenter courseListPresenter;
  bool shouldFilter = false;

  CourseList(this.courseListPresenter, this.shouldFilter);

  @override
  State<StatefulWidget> createState() {
    return new CourseListState(courseListPresenter, shouldFilter);
  }
  void toggleFilter() { shouldFilter = !shouldFilter; }
}

class CourseListState extends State<CourseList> {
  final CourseListPresenter courseListPresenter;
  final bool shouldFilter;

  CourseListState(this.courseListPresenter, this.shouldFilter);

  @override
  Widget build(BuildContext context) {
    int itemCount = courseListPresenter.getCourses().length;
    List<Widget> widgets = new List<Widget>();

    for (int i=0; i< courseListPresenter.getCourses().length; i++) {
      widgets.add(new CourseListItem(courseListPresenter, i, shouldFilter));
    }
    if (shouldFilter == true) {
      widgets.add(
        new Container(
          margin: const EdgeInsets.fromLTRB(50.0, 15.0, 50.0, 15.0),
          child: new RaisedButton(
              color: Colors.red,
              onPressed: () => voidFunction,
              child: new Container(
                margin: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 15.0),
                child:new Text("Register Favorited Courses"),
              ),
          ),
        )
      );

    }
    return itemCount > 0 ? new ListView(children:widgets):
      new Text("No Courses found!");
  }

  // TODO: Push Data for TimeTable Here
  void voidFunction() { }
}