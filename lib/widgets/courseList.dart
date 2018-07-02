import 'dart:async';
import 'dart:convert';

import 'package:cie_team1/generic/genericAlert.dart';
import 'package:cie_team1/generic/genericIcon.dart';
import 'package:cie_team1/generic/genericShowInstruction.dart';
import 'package:cie_team1/model/course/course.dart';
import 'package:cie_team1/presenter/courseListPresenter.dart';
import 'package:cie_team1/presenter/currentUserPresenter.dart';
import 'package:cie_team1/utils/analytics.dart';
import 'package:cie_team1/utils/cieColor.dart';
import 'package:cie_team1/utils/cieStyle.dart';
import 'package:cie_team1/utils/nineAPIConsumer.dart';
import 'package:cie_team1/utils/staticVariables.dart';
import 'package:cie_team1/widgets/courseListItem.dart';
import 'package:flutter/material.dart';
import 'package:cie_team1/utils/routes.dart';

class CourseList extends StatefulWidget {
  // Stateful because then this class can be used for favourites as well.
  final CourseListPresenter courseListPresenter;
  final CurrentUserPresenter userPresenter;
  bool shouldFilterByFavorites = false;
  final FocusNode focus;

  CourseList(this.courseListPresenter, this.shouldFilterByFavorites,
      this.userPresenter, this.focus);

  @override
  State<StatefulWidget> createState() {
    return new CourseListState(
        courseListPresenter, shouldFilterByFavorites, userPresenter, focus);
  }

  void toggleFilter() {
    shouldFilterByFavorites = !shouldFilterByFavorites;
  }
}

class CourseListState extends State<CourseList> {
  final CourseListPresenter courseListPresenter;
  final CurrentUserPresenter userPresenter;
  final TextEditingController c1 = new TextEditingController();
  final bool shouldFilterByFavorites;
  bool shouldSearch = false;
  String filter = "13";
  String searchValue = "";
  bool coursesRegistered = false;
  FocusNode focus;

  CourseListState(this.courseListPresenter, this.shouldFilterByFavorites,
      this.userPresenter, this.focus) {
    if (this.userPresenter.getCurrentUser().isLoggedIn != null &&
        this.userPresenter.getCurrentUser().isLoggedIn &&
        this.userPresenter.getCurrentUser().department.isNotEmpty) {
      if (this.userPresenter.getCurrentUser().department.isNotEmpty) {
        String department = this.userPresenter.getCurrentUser().department;
        this.filter =
            department.substring(department.length - 2, department.length);
      }
    }
  }

