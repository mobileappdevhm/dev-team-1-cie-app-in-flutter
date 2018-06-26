import 'package:cie_team1/presenter/courseListPresenter.dart';
import 'package:cie_team1/utils/staticVariables.dart';
import 'package:cie_team1/widgets/courseDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

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
                child: new Center(
                    child: new CourseDetails(
                  0,
                  new CourseListPresenter(null, Flavor.MOCK),
                )),
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
            expect(widget.data, 'Title of Course 1');
            counter++;
          } else if (counter == 1) {
            expect(widget.data, 'FK 02');
            counter++;
          } else if (counter == 2) {
            expect(widget.data.contains("Wed"), true);
            counter++;
          } else if (counter == 3) {
            expect(widget.data.isEmpty, false);
            counter++;
          } else if (counter == 5) {
            expect(widget.data, 'Description');
            counter++;
          } else if (counter == 6) {
            expect(widget.data.isEmpty, false);
            counter++;
          } else if (counter == 7) {
            expect(widget.data, 'ECTS:');
            counter++;
          } else if (counter == 9) {
            expect(widget.data.isEmpty, false);
            counter++;
          } else if (counter == 10) {
            expect(widget.data, "Hours per Week:");
            counter++;
          } else if (counter == 11) {
            expect(widget.data.contains("1"), true);
            counter++;
          } else if (counter == 12) {
            expect(widget.data, 'Pending');
            counter++;
          } else if (counter == 13) {
            expect(widget.data, 'Contact');
            counter++;
          } else if (counter == 14) {
            expect(widget.data, 'Course Details');
            counter++;
          }
        }
      }
    });
  });
}
