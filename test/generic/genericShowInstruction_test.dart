import 'package:cie_app/generic/genericShowInstruction.dart';
import 'package:cie_app/presenter/courseListPresenter.dart';
import 'package:cie_app/presenter/currentUserPresenter.dart';
import 'package:cie_app/utils/staticVariables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

CourseListPresenter courseListPresenter;
CurrentUserPresenter currentUserPresenter;

@Timeout(const Duration(seconds: 20))
void main() {
  group('Introduction', () {
    setUp(() {
      courseListPresenter = new CourseListPresenter(null);
      currentUserPresenter = new CurrentUserPresenter(null, Flavor.PROD);
    });

    testWidgets('1 widgetTest for introduction', (WidgetTester tester) async {
      // Tells the tester to build a UI based on the widget tree passed to it
      await tester.pumpWidget(
        new StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return new MaterialApp(
              home: new Material(
                  child: new Column(
                children: <Widget>[
                  GenericShowInstruction.showInstructions(
                      context, true, courseListPresenter, currentUserPresenter),
                ],
              )),
            );
          },
        ),
      );

      final Iterable<Widget> listOfWidgets = tester.allWidgets;

      int counter = 0;
      for (Widget widget in listOfWidgets) {
        if (widget is Text) {
          if (counter == 0) {
            expect(widget.data, StaticVariables.INSTRUCTIONS_TITLE);
            counter++;
          } else if (counter == 1) {
            expect(widget.data, StaticVariables.INSTRUCTIONS_BASIC);
            counter++;
          } else if (counter == 2) {
            expect(widget.data, StaticVariables.INSTRUCTIONS_TIP);
            counter++;
          } else if (counter == 3) {
            expect(widget.data, StaticVariables.INSTRUCTIONS_TRAFFIC_LIGHT);
            counter++;
          } else if (counter == 4) {
            expect(widget.data, StaticVariables.INSTRUCTIONS_FAVORITES);
            counter++;
          } else if (counter == 5) {
            expect(widget.data, StaticVariables.INSTRUCTIONS_LOTTERY);
            counter++;
          } else if (counter == 6) {
            expect(
                widget.data, StaticVariables.INSTRUCTIONS_BUTTON_TEXT_REFRESH);
            counter++;
          }
        }
      }
    });

    testWidgets('2 widgetTest for introduction on course list',
        (WidgetTester tester) async {
      // Tells the tester to build a UI based on the widget tree passed to it
      await tester.pumpWidget(
        new StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return new MaterialApp(
              home: new Material(
                  child: new Column(
                children: <Widget>[
                  GenericShowInstruction.showInstructions(context, false,
                      courseListPresenter, currentUserPresenter),
                ],
              )),
            );
          },
        ),
      );

      final Iterable<Widget> listOfWidgets = tester.allWidgets;

      int counter = 0;
      for (Widget widget in listOfWidgets) {
        if (widget is Text) {
          if (counter == 0) {
            expect(widget.data, StaticVariables.INSTRUCTIONS_TITLE);
            counter++;
          } else if (counter == 1) {
            expect(widget.data, StaticVariables.INSTRUCTIONS_BASIC);
            counter++;
          } else if (counter == 2) {
            expect(widget.data, StaticVariables.INSTRUCTIONS_TIP);
            counter++;
          } else if (counter == 3) {
            expect(widget.data, StaticVariables.INSTRUCTIONS_TRAFFIC_LIGHT);
            counter++;
          } else if (counter == 4) {
            expect(widget.data, StaticVariables.INSTRUCTIONS_FAVORITES);
            counter++;
          } else if (counter == 5) {
            expect(widget.data, StaticVariables.INSTRUCTIONS_LOTTERY);
            counter++;
          } else if (counter == 6) {
            expect(widget.data, StaticVariables.INSTRUCTIONS_BUTTON_TEXT);
            counter++;
          }
        }
      }
    });
  });
}
