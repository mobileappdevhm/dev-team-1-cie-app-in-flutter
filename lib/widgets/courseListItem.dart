import 'package:cie_team1/presenter/courseListPresenter.dart';
import 'package:cie_team1/utils/cieStyle.dart';
import 'package:flutter/material.dart';

class CourseListItem extends StatefulWidget {
  // Stateful because we can mark items as favourite
  final CourseListPresenter courseListPresenter;
  final int id;
  final bool shouldFilter;

  CourseListItem(this.courseListPresenter, this.id, this.shouldFilter);

  @override
  State<StatefulWidget> createState() {
    return new CourseListItemState(courseListPresenter, id, shouldFilter);
  }
}

class CourseListItemState extends State<CourseListItem> {
  final int id;
  final CourseListPresenter courseListPresenter;
  final bool shouldFilter;
  String temp = "";

  CourseListItemState(this.courseListPresenter, this.id, this.shouldFilter);

  @override
  Widget build(BuildContext context) {
    Icon availabilityIcon;
    double iconSize = CiEStyle.getCoursesListIconSize();

    switch (courseListPresenter.getAvailability(id)) {
      case 0:
        availabilityIcon = new Icon(
          const IconData(0xe86c, fontFamily: 'MaterialIcons'),
          size: iconSize,
          color: Color.fromRGBO(111, 207, 151, 1.0),
        );
        break;
      case 1:
        availabilityIcon = new Icon(
          const IconData(0xe8fd, fontFamily: 'MaterialIcons'),
          size: iconSize,
          color: Color.fromRGBO(242, 201, 76, 1.0),
        );
        break;
      case 2:
        availabilityIcon = new Icon(
          const IconData(0xe888, fontFamily: 'MaterialIcons'),

          size: iconSize,
          color: Color.fromRGBO(235, 87, 87, 1.0),
        );
        break;
    };

    if (shouldFilter == false || courseListPresenter.getFavourite(id)) {
      return new ListTile(
        leading: availabilityIcon,
        title: new Text(courseListPresenter.getTitle(id),
          style: CiEStyle.getCoursesTitleStyle(),),
        subtitle: new Row(
          children: <Widget>[
            new Padding (
              padding: new EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
              child: new Text("FK " + courseListPresenter.getFaculty(id),
                style: CiEStyle.getCoursesListFacultyStyle(),),
            ),
            new Text("Time: " + courseListPresenter.getLectureTime(id),
              style: CiEStyle.getCoursesListTimeStyle(),),
          ],
        ),
        trailing: new IconButton(
          icon: new Icon(
            (courseListPresenter.getFavourite(id)
                ? const IconData(0xe87d, fontFamily: 'MaterialIcons')
                : const IconData(0xe87e, fontFamily: 'MaterialIcons')
            ),
            size: iconSize,
            color: Color.fromRGBO(235, 87, 87, 1.0),
          ),
          onPressed: _toggleFavourite,
        ),
        onTap: _toggleDescription,
      );
    }
    // Build functions must never return null. To return an empty space that
    // causes the building widget to fill available room, return
    // "new Container()". To return an empty space that takes as little room as
    //possible, return "new Container(width: 0.0, height: 0.0)".
    return new Container(width: 0.0, height: 0.0);
  }

  void _toggleFavourite() {
    setState(() {
      courseListPresenter.toggleFavourite(id);
    });
  }

  void _toggleDescription() {
    setState(() {
      courseListPresenter.toggleShowCourseDescription(id);
    });
  }
}