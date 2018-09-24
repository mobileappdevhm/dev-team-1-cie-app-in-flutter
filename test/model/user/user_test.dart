import 'package:cie_app/model/course/course.dart';
import 'package:cie_app/model/user/currentUser_prod.dart';
import 'package:cie_app/model/user/user.dart';
import 'package:test/test.dart';

@Timeout(const Duration(seconds: 10))
void main() {
  List<dynamic> courseList = new List<dynamic>();
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
  setUp(() {
    courseList.add(courseData);
  });

  group("simpleUserTest", () {
    User sut;
    List<Course> courses;

    setUp(() {
      courses = Course.fromJson(courseList);

      sut = new UserBuilder()
          .withID("id-123")
          .withUsername("Max42")
          .withFirstName("Max")
          .withLastName("Mustermann")
          .withDepartment("07")
          .withStatus("sleeping")
          .withCurrentCourses(courses)
          .withPrevCourses(courses)
          .build();
    });

    test('1', () {
      expect(sut.id, "id-123");
    });

    test('2', () {
      expect(sut.currentCourses, courses);
    });

    test('2', () {
      expect(sut.department, '07');
    });

    test('3', () {
      expect(sut.firstName, 'Max');
    });

    test('4', () {
      expect(sut.lastName, 'Mustermann');
    });

    test('5', () {
      expect(sut.prevCourses, courses);
    });

    test('6', () {
      expect(sut.status, 'sleeping');
    });

    test('7', () {
      expect(sut.username, 'Max42');
    });
  });

  group("simpleUserProdTest", () {
    test('1', () {
      final CurrentUserProd sut = new CurrentUserProd();

      expect(sut.getCurrentUser() != null, true);
    });
  });

  group("user json", () {
    test('1 user from json', () {
      var jsonData = new Map<String, dynamic>();
      jsonData['id'] = "user-id";
      jsonData['language'] = "de";
      jsonData['name'] = "name";
      jsonData['firstName'] = "firstName";
      jsonData['lastName'] = "lastName";
      jsonData['department'] = "IT";
      jsonData['degree'] = "BA";
      jsonData['isLoggedIn'] = 'true';
      jsonData['isMetricsEnabled'] = 'true';

      var user = UserBuilder.fromJson(jsonData);

      expect(user.id, "user-id");
      expect(user.language, "de");
      expect(user.name, "name");
      expect(user.firstName, "firstName");
      expect(user.lastName, "lastName");
      expect(user.department, "IT");
      expect(user.degree, "BA");
      expect(user.isLoggedIn, true);
      expect(user.isMetricsEnabled, true);
    });

    test('2 user to json', () {
      var jsonData = User.toJson(new User("user-id", "de", "name", "IT", "BA",
          true, false, "haha", "firstName", "lastName", "bored", null, null));

      expect(jsonData['id'], "user-id");
      expect(jsonData['language'], "de");
      expect(jsonData['name'], "name");
      expect(jsonData['firstName'], "firstName");
      expect(jsonData['lastName'], "lastName");
      expect(jsonData['department'], "IT");
      expect(jsonData['degree'], "BA");
      expect(jsonData['isLoggedIn'], 'true');
      expect(jsonData['isMetricsEnabled'], 'false');
    });
  });

  group("userBuilder", () {
    test('1 ', () {
      UserBuilder sut = new UserBuilder().withLanguage("German");

      expect(sut.language, "German");
    });
    test('2 ', () {
      UserBuilder sut = new UserBuilder().withName("Hans");

      expect(sut.name, "Hans");
    });
    test('3 ', () {
      UserBuilder sut = new UserBuilder().withDegree("Bachelor");

      expect(sut.degree, "Bachelor");
    });
    test('4 ', () {
      UserBuilder sut = new UserBuilder().withIsLoggedIn(true);

      expect(sut.isLoggedIn, true);
    });
  });
}
