import 'dart:convert';

import 'package:cie_team1/di/courses_di.dart';
import 'package:cie_team1/model/course/course.dart';
import 'package:cie_team1/model/course/courses.dart';
import 'package:cie_team1/model/course/details/date.dart';
import 'package:cie_team1/model/user/currentUser.dart';
import 'package:cie_team1/utils/fileStore.dart';
import 'package:cie_team1/utils/staticVariables.dart';
import 'package:flutter/material.dart';

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
          Campus campus;
          DateTime begin;
          DateTime end;
          String roomNumber;
          Date date;
          if (courseBuilder.dates.length > 0) {
            for (int i = 0; i < courseBuilder.dates.length; i++) {
              if (!courseBuilder.dates[i].isCanceled)
                date = courseBuilder.dates[i];
            }
            if (date != null && date.rooms != null && date.rooms.length > 0) {
              //real data
              begin = DateTime.parse(date.begin);
              end = DateTime.parse(date.end);
              roomNumber = date.rooms[0].number;
              campus = CampusUtility.getStringAsCampus(date.rooms[0].campus);
            } else {
              //unknown data
              begin = DateTime.parse(courseBuilder.dates[0].begin);
              end = DateTime.parse(courseBuilder.dates[0].end);
              roomNumber = "unknown";
              campus = Campus.LOTHSTRASSE;
            }
          } else {
            //completely unknown data
            begin = new DateTime.now();
            end = new DateTime.now();
            roomNumber = "unknown";
            campus = Campus.LOTHSTRASSE;
          }

          courseBuilder
              .withLecturesPerWeek([
                new Lecture(
                    campus,
                    WeekdayUtility.intToWeekday((begin.day - 1) % 6),
                    new DayTime(begin.hour, begin.minute),
                    new DayTime(end.hour, end.minute),
                    roomNumber)
              ])
              .withHoursPerWeek(2)
              .withEcts(2)
          //TODO replace with professor email if available
              .withProfessorEmail("example@hm.edu")
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
    getCourses()
        .where((c) => c.isFavourite)
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

  //If lectures of this course conflicts with other favourite lecture return true
  bool checkIfConflictsOtherFavoriteCourse(id) {
    return getCourses()[id].lecturesPerWeek.any((thisFavorite) =>
        getFavouriteLectures().any((otherFavorite) =>
            _checkTimeConflict(thisFavorite, otherFavorite)));
  }

  //If lectures of this course conflicts with other favourite lecture return true
  bool checkIfConflictsOtherFavoriteLecture(Lecture lecture) {
    return getFavouriteLectures()
        .any((otherFavorite) => _checkTimeConflict(lecture, otherFavorite));
  }

  //If lectures of this course conflicts with other favourite lecture return true
  List<Lecture> getConflictingLectures(int id) {
    return getFavouriteLectures().where((l) => getCourses()[id].lecturesPerWeek.any((c) => _checkTimeConflict(c, l))).toList();
  }

  bool _checkTimeConflict(Lecture thisFavorite, Lecture otherFavorite) {
    //Cant conflict itself
    if (thisFavorite == otherFavorite) return false;
    //If weekday is not same return false
    if (thisFavorite.weekday != otherFavorite.weekday) return false;
    //If running at same time return true
    int timeBetweenLectures =
    _getTimeBetweenLectures(thisFavorite, otherFavorite);
    if (timeBetweenLectures < 0) return true;
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

  bool _timeIsEnoughForCampusSwitch(
      Campus campusOne, Campus campusTwo, int timeBetweenLectures) {
    if (campusOne == Campus.LOTHSTRASSE && campusTwo == Campus.KARLSTRASSE ||
        campusTwo == Campus.LOTHSTRASSE && campusOne == Campus.KARLSTRASSE) {
      return timeBetweenLectures >=
          StaticVariables.CAMPUS_COMMUTE_MIN_LOTH_KARL;
    } else if (campusOne == Campus.LOTHSTRASSE && campusTwo == Campus.PASING ||
        campusTwo == Campus.LOTHSTRASSE && campusOne == Campus.PASING) {
      return timeBetweenLectures >= StaticVariables.CAMPUS_COMMUTE_MIN_LOTH_PAS;
    } else {
      return timeBetweenLectures >= StaticVariables.CAMPUS_COMMUTE_MIN_PAS_KARL;
    }
  }

  int _timeRequiredForCampusSwitch(Campus campusOne, Campus campusTwo) {
    if (campusOne == Campus.LOTHSTRASSE && campusTwo == Campus.KARLSTRASSE ||
        campusTwo == Campus.LOTHSTRASSE && campusOne == Campus.KARLSTRASSE) {
      return StaticVariables.CAMPUS_COMMUTE_MIN_LOTH_KARL;
    } else if (campusOne == Campus.LOTHSTRASSE && campusTwo == Campus.PASING ||
        campusTwo == Campus.LOTHSTRASSE && campusOne == Campus.PASING) {
      return StaticVariables.CAMPUS_COMMUTE_MIN_LOTH_PAS;
    } else {
      return StaticVariables.CAMPUS_COMMUTE_MIN_PAS_KARL;
    }
  }

  String constructSchedulingConflictText(Lecture one, Lecture two) {
    String campusOne = CampusUtility.getCampusAsLongString(one.campus);
    String campusTwo = CampusUtility.getCampusAsLongString(two.campus);
    String time =
    _timeRequiredForCampusSwitch(one.campus, two.campus).toString();
    return one.course.name +
        " is held in the " +
        campusOne +
        " campus, and " +
        two.course.name +
        " is held in the " +
        campusTwo +
        " campus.\n\n"
            "Please consider that the commute between the " +
        campusOne +
        " and the " +
        campusTwo +
        " campus may take more than " +
        time +
        " minutes.\n\nYou may not arrive to class on time.";
  }

  //Returns a list with two strings
  List<String> getCourseDescriptionConflictText(int id) {
    List<String> reason = new List<String>();

    if (getCourses()[id].isFavourite)
      reason.add(StaticVariables.COURSE_DESCRIPTION_CONFLICTS_WITH_OTHER_FAVORIT);
    else
      reason.add(StaticVariables.COURSE_DESCRIPTION_CONFLICTS_WITH_FAVORIT);

    //Find courses who conflicts and why there is a conflict
    List<Lecture> conflicts = getConflictingLectures(id);
    if (conflicts != null) {
      Set<Course> conflictingCourses =
      conflicts.map((l) => l.course).toSet();
      conflictingCourses.forEach(
              (c) => reason.insert(1, "\n" + _getConflictReasonText(getCourses()[id], c)));
    }

    return reason;
  }

  //Generated a text which shows the user why this course conflicts with other courses
  String _getConflictReasonText(Course thisFavorite, Course otherFavorite) {
    String result = otherFavorite.name + ": ";
    //Add commute time conflict text
    thisFavorite.lecturesPerWeek
        .forEach((l) => otherFavorite.lecturesPerWeek
        .forEach((f) => result += _getLectureConflictProblemText(l, f)));
    //timeBetweenLecturesText.forEach((res) => result += res);

    return result;
  }

  //Compare two lectues and return error text if they conflict
  String _getLectureConflictProblemText(Lecture l, Lecture f) {
    String result = "";

    if (_getTimeBetweenLectures(l, f) < 0) {
      result += "Lecture time schedules overlap.";
    } else {
      Campus campusOne = l.campus;
      Campus campusTwo = f.campus;
      if (campusOne == Campus.LOTHSTRASSE && campusTwo == Campus.KARLSTRASSE ||
          campusTwo == Campus.LOTHSTRASSE && campusOne == Campus.KARLSTRASSE) {
        result += "Commute Time Lothstr. to Karlstr. < " +
            StaticVariables.CAMPUS_COMMUTE_MIN_LOTH_KARL.toString();
      } else
      if (campusOne == Campus.LOTHSTRASSE && campusTwo == Campus.PASING ||
          campusTwo == Campus.LOTHSTRASSE && campusOne == Campus.PASING) {
        result += "Commute Time Lothstr. to Pasing < " +
            StaticVariables.CAMPUS_COMMUTE_MIN_LOTH_PAS.toString();
      } else {
        result += "Commute Time Pasing to Karlstr. < " +
            StaticVariables.CAMPUS_COMMUTE_MIN_PAS_KARL.toString();
      }
    }

    return result;
  }
}
