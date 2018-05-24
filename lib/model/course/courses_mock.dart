import 'package:cie_team1/model/course/course.dart';
import 'package:cie_team1/model/course/courses.dart';

class CoursesMock implements Courses {
  List<Course> courses = [];

  CoursesMock() {
    courses.add(new Course("Title of Course 1", "07", "Mo 10:00-11:30", "Some description 1",
        1, 1, "test@test.de", "Test",
        1, false, 1));
    courses.add(new Course("Title of Course 2", "07", "Mo 12:00-13:30", "Some description 2",
        1, 1, "test@test.de", "Test",
        1, true, 0));
    courses.add(new Course("Title of Course 3", "07", "Di 9:45-11:30", "Some description 3",
        1, 1, "test@test.de", "Test",
        1, false, 2));
    courses.add(new Course("Title of Course 4", "07", "Mo 10:00-11:30", "Some description 4",
        1, 1, "test@test.de", "Test",
        1, true, 0));
    courses.add(new Course("Title of Course 5", "07", "Do 10:00-11:30", "Some description 5",
        1, 1, "test@test.de", "Test",
        1, false, 0));
    courses.add(new Course("Title of Course 6", "07", "Mo 10:00-11:30", "Some description 6",
        1, 1, "test@test.de", "Test",
        1, false, 1));
    courses.add(new Course("Title of Course 7", "07", "Fr 10:00-11:30", "Some description 7",
        1, 1, "test@test.de", "Test",
        1, true, 1));
    courses.add(new Course("Title of Course 8", "07", "Mo 10:00-11:30", "Some description 8",
        1, 1, "test@test.de", "Test",
        1, false, 2));
    courses.add(new Course("Title of Course 9", "07", "Mo 10:00-11:30", "Some description 9",
        1, 1, "test@test.de", "Test",
        1, false, 0));
    courses.add(new Course("Title of Course 10", "08", "Mo 10:00-11:30", "Some description 8",
        1, 1, "test@test.de", "Test",
        1, false, 2));
    courses.add(new Course("Title of Course 11", "08", "Mo 10:00-11:30", "Some description 9",
        1, 1, "test@test.de", "Test",
        1, false, 0));
    courses.add(new Course("Title of Course 12", "01", "Mo 10:00-11:30", "Some description 8",
        1, 1, "test@test.de", "Test",
        1, false, 2));
    courses.add(new Course("Title of Course 13", "01", "Mo 10:00-11:30", "Some description 9",
        1, 1, "test@test.de", "Test",
        1, false, 0));
    courses.add(new Course("Title of Course 14", "01", "Mo 10:00-11:30", "Some description 8",
        1, 1, "test@test.de", "Test",
        1, false, 2));
    courses.add(new Course("Title of Course 15", "02", "Mo 10:00-11:30", "Some description 9",
        1, 1, "test@test.de", "Test",
        1, false, 0));
    courses.add(new Course("Title of Course 16", "03", "Mo 10:00-11:30", "Some description 8",
        1, 1, "test@test.de", "Test",
        1, false, 2));
    courses.add(new Course("Title of Course 17", "03", "Mo 10:00-11:30", "Some description 9",
        1, 1, "test@test.de", "Test",
        1, false, 0));
    courses.add(new Course("Title of Course 18", "04", "Mo 10:00-11:30", "Some description 8",
        1, 1, "test@test.de", "Test",
        1, false, 2));
    courses.add(new Course("Title of Course 19", "04", "Mo 10:00-11:30", "Some description 9",
        1, 1, "test@test.de", "Test",
        1, false, 0));
    courses.add(new Course("Title of Course 20", "05", "Mo 10:00-11:30", "Some description 8",
        1, 1, "test@test.de", "Test",
        1, false, 2));
    courses.add(new Course("Title of Course 21", "06", "Mo 10:00-11:30", "Some description 9",
        1, 1, "test@test.de", "Test",
        1, false, 0));
    courses.add(new Course("Title of Course 22", "06", "Mo 10:00-11:30", "Some description 8",
        1, 1, "test@test.de", "Test",
        1, false, 2));
    courses.add(new Course("Title of Course 23", "06", "Mo 10:00-11:30", "Some description 9",
        1, 1, "test@test.de", "Test",
        1, false, 0));
    courses.add(new Course("Title of Course 24", "01", "Mo 10:00-11:30", "Some description 9",
        1, 1, "test@test.de", "Test",
        1, false, 0));
    courses.add(new Course("Title of Course 25", "01", "Mo 10:00-11:30", "Some description 9",
        1, 1, "test@test.de", "Test",
        1, false, 0));
    courses.add(new Course("Title of Course 26", "01", "Mo 10:00-11:30", "Some description 9",
        1, 1, "test@test.de", "Test",
        1, false, 0));
    courses.add(new Course("Title of Course 27", "01", "Mo 10:00-11:30", "Some description 9",
        1, 1, "test@test.de", "Test",
        1, false, 0));
    courses.add(new Course("Title of Course 28", "01", "Mo 10:00-11:30", "Some description 9",
        1, 1, "test@test.de", "Test",
        1, false, 0));
    courses.add(new Course("Title of Course 29", "01", "Mo 10:00-11:30", "Some description 9",
        1, 1, "test@test.de", "Test",
        1, false, 0));
    courses.add(new Course("Title of Course 30", "01", "Mo 10:00-11:30", "Some description 9",
        1, 1, "test@test.de", "Test",
        1, false, 0));
    courses.add(new Course("Title of Course 31", "01", "Mo 10:00-11:30", "Some description 9",
        1, 1, "test@test.de", "Test",
        1, false, 0));
  }

  @override
  List<Course> getCourses() {
    return courses;
  }
}