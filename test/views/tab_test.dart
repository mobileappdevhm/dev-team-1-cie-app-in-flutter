import 'package:cie_team1/views/tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cie_team1/model/course/course.dart';

@Timeout(const Duration(seconds: 20))
void main() {
  testWidgets('test123', (WidgetTester tester) async {
    await tester.pumpWidget(new MaterialApp(home: new TabsPage()));

    /*
<<<<<<< Updated upstream
    expect(find.text("Pull down to Refresh"), findsOneWidget);
    expect(find.text("Courses"), findsWidgets);
    expect(find.text("Map"), findsOneWidget);
    expect(find.text("Schedule"), findsOneWidget);
    expect(find.text("Favorites"), findsOneWidget);
    expect(find.text("Profile"), findsOneWidget);
=======
*/
      final Iterable<Widget> listOfWidgets = tester.allWidgets;
      List<String> expectedText = [
      'Pull down to Refresh',
      'Department 01',
      'Department 02',
      'Department 03',
      'Department 04',
      'Department 05',
      'Department 06',
      'Department 07',
      'Department 08',
      'Department 09',
      'Department 10',
      'Department 11',
      'Department 12',
      'Department 13',
      'Department 14',
      'Title of Course 8',
      'DP 09',
      'Fri 13:30-15:00',
      'Title of Course 22',
      'DP 09',
      'Thu 17:00-18:30',
      'Title of Course 36',
      'DP 09',
      'Wed 10:00-11:30',
      'Title of Course 50',
      'DP 09',
      'Tue 13:30-15:00',
      'Title of Course 64',
      'DP 09',
      'Mon 17:00-18:30',
      'Courses',
      'Courses',
      'Map',
      'Schedule',
      'Favorites',
      'Profile'
      ];

      int counter = 0;
      for (Widget widget in listOfWidgets) {
        if (widget is Text) {
          if(counter == 2 || counter == 3){
            if (WeekdayUtility.getCurrentWeekday() != Weekday.Sun &&
                WeekdayUtility.getCurrentWeekday() != Weekday.Sat) {
              if (counter == 2) {
                expect(widget.data.isNotEmpty, true);
                counter++;
              } else if (counter == 3) {
                expect(widget.data.isNotEmpty, true);
                counter++;
              }
            }
          }
          else {
            expect(widget.data, expectedText.elementAt(counter));
            counter++;
          }
        }
      }
    });

//  group('settingspagewidget', () {
//    testWidgets('1 widgetTest for settings', (WidgetTester tester) async {
//// Tells the tester to build a UI based on the widget tree passed to it
//      await tester.pumpWidget(
//        new StatefulBuilder(
//          builder: (BuildContext context, StateSetter setState) {
//            return new MaterialApp(
//              home: new Material(
//                child: new Center(child: new TabsPage()),
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
//            expect(widget.data, 'Pull down to Refresh');
//            counter++;
//          } else if (counter == 1) {
//            expect( widget.data.contains("Department"), true);
//            counter++;
//          } else if(counter >= 2){
//            if (WeekdayUtility.getCurrentWeekday() != Weekday.Sun &&
//                WeekdayUtility.getCurrentWeekday() != Weekday.Sat){
//              if (counter == 2) {
//                expect(widget.data.isNotEmpty, true);
//                counter++;
//              } else if (counter == 3) {
//                expect(widget.data.isNotEmpty, true);
//                counter++;
//              }
//            }
//          }
//
//        }
//      }
//    });
//  });
}
