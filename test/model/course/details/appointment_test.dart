import 'package:cie_app/model/course/course.dart';
import 'package:cie_app/model/course/details/appointment.dart';
import 'package:cie_app/model/course/details/campus.dart';
import 'package:cie_app/model/course/details/weekday.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final List<dynamic> jsonList = [
    {"dayOfWeekName": "Monday", "timeBegin": "10:00:00", "timeEnd": "13:15:00"},
    {"dayOfWeekName": "Tuesday", "timeBegin": "11:30:00", "timeEnd": "13:15:00"}
  ];

  final dynamic courseData = {
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
            "number": "LO 119",
            "building": "L",
            "campus": "Pasing",
            "actions": []
          }
        ],
        "lecturer": [
          {
            "title": null,
            "firstName": null,
            "lastName": "Brehm, Lars",
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

  test('fromJson', () {
    var course = new Course(courseData);
    var appointments = Appointment.fromJson(jsonList, course);

    expect(appointments[0].weekday, Weekday.Mon);
    expect(appointments[1].weekday, Weekday.Tue);

    expect(appointments[0].getCampus(), Campus.LOTHSTRASSE);
    expect(appointments[1].getCampus(), Campus.LOTHSTRASSE);

    expect(appointments[0].sortValue() < appointments[1].sortValue(), true);
    expect(appointments[0].sortValue() > appointments[1].sortValue(), false);
  });
}
