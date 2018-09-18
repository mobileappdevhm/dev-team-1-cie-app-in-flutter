import 'package:cie_app/presenter/currentUserPresenter.dart';
import 'package:cie_app/utils/cieStyle.dart';
import 'package:cie_app/utils/staticVariables.dart';
import 'package:flutter/material.dart';

class PrevCourseListItem extends StatefulWidget {
  // Stateful because we can mark items as favourite
  final CurrentUserPresenter currentUserPresenter;
  final int id;

  PrevCourseListItem(this.currentUserPresenter, this.id);

  @override
  State<StatefulWidget> createState() {
    return new PrevCourseListItemState(currentUserPresenter, id);
  }
}

class PrevCourseListItemState extends State<PrevCourseListItem> {
  final int id;
  final CurrentUserPresenter currentUserPresenter;

  PrevCourseListItemState(this.currentUserPresenter, this.id);

  @override
  Widget build(BuildContext context) {
    return new ListTile(
        title: new Text(
          currentUserPresenter.getTitle(id),
          style: CiEStyle.getPrevCoursesTitleStyle(),
        ),
        subtitle: new Column(
          children: <Widget>[
            new Row(
              children: <Widget>[
                new Expanded(
                  child: new Text(
                        currentUserPresenter.getDepartmentShortName(id),
                    style: CiEStyle.getCoursesListFacultyStyle(context),
                  ),
                ),
                new Text(
                  currentUserPresenter.getCredits(id).toString() + " ECTS",
                  style: CiEStyle.getPrevCoursesCreditsStyle(),
                ),
              ],
            ),
          ],
        ));
  }

  String _getFacultiesBeautiful(Set<String> departments) {
    var ret = "";
    departments.forEach((String department) {
      ret += ", " + StaticVariables.FK + " " + department;
    });

    return ret.substring(2);
  }
}
