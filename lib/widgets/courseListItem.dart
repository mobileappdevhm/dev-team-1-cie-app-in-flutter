import 'package:cie_team1/presenter/courseListPresenter.dart';
import 'package:cie_team1/utils/cieColor.dart';
import 'package:cie_team1/utils/cieStyle.dart';
import 'package:cie_team1/widgets/courseDetails.dart';
import 'package:cie_team1/generic/genericIcon.dart';
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

  CourseListItemState(this.courseListPresenter, this.id, this.shouldFilter);

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      leading: GenericIcon.buildGenericAvailabilityIcon(
          courseListPresenter.getAvailability(id)),
      title: new Text(courseListPresenter.getTitle(id),
        style: CiEStyle.getCoursesTitleStyle(),),
      subtitle: new Row(
        children: <Widget>[
          new Padding (
            padding: new EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
            child: new Text("FK " + courseListPresenter.getFaculty(id),
              style: CiEStyle.getCoursesListFacultyStyle(),),
          ),
          new Text("Time: " + courseListPresenter.getLectureTimesBeautiful(id),
            style: CiEStyle.getCoursesListTimeStyle(),),
        ],
      ),
      trailing: new IconButton(
        icon: GenericIcon.buildGenericFavoriteIcon(
            courseListPresenter.getFavourite(id)),
        onPressed: _toggleFavourite,
      ),
      onTap: _toggleDescription,
    );
  }

  void _toggleFavourite() {
    setState(() {
      courseListPresenter.toggleFavourite(id);
    });
  }

  void _toggleDescription() {
    Navigator.push(
        context,
        new MaterialPageRoute(builder: (context) => new CourseDetails()));
  }
}