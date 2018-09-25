import 'dart:convert';

import 'package:cie_app/generic/genericIcon.dart';
import 'package:cie_app/model/course/details/department.dart';
import 'package:cie_app/utils/cieColor.dart';
import 'package:cie_app/utils/cieStyle.dart';
import 'package:cie_app/utils/dataManager.dart';
import 'package:cie_app/utils/staticVariables.dart';
import 'package:flutter/material.dart';

class AddTakenCourses extends StatefulWidget {
  AddTakenCourses(this.semesterList, {Key key, this.title}) : super(key: key);
  final String title;
  final List<String> semesterList;

  @override
  _AddTakenCoursesState createState() =>
      new _AddTakenCoursesState(semesterList);
}

class _AddTakenCoursesState extends State<AddTakenCourses> {
  _AddTakenCoursesState(this.semesterList);

  var semesterList = new List<String>();
  var semesterFilter = "";
  var departmentFilter = StaticVariables.ALL_DEPARTMENTS;
  var coursesSelected = new List<dynamic>();
  var shouldSearch = false;
  var searchValue = "";
  final TextEditingController c1 = new TextEditingController();

  @override
  initState() {
    super.initState();
    _initialize();
  }

  void _initialize() async {
    var fetchNewData = true;
    if (semesterList.length > 0) {
      fetchNewData = false;
      setState(() {
        semesterFilter = semesterList.first;
      });
      await DataManager.getResource(DataManager.LOCAL_COURSES + semesterFilter)
          .then((hasOldCourseData) {
        if (hasOldCourseData != null && hasOldCourseData.length > 3) {
          fetchNewData = false;
          setState(() {
            DataManager.getResource(DataManager.LOCAL_TAKEN_COURSES)
                .then((val) {
              if (val != null) {
                try {
                  List<dynamic> savedHistory = json.decode(val);
                  for (int i = 0; i < savedHistory.length; i++) {
                    coursesSelected.add(savedHistory.elementAt(i));
                  }
                } catch (e) {
                  print("addTakenCourses.dart, error: " + e.toString());
                }
              }
            });
          });
        } else {
          fetchNewData = true;
        }
      });
    }
    if (fetchNewData) {
      await DataManager.updateAll(context, true);
      setState(() {
        searchValue = "";
      });
      buildOldCourses(searchValue);
    }
  }

  static bool getCheckedValue(List<dynamic> courses, String id) {
    for (var course in courses) {
      if (course['id'] == id) return true;
    }
    return false;
  }

