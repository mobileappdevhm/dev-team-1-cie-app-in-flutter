import 'package:cie_app/model/course/course.dart';
import 'package:cie_app/model/course/details/dayTime.dart';
import 'package:cie_app/model/course/details/weekday.dart';
import 'package:test/test.dart';

@Timeout(const Duration(seconds: 10))
void main() {
  List<dynamic> jsonDataList = new List<dynamic>();
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
      {"title": null, "firstName": "test", "lastName": "test", "actions": []},
      {"title": null, "firstName": "first", "lastName": "second", "actions": []}
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
  setUp(() {
    jsonDataList.add(jsonData);
  });

  group("simplecourseTest", () {
    Course sut;
    setUp(() {
      sut = new Course(jsonData);
    });
    test('id', () {
      expect(sut.id, "thisisagreatid");
    });
    test('description', () {
      expect(sut.description, "thisisagreatdescription");
    });
    test('isCoterie', () {
      expect(sut.isCoterie, false);
    });
    test('hasHomeBias', () {
      expect(sut.hasHomeBias, false);
    });
    test('category', () {
      expect(sut.category, "Green");
    });
    test('department', () {
      expect(sut.department.shortName.contains("07"), true);
    });
    test('level', () {
      expect(sut.level, "Bachelor");
    });
    test('ects', () {
      expect(sut.ects, 2);
    });
    test('SWS', () {
      expect(sut.sws, 2);
    });
    test('usCredits', () {
      expect(sut.usCredits, 2);
    });
    test('locations', () {
      expect(sut.locations[0].number, "R0.008");
    });
    test('lecturer', () {
      expect(sut.lecturer[0].lastName, "test");
    });
    test('appointments', () {
      expect(sut.appointments[0].weekday, Weekday.Mon);
      expect(sut.appointments[0].timeBegin.toString(),
          new DayTime(10, 00).toString());
      expect(sut.appointments[0].timeEnd.toString(),
          new DayTime(13, 15).toString());
    });
    test('dates', () {
      expect(sut.dates[0].title, null);
    });
    test('name', () {
      expect(sut.name, "Digital Technology");
    });
    test('shortName', () {
      expect(sut.shortName, "DT");
    });

    test('13 equals', () {
      final Course sut2 = new Course(jsonData);
      expect(sut.equals(sut2), true);
    });
  });

  test('fromJson test', () {
    Course course;
    try {
      course = Course.fromJson(jsonDataList)[0];
    } catch (e) {
      fail("Unable to parse json data");
    }
    expect(course.id, "thisisagreatid");
    expect(course.description, "thisisagreatdescription");
    expect(course.isCoterie, false);
    expect(course.hasHomeBias, false);
    expect(course.category, "Green");
    expect(course.department.shortName.contains("07"), true);
    expect(course.level, "Bachelor");
    expect(course.ects, 2);
    expect(course.sws, 2);
    expect(course.usCredits, 2);
    expect(course.locations[0].number, "R0.008");
    expect(course.lecturer[0].lastName, "test");
    expect(course.appointments[0].weekday, Weekday.Mon);
    expect(course.appointments[0].timeBegin.toString(),
        new DayTime(10, 00).toString());
    expect(course.appointments[0].timeEnd.toString(),
        new DayTime(13, 15).toString());
    expect(course.dates[0].title, null);
    expect(course.name, "Digital Technology");
    expect(course.shortName, "DT");
  });

  group('class functions', () {
    Course course;
    setUp((){
      course = new Course(jsonData);
    });

    test('getNamesOfLecturers', (){
      expect(course.getNamesOfLecturers(), 'test test, first second');
    });

    test('occursOnDay', (){
      expect(course.occursOnDay(Weekday.Fri), false);
      expect(course.occursOnDay(Weekday.Mon), true);
    });
  });
}
