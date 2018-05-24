import 'package:cie_team1/views/maps.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

@Timeout(const Duration(seconds: 20))
void main() {
  //not working because exception if page is building.
/*
  testWidgets('1 widgetTest for map', (WidgetTester tester) async {
    // Tells the tester to build a UI based on the widget tree passed to it
    await tester.pumpWidget(
      new StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return new MaterialApp(
            home: new Material(
              child: new Center(
                  child: new MapPage()
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
          expect(widget.data, 'Lothstrasse');
          counter++;
        } else if (counter == 1) {
          expect(widget.data, 'Pasing');
          counter++;
        } else if (counter == 1) {
        expect(widget.data, 'Karlstrasse');
        counter++;
        }
      }
    }

  });
*/
}
