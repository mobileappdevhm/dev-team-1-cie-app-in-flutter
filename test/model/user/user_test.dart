import 'package:cie_team1/model/course/course.dart';
import 'package:cie_team1/model/user/user.dart';
import 'package:cie_team1/utils/staticVariables.dart';
import 'package:test/test.dart';

@Timeout(const Duration(seconds: 10))
void main() {
  group("simpleUserTest", () {
    User sut;
    List<Course> courses;

    setUp(() {
      courses = [
        new CourseBuilder()
            .withName("Blaba")
            .withFaculty("7")
            .withLecturesPerWeek([
              new Lecture(Campus.KARLSTRASSE, Weekday.Mon, new DayTime(10, 00),
                  new DayTime(11, 30), "R0.009")
            ])
            .withDescription("boring")
            .withHoursPerWeek(2)
            .withEcts(2)
            .withProfessorEmail(StaticVariables.MOCK_EMAIL)
            .withProfessorName("Max Mustermann")
            .withIsFavorite(false)
            .withhasHomeBias(false)
            .withIsCoterie(false)
            .build()
      ];

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

  //TODO Travis has sometimes problems with this test, because it relies on path_provider
  //group("simpleUserProdTest", () {
  //  //List<Course> courses;
//
  //  //setUp(() {
  //  /*courses = [
  //      new CourseBuilder()
  //      .withName("Blaba")
  //      .withFaculty("7")
  //      .withLecturesPerWeek([
  //        new Lecture(Campus.KARLSTRASSE, Weekday.Mon, new DayTime(10, 00),
  //            new DayTime(11, 30), "R0.009")
  //      ])
  //      .withDescription("boring")
  //      .withHoursPerWeek(2)
  //      .withEcts(2)
  //      .withProfessorEmail(StaticVariables.MOCK_EMAIL)
  //      .withProfessorName("Max Mustermann")
  //      .withAvailable(CourseAvailability.AVAILABLE)
  //      .withIsFavorite(false)
  //      .build()
  //    ];*/
//
  //  //});
//
  //  test('1', () {
  //    final CurrentUserProd sut = new CurrentUserProd();
//
  //    expect(sut.getCurrentUser() != null, true);
  //  });
  //});

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

      expect(sut.language,"German");
    });
    test('2 ', () {
      UserBuilder sut = new UserBuilder().withName("Hans");

      expect(sut.name,"Hans");
    });
    test('3 ', () {
      UserBuilder sut = new UserBuilder().withDegree("Bachelor");

      expect(sut.degree,"Bachelor");
    });
    test('4 ', () {
      UserBuilder sut = new UserBuilder().withIsLoggedIn(true);

      expect(sut.isLoggedIn,true);
    });
  });
}
