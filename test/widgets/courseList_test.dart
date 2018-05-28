import 'package:cie_team1/presenter/courseListPresenter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:cie_team1/widgets/courseList.dart';
import 'package:cie_team1/model/course/courses_mock.dart';

void main() {
  // Expected widget within created widgets. Generated using our mock's behavior
  final List<String> expectedTexts = new List<String>();
  expectedTexts.addAll(CoursesMock.mockTimes());
  for (int i=1; i< 100; i++) {
    expectedTexts.add("Department #"+CoursesMock.generateMockDepartment(i));
    expectedTexts.add(CoursesMock.generateMockCourseTitle(i));
    expectedTexts.add("FK "+CoursesMock.generateMockDepartment(i));
    expectedTexts.add("Time: " + CoursesMock.generateMockTime(i));
  }
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

    checkForDuplicateWidgets(listOfWidgets, expectedTexts);
    checkIfTextsCreatedCorrectly(listOfWidgets, expectedTexts);
  });
}

void checkForDuplicateWidgets(Iterable<Widget> listOfWidgets, List<String> expectedTexts) {
  List<Widget> textElements = new List<Widget>();
  for (Widget widget in listOfWidgets) {
    if (textElements.contains(widget)) {
      fail("Error - Bad Internal CourseListItem State; Duplicate widgets found");
    }
    textElements.add(widget);
  }
}

void checkIfTextsCreatedCorrectly(Iterable<Widget> listOfWidgets, List<String> expectedTexts) {
  List<String> textElements = new List<String>();
  for (Widget widget in listOfWidgets) {
    if (widget is Text) {
      textElements.add(widget.data);
    }
  }
  for (String text in textElements) {
    expect(expectedTexts.contains(text), true);
  }
}
