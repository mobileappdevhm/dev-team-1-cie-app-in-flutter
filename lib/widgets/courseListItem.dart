import 'package:cie_team1/presenter/courseListPresenter.dart';
import 'package:cie_team1/utils/cieStyle.dart';
import 'package:cie_team1/widgets/courseDetails.dart';
import 'package:cie_team1/generic/genericIcon.dart';
import 'package:flutter/material.dart';

class CourseListItem extends StatelessWidget {
  final int id;
  final CourseListPresenter courseListPresenter;
  Widget inheritedChild;

  CourseListItem(this.courseListPresenter, this.id, this.inheritedChild);

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
            child: new Text("DP " + courseListPresenter.getFaculty(id),
              style: CiEStyle.getCoursesListFacultyStyle(),),
          ),
          new Text("Time: " + courseListPresenter.getLectureTimesBeautiful(id),
            style: CiEStyle.getCoursesListTimeStyle(),),
        ],
      ),
      trailing: inheritedChild,
      onTap: () => _toggleDescription(context),
    );
  }

  void _toggleDescription(BuildContext context) {
    Navigator.push(
        context,
        new MaterialPageRoute(builder: (context) => new CourseDetails()));
  }
}