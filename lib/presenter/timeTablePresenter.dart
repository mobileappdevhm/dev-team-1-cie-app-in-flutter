import 'package:cie_team1/di/currentUser_di.dart';
import 'package:cie_team1/model/course/course.dart';
import 'package:cie_team1/model/user/user.dart';
import 'package:cie_team1/model/user/currentUser.dart';
import 'package:cie_team1/widgets/timeTableItem.dart';
import 'package:flutter/material.dart';

abstract class TimeTablePresenter {
  CurrentUser _currentUser;

  TimeTablePresenter() {
    UserInjector.configure(Flavor.MOCK);
    _currentUser = new UserInjector().currentUser;
  }

  User getCurrentUser() {
    return _currentUser.getCurrentUser();
  }

  List<Course> getCourses() {
    return _currentUser
        .getCurrentUser()
        .currentCourses;
  }

  String getTitle(int id) {
    return _currentUser
        .getCurrentUser()
        .currentCourses[id].name;
  }

  int getCredits(int id) {
    return _currentUser
        .getCurrentUser()
        .currentCourses[id].ects;
  }

  String getFaculty(int id) {
    return _currentUser
        .getCurrentUser()
        .currentCourses[id].faculty.toString();
  }

  List<Lecture> getLectureTimes(int id) {
    return _currentUser
        .getCurrentUser()
        .currentCourses[id].lecturesPerWeak;
  }

  String getDayTimeTable(int id) {
    List<Lecture> lectures = _currentUser
        .getCurrentUser()
        .currentCourses[id].lecturesPerWeak;
    String result = "";
    for (var i = 0; i < lectures.length; i++) {
      if (i != 0)
        result += '\n';
      result = WeekdayUtility.getWeekdayAsString(lectures[i].weekday);
    }

    return result;
  }

  String getTimeTimeTable(int id) {
    List<Lecture> lectures = _currentUser
        .getCurrentUser()
        .currentCourses[id].lecturesPerWeak;
    String result = "";
    for (var i = 0; i < lectures.length; i++) {
      if (i != 0)
        result += '\n ';
      result +=
          lectures[i].startDayTime.toString() + '-' +
          lectures[i].endDayTime.toString();
    }

    return result;
  }

  String getProfessorName(int id){
    return _currentUser
        .getCurrentUser()
        .currentCourses[id].professorName;
  }



  @override
  List<Widget> getTimeTableItems() {
    List<Widget> result = <Widget>[];

    for (int i = 0; i < getCourses().length; i++) {
      result.add(new TimeTableItem.ScheduleItem(this, i));
    }

    return result;
  }
}