import 'package:cie_team1/model/course/course.dart';
import 'package:flutter/material.dart';
import 'package:test/test.dart';
import 'package:cie_team1/utils/cieColor.dart';

@Timeout(const Duration(seconds: 10))
void main() {
  group("simplecourseTest", () {
    test('1', () {
      final Course sut = new CourseBuilder()
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
        .withAvailable(CourseAvailability.AVAILABLE)
        .withIsFavorite(false)
      .build();

      expect(sut.name, "Blaba");
    });

    test('2', () {
      final Course sut = new CourseBuilder()
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
          .withAvailable(CourseAvailability.AVAILABLE)
          .withIsFavorite(false)
      .build();
      expect(sut.faculty, "7");
    });
    test('3', () {
      final Course sut = new CourseBuilder()
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
          .withAvailable(CourseAvailability.AVAILABLE)
          .withIsFavorite(false)
          .build();

      expect(sut.lecturesPerWeek[0].weekday, Weekday.Mon);
      expect(sut.lecturesPerWeek[0].startDayTime.toString(),
          new DayTime(10, 00).toString());
      expect(sut.lecturesPerWeek[0].endDayTime.toString(),
          new DayTime(11, 30).toString());
    });
    test('4', () {
      final Course sut = new CourseBuilder()
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
        .withAvailable(CourseAvailability.AVAILABLE)
        .withIsFavorite(false)
      .build();

      expect(sut.description, "boring");
    });
    test('5', () {
      final Course sut = new CourseBuilder()
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
        .withAvailable(CourseAvailability.AVAILABLE)
        .withIsFavorite(false)
      .build();

      expect(sut.hoursPerWeek, 2);
    });
    test('6', () {
      final Course sut = new CourseBuilder()
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
        .withAvailable(CourseAvailability.AVAILABLE)
        .withIsFavorite(false)
      .build();

      expect(sut.ects, 2);
    });

    test('7', () {
      final Course sut = new CourseBuilder()
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
        .withAvailable(CourseAvailability.AVAILABLE)
        .withIsFavorite(false)
      .build();

      expect(sut.professorEmail, "example@hm.edu");
    });

    test('8', () {
      final Course sut = new CourseBuilder()
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
        .withAvailable(CourseAvailability.AVAILABLE)
        .withIsFavorite(false)
      .build();

      expect(sut.professorName, "Max Mustermann");
    });

    test('9', () {
      final Course sut = new CourseBuilder()
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
        .withAvailable(CourseAvailability.AVAILABLE)
        .withIsFavorite(false)
      .build();

      expect(sut.available, CourseAvailability.AVAILABLE);
    });

    test('10', () {
      final Course sut = new CourseBuilder()
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
        .withAvailable(CourseAvailability.AVAILABLE)
        .withIsFavorite(false)
      .build();

      expect(sut.isFavourite, false);
    });

    test('11', () {
      final Course sut = new CourseBuilder()
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
        .withAvailable(CourseAvailability.AVAILABLE)
        .withIsFavorite(false)
      .build();

      expect(sut.available, CourseAvailability.AVAILABLE);
    });

    test('12 ocure', () {
      final Course sut = new CourseBuilder()
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
        .withAvailable(CourseAvailability.AVAILABLE)
        .withIsFavorite(false)
      .build();

      expect(sut.occursOnDay(Weekday.Mon), true);
    });

    test('13 ocure', () {
      final Course sut = new CourseBuilder()
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
        .withAvailable(CourseAvailability.AVAILABLE)
        .withIsFavorite(false)
      .build();

      expect(sut.occursOnDay(Weekday.Sun), false);
    });

    test('14 equals', () {
      final Course sut = new CourseBuilder()
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
          .withAvailable(CourseAvailability.AVAILABLE)
          .withIsFavorite(false)
          .build();

      final Course sut2 = new CourseBuilder()
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
          .withAvailable(CourseAvailability.AVAILABLE)
          .withIsFavorite(false)
          .build();

      expect(sut.equals(sut2), true);
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

    test('unavailable', () {
      expect(
          CourseAvailabilityUtility
              .getFacultyAsInt(CourseAvailability.UNAVAILABLE),
          2);
    });

    test('available', () {
      expect(
          CourseAvailabilityUtility
              .intToColoredString(CourseAvailability.AVAILABLE,1.0).toString(),
          new Text('Available',style: new TextStyle(fontSize: 1.0, color: CiEColor.green)).toString());
    });

    test('available', () {
      expect(
          CourseAvailabilityUtility
              .intToColoredString(CourseAvailability.PENDING,1.0).toString(),
          new Text('Pending',style: new TextStyle(fontSize: 1.0, color: CiEColor.yellow)).toString());
    });

    test('unavailable', () {
      expect(
          CourseAvailabilityUtility
              .intToColoredString(CourseAvailability.UNAVAILABLE,1.0).toString(),
          new Text('Unavailable',style: new TextStyle(fontSize: 1.0, color: CiEColor.red)).toString());
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

  group("CourseBuilder", (){

    test('1', () {
      final CourseBuilder sut = new CourseBuilder();
      expect(sut.withId("1").id, '1');
    });

    test('2', () {
      final CourseBuilder sut = new CourseBuilder();
      expect(sut.withIsCoterie(true).isCoterie, true);
    });

    test('3', () {
      final CourseBuilder sut = new CourseBuilder();
      expect(sut.withhasHomeBias(true).hasHomeBias, true);
    });

    test('4', () {
      final CourseBuilder sut = new CourseBuilder();
      expect(sut.withShortName("213412343412").shortName, '213412343412');
    });

    test('5', () {
      final CourseBuilder sut = new CourseBuilder();
      expect(sut.withCorrelations(new List<dynamic>()).runtimeType, new CourseBuilder().runtimeType);
    });

    test('6', () {
      final CourseBuilder sut = new CourseBuilder();
      expect(sut.withActions(new List<dynamic>()).runtimeType, new CourseBuilder().runtimeType);
    });

    test('6', () {
      final CourseBuilder sut = new CourseBuilder();
      expect(sut.withdates(new List<dynamic>()).runtimeType, new CourseBuilder().runtimeType);
    });

    test('6', () {
      /*
      final Map<String,dynamic> map = new Map<String,dynamic>();

      map["id"] = "10";
      map["description"] = "10";
      map["isCoterie"] = true;
      map["hasHomeBias"] = true;
      map["correlation"] = true;
      map["dates"] = "s";
      map["name"] = "asdbkvk";
      map["shortName"] = "sadasdsad";
      map["actions"] = "1";
      final CourseBuilder sut = CourseBuilder.fromJson(map);
      expect(sut.runtimeType, new CourseBuilder().runtimeType);
      */
    });


  });


}
