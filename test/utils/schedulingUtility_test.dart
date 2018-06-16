import 'package:cie_team1/model/course/course.dart';
import 'package:cie_team1/utils/schedulingUtility.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cie_team1/utils/staticVariables.dart';

@Timeout(const Duration(seconds: 5))
void main() {
  Course testCourseOne;
  Course testCourseTwo;
  Lecture testLectureOne;
  Lecture testLectureTwo;
  setUp((){
    testLectureOne = new Lecture(Campus.KARLSTRASSE, Weekday.Mon,
        new DayTime(10, 00), new DayTime(11, 30), "R0.009") ;
    testLectureTwo = new Lecture(Campus.PASING, Weekday.Mon, new DayTime(10, 00),
        new DayTime(11, 30), "R0.009") ;
    testCourseOne = new CourseBuilder()
      .withName("Blaba")
      .withFaculty("7")
      .withLecturesPerWeek([
        testLectureOne
      ])
      .withDescription("boring")
      .withHoursPerWeek(2)
      .withEcts(2)
      .withProfessorEmail("example@hm.edu")
      .withProfessorName("Max Mustermann")
      .withAvailable(CourseAvailability.AVAILABLE)
      .withIsFavorite(false)
      .build();
    testCourseTwo = new CourseBuilder()
      .withName("Blaba")
      .withFaculty("7")
      .withLecturesPerWeek([
        testLectureTwo
      ])
      .withDescription("boring")
      .withHoursPerWeek(2)
      .withEcts(2)
      .withProfessorEmail("example@hm.edu")
      .withProfessorName("Max Mustermann")
      .withAvailable(CourseAvailability.AVAILABLE)
      .withIsFavorite(false)
      .build();
    testLectureOne.course = testCourseOne;
    testLectureTwo.course = testCourseTwo;
  });


  group('timeRequired', () {
    test('1 far campus, both same Loth', () async {
      final int timeRequired = SchedulingUtility.timeRequired(Campus.LOTHSTRASSE,
          Campus.LOTHSTRASSE);

      expect(timeRequired, StaticVariables.SAME_CAMPUS_COMMUTE_MINS);
    });

    test('2 far campus, both same Pasing', () async {
      final int timeRequired = SchedulingUtility.timeRequired(Campus.PASING,
          Campus.PASING);

      expect(timeRequired, StaticVariables.SAME_CAMPUS_COMMUTE_MINS);
    });

    test('3 far campus, both same Karl', () async {
      final int timeRequired = SchedulingUtility.timeRequired(Campus.KARLSTRASSE,
          Campus.KARLSTRASSE);

      expect(timeRequired, StaticVariables.SAME_CAMPUS_COMMUTE_MINS);
    });

    test('4 far campus, Loth Pasing', () async {
      final int timeRequired = SchedulingUtility.timeRequired(Campus.LOTHSTRASSE,
          Campus.PASING);

      expect(timeRequired, StaticVariables.LOTHSTRASSE_PASING_COMMUTE_MINS);
    });

    test('5 far campus, Loth Pasing', () async {
      final int timeRequired = SchedulingUtility.timeRequired(Campus.PASING,
          Campus.LOTHSTRASSE);

      expect(timeRequired, StaticVariables.LOTHSTRASSE_PASING_COMMUTE_MINS);
    });

    test('6 far campus, Loth Karl', () async {
      final int timeRequired = SchedulingUtility.timeRequired(Campus.LOTHSTRASSE,
          Campus.KARLSTRASSE);

      expect(timeRequired, StaticVariables.LOTHSTRASSE_KARLSTRASSE_COMMUTE_MINS);
    });

    test('7 far campus, Karl Loth', () async {
      final int timeRequired = SchedulingUtility.timeRequired(Campus.KARLSTRASSE,
          Campus.LOTHSTRASSE);
      expect(timeRequired, StaticVariables.LOTHSTRASSE_KARLSTRASSE_COMMUTE_MINS);
    });

    test('8 far campus, Pasing Karl', () async {
      final int timeRequired = SchedulingUtility.timeRequired(Campus.PASING,
          Campus.KARLSTRASSE);
      expect(timeRequired, StaticVariables.KARLSTRASSE_PASING_COMMUTE_MINS);
    });

    test('9 far campus, Pasing Karl', () async {
      final int timeRequired = SchedulingUtility.timeRequired(Campus.KARLSTRASSE,
          Campus.PASING);
      expect(timeRequired, StaticVariables.KARLSTRASSE_PASING_COMMUTE_MINS);
    });
  }); //group

  group('schedulingtest', () {
    test('1 both Pasing', () async {
      final DayTime day1 = new DayTime(12, 0);
      final DayTime day2 = new DayTime(12, 5);
      final bool sut = SchedulingUtility.isSchedulingConflict(
          day1, day2, Campus.PASING, Campus.PASING);

      expect(sut, false);
    });

    test('2 both Loth', () async {
      final DayTime day1 = new DayTime(12, 0);
      final DayTime day2 = new DayTime(12, 5);
      final bool sut = SchedulingUtility.isSchedulingConflict(
          day1, day2, Campus.LOTHSTRASSE, Campus.LOTHSTRASSE);

      expect(sut, false);
    });

    test('2 Loth Pasing', () async {
      final DayTime day1 = new DayTime(12, 0);
      final DayTime day2 = new DayTime(12, 5);
      final bool sut = SchedulingUtility.isSchedulingConflict(
          day1, day2, Campus.LOTHSTRASSE, Campus.PASING);

      expect(sut, true);
    });

    test('2 Loth Pasing much time', () async {
      final DayTime day1 = new DayTime(12, 0);
      final DayTime day2 = new DayTime(18, 5);
      final bool sut = SchedulingUtility.isSchedulingConflict(
          day1, day2, Campus.LOTHSTRASSE, Campus.PASING);

      expect(sut, false);
    });

    test('2 Loth Loth much time', () async {
      final DayTime day1 = new DayTime(12, 0);
      final DayTime day2 = new DayTime(18, 5);
      final bool sut = SchedulingUtility.isSchedulingConflict(
          day1, day2, Campus.LOTHSTRASSE, Campus.LOTHSTRASSE);

      expect(sut, false);
    });
  }); //group

  group("isCloseTime", () {
    test('1', () {
      DayTime one = new DayTime(10, 00);
      DayTime two = new DayTime(11, 30);
      bool result = SchedulingUtility.isCloseTime(one, two,
      StaticVariables.KARLSTRASSE_PASING_COMMUTE_MINS);
      expect(result, false);
    });

    test('2', () {
      DayTime one = new DayTime(11, 30);
      DayTime two = new DayTime(11, 45);
      bool result = SchedulingUtility.isCloseTime(one, two,
      StaticVariables.KARLSTRASSE_PASING_COMMUTE_MINS);
      expect(result, true);
    });

    test('3', () {
      DayTime one = new DayTime(11, 30);
      DayTime two = new DayTime(11, 45);
      bool result = SchedulingUtility.isCloseTime(one, two,
      StaticVariables.LOTHSTRASSE_KARLSTRASSE_COMMUTE_MINS);
      expect(result, true);
    });

    test('4', () {
      DayTime one = new DayTime(11, 30);
      DayTime two = new DayTime(11, 30);
      bool result = SchedulingUtility.isCloseTime(one, two,
      StaticVariables.SAME_CAMPUS_COMMUTE_MINS);
      expect(result, false);
    });
  });

  group("isSchedulingConflict", () {
    test('1', () {
      DayTime dayTimeOne = new DayTime(10, 00);
      DayTime dayTimeTwo = new DayTime(11, 30);

      bool result = SchedulingUtility.isSchedulingConflict(
          dayTimeOne, dayTimeTwo, Campus.LOTHSTRASSE, Campus.PASING);
      expect(result, false);
    });

    test('2', () {
      DayTime dayTimeOne = new DayTime(11, 30);
      DayTime dayTimeTwo = new DayTime(11, 45);

      bool result = SchedulingUtility.isSchedulingConflict(
          dayTimeOne, dayTimeTwo, Campus.LOTHSTRASSE, Campus.LOTHSTRASSE);
      expect(result, false);
    });

    test('3', () {
      DayTime dayTimeOne = new DayTime(11, 30);
      DayTime dayTimeTwo = new DayTime(11, 45);

      bool result = SchedulingUtility.isSchedulingConflict(
          dayTimeOne, dayTimeTwo, Campus.LOTHSTRASSE, Campus.PASING);
      expect(result, true);
    });

    test('4', () {
      DayTime dayTimeOne = new DayTime(9, 30);
      DayTime dayTimeTwo = new DayTime(9, 45);

      bool result = SchedulingUtility.isSchedulingConflict(
          dayTimeOne, dayTimeTwo, Campus.LOTHSTRASSE, Campus.KARLSTRASSE);
      expect(result, true);
    });

    test('4', () {
      DayTime dayTimeOne = new DayTime(13, 30);
      DayTime dayTimeTwo = new DayTime(13, 45);

      bool result = SchedulingUtility.isSchedulingConflict(
          dayTimeOne, dayTimeTwo, Campus.PASING, Campus.KARLSTRASSE);
      expect(result, true);
    });
  });

  group("schedulingConflictText", ()
  {
    test('uses text according to the campus', () {
      String text = SchedulingUtility
          .constructSchedulingConflictText(testLectureOne, testLectureTwo);
      expect(text.contains(CampusUtility
          .getCampusAsString(testLectureOne.campus)), true);
      expect(text.contains(CampusUtility
          .getCampusAsString(testLectureTwo.campus)), true);
    });

    test('uses the specified time to render the conflict', () {
      String text = SchedulingUtility
          .constructSchedulingConflictText(testLectureOne, testLectureTwo);
      expect(text.contains(SchedulingUtility
          .timeRequired(testLectureOne.campus, testLectureTwo.campus)
          .toString()), true);
    });
  });
} //main
