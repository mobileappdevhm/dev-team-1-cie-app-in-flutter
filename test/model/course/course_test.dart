import 'package:cie_team1/model/course/course.dart';
import 'package:test/test.dart';

@Timeout(const Duration(seconds: 10))

void main(){

  group("simplecourseTest", () {

    test('1', () {
      final Course sut = new Course(
          "Blaba",
          "7",
          [new Lecture(Campus.KARLSTRASSE, Weekday.Mon, new DayTime(10, 00), new DayTime(11, 30))],
          "boring",
          2,
          2,
          "example@hm.edu",
          "Max Mustermann",
          1,
          false,
          CourseAvailability.AVAILABLE);

      expect(sut.name, "Blaba");
    });

    test('2', () {
      final Course sut = new Course(
          "Blaba",
          "7",
          [new Lecture(Campus.KARLSTRASSE, Weekday.Mon, new DayTime(10, 00), new DayTime(11, 30))],
          "boring",
          2,
          2,
          "example@hm.edu",
          "Max Mustermann",
          1,
          false,
          CourseAvailability.AVAILABLE);

      expect(sut.faculty, "7");
    });
    test('3', () {
      final Course sut = new Course(
          "Blaba",
          "7",
          [new Lecture(Campus.KARLSTRASSE, Weekday.Mon, new DayTime(10, 00), new DayTime(11, 30))],
          "boring",
          2,
          2,
          "example@hm.edu",
          "Max Mustermann",
          1,
          false,
          CourseAvailability.AVAILABLE);

      expect(sut.lecturesPerWeek[0].weekday, Weekday.Mon);
      expect(sut.lecturesPerWeek[0].startDayTime.toString(), new DayTime(10, 00).toString());
      expect(sut.lecturesPerWeek[0].endDayTime.toString(), new DayTime(11, 30).toString());
    });
    test('4', () {
      final Course sut = new Course(
          "Blaba",
          "7",
          [new Lecture(Campus.KARLSTRASSE, Weekday.Mon, new DayTime(10, 00), new DayTime(11, 30))],
          "boring",
          2,
          2,
          "example@hm.edu",
          "Max Mustermann",
          1,
          false,
          CourseAvailability.AVAILABLE);

      expect(sut.description, "boring");
    });
    test('5', () {
      final Course sut = new Course(
          "Blaba",
          "7",
          [new Lecture(Campus.KARLSTRASSE, Weekday.Mon, new DayTime(10, 00), new DayTime(11, 30))],
          "boring",
          2,
          2,
          "example@hm.edu",
          "Max Mustermann",
          1,
          false,
          CourseAvailability.AVAILABLE);

      expect(sut.hoursPerWeek, 2);
    });
    test('6', () {
      final Course sut = new Course(
          "Blaba",
          "7",
          [new Lecture(Campus.KARLSTRASSE, Weekday.Mon, new DayTime(10, 00), new DayTime(11, 30))],
          "boring",
          2,
          2,
          "example@hm.edu",
          "Max Mustermann",
          1,
          false,
          CourseAvailability.AVAILABLE);

      expect(sut.ects, 2);
    });

    test('7', () {
      final Course sut = new Course(
          "Blaba",
          "7",
          [new Lecture(Campus.KARLSTRASSE, Weekday.Mon, new DayTime(10, 00), new DayTime(11, 30))],
          "boring",
          2,
          2,
          "example@hm.edu",
          "Max Mustermann",
          1,
          false,
          CourseAvailability.AVAILABLE);

      expect(sut.professorEmail, "example@hm.edu");
    });

    test('8', () {
      final Course sut = new Course(
          "Blaba",
          "7",
          [new Lecture(Campus.KARLSTRASSE, Weekday.Mon, new DayTime(10, 00), new DayTime(11, 30))],
          "boring",
          2,
          2,
          "example@hm.edu",
          "Max Mustermann",
          1,
          false,
          CourseAvailability.AVAILABLE);

      expect(sut.professorName, "Max Mustermann");
    });

    test('9', () {
      final Course sut = new Course(
          "Blaba",
          "7",
          [new Lecture(Campus.KARLSTRASSE, Weekday.Mon, new DayTime(10, 00), new DayTime(11, 30))],
          "boring",
          2,
          2,
          "example@hm.edu",
          "Max Mustermann",
          1,
          false,
          CourseAvailability.AVAILABLE);

      expect(sut.available, 1);
    });

    test('10', () {
      final Course sut = new Course(
          "Blaba",
          "7",
          [new Lecture(Campus.KARLSTRASSE, Weekday.Mon, new DayTime(10, 00), new DayTime(11, 30))],
          "boring",
          2,
          2,
          "example@hm.edu",
          "Max Mustermann",
          1,
          false,
          CourseAvailability.AVAILABLE);

      expect(sut.isFavourite, false);
    });

    test('11', () {
      final Course sut = new Course(
          "Blaba",
          "7",
          [new Lecture(Campus.KARLSTRASSE, Weekday.Mon, new DayTime(10, 00), new DayTime(11, 30))],
          "boring",
          2,
          2,
          "example@hm.edu",
          "Max Mustermann",
          1,
          false,
          CourseAvailability.AVAILABLE);

      expect(sut.availability, CourseAvailability.AVAILABLE);
    });
  });


  group('static stuff', (){
    
    test('available', (){

      expect(CourseDefinitions.AVAILABILITY_AVAILABLE,0);
    });

    test('available', (){

      expect(CourseDefinitions.AVAILABILITY_PENDING,1);
    });

    test('available', (){

      expect(CourseDefinitions.AVAILABILITY_UNAVAILABLE,2);
    });
    
    
  });


}

