import 'package:cie_app/presenter/courseListPresenter.dart';
import 'package:cie_app/presenter/currentUserPresenter.dart';
import 'package:cie_app/utils/staticVariables.dart';
import 'package:cie_app/views/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

@Timeout(const Duration(seconds: 20))
void main() {
  group('settingspagewidget', () {
    testWidgets('1 widgetTest for settings', (WidgetTester tester) async {
      // Tells the tester to build a UI based on the widget tree passed to it
      ValueChanged<bool> boolean;
      await tester.pumpWidget(
        new StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return new MaterialApp(
              home: new Material(
                child: new Center(
                    child: new Settings(
                        new CurrentUserPresenter(boolean, Flavor.PROD),
                        new CourseListPresenter(boolean))),
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
            expect(
                widget.data,
                " " +
                    new CurrentUserPresenter(boolean, Flavor.PROD)
                        .getFullName());
            counter++;
          } else if (counter == 2) {
            expect(widget.data, StaticVariables.LOGIN_BUTTON);
            counter++;
          } else if (counter == 3) {
            expect(widget.data, StaticVariables.SHOW_INSTRUCTIONS);
            counter++;
          } else if (counter == 4) {
            expect(widget.data, StaticVariables.LEVEL + ": ");
            counter++;
          } else if (counter == 5) {
            expect(
                widget.data,
                " " +
                    new CurrentUserPresenter(boolean, Flavor.PROD)
                        .getCurrentUserLevel());
            counter++;
          } else if (counter == 6) {
            expect(widget.data, StaticVariables.DEPARTMENT + ": ");
            counter++;
          } else if (counter == 7) {
            expect(
                widget.data,
                " " +
                    new CurrentUserPresenter(boolean, Flavor.PROD)
                        .getCurrentUserFaculty());
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
          } else if (counter == 14) {
            expect(widget.data.isNotEmpty, true); // is Metric button
            counter++;
          } else if (counter == 15) {
            expect(widget.data, StaticVariables.PRIVACY_BUTTON);
            counter++;
          }
        }
      }
    });

    testWidgets('2 widgetTest for settings', (WidgetTester tester) async {
      // Tells the tester to build a UI based on the widget tree passed to it
      ValueChanged<bool> boolean;
      await tester.pumpWidget(
        new StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return new MaterialApp(
              home: new Material(
                child: new Center(
                    child: new Settings(
                        new CurrentUserPresenter(boolean, Flavor.PROD),
                        new CourseListPresenter(boolean))),
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
            expect(
                widget.data,
                " " +
                    new CurrentUserPresenter(boolean, Flavor.MOCK)
                        .getFullName());
            counter++;
          } else if (counter == 2) {
            expect(widget.data, StaticVariables.LOGIN_BUTTON);
            counter++;
          } else if (counter == 3) {
            expect(widget.data, StaticVariables.SHOW_INSTRUCTIONS);
            await tester.tap(find.byWidget(widget));
            counter++;
          }
        }
      }
    });

//    testWidgets('3 widgetTest for settings Pressing Taken Courses Button',
//        (WidgetTester tester) async {
//      ValueChanged<bool> boolean;
//      // Tells the tester to build a UI based on the widget tree passed to it
//      await tester.pumpWidget(
//        new StatefulBuilder(
//          builder: (BuildContext context, StateSetter setState) {
//            return new MaterialApp(
//              home: new Material(
//                child: new Center(
//                    child: new Settings(
//                        new CurrentUserPresenter(boolean, Flavor.PROD))),
//              ),
//            );
//          },
//        ),
//      );
//
//      final Iterable<Widget> listOfWidgets = tester.allWidgets;
//
//      int counter = 0;
//      for (Widget widget in listOfWidgets) {
//        if (widget is Text) {
//          if (counter == 0) {
//            expect(widget.data, StaticVariables.LOGGED_IN_AS);
//            counter++;
//          } else if (counter == 1) {
//            expect(
//                widget.data,
//                " " +
//                    new CurrentUserPresenter(boolean, Flavor.PROD)
//                        .getFullName());
//            counter++;
//          } else if (counter == 2) {
//            expect(widget.data, StaticVariables.LOGIN_BUTTON);
//            counter++;
//          } else if (counter == 3) {
//            expect(widget.data, StaticVariables.SHOW_INSTRUCTIONS);
//            counter++;
//          } else if (counter == 4) {
//            expect(widget.data, StaticVariables.STATUS + " : ");
//            counter++;
//          } else if (counter == 5) {
//            expect(
//                widget.data,
//                " " +
//                    new CurrentUserPresenter(boolean, Flavor.PROD)
//                        .getCurrentUserStatus());
//            counter++;
//          } else if (counter == 6) {
//            expect(widget.data, StaticVariables.DEPARTMENT + " : ");
//            counter++;
//          } else if (counter == 7) {
//            expect(
//                widget.data,
//                " " +
//                    new CurrentUserPresenter(boolean, Flavor.PROD)
//                        .getCurrentUserFaculty());
//            counter++;
//          } else if (counter == 8) {
//            expect(widget.data, StaticVariables.CONTACT_OFFICE);
//            counter++;
//          } else if (counter == 9) {
//            expect(widget.data, StaticVariables.CIE_CERTIFICATE);
//            counter++;
//          } else if (counter == 10) {
//            expect(widget.data.isEmpty, false);
//            counter++;
//          } else if (counter == 11) {
//            expect(widget.data, StaticVariables.IE_CERTIFICATE);
//            counter++;
//          } else if (counter == 12) {
//            expect(widget.data.isEmpty, false);
//            counter++;
//          } else if (counter == 13) {
//            expect(widget.data, StaticVariables.TAKEN_COURSES);
//            await tester.tap(find.byWidget(widget));
//            counter++;
//          }
//        }
//      }
//    });
//
//    testWidgets('4 widgetTest for settings pressing show instruction',
//        (WidgetTester tester) async {
//      // Tells the tester to build a UI based on the widget tree passed to it
//      ValueChanged<bool> boolean;
//      await tester.pumpWidget(
//        new StatefulBuilder(
//          builder: (BuildContext context, StateSetter setState) {
//            return new MaterialApp(
//              home: new Material(
//                child: new Center(
//                    child: new Settings(
//                        new CurrentUserPresenter(boolean, Flavor.PROD))),
//              ),
//            );
//          },
//        ),
//      );
//
//      final Iterable<Widget> listOfWidgets = tester.allWidgets;
//
//      int counter = 0;
//      for (Widget widget in listOfWidgets) {
//        if (widget is Text) {
//          if (counter == 0) {
//            expect(widget.data, StaticVariables.LOGGED_IN_AS);
//            counter++;
//          } else if (counter == 1) {
//            expect(
//                widget.data,
//                " " +
//                    new CurrentUserPresenter(boolean, Flavor.PROD)
//                        .getFullName());
//            counter++;
//          } else if (counter == 2) {
//            expect(widget.data, StaticVariables.LOGIN_BUTTON);
//            counter++;
//          } else if (counter == 3) {
//            expect(widget.data, StaticVariables.SHOW_INSTRUCTIONS);
//            counter++;
//          } else if (counter == 4) {
//            expect(widget.data, StaticVariables.STATUS + " : ");
//            counter++;
//          } else if (counter == 5) {
//            expect(
//                widget.data,
//                " " +
//                    new CurrentUserPresenter(boolean, Flavor.PROD)
//                        .getCurrentUserStatus());
//            counter++;
//          } else if (counter == 6) {
//            expect(widget.data, StaticVariables.DEPARTMENT + " : ");
//            counter++;
//          } else if (counter == 7) {
//            expect(
//                widget.data,
//                " " +
//                    new CurrentUserPresenter(boolean, Flavor.PROD)
//                        .getCurrentUserFaculty());
//            counter++;
//          } else if (counter == 8) {
//            expect(widget.data, StaticVariables.CONTACT_OFFICE);
//            counter++;
//          } else if (counter == 9) {
//            expect(widget.data, StaticVariables.CIE_CERTIFICATE);
//            counter++;
//          } else if (counter == 10) {
//            expect(widget.data.isEmpty, false);
//            counter++;
//          } else if (counter == 11) {
//            expect(widget.data, StaticVariables.IE_CERTIFICATE);
//            counter++;
//          } else if (counter == 12) {
//            expect(widget.data.isEmpty, false);
//            counter++;
//          } else if (counter == 13) {
//            expect(widget.data, StaticVariables.TAKEN_COURSES);
//            counter++;
//          } else if (counter == 14) {
//            expect(widget.data.isNotEmpty, true); // is Metric button
//            counter++;
//          } else if (counter == 15) {
//            expect(widget.data, StaticVariables.PRIVACY_BUTTON);
//            await tester.tap(find.byWidget(widget));
//            counter++;
//          }
//        }
//      }
//    });
  });
}
