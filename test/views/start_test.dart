import 'package:cie_team1/views/start.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

@Timeout(const Duration(seconds: 20))
void main() {

  testWidgets('1 widgetTest', (WidgetTester tester) async {
    // Tells the tester to build a UI based on the widget tree passed to it
    await tester.pumpWidget(
      new StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return new MaterialApp(
            home: new Material(
              child: new Center(
                  child: new WelcomePage()
              ),
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
          expect(widget.data, 'Courses in English');
          counter++;
        } else if (counter == 1) {
          expect(widget.data, 'Start');
          counter++;
        }
      }
    }

    await tester.tap(find.text('Courses in English'));

  });

}

