import 'package:cie_team1/generated/i18n.dart';
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
              localizationsDelegates: [S.delegate],
              supportedLocales: S.delegate.supportedLocales,
              localeResolutionCallback:
                  S.delegate.resolution(fallback: new Locale("en", "")),
              onGenerateTitle: (context) => S.of(context).main_title,
              theme: new ThemeData(
                primarySwatch: Colors.red,
              ),
              home: new Material(
                child: new Center(child: new CourseDetails()),
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
            expect(widget.data, 'Title of course');
            counter++;
          } else if (counter == 1) {
            expect(widget.data, 'FK 07');
            counter++;
          } else if (counter == 2) {
            expect(widget.data, 'Description');
            counter++;
          } else if (counter == 3) {
            expect(widget.data.isEmpty, false);
            counter++;
          } else if (counter == 4) {
            expect(widget.data, "Hours per Week:");
            counter++;
          } else if (counter == 5) {
            expect(widget.data.isEmpty, false);
            counter++;
          } else if (counter == 6) {
            expect(widget.data, 'ECTS:');
            counter++;
          } else if (counter == 7) {
            expect(widget.data.isEmpty, false);
            counter++;
          } else if (counter == 8) {
            expect(widget.data, "Available");
            counter++;
          } else if (counter == 9) {
            expect(widget.data, "Contact");
            counter++;
          }
        }
      }
    });
  });
}
