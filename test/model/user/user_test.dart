import 'package:cie_team1/model/course/course.dart';
import 'package:cie_team1/model/user/currentUser_prod.dart';
import 'package:cie_team1/model/user/user.dart';
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
        .withProfessorEmail("example@hm.edu")
        .withProfessorName("Max Mustermann")
        .withAvailable(CourseAvailability.AVAILABLE)
        .withIsFavorite(false)
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

  group("simpleUserProdTest", () {
    //List<Course> courses;

    setUp(() {
      /*courses = [
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
        .withProfessorEmail("example@hm.edu")
        .withProfessorName("Max Mustermann")
        .withAvailable(CourseAvailability.AVAILABLE)
        .withIsFavorite(false)
        .build()
      ];*/

    });

    test('1', () {
      final CurrentUserProd sut = new CurrentUserProd();

      expect(sut.getCurrentUser()!=null, true);
    });
  });
}
