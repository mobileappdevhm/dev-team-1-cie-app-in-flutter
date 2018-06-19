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
      syncFavoritedCoursesFromMemory();
    });
  }

  void syncFavoritedCoursesFromMemory() {
    FileStore.readFileAsString(FileStore.FAVORITES).then((String favoriteIds) {
      if (favoriteIds != null) {
        dynamic favoritesJson = json.decode(favoriteIds);
        for (Course c in _courses.getCourses()) {
          if (favoritesJson[c.id] != null) {
            c.isFavourite = true;
          }
        }
      }
      this.onChanged(true);
    });
  }

  void commitFavoritedCoursesToMemory() {
    // dynamic so we can easily refactor to support more data in the future
    Map<String, dynamic> toJson = new Map<String, dynamic>();
    for (Course c in _courses.getCourses()) {
      if (c.isFavourite) {
        toJson.putIfAbsent(c.id, ()=>c.isFavourite);
      }
    }
    FileStore.writeToFile(FileStore.FAVORITES, json.encode(toJson));
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

  void toggleFavourite(int id, bool shouldUseMemory) {
    _courses.getCourses()[id].isFavourite =
      !_courses.getCourses()[id].isFavourite;
    if (shouldUseMemory) {
      commitFavoritedCoursesToMemory();
    }
  }

  void toggleFavouriteWhenChangeView(int id) {
    toggleFavourite(id, true);
    _coursesToDeleteOnViewChange.contains(id) ?
      _coursesToDeleteOnViewChange.remove(id) :
      _coursesToDeleteOnViewChange.add(id);
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
    getCourses().where((c) => c.isFavourite).forEach((c) => c.lecturesPerWeek
        .where((l) => l.weekday == searchedWeekday)
        .forEach((l) => lectures.add(l)));
    return _sortLectures(lectures);
  }
}
