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
  List<int> _coursesToDeleteOnViewChange = List<int>();

  CourseListPresenter(this.onChanged) {
    CourseInjector.configure(Flavor.MOCK);
    _courses = new CourseInjector().courses;
  }

  // TODO: Heavily modify this function.
  // TODO: -Rename to be more relevant to update function,
  // TODO: -Check if course is already stored before adding here
  // TODO: -Make the loop contents more relevant and move it somewhere else
  void addCoursesFromMemory() {
    this.onChanged(true);
    List<Course> courseList = _courses.getCourses();
    bool didUpdate = false;
    FileStore.readFileAsString(FileStore.COURSES).then((String val) {
      if (val != null) {
        final List<dynamic> jsonData = json.decode(val);
        for (int i = 0; i < jsonData.length; i++) {
          CourseBuilder courseBuilder = new CourseBuilder.fromJson(jsonData[i]);
          // TODO: Delete the following builder code & only rely on the .fromJson
          // once all relevent data is available from the Nine API
          courseBuilder
              .withLecturesPerWeek(
              [
                new Lecture(
                    Campus.KARLSTRASSE, Weekday.Mon, new DayTime(10, 00),
                    new DayTime(11, 30), "R0.009")
              ])
              .withHoursPerWeek(2)
              .withEcts(2)
              .withProfessorEmail("example@hm.edu")
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

  //Remove the courses outstanding for remove
  void deactivate() {
    _coursesToDeleteOnViewChange.clear();
  }

  void toggleFavourite(int id) {
    if (_courses.getCourses()[id].isFavourite) {
      _courses.getCourses()[id].isFavourite = false;
    } else {
      _courses.getCourses()[id].isFavourite = true;
    }
  }

  void toggleFavouriteWhenChangeView(int id) {
    toggleFavourite(id);
    if (_coursesToDeleteOnViewChange.contains(id)) {
      _coursesToDeleteOnViewChange.remove(id);
    } else {
      _coursesToDeleteOnViewChange.add(id);
    }
  }

  bool getFavourite(int id) {
    return _courses.getCourses()[id].isFavourite;
  }

  bool getWillChangeOnViewChange(int id) {
    return _coursesToDeleteOnViewChange.contains(id);
  }

  void toggleShowCourseDescription(int id) {
    //Todo: Implementation needed. See Issue #12
  }

  List<Course> getCourses() {
    return _courses.getCourses();
  }

  List<Course> getPrevCourses(CurrentUser currentUser) {
    return currentUser
        .getCurrentUser()
        .prevCourses;
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

  String getHoursPerWeek(int id) {
    return _courses.getCourses()[id].hoursPerWeek.toString();
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

  //Get every lectures of users courses
  List<Lecture> getFavouriteLectures() {
    List<Lecture> lectures = [];
    //Add all favourite lectures to lectures list
    getCourses().where((c) => c.isFavourite)
        .forEach((c) => c.lecturesPerWeek.forEach((l) => lectures.add(l)));
    return _sortLectures(lectures);
  }

  //Sort lectures. Monday first
  List<Lecture> _sortLectures(List<Lecture> lectures) {
    lectures.sort((a, b) => a.sortValue() - b.sortValue());
    return lectures;
  }

  List<Lecture> getFavouriteLecturesOfWeekday(Weekday searchedWeekday) {
    List<Lecture> lectures = [];
    //Add all lectures to lectures list
    getCourses().where((c) => c.isFavourite).forEach((c) =>
        c.lecturesPerWeek
            .where((l) => l.weekday == searchedWeekday)
            .forEach((l) => lectures.add(l)));
    return _sortLectures(lectures);
  }

  //If lectures of this course conflicts with other favourite lecture return true
  bool checkIfConflictsOtherFavorite(id) {
    return getCourses()[id].lecturesPerWeek.any((thisFavorite) =>
        getFavouriteLectures().any((otherFavorite) =>
            _checkTimeConflict(thisFavorite, otherFavorite)));
  }

  bool _checkTimeConflict(Lecture thisFavorite, Lecture otherFavorite) {
    //If weekday is not same return false
    if (thisFavorite.weekday != otherFavorite.weekday)
      return false;
    //If running at same time return true
    int timeBetweenLectures = _getTimeBetweenLectures(
        thisFavorite, otherFavorite);
    if (timeBetweenLectures < 0)
      return true;
    //If time is not enough to switch campus return true
    if (!_timeIsEnoughForCampusSwitch(
        thisFavorite.campus, otherFavorite.campus, timeBetweenLectures))
      return true;
    return false;
  }

  // < 0 when lectures are running at same time
  // 0 lectures starting right after each other
  // > 0 minutes between lectures are returned
  int _getTimeBetweenLectures(Lecture thisFavorite, Lecture otherFavorite) {
    //Idea is to sub end time from start time in both ways.
    //If both vales are neg or pos courses are take place at same time.
    //If one value is positive the other negative the positive value is time between lectures
    //This only works because we can assume that endTime is later than startTime
    int valueOne = thisFavorite.startDayTime.getAsInt() -
        otherFavorite.endDayTime.getAsInt();
    int valueTwo = otherFavorite.startDayTime.getAsInt() -
        thisFavorite.endDayTime.getAsInt();

    return valueOne > valueTwo ? valueOne : valueTwo;
  }

  bool _timeIsEnoughForCampusSwitch(Campus campusOne, Campus campusTwo,
      int timeBetweenLectures) {
    return true;
  }
}
