import 'package:cie_team1/utils/staticVariables.dart';
import 'package:cie_team1/widgets/privacyPage.dart';
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
                child: new Center(child: new PrivacyPage()),
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
            expect(widget.data.isEmpty, false);
            counter++;
          }
        }
      }
    });
  });

  group('settingspagewidget State', () {
    testWidgets('1 switch states', (WidgetTester tester) async {
// Tells the tester to build a UI based on the widget tree passed to it
      await tester.pumpWidget(
        new StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return new MaterialApp(
              home: new Material(
                child: new Center(child: new PrivacyPage()),
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
            expect(widget.data.isEmpty, false);
            counter++;
          } else if (counter == 1) {
            expect(widget.data, 'Contact');
            counter++;
          } else if (counter == 2) {
            expect(widget.data, StaticVariables.CHANGE_TO_GERMAN);
            await tester.tap(find.byWidget(widget));
            counter++;
          }
        }
      }
    });
  });
}
