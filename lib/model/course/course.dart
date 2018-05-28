class Course {
  final String name;
  final String faculty;
  final String lectureTime;
  final String description;
  final int hoursPerWeek;
  final int ects;
  final String professorEmail;
  final String professorName;
  final int availableForStudent;
  bool isFavourite;
  final int availability;

  Course(this.name, this.faculty, this.lectureTime, this.description,
      this.hoursPerWeek, this.ects, this.professorEmail, this.professorName,
      this.availableForStudent, this.isFavourite, this.availability);
}

class CourseDefinitions {
  static const int AVAILABILITY_AVAILABLE = 0;
  static const int AVAILABILITY_PENDING = 1;
  static const int AVAILABILITY_UNAVAILABLE = 2;
  static const List<String> DEPARTMENTS = [
    "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12",
    "13", "14"
  ];
}