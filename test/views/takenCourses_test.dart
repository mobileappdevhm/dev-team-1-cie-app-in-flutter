import 'package:cie_app/model/course/courses_mock.dart';
import 'package:cie_app/presenter/currentUserPresenter.dart';
import 'package:cie_app/utils/staticVariables.dart';
import 'package:cie_app/views/takenCourses.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

@Timeout(const Duration(seconds: 20))
void main() {
  testWidgets('1 widgetTest', (WidgetTester tester) async {
    void _voidCallback(bool didChange) {}
  CurrentUserPresenter ct = new CurrentUserPresenter(_voidCallback, Flavor.MOCK);
    // Tells the tester to build a UI based on the widget tree passed to it
    await tester.pumpWidget(
      new StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return new MaterialApp(
            home: new Material(
              child: new Center(child: new TakenCourses(ct)),
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
          expect(widget.data, 'No Courses found.');
          counter++;
        }
        //TODO can be extended
      }
    }
  });
}
