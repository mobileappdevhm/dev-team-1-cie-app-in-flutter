import 'package:cie_team1/presenter/courseListPresenter.dart';
import 'package:flutter/material.dart';

class CourseListItem extends StatefulWidget {
  // Stateful because we can mark items as favourite
  final CourseListPresenter courseListPresenter;
  final int id;

  CourseListItem(this.courseListPresenter, this.id);

  @override
  State<StatefulWidget> createState() {
    return new CourseListItemState(courseListPresenter, id);
  }
}

class CourseListItemState extends State<CourseListItem> {
  final int id;
  final CourseListPresenter courseListPresenter;

  CourseListItemState(this.courseListPresenter, this.id);

  @override
  Widget build(BuildContext context) {
    return new ListTile(
        leading: new Icon(
          const IconData(0xe86c, fontFamily: 'MaterialIcons'),
          //Todo: Maybe responsive calculation should be added later
          size: 40.0,
          color: Color.fromRGBO(111, 207, 151, 1.0),
        ),
        title: new Text("Title of course"),
        subtitle: new Row(
          children: <Widget>[
            new Text("FK 07"),
            new Text("Time: Mo 13:30-14:15"),
          ],
        ),
        trailing: new IconButton(
          icon: new Icon(
            (courseListPresenter.getFavourite(id)
                ? const IconData(0xe87d, fontFamily: 'MaterialIcons')
                : const IconData(0xe87e, fontFamily: 'MaterialIcons')
            ),
            //Todo: Maybe responsive calculation should be added later
            size: 40.0,
            color: Color.fromRGBO(235, 87, 87, 1.0),
          ),
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
    setState(() {
      courseListPresenter.toggleShowCourseDescription(id);
    });
  }
}