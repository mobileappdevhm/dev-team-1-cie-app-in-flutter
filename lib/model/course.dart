class Course {
  final String name;
  final int faculty;
  final List<DateTime> lectureTime;
  final String description;
  final int hoursPerWeak;
  final int ects;
  final String professorEmail;
  final String professorName;
  final int availableForStudent;

  const Course({this.name, this.faculty, this.lectureTime, this.description,
      this.hoursPerWeak, this.ects, this.professorEmail, this.professorName,
      this.availableForStudent});
}