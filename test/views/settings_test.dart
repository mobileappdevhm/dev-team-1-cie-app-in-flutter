import 'package:cie_team1/presenter/currentUserPresenter.dart';
import 'package:cie_team1/views/settings.dart';
import 'package:cie_team1/utils/staticVariables.dart';
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
                child: new Center(child: new Settings()),
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
            expect(widget.data, "Logged in as");
            counter++;
          } else if (counter == 1) {
            expect(widget.data, " " + new CurrentUserPresenter().getFullName());
            counter++;
          } else if (counter == 2) {
            expect(widget.data, "Log out");
            counter++;
          } else if (counter == 3) {
            expect(widget.data, "Status : ");
            counter++;
          } else if (counter == 4) {
            expect(widget.data,
                " " + new CurrentUserPresenter().getCurrentUserStatus());
            counter++;
          } else if (counter == 5) {
            expect(widget.data, "Department : ");
            counter++;
          } else if (counter == 6) {
            expect(widget.data,
                " " + new CurrentUserPresenter().getCurrentUserFaculty());
            counter++;
          } else if (counter == 7) {
            expect(widget.data, "Contact International Office");
            counter++;
          } else if (counter == 8) {
            expect(widget.data, "Courses in English Certificate");
            counter++;
          } else if (counter == 9) {
            expect(widget.data.isEmpty, false);
            counter++;
          } else if (counter == 10) {
            expect(widget.data, "International Engineering Certificate");
            counter++;
          } else if (counter == 11) {
            expect(widget.data.isEmpty, false);
            counter++;
          } else if (counter == 12) {
            expect(widget.data, "Taken Courses");
            counter++;
          }
        }
      }
    });
  });
}
