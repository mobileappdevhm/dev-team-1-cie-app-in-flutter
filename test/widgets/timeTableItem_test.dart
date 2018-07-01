import 'package:cie_team1/model/course/course.dart';
import 'package:cie_team1/utils/staticVariables.dart';
import 'package:cie_team1/widgets/timeTableItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

@Timeout(const Duration(seconds: 20))
void main() {
  Lecture testLectureOne;
  Course testCourseOne;

  setUp(() {
    testLectureOne = new Lecture(Campus.KARLSTRASSE, Weekday.Mon,
        new DayTime(10, 00), new DayTime(11, 30), "R0.009");
    testCourseOne = new CourseBuilder()
        .withName("Blaba")
        .withFaculty("7")
        .withLecturesPerWeek([testLectureOne])
        .withDescription("boring")
        .withHoursPerWeek(2)
        .withEcts(2)
        .withProfessorEmail(StaticVariables.MOCK_EMAIL)
        .withProfessorName("Max Mustermann")
        .withIsCoterie(false)
        .withhasHomeBias(false)
        .withIsFavorite(false)
        .build();
    testLectureOne.course = testCourseOne;
  });

  group('settingspagewidget', () {
    testWidgets('1 widgetTest for settings', (WidgetTester tester) async {
// Tells the tester to build a UI based on the widget tree passed to it
      await tester.pumpWidget(
        new StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return new MaterialApp(
              home: new Material(
                child: new Center(child: new TimeTableItem(testLectureOne)),
              ),
            );
          },
        ),
      );

      final Iterable<Widget> listOfWidgets = tester.allWidgets;
      int i = 0;
      List<String> expectedTextWidgetData = [
        'Blaba',
        'Campus:',
        'Karl.',
        'Time:',
        '10:00-11:30',
        'Professor:',
        'Max Mustermann',
        'Room:',
        'R0.009',
      ];
      for (Widget widget in listOfWidgets) {
        if (widget is Text) {
          expect(
              widget.data.contains(expectedTextWidgetData.elementAt(i)), true);
          i++;
        }
      }
    });
  });
}
