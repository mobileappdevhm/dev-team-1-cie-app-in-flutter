class Course {
  final String name;
  final String faculty;
  final List<Lecture> lecturesPerWeek;
  final String description;
  final int hoursPerWeek;
  final int ects;
  final String professorEmail;
  final String professorName;
  final CourseAvailability available;
  bool isFavourite;

  Course(this.name, this.faculty, this.lecturesPerWeek, this.description,
      this.hoursPerWeek, this.ects, this.professorEmail, this.professorName,
      this.available, this.isFavourite) {
    //Set this course as parent of every lectures contained
    //Required for timetable
    lecturesPerWeek.forEach((l) => l.course = this);
  }

  bool occursOnDay(Weekday weekDay) {
    //Is there a lecture on searched day
    return lecturesPerWeek.any((lecture) => lecture.weekday == weekDay);
  }
}

class Lecture {
  final Campus campus;
  final Weekday weekday;
  final DayTime startDayTime;
  final DayTime endDayTime;
  final String room;
  Course course;

  Lecture(this.campus, this.weekday, this.startDayTime, this.endDayTime,
      this.room);

  //Return int which helps to get the order of lectures in week correct
  int sortValue() {
    // result looks like: whhmm
    return WeekdayUtility.getWeekdayAsInt(weekday) * 10000 +
        startDayTime.hour * 100 + startDayTime.minute;
  }
}

class DayTime {
  final int hour;
  final int minute;

  DayTime(this.hour, this.minute);

  @override
  String toString() {
    String hourString = hour.toString();
    if (hour <= 9)
      hourString = "0" + hourString;

    String minuteString = minute.toString();
    if (minute <= 9)
      minuteString = "0" + minuteString;

    return '$hourString:$minuteString';
  }
}

class CourseDefinitions {
  static const List<String> DEPARTMENTS = [
    "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12",
    "13", "14"
  ];
}

enum CourseAvailability { AVAILABLE, PENDING, UNAVAILABLE }
enum Weekday { Mon, Tue, Wed, The, Fri, Sat, Sun }
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

  static CourseAvailability intToCourseAvailability (int i) {
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
}



//class FacultyUtility {
//  static int getFacultyAsInt(Faculty f) {
//    switch (f) {
//      case Faculty.ZERO:
//        return 0;
//      case Faculty.ONE:
//        return 1;
//      case Faculty.TWO:
//        return 2;
//      case Faculty.THREE:
//        return 3;
//      case Faculty.FOUR:
//        return 4;
//      case Faculty.FIVE:
//        return 5;
//      case Faculty.SIX:
//        return 6;
//      case Faculty.SEVEN:
//        return 7;
//      case Faculty.EIGHT:
//        return 8;
//      case Faculty.NINE:
//        return 9;
//      case Faculty.TEN:
//        return 10;
//      case Faculty.ELEVEN:
//        return 11;
//      case Faculty.TWELVE:
//        return 12;
//      case Faculty.THIRTEEN:
//        return 13;
//    }
//    return 0;
//  }
//
//  static Faculty intToFaculty(int i) {
//    switch (i) {
//      case 0:
//        return Faculty.ZERO;
//      case 1:
//        return Faculty.ONE;
//      case 2:
//        return Faculty.TWO;
//      case 3:
//        return Faculty.THREE;
//      case 4:
//        return Faculty.FOUR;
//      case 5:
//        return Faculty.FIVE;
//      case 6:
//        return Faculty.SIX;
//      case 7:
//        return Faculty.SEVEN;
//      case 8:
//        return Faculty.EIGHT;
//      case 9:
//        return Faculty.NINE;
//      case 10:
//        return Faculty.TEN;
//      case 11:
//        return Faculty.ELEVEN;
//      case 12:
//        return Faculty.TWELVE;
//      case 13:
//        return Faculty.THIRTEEN;
//    }
//    return Faculty.ZERO;
//  }
//
//  static String getFacultyAsString(Faculty f) {
//    switch (f) {
//      case Faculty.ZERO:
//        return "00";
//      case Faculty.ONE:
//        return "01";
//      case Faculty.TWO:
//        return "02";
//      case Faculty.THREE:
//        return "03";
//      case Faculty.FOUR:
//        return "04";
//      case Faculty.FIVE:
//        return "05";
//      case Faculty.SIX:
//        return "06";
//      case Faculty.SEVEN:
//        return "07";
//      case Faculty.EIGHT:
//        return "08";
//      case Faculty.NINE:
//        return "09";
//      case Faculty.TEN:
//        return "10";
//      case Faculty.ELEVEN:
//        return "11";
//      case Faculty.TWELVE:
//        return "12";
//      case Faculty.THIRTEEN:
//        return "13";
//    }
//    // Not reachable.
//    return "";
//  }
//}

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
      case Weekday.The:
        return "The";
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
      case Weekday.The:
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
        return Weekday.The;
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
