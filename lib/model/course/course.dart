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
}

class Lecture {
  final Weekday weekday;
  final DayTime startDayTime;
  final DayTime endDayTime;

  Lecture(this.weekday, this.startDayTime, this.endDayTime);

  @override
  String toString() {
    return weekday.toString() + ":" + startDayTime.toString() + "-" +
        endDayTime.toString();
  }
}

class DayTime {
  final int hour;
  final int minute;

  DayTime(this.hour, this.minute);
}

enum Weekday { Mon, Tue, Wed, The, Fri, Sat, Sun }

enum CourseAvailability { AVAILABLE, PENDING, UNAVAILABLE }