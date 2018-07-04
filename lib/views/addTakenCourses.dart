import 'package:cie_team1/presenter/currentUserPresenter.dart';
import 'package:cie_team1/utils/cieColor.dart';
import 'package:cie_team1/utils/cieStyle.dart';
import 'package:cie_team1/utils/staticVariables.dart';
import 'package:cie_team1/views/takenCourses.dart';
import 'package:flutter/material.dart';
import 'package:cie_team1/model/course/course.dart';
import 'package:cie_team1/utils/nineAPIConsumer.dart';
import 'package:cie_team1/utils/fileStore.dart';
import 'dart:convert';
import 'package:cie_team1/generic/genericIcon.dart';

class AddTakenCourses extends StatefulWidget {
  AddTakenCourses({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _AddTakenCoursesState createState() => new _AddTakenCoursesState();
}

class _AddTakenCoursesState extends State<AddTakenCourses> {
  String semesterFilter = "SoSe2018";
  String departmentFilter = "All Departments";
  List<String> coursesSelected = new List<String>();
  bool shouldSearch = false;
  String searchValue = "";
  final TextEditingController c1 = new TextEditingController();

  @override
  initState() {
    super.initState();
    List<String> urls = new List<String>();
      FileStore.readFileAsString(FileStore.OLD_COURSES+"0").then((hasOldCourseData){
        if (hasOldCourseData!=null) {
          setState(() {
            FileStore.readFileAsString(FileStore.TAKEN_COURSES).then((val) {
              if (val != null) {
                List<dynamic> savedHistory = json.decode(val);
                for(int i=0; i< savedHistory.length; i++) {
                  coursesSelected.add(savedHistory.elementAt(i));
                }
              }
            });
          });
        }
        else {
          for (int i=0; i<CourseHistory.semesterList.length; i++) {
            urls.add(NineAPIEngine.NINE_PREV_COURSE_LIST_URL +
                CourseHistory.getUrl(CourseHistory.semesterList.elementAt(i)));
          }
          NineAPIEngine.getJsonMulti(context, urls).then((v) {
            setState(() {
              FileStore.readFileAsString(FileStore.TAKEN_COURSES).then((val) {
                List<dynamic> savedHistory = json.decode(val);
                for(int i=0; i< savedHistory.length; i++) {
                  coursesSelected.add(savedHistory.elementAt(i));
                }
              });
            });
          });
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
          for (int i=0; i < courseJson.length; i++) {
            List<dynamic> departments = (courseJson[i]['correlations']);
            if((departments.toString().contains(departmentFilter) || departmentFilter == "All Departments") &&
                (!shouldSearch || courseJson[i]['name'].toString().toLowerCase().contains(searchValue.toLowerCase()))) {
              courseWidgets.add(new ListTile(
                title: new Text(courseJson[i]['name'],
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
                      FileStore.writeToFile(FileStore.TAKEN_COURSES, json.encode(coursesSelected));
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
          actions: <Widget>[
          ],
        ),
        body: new Center(
          child: new ListView(
            children: <Widget>[
              buildDropdowns(),
              shouldSearch ? new Container(
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
              ) : new Container(height: 0.0),
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
    departments.addAll(CourseDefinitions.departments.map((String value) {
          if (value != null) {
            return new DropdownMenuItem<String>(
              value: value,
              child: new Text(departmentLabel + value,
                  overflow: TextOverflow.clip),
            );
          }
        }).toList());

    List<DropdownMenuItem<String>> semesters =
    List<DropdownMenuItem<String>>();
    semesters.addAll(CourseHistory.semesterList.map((String value) {
      if (value != null) {
        return new DropdownMenuItem<String>(
          value: value,
          child: new Text(value,
              overflow: TextOverflow.clip),
        );
      }
    }).toList());

    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        new Column(
          children: <Widget>[
            new DropdownButton(items: semesters , onChanged: changeSemesterFilter, value:semesterFilter)
          ],
        ),
        new Column(
          children: <Widget>[
            new DropdownButton(items: departments, onChanged: changeDepartmentFilter, value:departmentFilter)
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
      this.departmentFilter= val;
    });
  }
}
