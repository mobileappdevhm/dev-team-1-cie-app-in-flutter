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
    //TODO use userPresenter.prevCourses here
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
                    builder: (context) => new AddTakenCourses(semesterList, currentUserPresenter)));
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

  int countEcts(List<dynamic> historyJson) {
    var count = 0;
    for (var course in historyJson) {
      count += course['ects'].round();
    }
    return count;
  }

  FutureBuilder buildPreviousCourses() {
    return new FutureBuilder(
        future: DataManager.getResource(DataManager.LOCAL_TAKEN_COURSES),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<dynamic> historyJson = json.decode(snapshot.data);
            List<Widget> widgets = new List<Widget>();
            var ectsTotal = countEcts(historyJson);
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
                            historyJson[i]['ects'].round().toString() + " " + StaticVariables.ECTS,
                            style: CiEStyle.getPrevCoursesSubtitleStyle(),
                          ),
                          new Padding(
                              padding: new EdgeInsets.only(right: 10.0)),
                          new Text(
                            "-",
                            style: CiEStyle.getPrevCoursesSubtitleStyle(),
                          ),
                          new Padding(
                              padding: new EdgeInsets.only(right: 10.0)),
                          new Text(
                            historyJson[i]['department']['shortName'],
                            style: CiEStyle.getPrevCoursesSubtitleStyle(),
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
          return new Container(
              padding: new EdgeInsets.all(15.0),
              child: new Text(StaticVariables.TAKEN_COURSES_ERROR_NO_COURSE_FOUND,
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
  }
}
