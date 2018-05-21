import 'package:cie_team1/model/course/course.dart';
import 'package:cie_team1/model/course/courses.dart';

class CoursesMock implements Courses {
  List<Course> courses = [];

  CoursesMock() {
    courses.add(new Course("Operating Systems", 07, "Mo 10:00-11:30", "Some description",
        1, 1, "test@test.de", "Test",
        1, false));
    courses.add(new Course("Operating Systems", 07, "Mo 10:00-11:30", "Some description",
        1, 1, "test@test.de", "Test",
        1, false));
    courses.add(new Course("Operating Systems", 07, "Mo 10:00-11:30", "Some description",
        1, 1, "test@test.de", "Test",
        1, false));
    courses.add(new Course("Operating Systems", 07, "Mo 10:00-11:30", "Some description",
        1, 1, "test@test.de", "Test",
        1, false));
    courses.add(new Course("Operating Systems", 07, "Mo 10:00-11:30", "Some description",
        1, 1, "test@test.de", "Test",
        1, false));
    courses.add(new Course("Operating Systems", 07, "Mo 10:00-11:30", "Some description",
        1, 1, "test@test.de", "Test",
        1, false));
    courses.add(new Course("Operating Systems", 07, "Mo 10:00-11:30", "Some description",
        1, 1, "test@test.de", "Test",
        1, false));
    courses.add(new Course("Operating Systems", 07, "Mo 10:00-11:30", "Some description",
        1, 1, "test@test.de", "Test",
        1, false));
    courses.add(new Course("Operating Systems", 07, "Mo 10:00-11:30", "Some description",
        1, 1, "test@test.de", "Test",
        1, false));
  }

  @override
  List<Course> getCourses() {
    return courses;
  }
}