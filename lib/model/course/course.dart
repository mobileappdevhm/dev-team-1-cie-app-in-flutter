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
      this.availableForStudent, this.isFavourite, this.availability);

  bool occursOnDay(Weekday weekDay) {
    //Is there a lecture on searched day
    return lecturesPerWeak.any((lecture) => lecture.weekday == weekDay);
  }
}

class Lecture {
  final Weekday weekday;
  final DayTime startDayTime;
  final DayTime endDayTime;

  Lecture(this.weekday, this.startDayTime, this.endDayTime);
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
  static String getWeekdayAsString(Weekday day){
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
}

enum CourseAvailability { AVAILABLE, PENDING, UNAVAILABLE }