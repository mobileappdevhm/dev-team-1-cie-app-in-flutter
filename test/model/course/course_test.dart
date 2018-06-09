import 'package:cie_team1/model/course/course.dart';
import 'package:test/test.dart';

@Timeout(const Duration(seconds: 10))
void main() {
  group("simplecourseTest", () {
    test('1', () {
      final Course sut = new Course(
        "Blaba",
        "7",
        [
          new Lecture(Campus.KARLSTRASSE, Weekday.Mon, new DayTime(10, 00),
              new DayTime(11, 30), "R0.009")
        ],
        "boring",
        2,
        2,
        "example@hm.edu",
        "Max Mustermann",
        CourseAvailability.AVAILABLE,
        false,
      );

      expect(sut.name, "Blaba");
    });

    test('2', () {
      final Course sut = new Course(
          "Blaba",
          "7",
          [
            new Lecture(Campus.KARLSTRASSE, Weekday.Mon, new DayTime(10, 00),
                new DayTime(11, 30), "R0.009")
          ],
          "boring",
          2,
          2,
          "example@hm.edu",
          "Max Mustermann",
          CourseAvailability.AVAILABLE,
          false);

      expect(sut.faculty, "7");
    });
    test('3', () {
      final Course sut = new Course(
          "Blaba",
          "7",
          [
            new Lecture(Campus.KARLSTRASSE, Weekday.Mon, new DayTime(10, 00),
                new DayTime(11, 30), "R0.009")
          ],
          "boring",
          2,
          2,
          "example@hm.edu",
          "Max Mustermann",
          CourseAvailability.AVAILABLE,
          false);

      expect(sut.lecturesPerWeek[0].weekday, Weekday.Mon);
      expect(sut.lecturesPerWeek[0].startDayTime.toString(),
          new DayTime(10, 00).toString());
      expect(sut.lecturesPerWeek[0].endDayTime.toString(),
          new DayTime(11, 30).toString());
    });
    test('4', () {
      final Course sut = new Course(
        "Blaba",
        "7",
        [
          new Lecture(Campus.KARLSTRASSE, Weekday.Mon, new DayTime(10, 00),
              new DayTime(11, 30), "R0.009")
        ],
        "boring",
        2,
        2,
        "example@hm.edu",
        "Max Mustermann",
        CourseAvailability.AVAILABLE,
        false,
      );

      expect(sut.description, "boring");
    });
    test('5', () {
      final Course sut = new Course(
        "Blaba",
        "7",
        [
          new Lecture(Campus.KARLSTRASSE, Weekday.Mon, new DayTime(10, 00),
              new DayTime(11, 30), "R0.009")
        ],
        "boring",
        2,
        2,
        "example@hm.edu",
        "Max Mustermann",
        CourseAvailability.AVAILABLE,
        false,
      );

      expect(sut.hoursPerWeek, 2);
    });
    test('6', () {
      final Course sut = new Course(
        "Blaba",
        "7",
        [
          new Lecture(Campus.KARLSTRASSE, Weekday.Mon, new DayTime(10, 00),
              new DayTime(11, 30), "R0.009")
        ],
        "boring",
        2,
        2,
        "example@hm.edu",
        "Max Mustermann",
        CourseAvailability.AVAILABLE,
        false,
      );

      expect(sut.ects, 2);
    });

    test('7', () {
      final Course sut = new Course(
        "Blaba",
        "7",
        [
          new Lecture(Campus.KARLSTRASSE, Weekday.Mon, new DayTime(10, 00),
              new DayTime(11, 30), "R0.009")
        ],
        "boring",
        2,
        2,
        "example@hm.edu",
        "Max Mustermann",
        CourseAvailability.AVAILABLE,
        false,
      );

      expect(sut.professorEmail, "example@hm.edu");
    });

    test('8', () {
      final Course sut = new Course(
        "Blaba",
        "7",
        [
          new Lecture(Campus.KARLSTRASSE, Weekday.Mon, new DayTime(10, 00),
              new DayTime(11, 30), "R0.009")
        ],
        "boring",
        2,
        2,
        "example@hm.edu",
        "Max Mustermann",
        CourseAvailability.AVAILABLE,
        false,
      );

      expect(sut.professorName, "Max Mustermann");
    });

    test('9', () {
      final Course sut = new Course(
        "Blaba",
        "7",
        [
          new Lecture(Campus.KARLSTRASSE, Weekday.Mon, new DayTime(10, 00),
              new DayTime(11, 30), "R0.009")
        ],
        "boring",
        2,
        2,
        "example@hm.edu",
        "Max Mustermann",
        CourseAvailability.AVAILABLE,
        false,
      );

      expect(sut.available, CourseAvailability.AVAILABLE);
    });

    test('10', () {
      final Course sut = new Course(
        "Blaba",
        "7",
        [
          new Lecture(Campus.KARLSTRASSE, Weekday.Mon, new DayTime(10, 00),
              new DayTime(11, 30), "R0.009")
        ],
        "boring",
        2,
        2,
        "example@hm.edu",
        "Max Mustermann",
        CourseAvailability.AVAILABLE,
        false,
      );

      expect(sut.isFavourite, false);
    });

    test('11', () {
      final Course sut = new Course(
        "Blaba",
        "7",
        [
          new Lecture(Campus.KARLSTRASSE, Weekday.Mon, new DayTime(10, 00),
              new DayTime(11, 30), "R0.009")
        ],
        "boring",
        2,
        2,
        "example@hm.edu",
        "Max Mustermann",
        CourseAvailability.AVAILABLE,
        false,
      );

      expect(sut.available, CourseAvailability.AVAILABLE);
    });

    test('12 ocure', () {
      final Course sut = new Course(
        "Blaba",
        "7",
        [
          new Lecture(Campus.KARLSTRASSE, Weekday.Mon, new DayTime(10, 00),
              new DayTime(11, 30), "R0.009")
        ],
        "boring",
        2,
        2,
        "example@hm.edu",
        "Max Mustermann",
        CourseAvailability.AVAILABLE,
        false,
      );

      expect(sut.occursOnDay(Weekday.Mon), true);
    });

    test('13 ocure', () {
      final Course sut = new Course(
        "Blaba",
        "7",
        [
          new Lecture(Campus.KARLSTRASSE, Weekday.Mon, new DayTime(10, 00),
              new DayTime(11, 30), "R0.009")
        ],
        "boring",
        2,
        2,
        "example@hm.edu",
        "Max Mustermann",
        CourseAvailability.AVAILABLE,
        false,
      );

      expect(sut.occursOnDay(Weekday.Sun), false);
    });
  });

  group('static stuff', () {
    test('available', () {
      expect(
          CourseAvailabilityUtility
              .getFacultyAsInt(CourseAvailability.AVAILABLE),
          0);
    });

    test('available', () {
      expect(
          CourseAvailabilityUtility.getFacultyAsInt(CourseAvailability.PENDING),
          1);
    });

    test('available', () {
      expect(
          CourseAvailabilityUtility
              .getFacultyAsInt(CourseAvailability.UNAVAILABLE),
          2);
    });
  });

  group('weekday utility', () {
    test('1', () {
      expect(WeekdayUtility.getWeekdayAsString(Weekday.Sun), "Sun");
    });

    test('2', () {
      expect(WeekdayUtility.getWeekdayAsString(Weekday.Sat), "Sat");
    });
    test('4', () {
      expect(WeekdayUtility.getWeekdayAsString(Weekday.Fri), "Fri");
    });

    test('5', () {
      expect(WeekdayUtility.getWeekdayAsString(Weekday.Thu), "Thu");
    });

    test('6', () {
      expect(WeekdayUtility.getWeekdayAsString(Weekday.Wed), "Wed");
    });

    test('7', () {
      expect(WeekdayUtility.getWeekdayAsString(Weekday.Tue), "Tue");
    });

    test('8', () {
      expect(WeekdayUtility.getWeekdayAsString(Weekday.Mon), "Mon");
    });

    test('9', () {
      expect(WeekdayUtility.getWeekdayAsInt(Weekday.Sun), 6);
    });

    test('10', () {
      expect(WeekdayUtility.getWeekdayAsInt(Weekday.Sat), 5);
    });
    test('11', () {
      expect(WeekdayUtility.getWeekdayAsInt(Weekday.Fri), 4);
    });

    test('12', () {
      expect(WeekdayUtility.getWeekdayAsInt(Weekday.Thu), 3);
    });

    test('13', () {
      expect(WeekdayUtility.getWeekdayAsInt(Weekday.Wed), 2);
    });

    test('14', () {
      expect(WeekdayUtility.getWeekdayAsInt(Weekday.Tue), 1);
    });

    test('15', () {
      expect(WeekdayUtility.getWeekdayAsInt(Weekday.Mon), 0);
    });

    test('16', () {
      expect(WeekdayUtility.intToWeekday(4), Weekday.Fri);
    });

    test('17', () {
      expect(WeekdayUtility.intToWeekday(5), Weekday.Sat);
    });
    test('18', () {
      expect(WeekdayUtility.intToWeekday(6), Weekday.Sun);
    });

    test('19', () {
      expect(WeekdayUtility.intToWeekday(3), Weekday.Thu);
    });

    test('20', () {
      expect(WeekdayUtility.intToWeekday(2), Weekday.Wed);
    });
    test('21', () {
      expect(WeekdayUtility.intToWeekday(1), Weekday.Tue);
    });
    test('22', () {
      expect(WeekdayUtility.intToWeekday(0), Weekday.Mon);
    });

  });
}
