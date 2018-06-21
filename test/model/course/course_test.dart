import 'dart:convert';

import 'package:cie_team1/model/course/course.dart';
import 'package:cie_team1/model/course/details/correlation.dart';
import 'package:cie_team1/model/course/details/date.dart';
import 'package:cie_team1/model/course/details/lecturer.dart';
import 'package:cie_team1/model/course/details/room.dart';
import 'package:test/test.dart';

@Timeout(const Duration(seconds: 10))
void main() {
  group("simplecourseTest", () {
    Course sut;
    setUp(() {
      sut = new CourseBuilder()
          .withName("Blaba")
          .withFaculty("7")
          .withLecturesPerWeek([
            new Lecture(Campus.KARLSTRASSE, Weekday.Mon, new DayTime(10, 00),
                new DayTime(11, 30), "R0.009")
          ])
          .withDescription("boring")
          .withHoursPerWeek(2)
          .withEcts(2)
          .withProfessorEmail("example@hm.edu")
          .withProfessorName("Max Mustermann")
          .withIsFavorite(false)
          .withhasHomeBias(false)
          .withIsCoterie(false)
          .build();
    });
    test('1', () {
      expect(sut.name, "Blaba");
    });

    test('2', () {
      expect(sut.faculty, "7");
    });
    test('3', () {
      expect(sut.lecturesPerWeek[0].weekday, Weekday.Mon);
      expect(sut.lecturesPerWeek[0].startDayTime.toString(),
          new DayTime(10, 00).toString());
      expect(sut.lecturesPerWeek[0].endDayTime.toString(),
          new DayTime(11, 30).toString());
    });
    test('4', () {
      expect(sut.description, "boring");
    });
    test('5', () {
      expect(sut.hoursPerWeek, 2);
    });
    test('6', () {
      expect(sut.ects, 2);
    });

    test('7', () {
      expect(sut.professorEmail, "example@hm.edu");
    });

    test('8', () {
      expect(sut.professorName, "Max Mustermann");
    });

    test('9', () {
      expect(sut.available, CourseAvailability.AVAILABLE);
    });

    test('10', () {
      expect(sut.isFavourite, false);
    });

    test('11', () {
      expect(sut.available, CourseAvailability.AVAILABLE);
    });

    test('12 ocure', () {
      expect(sut.occursOnDay(Weekday.Mon), true);
    });

    test('13 ocure', () {
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

  group('courseBuilder test', () {
    test('complete builder test', () {
      var testString = "test";
      var testBool = true;
      var testInt = 1;
      var testDynamicList = new List<dynamic>();
      var testCorrelationList = new List<Correlation>();
      var testDateList = new List<Date>();
      var testLectureList = new List<Lecture>();
      CourseBuilder builder = new CourseBuilder()
          .withName(testString)
          .withId(testString)
          .withDescription(testString)
          .withIsCoterie(testBool)
          .withhasHomeBias(testBool)
          .withCorrelations(testCorrelationList)
          .withdates(testDateList)
          .withShortName(testString)
          .withActions(testDynamicList)
          .withFaculty(testString)
          .withLecturesPerWeek(testLectureList)
          .withHoursPerWeek(testInt)
          .withEcts(testInt)
          .withProfessorEmail(testString)
          .withProfessorName(testString)
          .withIsFavorite(testBool);
      Course built = builder.build();
      expect(built.name, testString);
      expect(built.isFavourite, testBool);
      expect(built.id, testString);
      expect(built.description, testString);
      expect(built.isCoterie, testBool);
      expect(built.hasHomeBias, testBool);
      expect(built.correlations, testCorrelationList);
      expect(built.dates, testDateList);
      expect(built.shortName, testString);
      expect(built.actions, testDynamicList);
      expect(built.faculty, testString);
      expect(built.lecturesPerWeek, testLectureList);
      expect(built.ects, testInt);
      expect(built.professorEmail, testString);
      expect(built.professorName, testString);
      expect(built.available, CourseAvailability.UNAVAILABLE);
      expect(built.isFavourite, testBool);
    });

    test('fromJson test', () {
      CourseBuilder builder;
      Map<String, dynamic> jsonData = json.decode('''
      {"id":"493e7e17-1508-e811-94bf-00155d6e6b0a","description":null,
      "isCoterie":false,"hasHomeBias":false,"correlations":[{"organiser":"FK 09"
      ,"curriculum":"WIM","actions":[]},{"organiser":"FK 09","curriculum":"MBA"
      ,"actions":[]},{"organiser":"FK 13","curriculum":"CIE","actions":[]}],
      "dates":[{"begin":"20180427T140000Z","end":"20180427T190000Z","title":null
      ,"isCanceled":false,"rooms":[{"number":"R 2.091","building":"R","campus":
      "Lothstrasse","actions":[]}],"lecturer":[{"title":null,"firstName":null,
      "lastName":"Rothlauf","actions":[]}],"actions":[]},{"begin":
      "20180323T150000Z","end":"20180323T200000Z","title":null,"isCanceled":
      false,"rooms":[{"number":"R 2.091","building":"R","campus":"Lothstrasse",
      "actions":[]}],"lecturer":[{"title":null,"firstName":null,"lastName":
      "Rothlauf","actions":[]}],"actions":[]},{"begin":"20180324T080000Z","end":
      "20180324T160000Z","title":null,"isCanceled":false,"rooms":[{"number":
      "R 2.091","building":"R","campus":"Lothstrasse","actions":[]}],"lecturer":
      [{"title":null,"firstName":null,"lastName":"Rothlauf","actions":[]}],
      "actions":[]},{"begin":"20180325T070000Z","end":"20180325T150000Z","title"
      :null,"isCanceled":false,"rooms":[{"number":"R 2.091","building":"R",
      "campus":"Lothstrasse","actions":[]}],"lecturer":[{"title":null,
      "firstName":null,"lastName":"Rothlauf","actions":[]}],"actions":[]},
      {"begin":"20180428T070000Z","end":"20180428T150000Z","title":null,
      "isCanceled":false,"rooms":[{"number":"R 2.091","building":"R","campus":
      "Lothstrasse","actions":[]}],"lecturer":[{"title":null,"firstName":null,
      "lastName":"Rothlauf","actions":[]}],"actions":[]},{"begin":
      "20180429T070000Z","end":"20180429T150000Z","title":null,"isCanceled":
      false,"rooms":[{"number":"R 2.091","building":"R","campus":"Lothstrasse",
      "actions":[]}],"lecturer":[{"title":null,"firstName":null,"lastName":
      "Rothlauf","actions":[]}],"actions":[]}],"name":"Intercultural Management"
      ,"shortName":"Intcult Mgt and Ledership","actions":[]}
      ''');
      try {
        builder = new CourseBuilder.fromJson(jsonData);
      } catch (e) {
        fail("Unable to parse json data");
      }
      var testString = "test";
      var testBool = true;
      var testInt = 1;
      var testDynamicList = new List<dynamic>();
      var testCorrelationList = new List<Correlation>();
      var testDateList = new List<Date>();
      var testRoomList = new List<Room>();
      var testLecturerList = new List<Lecturer>();
      var testLectureList = new List<Lecture>();
      builder
          .withId(testString)
          .withDescription(testString)
          .withIsCoterie(testBool)
          .withhasHomeBias(testBool)
          .withCorrelations(testCorrelationList)
          .withdates(testDateList)
          .withShortName(testString)
          .withActions(testDynamicList)
          .withLecturesPerWeek(testLectureList)
          .withHoursPerWeek(testInt)
          .withEcts(testInt)
          .withProfessorEmail(testString)
          .withProfessorName(testString)
          .withIsFavorite(testBool);
      Course built = builder.build();
      expect(built.name, "Intercultural Management");
      expect(built.isFavourite, testBool);
      expect(built.id, testString);
      expect(built.description, testString);
      expect(built.isCoterie, testBool);
      expect(built.hasHomeBias, testBool);
      expect(built.correlations, testCorrelationList);
      expect(built.dates, testDateList);
      if (built.dates.length > 0) {
        expect(built.dates[0].rooms, testRoomList);
        expect(built.dates[0].lecturers, testLecturerList);
      }
      expect(built.shortName, testString);
      expect(built.actions, testDynamicList);
      expect(built.faculty, "09");
      expect(built.lecturesPerWeek, testLectureList);
      expect(built.ects, testInt);
      expect(built.professorEmail, testString);
      expect(built.professorName, testString);
      expect(built.available, CourseAvailability.UNAVAILABLE);
      expect(built.isFavourite, testBool);
    });
  });
}
