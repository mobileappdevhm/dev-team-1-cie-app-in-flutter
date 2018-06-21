import 'package:cie_team1/model/course/details/correlation.dart';
import 'package:cie_team1/model/course/details/date.dart';
import 'package:cie_team1/utils/cieColor.dart';
import 'package:flutter/material.dart';

class CourseBuilder {
  /* FIELDS FROM NINE */
  String id;
  String description;
  bool isCoterie;
  bool hasHomeBias;
  List<Correlation> correlations;
  List<Date> dates;
  String name;
  String shortName;
  List<dynamic> actions;

  String faculty;
  List<Lecture> lecturesPerWeek;
  int hoursPerWeek;
  int ects;
  String professorEmail;
  String professorName;
  CourseAvailability available;
  bool isFavourite;

  // Standard Builder Pattern Implementation
  CourseBuilder withId(String id) {
    this.id = id;
    return this;
  }

  CourseBuilder withDescription(String description) {
    this.description = description;
    return this;
  }

  CourseBuilder withIsCoterie(bool isCoterie) {
    this.isCoterie = isCoterie;
    return this;
  }

  CourseBuilder withhasHomeBias(bool hasHomeBias) {
    this.hasHomeBias = hasHomeBias;
    return this;
  }

  CourseBuilder withCorrelations(List<dynamic> correlations) {
    this.correlations = correlations;
    return this;
  }

  CourseBuilder withdates(List<dynamic> dates) {
    this.dates = dates;
    return this;
  }

  CourseBuilder withName(String name) {
    this.name = name;
    return this;
  }

  CourseBuilder withShortName(String shortName) {
    this.shortName = shortName;
    return this;
  }

  CourseBuilder withActions(List<dynamic> actions) {
    this.actions = actions;
    return this;
  }

  CourseBuilder withFaculty(String faculty) {
    this.faculty = faculty;
    return this;
  }

  CourseBuilder withLecturesPerWeek(List<Lecture> lecturesPerWeek) {
    this.lecturesPerWeek = lecturesPerWeek;
    return this;
  }

  CourseBuilder withHoursPerWeek(int hoursPerWeek) {
    this.hoursPerWeek = hoursPerWeek;
    return this;
  }

  CourseBuilder withEcts(int ects) {
    this.ects = ects;
    return this;
  }

  CourseBuilder withProfessorEmail(String professorEmail) {
    this.professorEmail = professorEmail;
    return this;
  }

  CourseBuilder withProfessorName(String professorName) {
    this.professorName = professorName;
    return this;
  }

  CourseBuilder withIsFavorite(bool isFavorite) {
    this.isFavourite = isFavorite;
    return this;
  }

  static String buildProfessorName(dynamic jsonData) {
    dynamic professor = (jsonData['dates'][0]['lecturer'][0]);
    String title = professor['title'].toString();
    title = title != "null" ? title + " " : "";
    String firstName = professor['firstName'].toString();
    firstName = firstName != "null" ? firstName + " " : "";
    String lastName = professor['lastName'].toString();
    lastName = lastName != "null" ? lastName : "";
    return title + firstName + lastName;
  }

  static String buildDescription(dynamic jsonData) {
    return jsonData['description'] != null ? jsonData['description'] : "";
  }

  factory CourseBuilder.fromJson(Map<String, dynamic> jsonData) {
    String dep = ((jsonData['correlations'][0]['organiser']));
    return new CourseBuilder(
        id: jsonData['id'],
        description: buildDescription(jsonData),
        isCoterie: jsonData['isCoterie'],
        hasHomeBias: jsonData['hasHomeBias'],
        correlations: CorrelationBuilder.fromJson(jsonData['correlations']),
        dates: DateBuilder.fromJson(jsonData['dates']),
        name: jsonData['name'],
        shortName: jsonData['shortName'],
        actions: jsonData['actions'],
        faculty: dep.substring(3, dep.length),
        professorName: buildProfessorName(jsonData));
  }

  CourseBuilder(
      {this.id,
      this.description,
      this.isCoterie,
      this.hasHomeBias,
      this.correlations,
      this.dates,
      this.name,
      this.shortName,
      this.actions,
      this.faculty,
      this.professorName});

