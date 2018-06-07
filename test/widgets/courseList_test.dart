import 'package:cie_team1/presenter/courseListPresenter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:cie_team1/widgets/courseList.dart';
import 'package:cie_team1/model/course/courses_mock.dart';
import 'package:cie_team1/utils/staticVariables.dart';

void main() {

<<<<<<< HEAD
  /*// Expected widget within created widgets
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
=======
  group("1",(){
    // Expected widget within created widgets. Generated using our mock's behavior
    List<String> expectedTexts;
    // Texts that are unique to the favorites page
    List<String> favoritesPageAnomalies;

    setUp(() {
      expectedTexts = new List<String>();
      favoritesPageAnomalies = new List<String>();
      for (int i = 1; i < 100; i++) {
        expectedTexts.add(
            "Department #" + CoursesMock.generateMockDepartment(i));
        expectedTexts.add(CoursesMock.generateMockCourseTitle(i));
        expectedTexts.add("DP " + CoursesMock.generateMockDepartment(i));
        expectedTexts.add("Time: " + CoursesMock.generateMockTime(i));
      }
      favoritesPageAnomalies.add(StaticVariables.FAVORITES_REGISTRATION_BUTTON);
    });

    testWidgets('basic courses page', (WidgetTester tester) async {
      final bool isFavoritesPage = false;
      // This widget tree builds the widgets found on the Courses Page
      await tester.pumpWidget(
        new StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return new MaterialApp(
              home: new Material(
                child: new Center(
                    child: new CourseList(
                        new CourseListPresenter(), isFavoritesPage)
                ),
>>>>>>> 5c1316a4f24bf638e2c020a75ce99847e4a77894
              ),
            );
          },
        ),
      );
      final Iterable<Widget> listOfWidgets = tester.allWidgets;

      checkForDuplicateWidgets(listOfWidgets, expectedTexts);
      checkForFavoritesPageAnomalies(listOfWidgets, favoritesPageAnomalies,
          isFavoritesPage);
      checkForFavoritesPageAnomalies(listOfWidgets, favoritesPageAnomalies,
          isFavoritesPage);
    });

    testWidgets('basic favorites page', (WidgetTester tester) async {
      final bool isFavoritesPage = true;
      // This widget tree builds the widgets found on the Courses Page
      await tester.pumpWidget(
        new StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return new MaterialApp(
              home: new Material(
                child: new Center(
                    child: new CourseList(
                        new CourseListPresenter(), isFavoritesPage)
                ),
              ),
            );
          },
        ),
      );
      final Iterable<Widget> listOfWidgets = tester.allWidgets;

      checkForDuplicateWidgets(listOfWidgets, expectedTexts);
      checkIfTextsCreatedCorrectly(listOfWidgets, expectedTexts,
          favoritesPageAnomalies);
      checkForFavoritesPageAnomalies(listOfWidgets, favoritesPageAnomalies,
          isFavoritesPage);
    });
  });


  group('2',(){

    setUp((){

    });

    testWidgets('course_description', (WidgetTester tester) async {

      final bool isFavoritesPage = false;

      await tester.pumpWidget(
        new StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return new MaterialApp(
              home: new Material(
                child: new Center(
                    child: new CourseList(
                        new CourseListPresenter(), isFavoritesPage)
                ),
              ),
            );
          },
        ),
      );
      final Iterable<Widget> listOfWidgets = tester.allWidgets;

      for (Widget widget in listOfWidgets){
        //await tester.tap();
        //tester.pump();
      }


    });

  });
}

void checkForFavoritesPageAnomalies(Iterable<Widget> listOfWidgets,
    List<String> anomalies, bool isFavoritesPage) {
  List<Widget> textElements = new List<Widget>();
  for (Widget widget in listOfWidgets) {
    textElements.add(widget);
    for (String anomaly in anomalies) {
      if (textElements.contains(anomaly) && !isFavoritesPage) {
        fail("Error - Bad Internal CourseList State; Bad Page Rendered");
      }
    }
  }
}

void checkForDuplicateWidgets(Iterable<Widget> listOfWidgets,
    List<String> expectedTexts) {
  List<Widget> textElements = new List<Widget>();
  for (Widget widget in listOfWidgets) {
    if (textElements.contains(widget)) {
      fail("Error - Bad Internal CourseListItem State; Duplicate widgets found");
    }
    textElements.add(widget);
  }
}

void checkIfTextsCreatedCorrectly(Iterable<Widget> listOfWidgets,
    List<String> expectedTexts, List<String> anomalies) {
  List<String> textElements = new List<String>();
  for (Widget widget in listOfWidgets) {
    if (widget is Text) {
      textElements.add(widget.data);
    }
<<<<<<< HEAD
  }*/
}
=======
  }
  for (String text in textElements) {
    if (!anomalies.contains(text)) {
      expect(expectedTexts.contains(text), true);
    }
  }
}
>>>>>>> 5c1316a4f24bf638e2c020a75ce99847e4a77894
