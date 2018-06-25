import 'package:cie_team1/presenter/courseListPresenter.dart';
import 'package:cie_team1/utils/staticVariables.dart';
import 'package:cie_team1/views/schedule.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('1 schedule', (WidgetTester tester) async {
    await tester.pumpWidget(new MaterialApp(
        home: new Scaffold(
            body: new Schedule(
      new CourseListPresenter(null, Flavor.MOCK),
    ))));

    expect(find.text("Today"), findsOneWidget);
    expect(find.text("Weekly"), findsOneWidget);
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
