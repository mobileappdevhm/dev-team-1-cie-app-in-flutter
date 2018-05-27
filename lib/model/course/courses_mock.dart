import 'package:cie_team1/model/course/course.dart';
import 'package:cie_team1/model/course/courses.dart';

class CoursesMock implements Courses {
  List<Course> courses = [];

  CoursesMock() {
    courses = staticGetCourses();
  }

  @override
  List<Course> getCourses() {
    return courses;
  }

  static List<Course> staticGetCourses() {
    List<Course> courses = [];
    courses.add(new Course(
        "Title of Course 1",
        "07",
        [new Lecture(Weekday.Mon, new DayTime(10, 00), new DayTime(11, 30))],
        "Some description 1",
        1,
        1,
        "test@test.de",
        "Test",
        1,
        false,
        CourseAvailability.PENDING));
    courses.add(new Course(
        "Title of Course 2",
        "07",
        [
          new Lecture(Weekday.Mon, new DayTime(11, 45), new DayTime(13, 15)),
          new Lecture(Weekday.Mon, new DayTime(13, 30), new DayTime(15, 00))
        ],
        "Some description 2",
        1,
        1,
        "test@test.de",
        "Test",
        1,
        true,
        CourseAvailability.AVAILABLE));
    courses.add(new Course(
        "Title of Course 3",
        "07",
        [new Lecture(Weekday.Tue, new DayTime(10, 00), new DayTime(11, 30))],
        "Some description 3",
        1,
        1,
        "test@test.de",
        "Test",
        1,
        false,
        CourseAvailability.UNAVAILABLE));
    courses.add(new Course(
        "Title of Course 4",
        "07",
        [new Lecture(Weekday.Fri, new DayTime(10, 00), new DayTime(11, 30))],
        "Some description 4",
        1,
        1,
        "test@test.de",
        "Test",
        1,
        true,
        CourseAvailability.AVAILABLE));
    courses.add(new Course(
        "Title of Course 5",
        "07",
        [new Lecture(Weekday.The, new DayTime(10, 00), new DayTime(11, 30))],
        "Some description 5",
        1,
        1,
        "test@test.de",
        "Test",
        1,
        false,
        CourseAvailability.AVAILABLE));
    courses.add(new Course(
        "Title of Course 6",
        "07",
        [new Lecture(Weekday.Wed, new DayTime(10, 00), new DayTime(11, 30))],
        "Some description 6",
        1,
        1,
        "test@test.de",
        "Test",
        1,
        false,
        CourseAvailability.PENDING));
    courses.add(new Course(
        "Title of Course 7",
        "07",
        [new Lecture(Weekday.Fri, new DayTime(10, 00), new DayTime(11, 30))],
        "Some description 7",
        1,
        1,
        "test@test.de",
        "Test",
        1,
        true,
        CourseAvailability.PENDING));
    courses.add(new Course(
        "Title of Course 8",
        "07",
        [new Lecture(Weekday.Fri, new DayTime(10, 00), new DayTime(11, 30))],
        "Some description 8",
        1,
        1,
        "test@test.de",
        "Test",
        1,
        false,
        CourseAvailability.UNAVAILABLE));
    courses.add(new Course(
        "Title of Course 9",
        "07",
        [new Lecture(Weekday.Mon, new DayTime(17, 00), new DayTime(20, 00))],
        "Some description 9",
        1,
        1,
        "test@test.de",
        "Test",
        1,
        false,
        CourseAvailability.AVAILABLE));

    return courses;
  }
}