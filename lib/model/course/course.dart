import 'package:cie_team1/utils/cieColor.dart';
import 'package:flutter/material.dart';

class CourseBuilder {
  /* FIELDS FROM NINE */
  //TODO: Implement These & Merge, delete nineAPIConsumer.dart's NineCourse class
  String id;
  String description;
  bool isCoterie;
  bool hasHomeBias;
  List<dynamic> correlations;
  List<dynamic> dates;
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
    this.description=description;
    return this;
  }
  CourseBuilder withIsCoterie(bool isCoterie) {
    this.isCoterie=isCoterie;
    return this;
  }
  CourseBuilder withhasHomeBias(bool hasHomeBias) {
    this.hasHomeBias=hasHomeBias;
    return this;
  }
  CourseBuilder withCorrelations(List<dynamic> correlations) {
    this.correlations=correlations;
    return this;
  }
  CourseBuilder withdates(List<dynamic> dates) {
    this.dates=dates;
    return this;
  }
  CourseBuilder withName(String name) {
    this.name=name;
    return this;
  }
  CourseBuilder withShortName(String shortName) {
    this.shortName=shortName;
    return this;
  }
  CourseBuilder withActions(List<dynamic >actions) {
    this.actions=actions;
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
  CourseBuilder withAvailable(CourseAvailability available) {
    this.available = available;
    return this;
  }
  CourseBuilder withIsFavorite(bool isFavorite) {
    this.isFavourite = isFavorite;
    return this;
  }

  factory CourseBuilder.fromJson(Map<String, dynamic> jsonData) {
    String dep = ((jsonData['correlations'][0]['organiser']));
    return new CourseBuilder(
      id: jsonData['id'],
      description: jsonData['description'],
      isCoterie: jsonData['isCoterie'],
      hasHomeBias: jsonData['hasHomeBias'],
      correlations: jsonData['correlations'],
      dates: jsonData['dates'],
      name: jsonData['name'],
      shortName: jsonData['shortName'],
      actions: jsonData['actions'],
      faculty: dep.substring(3, dep.length)
    );
  }

  CourseBuilder({this.id, this.description, this.isCoterie, this.hasHomeBias,
    this.correlations, this.dates, this.name, this.shortName, this.actions,
    this.faculty});

  Course build(){
    return new Course(
      this.id, this.description, this.isCoterie, this.hasHomeBias,
      this.correlations, this.dates, this.name, this.shortName, this.actions,
      this.faculty, this.lecturesPerWeek, this.hoursPerWeek, this.ects,
      this.professorEmail, this.professorName, this.available, this.isFavourite);
  }
}

class Course {
  String id;
  String description;
  bool isCoterie;
  bool hasHomeBias;
  List<dynamic> correlations;
  List<dynamic> dates;
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
      this.isFavourite
      ) {
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
