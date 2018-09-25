import 'package:cie_app/model/course/details/department.dart';
import 'package:cie_app/views/addTakenCourses.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

@Timeout(const Duration(seconds: 20))
void main() {
  testWidgets('widgetTest', (WidgetTester tester) async {
    List<String> semesters = ["WiSe 2018", "SoSe 2018", "WiSe 2017"];

    await tester.pumpWidget(
      new StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return new MaterialApp(
            home: new Material(
              child: new Center(child: new AddTakenCourses(semesters)),
            ),
          );
        },
      ),
    );

    var listOfWidgets =
        tester.allWidgets.where((widget) => widget is Text);

    expect(listOfWidgets.where((widget) => widget is Text && widget.data == "WiSe 2017").toList().length > 0, true, reason: "Text WiSe 2017");
    expect(listOfWidgets.where((widget) => widget is Text && widget.data == "SoSe 2018").toList().length > 0, true, reason: "Text SoSe 2018");
    expect(listOfWidgets.where((widget) => widget is Text && widget.data == "WiSe 2018").toList().length > 0, true, reason: "Text WiSe 2018");

    expect(listOfWidgets.where((widget) => widget is Text && widget.data == "All Departments").toList().length > 0, true, reason: "Text All Departments");
    for (var department in Department.departments) {
      expect(listOfWidgets.where((widget) => widget is Text && widget.data == "Department " + department).toList().length > 0, true, reason: "Text Department " + department);
    }
  });
}