  initState() {
    super.initState();
    if (!shouldFilterByFavorites) {
      Analytics.setCurrentScreen("courses_screen");
    } else {
      Analytics.setCurrentScreen("favorites_screen");
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = new List<Widget>();

    if (courseListPresenter.getCourses().isEmpty) {
      return new Column(
        children: <Widget>[
          GenericShowInstruction.showInstructions(
              () => handleRefreshIndicator(context, courseListPresenter),
              context),
        ],
      );
    } else {
      if (shouldFilterByFavorites == false) {
        widgets.add(new Container(
            color: CiEColor.white,
            padding: new EdgeInsets.symmetric(vertical: 10.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text("Pull down to Refresh",
                    style: CiEStyle.getCourseListRefreshText()),
                new Icon(Icons.arrow_downward, color: CiEColor.mediumGray)
              ],
            )));

        //Select department to filter for
        EdgeInsets pad = const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0);
        String departmentLabel = "Department ";
        List<DropdownMenuItem<String>> departments =
            List<DropdownMenuItem<String>>();
        departments.add(new DropdownMenuItem<String>(
          value: "",
          child: new Text("All Departments", overflow: TextOverflow.clip),
        ));
        departments.addAll(CourseDefinitions.departments.map((String value) {
          if (value != null) {
            return new DropdownMenuItem<String>(
              value: value,
              child: new Text(departmentLabel + value,
                  overflow: TextOverflow.clip),
            );
          }
        }).toList());
        widgets.add(new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Container(
                  padding: pad,
                  child: new DropdownButton<String>(
                    items: departments,
                    onChanged: (String val) {
                      setState(() {
                        this.filter = val;
                      });
                    },
                    iconSize: 32.0,
                    value: filter,
                  )),
              new Container(
                padding: const EdgeInsets.fromLTRB(80.0, 10.0, 10.0, 10.0),
                child: new IconButton(
                    color: CiEColor.mediumGray,
                    icon: GenericIcon.buildGenericSearchIcon(shouldSearch),
                    onPressed: toggleSearch),
              )
            ]));
        if (shouldSearch) {
          widgets.add(new Container(
            padding: const EdgeInsets.fromLTRB(10.0, 1.0, 10.0, 1.0),
            alignment: Alignment.center,
            child: new TextField(
              focusNode: focus,
              controller: c1,
              decoration: const InputDecoration(
                hintText: "Search by Course Name",
                contentPadding: const EdgeInsets.all(10.0),
                border: OutlineInputBorder(),
              ),
              onChanged: (String val) => updateSearch(val),
              onSubmitted: (String val) => Analytics.logSearch(val),
            ),
          ));
        }
      } else {
        widgets.add(new Padding(
          padding: const EdgeInsets.all(10.0),
        ));
      }

      //Build the tiles of the course list / favorites list
      for (int i = 0; i < courseListPresenter.getCourses().length; i++) {
        if (_shouldShowCourse(i)) {
          if (shouldSearch == false ||
              (courseListPresenter
                  .getTitle(i)
                  .toLowerCase()
                  .contains(searchValue.toLowerCase()))) {
            widgets.add(
                new CourseListItem(courseListPresenter, i, favoriteIcon(i)));
            widgets.add(new Divider());
          }
        }
      }
      if (shouldFilterByFavorites == true) {
        widgets.add(new Container(
          margin: const EdgeInsets.fromLTRB(50.0, 15.0, 50.0, 15.0),
          child: _getRaisedSubmitButton(),
        ));
      }

      return new RefreshIndicator(
          child: new ListView(children: widgets),
          onRefresh: () => handleRefreshIndicator(context, courseListPresenter),
          color: CiEColor.mediumGray);
    }
  }

  bool _shouldShowCourse(int i) {
    if (shouldFilterByFavorites == false) {
      //return true if department is searched
      return courseListPresenter.getFaculties(i).toString().contains(filter);
    } else {
      //return true if course is favorite or is temporary available
      return courseListPresenter.getFavourite(i) ||
          courseListPresenter.getWillChangeOnViewChange(i);
    }
  }

  @override
  void deactivate() {
    super.deactivate();
    courseListPresenter.deactivate();
  }

  // Create a raised button on which is used on favorite page to allow users to submit their choices to lottery
  Widget _getRaisedSubmitButton() {
    bool isLoggedIn = userPresenter.getCurrentUser().isLoggedIn != null
        ? userPresenter.getCurrentUser().isLoggedIn
        : false;
    bool isDepartmentSet =
        userPresenter.getCurrentUser().department.isNotEmpty != null
            ? userPresenter.getCurrentUser().department.isNotEmpty
            : false;
    bool submissionValid = !coursesRegistered && isLoggedIn && isDepartmentSet;

    //Decide how to show submit button
    String textToShow;
    Color buttonColor;
    if (submissionValid) {
      textToShow = StaticVariables.FAVORITES_REGISTRATION_BUTTON;
      buttonColor = CiEColor.red;
    } else if (coursesRegistered && isLoggedIn) {
      textToShow = StaticVariables.FAVORITES_REGISTRATION_BUTTON_INACTIVE;
      buttonColor = CiEColor.lightGray;
    } else if (coursesRegistered && isLoggedIn && !isDepartmentSet) {
      textToShow =
          StaticVariables.FAVORITES_REGISTRATION_BUTTON_INACTIVE_NO_DEPARTMENT;
      buttonColor = CiEColor.lightGray;
    } else {
      textToShow = StaticVariables.FAVORITES_REGISTRATION_BUTTON_LOGIN_FIRST;
      buttonColor = CiEColor.red;
    }

    return new RaisedButton(
      color: buttonColor,
      shape: new RoundedRectangleBorder(
          borderRadius: CiEStyle.getButtonBorderRadius()),
      onPressed: ()=>_contextualCourseSubmission(userPresenter,
          submissionValid, isLoggedIn),
      child: new Container(
        margin: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 15.0),
        child: new Text(textToShow, style: new TextStyle(color: Colors.white)),
      ),
    );
  }

  handleRefreshIndicator(BuildContext context, CourseListPresenter presenter) {
    Future<Null> complete = NineAPIEngine.pullCourseJSON(context, true);
    presenter.addCoursesFromMemory();
    presenter.updateLecturerInfoFromMemory();
    presenter.onChanged(true);
    return complete;
  }

  Widget favoriteIcon(int id) {
    return new IconButton(
      icon: GenericIcon
          .buildGenericFavoriteIcon(courseListPresenter.getFavourite(id)),
      onPressed: () => _toggleFavourite(id),
    );
  }

  void _toggleFavourite(int id) {
    setState(() {
      //Remove course from favourites only after view change
      if (shouldFilterByFavorites)
        courseListPresenter.toggleFavouriteWhenChangeView(id);
      else
        courseListPresenter.toggleFavourite(id, true);
    });
  }

  void toggleSearch() {
    setState(() {
      this.shouldSearch = !shouldSearch;
    });
  }

  void _contextualCourseSubmission(CurrentUserPresenter user,
      bool isSubmissionValid, bool isLoggedIn) {
    if (isSubmissionValid != null && isSubmissionValid) {
      _handleCourseSubmission(user);
    }
    else if (isLoggedIn != null && !isLoggedIn) {
      Navigator.pushReplacementNamed(context, Routes.Login);
    }
  }

  void _handleCourseSubmission(CurrentUserPresenter user) {
    var no = () {};
    var yes = () {
      Map<String, String> userJson = {
          "id" : user.getCurrentUser().id,
          "firstName" : user.getCurrentUser().firstName,
          "lastName" : user.getCurrentUser().lastName
      };
      List<dynamic> selectedCourses = new List<dynamic>();
      for (Course c in courseListPresenter.getCourses()) {
        if (c.isFavourite) {
          selectedCourses.add( {"id" : c.id } );
        }
      }

      Map<String, String> postJson = new Map<String, String>();
      postJson.putIfAbsent("user", ()=>json.encode(userJson));
      postJson.putIfAbsent("courses", ()=>json.encode(selectedCourses));
      NineAPIEngine.postJson(context,
          NineAPIEngine.NINE_COURSE_SUBSCRIPTION_URL, postJson);
      setState(() {
        coursesRegistered = true;
      });
    };
    GenericAlert
        .confirm(
            context, no, yes, StaticVariables.ALERT_REGISTRATION_SUBMISSION)
        .then((_) {});
  }

  void updateSearch(String val) {
    setState(() {
      this.searchValue = val;
    });
  }
}
