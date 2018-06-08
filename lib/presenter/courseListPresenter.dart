import 'package:cie_team1/di/courses_di.dart';
import 'package:cie_team1/model/course/course.dart';
import 'package:cie_team1/model/course/courses.dart';
import 'package:cie_team1/model/user/currentUser.dart';
import 'package:flutter/cupertino.dart';

abstract class CourseListViewContract {
  //Todo: Needed in future
}

class CourseListPresenter {
  //List<Course> courses = [];
  Courses _courses;

  CourseListPresenter() {
    CourseInjector.configure(Flavor.MOCK);
    _courses = new CourseInjector().courses;
  }

  void toggleFavourite(int id) {
    if (_courses.getCourses()[id].isFavourite) {
      _courses.getCourses()[id].isFavourite = false;
    } else {
      _courses.getCourses()[id].isFavourite = true;
    }
  }

  bool getFavourite(int id) {
    return _courses.getCourses()[id].isFavourite;
  }

  void toggleShowCourseDescription(int id) {
    //Todo: Implementation needed. See Issue #12
  }

  List<Course> getCourses() {
    return _courses.getCourses();
  }

  List<Course> getPrevCourses(CurrentUser currentUser) {
    return currentUser.getCurrentUser().prevCourses;
  }

  CourseAvailability getAvailability(int id) {
    return _courses.getCourses()[id].available;
  }

  String getFaculty(int id) {
    return _courses.getCourses()[id].faculty.toString();
  }

  String getTitle(int id) {
    return _courses.getCourses()[id].name;
  }

  List<Lecture> getLectureTimes(int id) {
    return _courses.getCourses()[id].lecturesPerWeek;
  }

  String getLectureTimesBeautiful(int id, BuildContext context) {
    List<Lecture> lectures = _courses.getCourses()[id].lecturesPerWeek;
    String result = "";
    for (var i = 0; i < lectures.length; i++) {
      if (i != 0) result += '\n';
      result +=
          WeekdayUtility.getWeekdayAsString(lectures[i].weekday, context) +
              ' ' +
              lectures[i].startDayTime.toString() +
              '-' +
              lectures[i].endDayTime.toString();
    }

    return result;
  }
}
