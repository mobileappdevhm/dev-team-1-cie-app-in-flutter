import 'package:cie_team1/model/course/courses_mock.dart';
import 'package:cie_team1/views/takenCourses.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cie_team1/presenter/currentUserPresenter.dart';
import 'package:cie_team1/utils/staticVariables.dart';

@Timeout(const Duration(seconds: 20))
void main() {
  //TODO: Reimplement test
  /*
  testWidgets('1 widgetTest', (WidgetTester tester) async {
    void _voidCallback(bool didChange) {}
    CurrentUserPresenter ct = new CurrentUserPresenter(_voidCallback, Flavor.MOCK);
    // Tells the tester to build a UI based on the widget tree passed to it
    await tester.pumpWidget(
      new StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return new MaterialApp(
            home: new Material(
              child: new Center(child: new TakenCourses(ct)),
            ),
          );
        },
      ),
    );

    final Iterable<Widget> listOfWidgets = tester.allWidgets;

    int counter = 0;
    for (Widget widget in listOfWidgets) {
      if (widget is Text) {
        if (counter == 0) {
          expect(widget.data, 'Total of 6 ECTS');
          counter++;
        } else if (counter == 1) {
          expect(widget.data, CoursesMock.generateMockCourseTitle(1));
          counter++;
        } else if (counter == 2) {
          expect(widget.data.substring(0, 2), 'DP');
          counter++;
        } else if (counter == 3) {
          expect(widget.data.isNotEmpty, true);
          counter++;
        }
        // can be extended
      }
    }
  });
  */
}
