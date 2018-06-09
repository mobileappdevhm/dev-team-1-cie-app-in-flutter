import 'package:cie_team1/model/course/course.dart';
import 'package:cie_team1/views/tabs.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

@Timeout(const Duration(seconds: 20))
void main() {
  group('settingspagewidget', () {
    testWidgets('1 widgetTest for settings', (WidgetTester tester) async {
// Tells the tester to build a UI based on the widget tree passed to it
      await tester.pumpWidget(
        new StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return new MaterialApp(
              home: new Material(
                child: new Center(child: new TabsPage()),
              ),
            );
          },
        ),
      );

      final Iterable<Widget> listOfWidgets = tester.allWidgets;

      int counter = 0;
      for (Widget widget in listOfWidgets) {
        if (widget is Text) {
          if (WeekdayUtility.getCurrentWeekday() == Weekday.Sun ||
              WeekdayUtility.getCurrentWeekday() == Weekday.Sat) { // on weekend arent any courses
            if (counter == 0) {
              expect(widget.data, 'Today');
              counter++;
            } else if (counter == 1) {
              expect(
                  widget.data,
                  WeekdayUtility
                      .getWeekdayAsString(WeekdayUtility.getCurrentWeekday()));
              counter++;
            }
          } else {
            if (counter == 0) {
              expect(widget.data, 'Today');
              counter++;
            } else if (counter == 1) {
              expect(
                  widget.data,
                  WeekdayUtility
                      .getWeekdayAsString(WeekdayUtility.getCurrentWeekday()));
              counter++;
            } else if (counter == 2) {
              expect(widget.data.substring(0, 15), "Title of Course");
              counter++;
            } else if (counter == 3) {
              expect(widget.data.substring(0, 13), ' - Professor ');
              counter++;
            } else if (counter == 4) {
              expect(widget.data.substring(0, 8), 'Campus: ');
              counter++;
            } else if (counter == 5) {
              expect(widget.data, 'Pasing');
              counter++;
            }
          }
        }
      }
    });
  });
}
