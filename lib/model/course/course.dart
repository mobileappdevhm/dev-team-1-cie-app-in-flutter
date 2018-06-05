class Course {
  final String name;
  final String faculty;
  final List<Lecture> lecturesPerWeak;
  final String description;
  final int hoursPerWeak;
  final int ects;
  final String professorEmail;
  final String professorName;
  final int availableForStudent;
  bool isFavourite;
  final CourseAvailability availability;

  Course(this.name, this.faculty, this.lecturesPerWeak, this.description,
      this.hoursPerWeak, this.ects, this.professorEmail, this.professorName,
      this.availableForStudent, this.isFavourite, this.availability) {
    //Set this course as parent of every lectures contained
    //Required for timetable
    lecturesPerWeak.forEach((l) => l.course = this);
  }

  bool occursOnDay(Weekday weekDay) {
    //Is there a lecture on searched day
    return lecturesPerWeak.any((lecture) => lecture.weekday == weekDay);
  }
}

class Lecture {
  final Weekday weekday;
  final DayTime startDayTime;
  final DayTime endDayTime;
  Course course;

  Lecture(this.weekday, this.startDayTime, this.endDayTime);

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

enum Weekday { Mon, Tue, Wed, The, Fri, Sat, Sun }

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
}

enum CourseAvailability { AVAILABLE, PENDING, UNAVAILABLE }