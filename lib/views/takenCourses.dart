import 'dart:async';
import 'dart:convert';

import 'package:cie_app/presenter/currentUserPresenter.dart';
import 'package:cie_app/utils/cieColor.dart';
import 'package:cie_app/utils/cieStyle.dart';
import 'package:cie_app/utils/dataManager.dart';
import 'package:cie_app/utils/staticVariables.dart';
import 'package:cie_app/views/addTakenCourses.dart';
import 'package:flutter/material.dart';

class TakenCourses extends StatefulWidget {
  TakenCourses(this.currentUserPresenter);

  final CurrentUserPresenter currentUserPresenter;

  @override
  _TakenCoursesState createState() =>
      new _TakenCoursesState(currentUserPresenter);
}

class _TakenCoursesState extends State<TakenCourses> {
  final CurrentUserPresenter currentUserPresenter;

  _TakenCoursesState(this.currentUserPresenter);

  var semesterList = new List<String>();

  @override
  void initState() {
    super.initState();
    _loadSemesters();
    print("fired " + semesterList.length.toString());
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        floatingActionButton: new FloatingActionButton(
          child: new Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => new AddTakenCourses(semesterList)));
          },
        ),
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
          child: new Column(
            children: <Widget>[
              buildPreviousCourses(),
            ],
          ),
        ));
  }

  FutureBuilder buildPreviousCourses() {
    return new FutureBuilder(
        future: CourseHistory.loadCheckedCoursesFromMemory(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<dynamic> historyJson = json.decode(snapshot.data);
            List<Widget> widgets = new List<Widget>();
            int ectsTotal = historyJson.length * 2;
            widgets.add(ectsCount(ectsTotal));
            for (int i = 0; i < historyJson.length; i++) {
              widgets.add(new Container(
                  padding: new EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
                  child: new Text(
                    historyJson[i]['name'],
                    style: CiEStyle.getCoursesTitleStyle(context),
                  )));
              widgets.add(new Container(
                  padding: new EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                  child: new Column(
                    children: <Widget>[
                      new Row(
                        children: <Widget>[
                          new Text(
                            "2" + " ECTS",
                            style: CiEStyle.getPrevCoursesCreditsStyle(),
                          ),
                          new Padding(
                              padding: new EdgeInsets.only(right: 10.0)),
                          new Text(
                            "-",
                            style: CiEStyle.getPrevCoursesCreditsStyle(),
                          ),
                          new Padding(
                              padding: new EdgeInsets.only(right: 10.0)),
                          new Text(
                            historyJson[i]['correlations'][0]['organiser'],
                            style: CiEStyle.getPrevCoursesCreditsStyle(),
                          ),
                        ],
                      ),
                    ],
                  )));
            }
            return new Expanded(
              child: new ListView(children: widgets),
            );
          }
          //TODO make text static -> staticVariables
          return new Container(
              padding: new EdgeInsets.all(15.0),
              child: new Text("No Courses found.",
                  style: CiEStyle.getWarningTextStyle()));
        });
  }

  Widget ectsCount(int credits) {
    return new Container(
      padding: const EdgeInsets.only(top: 20.0, bottom: 0.0, left: 16.0),
      child: new Text(
          StaticVariables.TOTAL_OF +
              " " +
              credits.toString() +
              " " +
              StaticVariables.ECTS,
          style: CiEStyle.getWarningTextStyle()),
      decoration: new BoxDecoration(
        border: new Border(
            bottom: new BorderSide(color: CiEColor.lightGray, width: 1.0)),
      ),
    );
  }

  Future _loadSemesters() async {
    var semesters = await DataManager.getResource(
        DataManager.LOCAL_SEMESTERS, DataManager.REMOTE_CIE_BASE);
    var list = await json.decode(semesters);
    for (int i = 0; i < list.length; i++) {
      semesterList.add(list[i]['name']);
    }
    print("finished loading: " + semesterList.length.toString());
  }
}

class CourseHistory {
  static Future<List<String>> getSemesterList() async {
    var semesterList = new List<String>();
    var semesters = await DataManager.getResource(
        DataManager.LOCAL_SEMESTERS, DataManager.REMOTE_CIE_BASE);
    var list = json.decode(semesters);
    for (int i = 0; i < list.length; i++) {
      semesterList.add(list[i]['name']);
    }
    return semesterList;
  }

  static Future<String> loadCheckedCoursesFromMemory() async {
    List<dynamic> res = json
        .decode(await DataManager.getResource(DataManager.LOCAL_TAKEN_COURSES));
    List<dynamic> allCourseJson = json.decode(await loadAllCoursesFromMemory());
    List<dynamic> releventCourseJson = new List<dynamic>();
    for (int i = 0; i < res.length; i++) {
      for (int j = 0; j < allCourseJson.length; j++) {
        if (res[i] == allCourseJson[j]['id']) {
          releventCourseJson.add(allCourseJson[j]);
          j = allCourseJson.length;
        }
      }
    }
    return json.encode(releventCourseJson);
  }

  static Future<String> loadAllCoursesFromMemory() async {
    List<dynamic> finalJson = new List<dynamic>();
    var semesterList = await getSemesterList();
    for (int i = 0; i < semesterList.length; i++) {
      String sem = await CourseHistory.getSingleJson(semesterList.elementAt(i));
      finalJson.addAll(json.decode(sem));
    }
    return json.encode(finalJson);
  }

  static Future<String> getSingleJson(String data) async {
    return DataManager.getResource(DataManager.LOCAL_COURSES + data);
  }
}
