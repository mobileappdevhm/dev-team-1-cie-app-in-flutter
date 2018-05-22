import 'package:cie_team1/presenter/currentUserPresenter.dart';
import 'package:cie_team1/utils/cieStyle.dart';
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
      title: new Text(currentUserPresenter.getTitle(id),
        style: CiEStyle.getPrevCoursesTitleStyle(),),
      subtitle: new Column(
        children: <Widget>[
          new Row(
            children: <Widget>[

              new Expanded(
                child: new Text("FK " + currentUserPresenter.getFaculty(id),
                  style: CiEStyle.getCoursesListFacultyStyle(),),
              ),
              new Text(
                currentUserPresenter.getCredits(id).toString() + " ECTS",
                style: CiEStyle.getPrevCoursesCreditsStyle(),
              ),

            ],
          ),
          new Divider(),
        ],
      )

    );
  }

}