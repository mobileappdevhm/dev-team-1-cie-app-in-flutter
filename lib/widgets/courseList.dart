import 'package:cie_team1/presenter/courseListPresenter.dart';
import 'package:cie_team1/widgets/courseListItem.dart';
import 'package:cie_team1/generic/genericAlert.dart';
import 'package:cie_team1/generic/genericIcon.dart';
import 'package:cie_team1/utils/cieColor.dart';
import 'package:cie_team1/utils/cieStyle.dart';
import 'package:cie_team1/model/course/course.dart';
import 'package:cie_team1/utils/staticVariables.dart';
import 'package:flutter/material.dart';

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
  final TextEditingController c1 = new TextEditingController();
  final bool shouldFilterByFavorites;
  bool shouldSearch = false;
  String filter = "07";
  String searchValue="";
  bool coursesRegistered = false;

  CourseListState(this.courseListPresenter, this.shouldFilterByFavorites);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = new List<Widget>();

    if (shouldFilterByFavorites == false) {
      EdgeInsets pad = const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0);
      String departmentLabel = "Department #";
      widgets.add(
          new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Container(
                    padding: pad,
                    child: new DropdownButton<String>(
                      items: CourseDefinitions.DEPARTMENTS.map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(departmentLabel+value, overflow: TextOverflow.clip),
                        );
                      }).toList(),
                      onChanged: (String val) {
                        setState(() {
                          this.filter = val;
                        });
                      },
                      iconSize: 32.0,
                      value: filter,
                    )
                ),
                new Container(
                  padding: const EdgeInsets.fromLTRB(80.0, 10.0, 10.0, 10.0),
                  child: new IconButton(
                      color: CiEColor.mediumGray,
                      icon: new Icon(Icons.search),
                      onPressed: toggleSearch
                  ),
                )
              ])
      );

      if (shouldSearch) {
        widgets.add(
            new Container(
              padding: const EdgeInsets.fromLTRB(10.0, 1.0, 10.0, 1.0),
              alignment: Alignment.center,
              child: new TextField(
                controller: c1,
                decoration: const InputDecoration(
                  hintText: "Search by Course Name",
                  contentPadding: const EdgeInsets.all(10.0),
                  border: OutlineInputBorder(),
                ),
                onChanged: (String val)=>updateSearch(val),
              ),
            )
        );
      }
    }

    for (int i=0; i< courseListPresenter.getCourses().length; i++) {
      if (shouldFilterByFavorites == false && courseListPresenter.getFaculty(i)==filter
          || (shouldFilterByFavorites == true && courseListPresenter.getFavourite(i))) {
        if (shouldSearch== false || (courseListPresenter.getTitle(i).contains(searchValue))) {
          widgets.add(
            //GenericBorderContainer.buildGenericBorderedElement(
              new CourseListItem(courseListPresenter, i, favoriteIcon(i))
            //)
          );
          //widgets.add(GenericBorderContainer.buildGenericBlurredLine());
          widgets.add(new Divider());
        }
      }
    }
    if (shouldFilterByFavorites == true) {
      widgets.add(
        new Container(
          margin: const EdgeInsets.fromLTRB(50.0, 15.0, 50.0, 15.0),
          child: new RaisedButton(
              color: (coursesRegistered == false) ? CiEColor.red : CiEColor.lightGray,
              shape: new RoundedRectangleBorder(borderRadius: CiEStyle.getButtonBorderRadius()),
              onPressed: (coursesRegistered == false) ? _handleCourseSubmission : ()=>_voidFunction,
              child: new Container(
                margin: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 15.0),
                child:new Text(
                    (coursesRegistered == false) ? StaticVariables.FAVORITES_REGISTRATION_BUTTON:
                    StaticVariables.FAVORITES_REGISTRATION_BUTTON_INACTIVE,
                style: new TextStyle(color: Colors.white)),
              ),
            ),
          )
      );
    }
    return new ListView(children:widgets);
  }

  Widget favoriteIcon(int id) {
    return new IconButton(
      icon: GenericIcon.buildGenericFavoriteIcon(
          courseListPresenter.getFavourite(id)
      ),
      onPressed: ()=>_toggleFavourite(id),
    );
  }

  void _toggleFavourite(int id) {
    setState(() {
      courseListPresenter.toggleFavourite(id);
    });
  }

  void toggleSearch() {
    setState(() {
      this.shouldSearch = !shouldSearch;
    });
  }

  // Build Asynchronously so that we can easily TODO: Send POST Request to Nine
  void _handleCourseSubmission() {
    var no = () {};
    var yes = () {
      setState(() {
        coursesRegistered = true;
      });
    };
    GenericAlert.confirm(context, no, yes,
        StaticVariables.ALERT_REGISTRATION_SUBMISSION).then((_) {});
  }

  void _voidFunction() {}

  void updateSearch(String val) {
    setState(() {
      this.searchValue = val;
    });
  }
}