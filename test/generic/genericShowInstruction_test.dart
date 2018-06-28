import 'package:cie_team1/generic/genericShowInstruction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

@Timeout(const Duration(seconds: 20))
void main() {
  group('Introduction', () {
    testWidgets('1 widgetTest for introduction', (WidgetTester tester) async {
      // Tells the tester to build a UI based on the widget tree passed to it
      await tester.pumpWidget(
        new StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return new MaterialApp(
              home: new Material(
                  child: new Column(
                    children: <Widget>[
                      GenericShowInstruction.showInstructions(null, context),
                    ],
                  )
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
            expect(widget.data,"Instructions");
            counter++;
          } else if (counter == 1) {
            expect(
                widget.data,"Unfortunately you have not downloaded any course data "
                "yet. At the end of the instruction you can download the courses for the fist time. "
                "After finishing the setup you can swipe down on favorite and courses page at any time to refresh.");
            counter++;
          } else if (counter == 2) {
            expect(widget.data, "Afterwards you will be able to to select favorite courses.\n"
                "Tipp: Use the filter at top of courses page to filter courses. Then press the heart icon.");
            counter++;
          } else if (counter == 3) {
            expect(widget.data, "You will notice that each course on the left side is dimpled "
                "red, orange or green. Red means you can't attend this course. "
                "Orange and green courses can be attended.");
            counter++;
          } else if (counter == 4) {
            expect(widget.data, "If you add courses to your favorites, which may lead to a time "
                "conflict, you can see this directly in the course selection. Click "
                "on the course for details.");
            counter++;
          } else if (counter == 5) {
            expect(widget.data, "Now when you have selected your favorites visit Favorite "
                "tab and hand in your courses for lottery. And don't foreget to "
                "check out your Timetable. By the way you can use the Timetable even if "
                "you don't use lottery function.");
            counter++;
          } else if (counter == 6) {
            expect(widget.data, "Plase go to courses page and refresh by swiping down.");
            counter++;
          } else if (counter == 7) {
            expect(widget.data, "Download courses now and restart");
            counter++;
          }
        }
      }
    });
  });
}