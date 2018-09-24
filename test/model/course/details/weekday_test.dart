import 'package:cie_app/model/course/details/weekday.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('getWeekdayAsString', () {
    test('Sun', () {
      expect(WeekdayUtility.getWeekdayAsString(Weekday.Sun), "Sun");
    });

    test('Sat', () {
      expect(WeekdayUtility.getWeekdayAsString(Weekday.Sat), "Sat");
    });
    test('Fri', () {
      expect(WeekdayUtility.getWeekdayAsString(Weekday.Fri), "Fri");
    });

    test('Thu', () {
      expect(WeekdayUtility.getWeekdayAsString(Weekday.Thu), "Thu");
    });

    test('Wed', () {
      expect(WeekdayUtility.getWeekdayAsString(Weekday.Wed), "Wed");
    });

    test('Tue', () {
      expect(WeekdayUtility.getWeekdayAsString(Weekday.Tue), "Tue");
    });

    test('Mon', () {
      expect(WeekdayUtility.getWeekdayAsString(Weekday.Mon), "Mon");
    });
  });

  group('getWeekdayAsLongString', () {
    test('Sunday', () {
      expect(WeekdayUtility.getWeekdayAsLongString(Weekday.Sun), "Sunday");
    });
    test('Saturday', () {
      expect(WeekdayUtility.getWeekdayAsLongString(Weekday.Sat), "Saturday");
    });
    test('Friday', () {
      expect(WeekdayUtility.getWeekdayAsLongString(Weekday.Fri), "Friday");
    });
    test('Thursday', () {
      expect(WeekdayUtility.getWeekdayAsLongString(Weekday.Thu), "Thursday");
    });
    test('Wednesday', () {
      expect(WeekdayUtility.getWeekdayAsLongString(Weekday.Wed), "Wednesday");
    });
    test('Tuesday', () {
      expect(WeekdayUtility.getWeekdayAsLongString(Weekday.Tue), "Tuesday");
    });
    test('Monday', () {
      expect(WeekdayUtility.getWeekdayAsLongString(Weekday.Mon), "Monday");
    });
  });

  group('getWeekdayAsInt', () {
    test('6', () {
      expect(WeekdayUtility.getWeekdayAsInt(Weekday.Sun), 6);
    });

    test('5', () {
      expect(WeekdayUtility.getWeekdayAsInt(Weekday.Sat), 5);
    });
    test('4', () {
      expect(WeekdayUtility.getWeekdayAsInt(Weekday.Fri), 4);
    });

    test('3', () {
      expect(WeekdayUtility.getWeekdayAsInt(Weekday.Thu), 3);
    });

    test('2', () {
      expect(WeekdayUtility.getWeekdayAsInt(Weekday.Wed), 2);
    });

    test('1', () {
      expect(WeekdayUtility.getWeekdayAsInt(Weekday.Tue), 1);
    });

    test('0', () {
      expect(WeekdayUtility.getWeekdayAsInt(Weekday.Mon), 0);
    });
  });

  group('intToWeekday', () {
    test('Sun', () {
      expect(WeekdayUtility.intToWeekday(6), Weekday.Sun);
    });

    test('Sat', () {
      expect(WeekdayUtility.intToWeekday(5), Weekday.Sat);
    });

    test('Fri', () {
      expect(WeekdayUtility.intToWeekday(4), Weekday.Fri);
    });

    test('Thu', () {
      expect(WeekdayUtility.intToWeekday(3), Weekday.Thu);
    });

    test('Wed', () {
      expect(WeekdayUtility.intToWeekday(2), Weekday.Wed);
    });

    test('Tue', () {
      expect(WeekdayUtility.intToWeekday(1), Weekday.Tue);
    });

    test('Mon', () {
      expect(WeekdayUtility.intToWeekday(0), Weekday.Mon);
    });
  });
}
