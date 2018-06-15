import 'dart:math';

import 'package:cie_team1/model/course/course.dart';
import 'package:cie_team1/model/course/courses.dart';

class CoursesMock implements Courses {
  static const int GENERATE_COURSES = 100;

  List<Course> courses = [];

  CoursesMock() {
    for (int i = 1; i < GENERATE_COURSES; i++) {
      courses.add(
        new CourseBuilder()
          .withName(generateMockCourseTitle(i))
          .withFaculty(generateMockDepartment(i))
          .withFaculty(generateMockDepartment(i))
          .withLecturesPerWeek(generateMockTime(i))
          .withDescription(generateMockDescription(i))
          .withHoursPerWeek(generateMockClassLength(i))
          .withEcts(generateMockECTS(i))
          .withProfessorEmail(generateMockEmail(i))
          .withProfessorName(generateMockName(i))
          .withAvailable(generateMockAvailability(i))
          .withIsFavorite(generateMockFavorite(i))
          .build()
      );
    }
  }

  static String generateMockCourseTitle(int i) {
    return "Title of Course " + i.toString();
  }

  static String generateMockDepartment(int i) {
    return CourseDefinitions
        .DEPARTMENTS[i.round() % CourseDefinitions.DEPARTMENTS.length];
  }

  static String generateMockDescription(int i) {
    return "Course Description " + i.toString();
  }

  static List<Lecture> generateMockTime(int i) {
    return generatedMockLectures()[i];
  }

  static int generateMockClassLength(int i) {
    return i % 4;
  }

  static int generateMockECTS(int i) {
    return i % 4;
  }

  static String generateMockEmail(int i) {
    return "testEmail" + i.toString() + "@test.de";
  }

  static String generateMockName(int i) {
    return "Professor name" + i.toString();
  }

  static CourseAvailability generateMockAvailability(int i) {
    return CourseAvailabilityUtility.intToCourseAvailability(i % 3);
  }

  static int generateMockAvailabilityLevel(int i) {
    return i % 2;
  }

  static bool generateMockFavorite(int i) {
    return i / pi.round() % 3 == 0 && i % 2 == 0;
  }

  static List<List<Lecture>> generatedMockLectures() {
    List<List<Lecture>> lectures = [];

    List<String> rooms = [
      "R0.001",
      "T0.001",
      "K0.011",
      "R3.024",
    ];

    List<List<DayTime>> times = [
      [new DayTime(8, 15), new DayTime(9, 45)],
      [new DayTime(10, 00), new DayTime(11, 30)],
      [new DayTime(11, 45), new DayTime(13, 15)],
      [new DayTime(13, 30), new DayTime(15, 00)],
      [new DayTime(15, 15), new DayTime(16, 45)],
      [new DayTime(17, 00), new DayTime(18, 30)],
    ];

    List<Campus> campus = [
      Campus.LOTHSTRASSE,
      Campus.PASING,
      Campus.KARLSTRASSE,
    ];

    for (int i = 1; i <= GENERATE_COURSES; i++) {
      // Do course with 2 lectures a week
      if (i % 4 == 0) {
        lectures.add([
          new Lecture(
              campus[i % campus.length],
              WeekdayUtility.intToWeekday(i % 4),
              times[i % times.length][0],
              times[i % times.length][1],
              rooms[i % rooms.length]),
          new Lecture(
              campus[i % campus.length],
              WeekdayUtility.intToWeekday((i + 1) % 4),
              times[(i + 1) % times.length][0],
              times[(i + 1) % times.length][1],
              rooms[i % rooms.length])
        ]);
      }
      // Do course with 1 lecture a week
      else {
        lectures.add([
          new Lecture(
              campus[i % campus.length],
              WeekdayUtility.intToWeekday(i % 5),
              times[i % times.length][0],
              times[i % times.length][1],
              rooms[i % rooms.length])
        ]);
      }
    }

    return lectures;
  }

  @override
  List<Course> getCourses() {
    return courses;
  }
}
