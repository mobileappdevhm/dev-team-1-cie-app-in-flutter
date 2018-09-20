import 'dart:convert';

import 'package:cie_app/generic/genericIcon.dart';
import 'package:cie_app/model/course/details/department.dart';
import 'package:cie_app/utils/cieColor.dart';
import 'package:cie_app/utils/cieStyle.dart';
import 'package:cie_app/utils/dataManager.dart';
import 'package:cie_app/utils/fileStore.dart';
import 'package:cie_app/utils/staticVariables.dart';
import 'package:cie_app/views/takenCourses.dart';
import 'package:flutter/material.dart';

class AddTakenCourses extends StatefulWidget {
  AddTakenCourses({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _AddTakenCoursesState createState() => new _AddTakenCoursesState();
}

class _AddTakenCoursesState extends State<AddTakenCourses> {
  //TODO do not hard code this semester
  String semesterFilter = "WiSe 2018";
  String departmentFilter = "All Departments";
  List<String> coursesSelected = new List<String>();
  bool shouldSearch = false;
  String searchValue = "";
  final TextEditingController c1 = new TextEditingController();

  @override
  initState() {
    super.initState();
    print("init");
    FileStore.readFileAsString(FileStore.COURSES + semesterFilter)
        .then((hasOldCourseData) {
      print(semesterFilter + " filter!!!!!!!!!!!!!!!!!!!!");
      var fetchNewData = true;
      if (hasOldCourseData != null && hasOldCourseData.length > 3) {
        fetchNewData = false;
        print("yes");
        setState(() {
          FileStore.readFileAsString(FileStore.TAKEN_COURSES).then((val) {
            if (val != null) {
              try {
                List<dynamic> savedHistory = json.decode(val);
                for (int i = 0; i < savedHistory.length; i++) {
                  coursesSelected.add(savedHistory.elementAt(i));
                }
              } catch (e) {
                print("addTakenCourses, error: " + e.toString());
              }
            }
          });
        });
      }
      if (fetchNewData) {
        DataManager.updateAll(context, true);
      }
    });
  }

  static bool getCheckedValue(List<String> courses, String id) {
    return courses.contains(id);
  }

  FutureBuilder buildOldCourses(String searchValue) {
    return new FutureBuilder(
      future: CourseHistory.getSingleJson(semesterFilter),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          List<dynamic> courseJson = json.decode(snapshot.data);
          List<Widget> courseWidgets = new List<Widget>();
          for (int i = 0; i < courseJson.length; i++) {
            if ((courseJson[i]['department']['name']
                        .contains(departmentFilter) ||
                    departmentFilter == "All Departments") &&
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
                trailing: new Checkbox(
                  value: getCheckedValue(coursesSelected, courseJson[i]['id']),
                  onChanged: (val) {
                    setState(() {
                      if (val == false) {
                        if (coursesSelected.contains(courseJson[i]['id'])) {
                          coursesSelected.remove(courseJson[i]['id']);
                        }
                      } else {
                        coursesSelected.add(courseJson[i]['id']);
                      }
                      FileStore.writeToFile(FileStore.TAKEN_COURSES,
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
                          hintText: "Search by Course Name",
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

  static void _voidCallback(bool didChange) {}

  Widget buildDropdowns() {
    String departmentLabel = "Department ";
    List<DropdownMenuItem<String>> departments =
        List<DropdownMenuItem<String>>();
    departments.add(new DropdownMenuItem<String>(
      value: "All Departments",
      child: new Text("All Departments", overflow: TextOverflow.clip),
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
    semesters.addAll(CourseHistory.semesterList.map((String value) {
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
