import 'package:cie_team1/presenter/courseListPresenter.dart';
import 'package:cie_team1/widgets/courseListItem.dart';
import 'package:flutter/material.dart';
import 'package:cie_team1/utils/cieStyle.dart';

class CourseList extends StatefulWidget {
  // Stateful because then this class can be used for favourites as well.
  final CourseListPresenter courseListPresenter;
  bool shouldFilterByFavorites = false;

  CourseList(this.courseListPresenter, this.shouldFilterByFavorites);

  @override
  State<StatefulWidget> createState() {
    return new CourseListState(courseListPresenter, shouldFilterByFavorites);
  }
  void toggleFilter() { shouldFilterByFavorites = !shouldFilterByFavorites; }
}

class CourseListState extends State<CourseList> {
  final CourseListPresenter courseListPresenter;
  final bool shouldFilterByFavorites;
  String filter = '01';

  CourseListState(this.courseListPresenter, this.shouldFilterByFavorites);

  updateFilter(String filter) {
    setState(() {
      this.filter = filter;
    });
  }

  @override
  Widget build(BuildContext context) {
    int itemCount = courseListPresenter.getCourses().length;
    List<Widget> widgets = new List<Widget>();

    if (shouldFilterByFavorites == false) {
      widgets.add(
        new Container(
            margin: const EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 5.0),
            decoration: new BoxDecoration(
              border: new Border(
                  bottom: new BorderSide(color: Colors.black,  width: 0.5)),
            ),
            child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text("Filter by: ", style: CiEStyle.getDropdownTitleStyle()),
              new DropdownButton<String>(
              items: <String>['01', '02', '03', '04', '05', '06', '07', '08'].map((String value) {
                return new DropdownMenuItem<String>(
                  value: value,
                  child: new Text(" Department " + value),
                );
              }).toList(),
              onChanged: (String val) {
                updateFilter(val);
              },
              value: filter,
            ),
          ]
          )
        )
      );
    }

    for (int i=0; i< courseListPresenter.getCourses().length; i++) {
      if (shouldFilterByFavorites == true || courseListPresenter.getFaculty(i) == filter) {
        widgets.add(new CourseListItem(courseListPresenter, i, shouldFilterByFavorites));
      }
    }
    if (shouldFilterByFavorites == true) {
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
  void voidFunction() {}
}