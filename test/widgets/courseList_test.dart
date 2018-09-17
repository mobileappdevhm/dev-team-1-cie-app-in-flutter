import 'package:cie_app/model/course/courses_mock.dart';
import 'package:cie_app/presenter/courseListPresenter.dart';
import 'package:cie_app/presenter/currentUserPresenter.dart';
import 'package:cie_app/utils/staticVariables.dart';
import 'package:cie_app/widgets/courseList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("1", () {
    // Expected widget within created widgets. Generated using our mock's behavior
    List<String> expectedTexts;
    // Texts that are unique to the favorites page
    List<String> favoritesPageAnomalies;
    CourseListPresenter clp;
    CurrentUserPresenter cup;
    FocusNode fN;

    setUp(() {
      expectedTexts = new List<String>();
      favoritesPageAnomalies = new List<String>();
      for (int i = 1; i < 100; i++) {
        expectedTexts
            .add("Department #" + CoursesMock.generateMockDepartment(i));
        expectedTexts.add(CoursesMock.generateMockCourseTitle(i));
        expectedTexts.add("DP " + CoursesMock.generateMockDepartment(i));
        expectedTexts.add(StaticVariables.FAVORITES_REGISTRATION_BUTTON_LOGIN_FIRST);
        //expectedTexts.add("Time: " + CoursesMock.generateMockTime(i));
      }
      favoritesPageAnomalies.add(StaticVariables.FAVORITES_REGISTRATION_BUTTON);

      clp = new CourseListPresenter(_voidCallback, Flavor.MOCK);
      cup = new CurrentUserPresenter(_voidCallback, Flavor.MOCK);
      fN = new FocusNode();
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
                    child: new CourseList(clp, isFavoritesPage, cup, fN)),
              ),
            );
          },
        ),
      );
      final Iterable<Widget> listOfWidgets = tester.allWidgets;

      checkForDuplicateWidgets(listOfWidgets, expectedTexts);
      checkForFavoritesPageAnomalies(
          listOfWidgets, favoritesPageAnomalies, isFavoritesPage);
      checkForFavoritesPageAnomalies(
          listOfWidgets, favoritesPageAnomalies, isFavoritesPage);
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
                    child: new CourseList(clp, isFavoritesPage, cup, fN)),
              ),
            );
          },
        ),
      );
      final Iterable<Widget> listOfWidgets = tester.allWidgets;

      checkForDuplicateWidgets(listOfWidgets, expectedTexts);
      checkIfTextsCreatedCorrectly(
          listOfWidgets, expectedTexts, favoritesPageAnomalies);
      checkForFavoritesPageAnomalies(
          listOfWidgets, favoritesPageAnomalies, isFavoritesPage);
    });
});

  group("2 user is logged in", () {
    // Expected widget within created widgets. Generated using our mock's behavior
    List<String> expectedTexts;
    // Texts that are unique to the favorites page
    List<String> favoritesPageAnomalies;
    CourseListPresenter clp;
    CurrentUserPresenter cup;
    FocusNode fN;

    setUp(() {
      expectedTexts = new List<String>();
      favoritesPageAnomalies = new List<String>();
      for (int i = 1; i < 100; i++) {
        expectedTexts
            .add("Department #" + CoursesMock.generateMockDepartment(i));
        expectedTexts.add(CoursesMock.generateMockCourseTitle(i));
        expectedTexts.add("DP " + CoursesMock.generateMockDepartment(i));
        expectedTexts.add(StaticVariables.FAVORITES_REGISTRATION_BUTTON);
      }
      favoritesPageAnomalies.add(StaticVariables.FAVORITES_REGISTRATION_BUTTON);

      clp = new CourseListPresenter(_voidCallback, Flavor.MOCK);
      cup = new CurrentUserPresenter(_voidCallback, Flavor.MOCK);
      cup.getCurrentUser().isLoggedIn = true;
      fN = new FocusNode();
    });

    testWidgets('pressing submit on favorite page', (WidgetTester tester) async {
      final bool isFavoritesPage = true;
      // This widget tree builds the widgets found on the Courses Page
      await tester.pumpWidget(
        new StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return new MaterialApp(
              home: new Material(
                child: new Center(
                    child: new CourseList(clp, isFavoritesPage, cup, fN)),
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
            expect(widget.data,StaticVariables.FAVORITES_REGISTRATION_BUTTON);
          }
          counter++;
        }
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

void checkForDuplicateWidgets(
    Iterable<Widget> listOfWidgets, List<String> expectedTexts) {
  List<Widget> textElements = new List<Widget>();
  for (Widget widget in listOfWidgets) {
    if (textElements.contains(widget)) {
      fail(
          "Error - Bad Internal CourseListItem State; Duplicate widgets found");
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
  }
  for (String text in textElements) {
    if (!anomalies.contains(text)) {
      expect(expectedTexts.contains(text), true);
    }
  }
}

void _voidCallback(bool didChange) {
  if (didChange == true) {
    setState(() => {});
  }
}

void setState(Map Function() param0) {}
