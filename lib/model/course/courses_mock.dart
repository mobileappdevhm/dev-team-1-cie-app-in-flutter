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