  Course build() {
    //isCoterie: false && hasHomeBias: false -> green course
    if (!isCoterie && !hasHomeBias) {
      this.available = CourseAvailability.AVAILABLE;
    }
    //isCoterie: false && hasHomeBias: true -> yellow course
    else if (!isCoterie && hasHomeBias) {
      this.available = CourseAvailability.PENDING;
    }
    //isCoterie: true && hasHomeBias: true -> red course
    else if (isCoterie && hasHomeBias) {
      this.available = CourseAvailability.UNAVAILABLE;
    }
    return new Course(
        this.id,
        this.description,
        this.isCoterie,
        this.hasHomeBias,
        this.correlations,
        this.dates,
        this.name,
        this.shortName,
        this.actions,
        this.faculty,
        this.lecturesPerWeek,
        this.hoursPerWeek,
        this.ects,
        this.professorEmail,
        this.professorName,
        this.available,
        this.isFavourite);
  }
}

class Course {
  String id;
  String description;
  bool isCoterie;
  bool hasHomeBias;
  List<Correlation> correlations;
  List<Date> dates;
  String name;
  String shortName;
  List<dynamic> actions;

  //final String name;
  final String faculty;
  final List<Lecture> lecturesPerWeek;

  //final String description;
  final int hoursPerWeek;
  final int ects;
  final String professorEmail;
  final String professorName;
  final CourseAvailability available;
  bool isFavourite;

  Course(
      this.id,
      this.description,
      this.isCoterie,
      this.hasHomeBias,
      this.correlations,
      this.dates,
      this.name,
      this.shortName,
      this.actions,
      //this.name,
      this.faculty,
      this.lecturesPerWeek,
      //this.description,
      this.hoursPerWeek,
      this.ects,
      this.professorEmail,
      this.professorName,
      this.available,
      this.isFavourite) {
    //Set this course as parent of every lectures contained
    //Required for timetable
    lecturesPerWeek.forEach((l) => l.course = this);
  }

  bool occursOnDay(Weekday weekDay) {
    //Is there a lecture on searched day
    return lecturesPerWeek.any((lecture) => lecture.weekday == weekDay);
  }

  bool equals(Course course) {
    // we can expect that ids will be unique from the nine API
    return (this.id == course.id);
  }
}

class Lecture {
  final Campus campus;
  final Weekday weekday;
  final DayTime startDayTime;
  final DayTime endDayTime;
  final String room;
  Course course;

  Lecture(
      this.campus, this.weekday, this.startDayTime, this.endDayTime, this.room);

  //Return int which helps to get the order of lectures in week correct
  int sortValue() {
    // result looks like: whhmm
    return WeekdayUtility.getWeekdayAsInt(weekday) * 10000 +
        startDayTime.hour * 100 +
        startDayTime.minute;
  }
}

class DayTime {
  final int hour;
  final int minute;

  DayTime(this.hour, this.minute);

  @override
  String toString() {
    String hourString = hour.toString();
    if (hour <= 9) hourString = "0" + hourString;

    String minuteString = minute.toString();
    if (minute <= 9) minuteString = "0" + minuteString;

    return '$hourString:$minuteString';
  }

  int getAsInt() {
    return hour * 60 + minute;
  }
}

//Todo: This needs to be replaced with enum style of implementation in future see below
class CourseDefinitions {
  static const List<String> DEPARTMENTS = [
    "01",
    "02",
    "03",
    "04",
    "05",
    "06",
    "07",
    "08",
    "09",
    "10",
    "11",
    "12",
    "13",
    "14"
  ];
}

enum CourseAvailability { AVAILABLE, PENDING, UNAVAILABLE }
enum Weekday { Mon, Tue, Wed, Thu, Fri, Sat, Sun }
enum Campus { KARLSTRASSE, LOTHSTRASSE, PASING }
//enum Faculty {
//  ZERO,
//  ONE,
//  TWO,
//  THREE,
//  FOUR,
//  FIVE,
//  SIX,
//  SEVEN,
//  EIGHT,
//  NINE,
//  TEN,
//  ELEVEN,
//  TWELVE,
//  THIRTEEN
//}

