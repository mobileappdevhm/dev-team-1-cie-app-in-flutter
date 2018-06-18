import 'package:cie_team1/presenter/currentUserPresenter.dart';
import 'package:cie_team1/utils/staticVariables.dart';
import 'package:cie_team1/views/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

@Timeout(const Duration(seconds: 20))
void main() {
  group('settingspagewidget', () {
    testWidgets('1 widgetTest for settings', (WidgetTester tester) async {
      _voidCallback(bool didChange) {print("wot");}
      CurrentUserPresenter currentUserPresenter = new CurrentUserPresenter(_voidCallback, Flavor.MOCK);
// Tells the tester to build a UI based on the widget tree passed to it
      await tester.pumpWidget(
        new StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return new MaterialApp(
              home: new Material(
                child: new Center(child: new Settings(currentUserPresenter)),
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
            expect(widget.data, StaticVariables.LOGGED_IN_AS);
            counter++;
          } else if (counter == 1) {
            expect(widget.data, " " + new CurrentUserPresenter(_voidCallback,
                Flavor.MOCK).getFullName());
            counter++;
          } else if (counter == 2) {
            expect(widget.data, StaticVariables.LOGOUT_BUTTON);
            counter++;
          } else if (counter == 3) {
            expect(widget.data, StaticVariables.PRIVACY_BUTTON);
            counter++;
          }else if (counter == 4) {
            expect(widget.data, StaticVariables.STATUS + " : ");
            counter++;
          } else if (counter == 5) {
            expect(widget.data, " " + new CurrentUserPresenter(_voidCallback,
                Flavor.MOCK).getCurrentUserStatus());
            counter++;
          } else if (counter == 6) {
            expect(widget.data, StaticVariables.DEPARTMENT + " : ");
            counter++;
          } else if (counter == 7) {
            expect(widget.data, " " + new CurrentUserPresenter(_voidCallback,
                Flavor.MOCK).getCurrentUserFaculty());
            counter++;
          } else if (counter == 8) {
            expect(widget.data, StaticVariables.CONTACT_OFFICE);
            counter++;
          } else if (counter == 9) {
            expect(widget.data, StaticVariables.CIE_CERTIFICATE);
            counter++;
          } else if (counter == 10) {
            expect(widget.data.isEmpty, false);
            counter++;
          } else if (counter == 11) {
            expect(widget.data, StaticVariables.IE_CERTIFICATE);
            counter++;
          } else if (counter == 12) {
            expect(widget.data.isEmpty, false);
            counter++;
          } else if (counter == 13) {
            expect(widget.data, StaticVariables.TAKEN_COURSES);
            counter++;
          }
        }
      }
    });
  });
}
