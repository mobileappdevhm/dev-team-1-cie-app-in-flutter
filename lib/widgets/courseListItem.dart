import 'package:cie_app/generic/genericIcon.dart';
import 'package:cie_app/presenter/courseListPresenter.dart';
import 'package:cie_app/utils/analytics.dart';
import 'package:cie_app/utils/cieStyle.dart';
import 'package:cie_app/utils/staticVariables.dart';
import 'package:cie_app/widgets/courseDetails.dart';
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
        style: CiEStyle.getCoursesTitleStyle(context),
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
                  courseListPresenter.getDepartmentShortName(id),
                  style: CiEStyle.getCoursesListFacultyStyle(context),
                ),
              ),
              new Padding(
                //Calculated padding to align left side
                padding: new EdgeInsets.fromLTRB(
                    0.0,
                    (CiEStyle.getCoursesListFacultyStyle(context).fontSize -
                            CiEStyle.getCoursesListTimeStyle().fontSize) /
                        2.0,
                    0.0,
                    0.0),
                //multiline fix taken from: https://stackoverflow.com/questions/50450891/how-do-i-make-a-text-widget-wrap-long-text-into-multiple-lines
                //TODO fix static constant 200 for container width
                child: new Container(
                  constraints: new BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width-200),
                  child: new Text(
                    courseListPresenter.getAppointmentTimesBeautiful(id),
                    style: CiEStyle.getCoursesListTimeStyle(),
                  ),
                ),
              )
            ],
          ),
          _getConflictWarning(id, context),
        ],
      ),
      trailing: inheritedChild,
      onTap: () => _toggleDescription(context),
    );
  }

  Widget _getConflictWarning(int id, BuildContext context) {
    if (courseListPresenter.checkIfConflictsOtherFavoriteCourse(id)) {
      String textToShow;
      TextStyle textStyleToShow;
      if (courseListPresenter.getCourses()[id].isFavourite) {
        textToShow = StaticVariables.COURSE_CONFLICTS_WITH_OTHER_FAVORIT;
        textStyleToShow = CiEStyle.getCourseConflictWarningStyle(context);
      } else {
        textToShow = StaticVariables.COURSE_CONFLICTS_WITH_FAVORIT;
        textStyleToShow = CiEStyle.getCourseConflictNotificationStyle(context);
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
              CiEStyle.getCourseConflictWarningStyle(context).fontSize + 3.0,
              0.0,
              0.0));
  }

  void _toggleDescription(BuildContext context) {
    //track click on course
    Analytics.logEvent("course_click", {
      "title": courseListPresenter.getTitle(id),
      "department": courseListPresenter.getDepartmentShortName(id)
    });

    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) => new CourseDetails(id, courseListPresenter)));
  }
}
