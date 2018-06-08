import 'package:cie_team1/model/course/course.dart';
import 'package:cie_team1/utils/schedulingUtility.dart';
import 'package:cie_team1/utils/staticVariables.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

@Timeout(const Duration(seconds: 5))
void main() {


  group('far campus', ()
  {


    test('1 far campus, both same Loth', () async {

      final bool sut = SchedulingUtility.isFarCampus(Campus.LOTHSTRASSE , Campus.LOTHSTRASSE);

      expect(sut, false);
    });

    test('2 far campus, both same Pasing', () async {

      final bool sut = SchedulingUtility.isFarCampus(Campus.PASING , Campus.PASING);

      expect(sut, false);
    });

    test('3 far campus, both same Karl', () async {

      final bool sut = SchedulingUtility.isFarCampus(Campus.KARLSTRASSE , Campus.KARLSTRASSE);

      expect(sut, false);
    });

    test('4 far campus, Loth Pasing', () async {

      final bool sut = SchedulingUtility.isFarCampus(Campus.LOTHSTRASSE , Campus.PASING);

      expect(sut, true);
    });

    test('5 far campus, Loth Pasing', () async {

      final bool sut = SchedulingUtility.isFarCampus(Campus.PASING , Campus.LOTHSTRASSE);

      expect(sut, true);
    });

    test('6 far campus, Loth Karl', () async {

      final bool sut = SchedulingUtility.isFarCampus(Campus.KARLSTRASSE , Campus.LOTHSTRASSE);

      expect(sut, false);
    });

    test('7 far campus, Loth Karl', () async {

      final bool sut = SchedulingUtility.isFarCampus(Campus.LOTHSTRASSE , Campus.KARLSTRASSE);

      expect(sut, false);
    });

    test('8 far campus, Pasing Karl', () async {

      final bool sut = SchedulingUtility.isFarCampus(Campus.PASING , Campus.KARLSTRASSE);

      expect(sut, true);
    });

    test('9 far campus, Pasing Karl', () async {

      final bool sut = SchedulingUtility.isFarCampus(Campus.KARLSTRASSE , Campus.PASING);

      expect(sut, true);
    });


  });//group

  group('schedulingtest', ()
  {


    test('1 both Pasing', () async {

      final DayTime day1 = new DayTime(12, 0);
      final DayTime day2 = new DayTime(12,5);
      final bool sut = SchedulingUtility.isSchedulingConflict(day1, day2, Campus.PASING, Campus.PASING);

      expect(sut, false);
    });

    test('2 both Loth', () async {

      final DayTime day1 = new DayTime(12, 0);
      final DayTime day2 = new DayTime(12,5);
      final bool sut = SchedulingUtility.isSchedulingConflict(day1, day2, Campus.LOTHSTRASSE, Campus.LOTHSTRASSE);

      expect(sut, false);
    });

    test('2 Loth Pasing', () async {

      final DayTime day1 = new DayTime(12, 0);
      final DayTime day2 = new DayTime(12,5);
      final bool sut = SchedulingUtility.isSchedulingConflict(day1, day2, Campus.LOTHSTRASSE, Campus.PASING);

      expect(sut, true);
    });

    test('2 Loth Pasing much time', () async {

      final DayTime day1 = new DayTime(12, 0);
      final DayTime day2 = new DayTime(18,5);
      final bool sut = SchedulingUtility.isSchedulingConflict(day1, day2, Campus.LOTHSTRASSE, Campus.PASING);

      expect(sut, false);
    });

    test('2 Loth Loth much time', () async {

      final DayTime day1 = new DayTime(12, 0);
      final DayTime day2 = new DayTime(18,5);
      final bool sut = SchedulingUtility.isSchedulingConflict(day1, day2, Campus.LOTHSTRASSE, Campus.LOTHSTRASSE);

      expect(sut, false);
    });


  });//group




}//main