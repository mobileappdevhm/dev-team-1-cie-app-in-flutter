import 'package:cie_app/presenter/courseListPresenter.dart';
import 'package:cie_app/utils/staticVariables.dart';
import 'package:cie_app/views/schedule.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('1 schedule', (WidgetTester tester) async {
    await tester.pumpWidget(new MaterialApp(
        home: new Scaffold(
            body: new Schedule(
      new CourseListPresenter(null, Flavor.MOCK),
    ))));

    expect(find.text(StaticVariables.SCHEDULE_TODAY), findsOneWidget);
    expect(find.text(StaticVariables.SCHEDULE_WEEKLY), findsOneWidget);
  });

  testWidgets('2 schedule', (WidgetTester tester) async {
    await tester.pumpWidget(
        new MaterialApp(home: new Scaffold(body: new ScheduleDivider("Test"))));

    expect(find.text("Test"), findsOneWidget);
  });

  testWidgets('3 schedule', (WidgetTester tester) async {
    await tester.pumpWidget(
        new MaterialApp(home: new Scaffold(body: noClassHeader("Text"))));

    expect(find.text("Text"), findsOneWidget);
  });
}
