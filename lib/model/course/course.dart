class Course {
  final String name;
  final int faculty;
  final String lectureTime;
  final String description;
  final int hoursPerWeak;
  final int ects;
  final String professorEmail;
  final String professorName;
  final int availableForStudent;
  bool isFavourite;

  Course(this.name, this.faculty, this.lectureTime, this.description,
      this.hoursPerWeak, this.ects, this.professorEmail, this.professorName,
      this.availableForStudent, this.isFavourite);
}
