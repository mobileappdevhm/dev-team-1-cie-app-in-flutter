class Course {
  final String name;
  final String faculty;
  final String date;
  final String startTime;
  final String endTime;
  final String description;
  final int hoursPerWeak;
  final int ects;
  final String professorEmail;
  final String professorName;
  final int availableForStudent;
  bool isFavourite;
  final int availability;

  Course(this.name, this.faculty, this.date, this.startTime, this.endTime, this.description,
      this.hoursPerWeak, this.ects, this.professorEmail, this.professorName,
      this.availableForStudent, this.isFavourite, this.availability);
}

class CourseDefinitions {
  static const int AVAILABILITY_AVAILABLE = 0;
  static const int AVAILABILITY_PENDING = 1;
  static const int AVAILABILITY_UNAVAILABLE = 2;
}