import 'package:cie_team1/presenter/courseListPresenter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:cie_team1/widgets/courseList.dart';


void main() {

  // Expected widget within created widgets
  final List<String> expectedTexts = [
    "Title of Course 1" ,
    "FK 07" ,
    "Time: Mo 10:00-11:30",
    "Title of Course 2" ,
    "FK 07" ,
    "Time: Mo 12:00-13:30",
    "Title of Course 3" ,
    "FK 07" ,
    "Time: Di 9:45-11:30",
    "Title of Course 4" ,
    "FK 07" ,
    "Time: Mo 10:00-11:30",
    "Title of Course 5" ,
    "FK 07" ,
    "Time: Do 10:00-11:30",
    "Title of Course 6" ,
    "FK 07" ,
    "Time: Mo 10:00-11:30",
    "Title of Course 7" ,
    "FK 07" ,
    "Time: Fr 10:00-11:30",
    "Title of Course 8" ,
    "FK 07" ,
    "Time: Mo 10:00-11:30",
    "Title of Course 9" ,
    "FK 07" ,
    "Time: Mo 10:00-11:30",
  ];

  testWidgets('1 widgetTest', (WidgetTester tester) async {

    // Tells the tester to build a UI based on the widget tree passed to it
    await tester.pumpWidget(
      new StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return new MaterialApp(
            home: new Material(
              child: new Center(
                child: new CourseList(new CourseListPresenter(), false)
              ),
            ),
          );
        },
      ),
    );

    final Iterable<Widget> listOfWidgets = tester.allWidgets;

    checkIfTextsCreatedCorrectly(listOfWidgets, expectedTexts);

  });





}

void checkIfTextsCreatedCorrectly(Iterable<Widget> listOfWidgets, List<String> expectedTexts) {
  var textWidgetPosition = 0;
  for (Widget widget in listOfWidgets) {
    if (widget is Text) {
      expect(widget.data, expectedTexts[textWidgetPosition]);
      textWidgetPosition++;
    }
  }
}