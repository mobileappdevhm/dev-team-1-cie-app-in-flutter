import 'package:cie_team1/di/courses_di.dart';
import 'package:flutter/material.dart';
import 'package:cie_team1/model/course/course.dart';
import 'package:cie_team1/model/course/courses.dart';
import 'package:cie_team1/model/user/currentUser.dart';
import 'package:cie_team1/utils/fileStore.dart';
import 'dart:convert';

abstract class CourseListViewContract {
  //Todo: Needed in future
}

class CourseListPresenter {
  Courses _courses;
  final ValueChanged<bool> onChanged;

  CourseListPresenter(this.onChanged) {
    CourseInjector.configure(Flavor.MOCK);
    _courses = new CourseInjector().courses;
  }

  // TODO: Heavily modify this function.
  // TODO: -Rename to be more relevant to update function,
  // TODO: -Check if course is already stored before adding here
  // TODO: -Make the loop contents more relevant and move it somewhere else
  void addCoursesFromMemory() {
    List<Course> courseList = _courses.getCourses();
    bool didUpdate = false;
    FileStore.readFileAsString(FileStore.COURSES).then((String val){
      if (val != null) {
        final List<dynamic> jsonData = json.decode(val);
        for (int i=0; i<jsonData.length; i++) {
          CourseBuilder courseBuilder = new CourseBuilder.fromJson(jsonData[i]);
            // TODO: Delete the following builder code & only rely on the .fromJson
            // once all relevent data is available from the Nine API
            courseBuilder
              .withLecturesPerWeek(
              [
                new Lecture(Campus.KARLSTRASSE, Weekday.Mon, new DayTime(10, 00),
                    new DayTime(11, 30), "R0.009")
              ])
              .withDescription("")
              .withHoursPerWeek(2)
              .withEcts(2)
              .withProfessorEmail("example@hm.edu")
              .withProfessorName("Max Mustermann")
              .withAvailable(CourseAvailability.AVAILABLE)
              .withIsFavorite(false);
          Course c = courseBuilder.build();
          if (isNewCourseData(courseList, c)) {
            courseList.add(c);
            didUpdate = true;
          }
        }
        if (didUpdate == true) {
          courseList.sort((one, two) => one.name.compareTo(two.name));
          this.onChanged(true);
        }
      }
    });
  }

  bool isNewCourseData(List<Course> courseList, Course candidate) {
    for (Course c in courseList) {
      // compares using the unique id from Nine
      if (c.equals(candidate)) {
        return false;
      }
    }
    return true;
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

  String getFacultyBeautiful(int id) {
    return "FK " + _courses.getCourses()[id].faculty.toString();
  }

  String getTitle(int id) {
    return _courses.getCourses()[id].name;
  }

  List<Lecture> getLectureTimes(int id) {
    return _courses.getCourses()[id].lecturesPerWeek;
  }

  String getDescription(int id) {
    return _courses.getCourses()[id].description;
  }

  //Todo: to implement
  String getHoursPerWeek(int id) {
    return "-";
  }

  String getEcts(int id) {
    return _courses.getCourses()[id].ects.toString();
  }

  String getProfessorName(int id) {
    return _courses.getCourses()[id].professorName;
  }

  String getLectureTimesBeautiful(int id) {
    List<Lecture> lectures = _courses.getCourses()[id].lecturesPerWeek;
    String result = "";
    for (var i = 0; i < lectures.length; i++) {
      if (i != 0) result += '\n';
      result += WeekdayUtility.getWeekdayAsString(lectures[i].weekday) +
          ' ' +
          lectures[i].startDayTime.toString() +
          '-' +
          lectures[i].endDayTime.toString();
    }

    return result;
  }
}