class CourseAvailabilityUtility {
  static int getFacultyAsInt(CourseAvailability a) {
    switch (a) {
      case CourseAvailability.AVAILABLE:
        return 0;
      case CourseAvailability.PENDING:
        return 1;
      case CourseAvailability.UNAVAILABLE:
        return 2;
    }
    return 0;
  }

  static CourseAvailability intToCourseAvailability(int i) {
    switch (i) {
      case 0:
        return CourseAvailability.AVAILABLE;
      case 1:
        return CourseAvailability.PENDING;
      case 2:
        return CourseAvailability.UNAVAILABLE;
    }
    return CourseAvailability.AVAILABLE;
  }

  static Widget intToColoredString(CourseAvailability i, double size) {
    switch (i) {
      case CourseAvailability.AVAILABLE:
        return new Text(
          "Available",
          style: new TextStyle(
            fontSize: size,
            color: CiEColor.green,
          ),
        );
      case CourseAvailability.PENDING:
        return new Text(
          "Pending",
          style: new TextStyle(
            fontSize: size,
            color: CiEColor.yellow,
          ),
        );
      case CourseAvailability.UNAVAILABLE:
        return new Text(
          "Unavailable",
          style: new TextStyle(
            fontSize: size,
            color: CiEColor.red,
          ),
        );
    }
    return null;
  }
}

class CampusUtility {
  static Campus getStringAsCampus(String campus) {
    switch (campus) {
      case "Karlstrasse":
        return Campus.KARLSTRASSE;
        break;
      case "Pasing":
        return Campus.PASING;
        break;
      default:
        return Campus.LOTHSTRASSE;
    }
  }

  static String getCampusAsString(Campus campus) {
    switch (campus) {
      case Campus.KARLSTRASSE:
        return "Karl.";
      case Campus.LOTHSTRASSE:
        return "Loth.";
      case Campus.PASING:
        return "Pasing";
    }
    return "";
  }

  static String getCampusAsLongString(Campus campus) {
    switch (campus) {
      case Campus.KARLSTRASSE:
        return "Karlstrasse";
      case Campus.LOTHSTRASSE:
        return "Lothstrasse";
      case Campus.PASING:
        return "Pasing";
    }
    return "";
  }
}

//This is not beautiful but there are no enums with assigned values since yet
class WeekdayUtility {
  static String getWeekdayAsString(Weekday day) {
    switch (day) {
      case Weekday.Mon:
        return "Mon";
      case Weekday.Tue:
        return "Tue";
      case Weekday.Wed:
        return "Wed";
      case Weekday.Thu:
        return "Thu";
      case Weekday.Fri:
        return "Fri";
      case Weekday.Sat:
        return "Sat";
      case Weekday.Sun:
        return "Sun";
    }
    // Not reachable.
    return "";
  }
  static String getWeekdayAsLongString(Weekday day) {
    switch (day) {
      case Weekday.Mon:
        return "Monday";
      case Weekday.Tue:
        return "Tuesday";
      case Weekday.Wed:
        return "Wednesday";
      case Weekday.Thu:
        return "Thursday";
      case Weekday.Fri:
        return "Friday";
      case Weekday.Sat:
        return "Saturday";
      case Weekday.Sun:
        return "Sunday";
    }
    // Not reachable.
    return "";
  }

  static int getWeekdayAsInt(Weekday day) {
    switch (day) {
      case Weekday.Mon:
        return 0;
      case Weekday.Tue:
        return 1;
      case Weekday.Wed:
        return 2;
      case Weekday.Thu:
        return 3;
      case Weekday.Fri:
        return 4;
      case Weekday.Sat:
        return 5;
      case Weekday.Sun:
        return 6;
    }
    // Not reachable.
    return 0;
  }

  static Weekday intToWeekday(int day) {
    switch (day) {
      case 0:
        return Weekday.Mon;
      case 1:
        return Weekday.Tue;
      case 2:
        return Weekday.Wed;
      case 3:
        return Weekday.Thu;
      case 4:
        return Weekday.Fri;
      case 5:
        return Weekday.Sat;
      case 6:
        return Weekday.Sun;
    }
    // Not reachable.
    return Weekday.Sun;
  }

  static Weekday getCurrentWeekday() {
    var now = new DateTime.now();
    return intToWeekday(now.weekday - 1);
  }
}
