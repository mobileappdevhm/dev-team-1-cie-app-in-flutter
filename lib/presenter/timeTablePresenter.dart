import 'package:cie_team1/di/currentUser_di.dart';
import 'package:cie_team1/model/course/course.dart';
import 'package:cie_team1/model/user/user.dart';
import 'package:cie_team1/model/user/currentUser.dart';
import 'package:cie_team1/widgets/timeTableItem.dart';
import 'package:flutter/material.dart';

class TimeTablePresenter {
  CurrentUser _currentUser;

  TimeTablePresenter() {
    UserInjector.configure(Flavor.MOCK);
    _currentUser = new UserInjector().currentUser;
  }

  User getCurrentUser() {
    return _currentUser.getCurrentUser();
  }

  //Get courses of user
  List<Course> getCourses() {
    return _currentUser
        .getCurrentUser()
        .currentCourses;
  }

  //Get every lectures of users courses
  List<Lecture> getLectures() {
    List<Lecture> lectures = [];
    //Add all lectures to lectures list
    getCourses().forEach((c) =>
        c.lecturesPerWeek.forEach((l) => lectures.add(l)));
    return _sortLectures(lectures);
  }

  //Sort lectures. Monday first
  List<Lecture> _sortLectures(List<Lecture> lectures) {
    lectures.sort((a, b) => a.sortValue() - b.sortValue());
    return lectures;
  }

  List<Lecture> getLecturesOfWeekday(Weekday searchedWeekday) {
    List<Lecture> lectures = [];
    //Add all lectures to lectures list
    getCourses().forEach((c) =>
        c.lecturesPerWeek.where((l) => l.weekday == searchedWeekday).forEach((l) => lectures.add(l)));
    return _sortLectures(lectures);
  }

  //Todo: We might need to change this. Every time a setter is called every thing is calculated.
  String getTitle(int id) {
    return getLectures()[id].course.name;
  }

  int getCredits(int id) {
    return getLectures()[id].course.ects;
  }

  String getFaculty(int id) {
    return getLectures()[id].course.faculty;
  }

  String getProfessorName(int id) {
    return getLectures()[id].course.professorName;
  }

  String getTime(int id) {
    return getLectures()[id].startDayTime.toString() + "-" +
        getLectures()[id].endDayTime.toString();
  }

  String getWeekday(int id) {
    return WeekdayUtility.getWeekdayAsString(getLectures()[id].weekday);
  }



  //@override
  //List<Widget> getTimeTableItems() {
  //  List<Widget> result = <Widget>[];
//
  //  //for (int i = 0; i < getCourses().length; i++) {
  //  for (int i = 0; i < getLectures().length; i++) {
  //    result.add(new TimeTableItem.ScheduleItem(this, i));
  //  }
//
  //  return result;
  //}
}