  FutureBuilder buildOldCourses(String searchValue) {
    return new FutureBuilder(
      future:
          DataManager.getResource(DataManager.LOCAL_COURSES + semesterFilter),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          List<dynamic> courseJson = json.decode(snapshot.data);
          List<Widget> courseWidgets = new List<Widget>();
          for (int i = 0; i < courseJson.length; i++) {
            if ((courseJson[i]['department']['name']
                        .contains(departmentFilter) ||
                    departmentFilter == StaticVariables.ALL_DEPARTMENTS) &&
                (!shouldSearch ||
                    courseJson[i]['name']
                        .toString()
                        .toLowerCase()
                        .contains(searchValue.toLowerCase()))) {
              courseWidgets.add(new ListTile(
                title: new Text(
                  courseJson[i]['name'],
                  style: CiEStyle.getPrevCoursesTitleStyle(),
                ),
                subtitle: new Container(
                  child: new Row(
                    children: <Widget>[
                      new Text(
                        courseJson[i]['ects'].round().toString() + " ECTS",
                        style: CiEStyle.getPrevCoursesSubtitleStyle(),
                      ),
                      new Padding(padding: new EdgeInsets.only(right: 10.0)),
                      new Text(
                        "-",
                        style: CiEStyle.getPrevCoursesSubtitleStyle(),
                      ),
                      new Padding(padding: new EdgeInsets.only(right: 10.0)),
                      new Text(
                        courseJson[i]['department']['shortName'],
                        style: CiEStyle.getPrevCoursesSubtitleStyle(),
                      ),
                    ],
                  ),
                ),
                trailing: new Checkbox(
                  value: getCheckedValue(coursesSelected, courseJson[i]['id']),
                  onChanged: (val) {
                    setState(() {
                      if (val == false) {
                        if (coursesSelected.contains(courseJson[i])) {
                          coursesSelected.remove(courseJson[i]);
                        }
                      } else {
                        coursesSelected.add(courseJson[i]);
                      }
                      DataManager.writeToFile(DataManager.LOCAL_TAKEN_COURSES,
                          json.encode(coursesSelected));
                    });
                  },
                  activeColor: CiEColor.red,
                ),
              ));
            }
          }
          return new Column(children: courseWidgets);
        }
        return new Container(height: 0.0);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(
            StaticVariables.TAKEN_COURSES,
            style: CiEStyle.getAppBarTitleStyle(context),
          ),
          elevation: CiEStyle.getAppBarElevation(context),
          backgroundColor: CiEColor.red,
          actions: <Widget>[],
        ),
        body: new Center(
          child: new ListView(
            children: <Widget>[
              buildDropdowns(),
              shouldSearch
                  ? new Container(
                      padding: const EdgeInsets.fromLTRB(10.0, 1.0, 10.0, 1.0),
                      alignment: Alignment.center,
                      child: new TextField(
                        //focusNode: focus,
                        controller: c1,
                        decoration: const InputDecoration(
                          hintText: StaticVariables.SEARCH_BY_COURSE_NAME,
                          contentPadding: const EdgeInsets.all(10.0),
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (String val) => updateSearch(val),
                      ),
                    )
                  : new Container(height: 0.0),
              buildOldCourses(searchValue),
            ],
          ),
        ));
  }

  Widget buildDropdowns() {
    String departmentLabel = StaticVariables.DEPARTMENT + " ";
    List<DropdownMenuItem<String>> departments =
        List<DropdownMenuItem<String>>();
    departments.add(new DropdownMenuItem<String>(
      value: StaticVariables.ALL_DEPARTMENTS,
      child: new Text(StaticVariables.ALL_DEPARTMENTS, overflow: TextOverflow.clip),
    ));
    departments.addAll(Department.departments.map((String value) {
      if (value != null) {
        return new DropdownMenuItem<String>(
          value: value,
          child: new Text(departmentLabel + value, overflow: TextOverflow.clip),
        );
      }
    }).toList());
    List<DropdownMenuItem<String>> semesters = List<DropdownMenuItem<String>>();
    semesters.addAll(semesterList.map((String value) {
      if (value != null) {
        return new DropdownMenuItem<String>(
          value: value,
          child: new Text(value, overflow: TextOverflow.clip),
        );
      }
    }).toList());
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        new Column(
          children: <Widget>[
            new DropdownButton(
                items: semesters,
                onChanged: changeSemesterFilter,
                value: semesterFilter)
          ],
        ),
        new Column(
          children: <Widget>[
            new DropdownButton(
                items: departments,
                onChanged: changeDepartmentFilter,
                value: departmentFilter)
          ],
        ),
        new IconButton(
            color: CiEColor.mediumGray,
            icon: GenericIcon.buildGenericSearchIcon(shouldSearch),
            onPressed: toggleSearch),
      ],
    );
  }

  void toggleSearch() {
    setState(() {
      shouldSearch = !shouldSearch;
    });
  }

  void updateSearch(val) {
    setState(() {
      searchValue = val;
    });
  }

  void changeSemesterFilter(String val) {
    //getData(val);
    setState(() {
      this.semesterFilter = val;
    });
  }

  void changeDepartmentFilter(String val) {
    setState(() {
      this.departmentFilter = val;
    });
  }
}
