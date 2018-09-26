import 'dart:async';
import 'dart:convert';

import 'package:cie_app/di/courses_di.dart';
import 'package:cie_app/model/course/course.dart';
import 'package:cie_app/model/course/courses.dart';
import 'package:cie_app/model/course/details/appointment.dart';
import 'package:cie_app/model/course/details/campus.dart';
import 'package:cie_app/model/course/details/courseAvailability.dart';
import 'package:cie_app/model/course/details/lecturer.dart';
import 'package:cie_app/model/course/details/weekday.dart';
import 'package:cie_app/utils/dataManager.dart';
import 'package:cie_app/utils/staticVariables.dart';
import 'package:flutter/material.dart';

abstract class CourseListViewContract {
  //Todo: Needed in future
}

class CourseListPresenter {
  Courses _courses;
  final ValueChanged<bool> onChanged;
  List<int> _coursesToDeleteOnViewChange = List<int>();

  CourseListPresenter(this.onChanged, [Flavor flavor = Flavor.PROD]) {
    CourseInjector.configure(flavor);
    _courses = new CourseInjector().courses;
  }

  // TODO: Heavily modify this function.
  // TODO: -Rename to be more relevant to update function,
  // TODO: -Check if course is already stored before adding here
  // TODO: -Make the loop contents more relevant and move it somewhere else
  Future addCoursesFromMemory() async {
    this.onChanged(true);
    List<Course> courseList = _courses.getCourses();
    bool didUpdate = false;
    var semester = await DataManager.getLatestSemester();
    DataManager.getResource(DataManager.LOCAL_COURSES + semester)
        .then((String val) {
      if (val != null) {
        final List<dynamic> jsonData = json.decode(val);
        for (int i = 0; i < jsonData.length; i++) {
          var course = new Course(jsonData[i]);
          if (isNewCourseData(courseList, course)) {
            courseList.add(course);
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

  //TODO do this everytime lecturers are fetched automatically - maybe in datamanager
  void updateLecturerInfoFromMemory() {
    DataManager.getResource(DataManager.LOCAL_LECTURERS).then((String val) {
      if (val != null) {
        final List<dynamic> jsonData = json.decode(val)['lecturers'];
        for (int i = 0; i < jsonData.length; i++) {
          for (Course c in _courses.getCourses()) {
            for (Lecturer l in c.lecturer) {
              if (l.lastName == jsonData[i]['lastName']) {
                l.email = jsonData[i]['email'];
                break; //the next lecturer could not be the same as before
              }
            }
          }
        }
      }
    });
  }

  void syncFavoritedCoursesFromMemory() {
    syncRegisteredCoursesFromMemory();
    DataManager.getResource(DataManager.LOCAL_FAVORITES)
        .then((String favoriteIds) {
      if (favoriteIds != null && favoriteIds != "") {
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

  void syncRegisteredCoursesFromMemory() {
    print("sync registered");
    DataManager.getResource(DataManager.LOCAL_SUBSCRIPTIONS)
        .then((String registeredIds) {
      if (registeredIds != null && registeredIds != "") {
        List<dynamic> registeredCourses = json.decode(registeredIds);
        for (Course c in _courses.getCourses()) {
          if (registeredCourses.contains(c.id)) {
            c.isFavourite = true;
          }
        }
      }
      commitFavoritedCoursesToMemory();
    });
  }

  void commitFavoritedCoursesToMemory() {
    // dynamic so we can easily refactor to support more data in the future
    Map<String, dynamic> toJson = new Map<String, dynamic>();
    for (Course c in _courses.getCourses()) {
      if (c.isFavourite) {
        toJson.putIfAbsent(c.id, () => c.isFavourite);
      }
    }
    DataManager.writeToFile(DataManager.LOCAL_FAVORITES, json.encode(toJson));
  }

  bool isNewCourseData(List<Course> courseList, Course candidate) {
    return courseList.firstWhere((c) => c.equals(candidate),
            orElse: () => null) ==
        null;
  }

  //Remove the courses outstanding for remove
  void deactivate() {
    _coursesToDeleteOnViewChange.clear();
  }

  void toggleFavourite(int id, bool shouldUseMemory) {
    _courses.getCourses()[id].isFavourite =
        !_courses.getCourses()[id].isFavourite;

    //TODO: make tests async doesn't work right now
    //analytics.logEvent(name: "toggle_favorite",
    //    parameters:{
    //      "name":_courses.getCourses()[id].name.toString(),
    //      "favorite":_courses.getCourses()[id].isFavourite.toString(),
    //      "department":_courses.getCourses()[id].faculty.toString(),});

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

  List<Course> getCourses() {
    return _courses.getCourses();
  }

  CourseAvailability getAvailability(int id) {
    return _courses.getCourses()[id].getAvailability();
  }

  String getDepartmentShortName(int id) {
    return _courses.getCourses()[id].department.shortName;
  }

  String getTitle(int id) {
    return _courses.getCourses()[id].name;
  }

  List<Appointment> getLectureTimes(int id) {
    return _courses.getCourses()[id].appointments;
  }

  String getDescription(int id) {
    return _courses.getCourses()[id].description;
  }

  String getSWS(int id) {
    return _courses.getCourses()[id].sws.toString();
  }

  String getEcts(int id) {
    return _courses.getCourses()[id].ects.toString();
  }

  String getNamesOfLecturers(int id) {
    return _courses.getCourses()[id].getNamesOfLecturers();
  }

  String getEmailsOfLecturers(int id) {
    var emails = "";
    for (var l in _courses.getCourses()[id].lecturer) {
      print(l.email);
      if (l.email == null || l.email == StaticVariables.MOCK_EMAIL) break;
      if (emails != "") {
        emails += ",";
      }
      emails += l.email;
    }
    return emails;
  }

  String getProfileOfLecturer(int id) {
    return _courses.getCourses()[id].lecturer[0].profile;
  }

  String getAppointmentTimesBeautiful(int id) {
    var course = _courses.getCourses()[id];
    var blocked = course.blocked;
    List<Appointment> appointments = course.appointments;
    String result = blocked ? StaticVariables.COURSE_INFO_SHORT_BLOCKED : "";
    for (var a in appointments) {
      if (result.length > 10) result += ', ';
      result += WeekdayUtility.getWeekdayAsString(a.weekday) +
          ' ' +
          a.timeBegin.toString() +
          '-' +
          a.timeEnd.toString();
    }
    return result;
  }

  //Get every lectures of users courses
  List<Appointment> getFavouriteAppointments() {
    List<Appointment> appointments = [];
    //Add all favourite lectures to lectures list
    getCourses()
        .where((c) => c.isFavourite)
        .forEach((c) => c.appointments.forEach((l) => appointments.add(l)));
    return _sortAppointments(appointments);
  }

  //Sort lectures. Monday first
  List<Appointment> _sortAppointments(List<Appointment> appointments) {
    appointments.sort((a, b) => a.sortValue() - b.sortValue());
    return appointments;
  }

  List<Appointment> getFavouriteAppointmentsOfWeekday(Weekday searchedWeekday) {
    List<Appointment> appointments = [];
    //Add all lectures to lectures list
    getCourses().where((c) => c.isFavourite).forEach((c) => c.appointments
        .where((l) => l.weekday == searchedWeekday)
        .forEach((l) => appointments.add(l)));
    return _sortAppointments(appointments);
  }

  //If lectures of this course conflicts with other favourite lecture return true
  bool checkIfConflictsOtherFavoriteCourse(id) {
    return getCourses()[id].appointments.any((thisFavorite) =>
        getFavouriteAppointments().any((otherFavorite) =>
            _checkTimeConflict(thisFavorite, otherFavorite)));
  }

  //If lectures of this course conflicts with other favourite lecture return true
  bool checkIfConflictsOtherFavoriteLecture(Appointment appointment) {
    return getFavouriteAppointments()
        .any((otherFavorite) => _checkTimeConflict(appointment, otherFavorite));
  }

  //If lectures of this course conflicts with other favourite lecture return true
  List<Appointment> getConflictingLectures(int id) {
    return getFavouriteAppointments()
        .where((l) =>
            getCourses()[id].appointments.any((c) => _checkTimeConflict(c, l)))
        .toList();
  }

  bool _checkTimeConflict(Appointment thisFavorite, Appointment otherFavorite) {
    //Cant conflict itself
    if (thisFavorite == otherFavorite) return false;
    if (thisFavorite.parent.id == otherFavorite.parent.id) return false;
    //If weekday is not same return false
    if (thisFavorite.weekday != otherFavorite.weekday) return false;
    //If running at same time return true
    int timeBetweenLectures =
        _getTimeBetweenLectures(thisFavorite, otherFavorite);
    if (timeBetweenLectures < 0) return true;
    //If time is not enough to switch campus return true
    if (!_timeIsEnoughForCampusSwitch(thisFavorite.getCampus(),
        otherFavorite.getCampus(), timeBetweenLectures)) return true;
    return false;
  }

  // < 0 when lectures are running at same time
  // 0 lectures starting right after each other
  // > 0 minutes between lectures are returned
  int _getTimeBetweenLectures(
      Appointment thisFavorite, Appointment otherFavorite) {
    //Idea is to sub end time from start time in both ways.
    //If both vales are neg or pos courses are take place at same time.
    //If one value is positive the other negative the positive value is time between lectures
    //This only works because we can assume that endTime is later than startTime
    int valueOne =
        thisFavorite.timeBegin.getAsInt() - otherFavorite.timeEnd.getAsInt();
    int valueTwo =
        otherFavorite.timeBegin.getAsInt() - thisFavorite.timeEnd.getAsInt();

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

  String constructSchedulingConflictText(Appointment one, Appointment two) {
    String campusOne = CampusUtility.getCampusAsLongString(one.getCampus());
    String campusTwo = CampusUtility.getCampusAsLongString(two.getCampus());
    String time = _timeRequiredForCampusSwitch(one.getCampus(), two.getCampus())
        .toString();
    return one.parent.name +
        " is held in the " +
        campusOne +
        " campus, and " +
        two.parent.name +
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
      reason
          .add(StaticVariables.COURSE_DESCRIPTION_CONFLICTS_WITH_OTHER_FAVORIT);
    else
      reason.add(StaticVariables.COURSE_DESCRIPTION_CONFLICTS_WITH_FAVORIT);

    //Find courses who conflicts and why there is a conflict
    List<Appointment> conflicts = getConflictingLectures(id);
    if (conflicts != null) {
      Set<Course> conflictingCourses = conflicts.map((l) => l.parent).toSet();
      conflictingCourses.forEach((c) =>
          reason.insert(1, "\n" + _getConflictReasonText(getCourses()[id], c)));
    }

    return reason;
  }

  //Generated a text which shows the user why this course conflicts with other courses
  String _getConflictReasonText(Course thisFavorite, Course otherFavorite) {
    String result = otherFavorite.name + ": ";
    //Add commute time conflict text
    thisFavorite.appointments.forEach((l) => otherFavorite.appointments
        .forEach((f) => result = _getLectureConflictProblemText(result, l, f)));
    //timeBetweenLecturesText.forEach((res) => result += res);

    return result;
  }

  //Compare two lectues and return error text if they conflict
  String _getLectureConflictProblemText(
      String result, Appointment l, Appointment f) {
    String localResult = "";

    if (_getTimeBetweenLectures(l, f) < 0) {
      localResult += "Lecture time schedules overlap.\n";
    } else {
      Campus campusOne = l.getCampus();
      Campus campusTwo = f.getCampus();
      if (campusOne == Campus.LOTHSTRASSE && campusTwo == Campus.KARLSTRASSE ||
          campusTwo == Campus.LOTHSTRASSE && campusOne == Campus.KARLSTRASSE) {
        localResult += "Commute Time between Lothstrasse and Karlstrasse < " +
            StaticVariables.CAMPUS_COMMUTE_MIN_LOTH_KARL.toString();
      } else if (campusOne == Campus.LOTHSTRASSE &&
              campusTwo == Campus.PASING ||
          campusTwo == Campus.LOTHSTRASSE && campusOne == Campus.PASING) {
        localResult += "Commute Time between Lothstrasse and Pasing < " +
            StaticVariables.CAMPUS_COMMUTE_MIN_LOTH_PAS.toString();
      } else {
        localResult += "Commute Time between Pasing and Karlstrstrasse < " +
            StaticVariables.CAMPUS_COMMUTE_MIN_PAS_KARL.toString();
      }
    }
    if (!result.contains(localResult)) {
      result += localResult;
    }
    return result;
  }
}
