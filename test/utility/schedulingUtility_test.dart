import 'package:cie_team1/utils/schedulingUtility.dart';
import 'package:cie_team1/model/course/course.dart';
import 'package:test/test.dart';

void main() {
  group("isFarCampus", (){
    test('1', () {
      bool result = SchedulingUtility.isFarCampus(Campus.KARLSTRASSE, Campus.KARLSTRASSE);
      expect(result, false);
    });

    test('2', () {
      bool result = SchedulingUtility.isFarCampus(Campus.LOTHSTRASSE, Campus.LOTHSTRASSE);
      expect(result, false);
    });

    test('3', () {
      bool result = SchedulingUtility.isFarCampus(Campus.PASING, Campus.PASING);
      expect(result, false);
    });

    test('4', () {
      bool result = SchedulingUtility.isFarCampus(Campus.KARLSTRASSE, Campus.LOTHSTRASSE);
      expect(result, false);
    });

    test('3', () {
      bool result = SchedulingUtility.isFarCampus(Campus.KARLSTRASSE, Campus.PASING);
      expect(result, true);
    });

    test('4', () {
      bool result = SchedulingUtility.isFarCampus(Campus.LOTHSTRASSE, Campus.PASING);
      expect(result, true);
    });
  });

  group("isCloseTime", (){
    test('1', () {
      DayTime one = new DayTime(10, 00);
      DayTime two = new DayTime(11, 30);
      bool result = SchedulingUtility.isCloseTime(one, two);
      expect(result, false);
    });

    test('2', () {
      DayTime one = new DayTime(11, 30);
      DayTime two = new DayTime(11, 45);
      bool result = SchedulingUtility.isCloseTime(one, two);
      expect(result, true);
    });

    test('2', () {
      DayTime one = new DayTime(11, 30);
      DayTime two = new DayTime(11, 30);
      bool result = SchedulingUtility.isCloseTime(one, two);
      expect(result, true);
    });
  });

  group("isSchedulingConflict", (){
    test('1', () {
      DayTime dayTimeOne = new DayTime(10, 00);
      DayTime dayTimeTwo = new DayTime(11, 30);

      bool result = SchedulingUtility.isSchedulingConflict(dayTimeOne,
          dayTimeTwo, Campus.LOTHSTRASSE, Campus.PASING);
      expect(result, false);
    });

    test('2', () {
      DayTime dayTimeOne = new DayTime(11, 30);
      DayTime dayTimeTwo = new DayTime(11, 45);

      bool result = SchedulingUtility.isSchedulingConflict(dayTimeOne,
          dayTimeTwo, Campus.LOTHSTRASSE, Campus.LOTHSTRASSE);
      expect(result, false);
    });

    test('3', () {
      DayTime dayTimeOne = new DayTime(11, 30);
      DayTime dayTimeTwo = new DayTime(11, 45);

      bool result = SchedulingUtility.isSchedulingConflict(dayTimeOne,
          dayTimeTwo, Campus.LOTHSTRASSE, Campus.PASING);
      expect(result, true);
    });
  });
}