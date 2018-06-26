import 'package:cie_team1/generic/genericIcon.dart';
import 'package:cie_team1/presenter/courseListPresenter.dart';
import 'package:cie_team1/utils/analytics.dart';
import 'package:cie_team1/utils/cieStyle.dart';
import 'package:cie_team1/utils/staticVariables.dart';
import 'package:cie_team1/widgets/courseDetails.dart';
import 'package:flutter/material.dart';

class CourseListItem extends StatelessWidget {
  final int id;
  final CourseListPresenter courseListPresenter;
  final Widget inheritedChild;

  CourseListItem(this.courseListPresenter, this.id, this.inheritedChild);

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      leading: GenericIcon.buildGenericAvailabilityIcon(
          courseListPresenter.getAvailability(id)),
      title: new Text(
        courseListPresenter.getTitle(id),
        style: CiEStyle.getCoursesTitleStyle(),
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: new Column(
        children: <Widget>[
          //Show department and time
          new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Padding(
                padding: new EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                child: new Text(
                  StaticVariables.FK + " " + courseListPresenter.getFaculty(id),
                  style: CiEStyle.getCoursesListFacultyStyle(),
                ),
              ),
              new Padding(
                //Calculated padding to align left side
                padding: new EdgeInsets.fromLTRB(
                    0.0,
                    (CiEStyle.getCoursesListFacultyStyle().fontSize -
                            CiEStyle.getCoursesListTimeStyle().fontSize) /
                        2.0,
                    0.0,
                    0.0),
                child: new Text(
                  courseListPresenter.getLectureTimesBeautiful(id),
                  style: CiEStyle.getCoursesListTimeStyle(),
                ),
              )
            ],
          ),
          _getConflictWarning(id),
        ],
      ),
      trailing: inheritedChild,
      onTap: () => _toggleDescription(context),
    );
  }

  Widget _getConflictWarning(id) {
    if (courseListPresenter.checkIfConflictsOtherFavoriteCourse(id)) {
      String textToShow;
      TextStyle textStyleToShow;
      if (courseListPresenter.getCourses()[id].isFavourite) {
        textToShow = StaticVariables.COURSE_CONFLICTS_WITH_OTHER_FAVORIT;
        textStyleToShow = CiEStyle.getCourseConflictWarningStyle();
      } else {
        textToShow = StaticVariables.COURSE_CONFLICTS_WITH_FAVORIT;
        textStyleToShow = CiEStyle.getCourseConflictNotificationStyle();
      }

      return new Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Text(
            textToShow,
            style: textStyleToShow,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      );
    } else
      //Return empty container to workaround a flutter bug
      //And we could use it to add some padding then layout isn't moving ife something changes
      return new Padding(
          padding: new EdgeInsets.fromLTRB(
              0.0,
              CiEStyle.getCourseConflictWarningStyle().fontSize + 3.0,
              0.0,
              0.0));
  }

  void _toggleDescription(BuildContext context) {
    //track click on course
    Analytics.logEvent("course_click", {
      "title": courseListPresenter.getTitle(id),
      "department": courseListPresenter.getFaculty(id)
    });

    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) => new CourseDetails(id, courseListPresenter)));
  }
}
