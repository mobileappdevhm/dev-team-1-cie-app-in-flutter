import 'package:cie_app/model/course/course.dart';
import 'package:cie_app/widgets/timeTableItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

@Timeout(const Duration(seconds: 20))
void main() {
  final dynamic jsonData = {
    "id": "thisisagreatid",
    "description": "thisisagreatdescription",
    "isCoterie": false,
    "hasHomeBias": false,
    "category": "Green",
    "department": {
      "color": "#008E7D",
      "name": "Fakultät 07",
      "shortName": "FK 07",
      "actions": []
    },
    "level": "Bachelor",
    "ects": 2,
    "sws": 2,
    "usCredits": 2,
    "locations": [
      {
        "number": "R0.008",
        "building": "R",
        "campus": "Lothstraße",
        "actions": []
      }
    ],
    "lecturer": [
      {"title": null, "firstName": "test", "lastName": "test", "actions": []}
    ],
    "appointments": [
      {
        "dayOfWeekName": "Monday",
        "timeBegin": "10:00:00",
        "timeEnd": "13:15:00"
      }
    ],
    "modules": null,
    "dates": [
      {
        "begin": "20181004T080000Z",
        "end": "20181004T111500Z",
        "title": null,
        "isCanceled": false,
        "rooms": [
          {
            "number": "R0.008",
            "building": "R",
            "campus": "Lothstraße",
            "actions": []
          }
        ],
        "lecturer": [
          {
            "title": null,
            "firstName": "test",
            "lastName": "test",
            "actions": []
          }
        ],
        "actions": []
      }
    ],
    "name": "Digital Technology",
    "shortName": "DT",
    "actions": []
  };

  group('timetable', () {
    testWidgets('1 widgetTest for timetableitem', (WidgetTester tester) async {
      Course course = new Course(jsonData);
// Tells the tester to build a UI based on the widget tree passed to it
      await tester.pumpWidget(
        new StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return new MaterialApp(
              home: new Material(
                child: new Center(
                    child: new TimeTableItem(course.appointments[0])),
              ),
            );
          },
        ),
      );

      final Iterable<Widget> listOfWidgets = tester.allWidgets;
      int i = 0;
      List<String> expectedTextWidgetData = [
        'Digital Technology',
        'Campus:',
        'Loth.',
        'Time:',
        '10:00-13:15',
        'Professor:',
        'test test',
        'Room:',
        'R0.008',
      ];
      for (Widget widget in listOfWidgets) {
        if (widget is Text) {
          expect(
              widget.data.contains(expectedTextWidgetData.elementAt(i)), true,
              reason: expectedTextWidgetData.elementAt(i));
          i++;
        }
      }
    });
  });
}
