import 'package:cie_team1/model/course/course.dart';
import 'package:cie_team1/model/course/courses.dart';
import 'dart:math';

class CoursesMock implements Courses {
  List<Course> courses = [];

  CoursesMock() {
    for (int i=1; i<=100; i++) {
      courses.add(new Course(
        generateMockCourseTitle(i),
        generateMockDepartment(i),
        generateMockTime(i),
        generateMockDescription(i),
        generateMockClassLength(i),
        generateMockECTS(i),
        generateMockEmail(i),
        generateMockName(i),
        generateMockAvailability(i),
        generateMockFavorite(i),
        generateMockAvailabilityLevel(i)
      ));
    }
  }

  void coursesMockStatic() {
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
  }

  static String generateMockCourseTitle(int i) {
    return "Title of Course " + i.toString();
  }

  static String generateMockDepartment(int i) {
    return CourseDefinitions.DEPARTMENTS[i.round()%CourseDefinitions.DEPARTMENTS.length];
  }

  static String generateMockDescription(int i) {
    return "Course Description " + i.toString();
  }

  static List<String> mockTimes() {
    return [
      "8:00-10:45",
      "9:45-11:30",
      "10:00-11:30",
      "13:00-12:00",
      "11:00-12:45"
    ];
  }

  static String generateMockTime(int i) {
    return mockTimes()[i%mockTimes().length];
  }

  static int generateMockClassLength(int i) {
    return i%4;
  }

  static int generateMockECTS(int i) {
    return i%4;
  }

  static String generateMockEmail(int i) {
    return "testEmail"+i.toString()+"@test.de";
  }

  static String generateMockName(int i) {
    return "Professor name" + i.toString();
  }

  static int generateMockAvailability(int i) {
    return 1;
  }

  static int generateMockAvailabilityLevel(int i) {
    return i%2;
  }

  static bool generateMockFavorite(int i) {
    return i/pi.round() %3 == 0 && i%2==0;
  }

  @override
  List<Course> getCourses() {
    return courses;
  }
}