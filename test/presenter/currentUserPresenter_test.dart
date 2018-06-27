import 'package:cie_team1/di/currentUser_di.dart';
import 'package:cie_team1/model/course/courses_mock.dart';
import 'package:cie_team1/presenter/currentUserPresenter.dart';
import 'package:cie_team1/utils/staticVariables.dart';
import 'package:test/test.dart';

void main() {
  CurrentUserPresenter sut;

  setUp(() {
    void _voidCallback(bool didChange) {}
    sut = new CurrentUserPresenter(_voidCallback, Flavor.MOCK);
  });

  group("User", () {
    test('1', () {
      expect(sut.getCurrentUser().username,
          new UserInjector().currentUser.getCurrentUser().username);
    });

    test('2', () {
      expect(sut.getCurrentUser().status,
          new UserInjector().currentUser.getCurrentUser().status);
    });

    test('3', () {
      expect(sut.getCurrentUserStatus(),
          new UserInjector().currentUser.getCurrentUser().status);
    });

    test('4', () {
      expect(sut.getCurrentUserFaculty(),
          new UserInjector().currentUser.getCurrentUser().department);
    });

    test('5', () {
      expect(sut.getCredits(1),
          new UserInjector().currentUser.getCurrentUser().prevCourses[1].ects);
    });
    test('6', () {
      expect(
          sut.getFullName(),
          new UserInjector().currentUser.getCurrentUser().firstName +
              " " +
              new UserInjector().currentUser.getCurrentUser().lastName);
    });

    test('7', () {
      expect(sut.getPrevCourses().length,
          new UserInjector().currentUser.getCurrentUser().prevCourses.length);
    });

    test('8', () {
      expect(
          sut.getCurrentCourses().length,
          new UserInjector()
              .currentUser
              .getCurrentUser()
              .currentCourses
              .length);
    });
  });

  group("facultycheck", () {
    test('1', () {
      expect(sut.getFaculties(1), CoursesMock.generateMockDepartment(2));
    });

    test('2', () {
      expect(sut.getFaculties(2), CoursesMock.generateMockDepartment(3));
    });

    test('3', () {
      expect(sut.getFaculties(3), CoursesMock.generateMockDepartment(4));
    });
  });

  group("title", () {
    test('1', () {
      expect(sut.getTitle(0), CoursesMock.generateMockCourseTitle(1));
    });

    test('2', () {
      expect(sut.getTitle(1), CoursesMock.generateMockCourseTitle(2));
    });

    test('3', () {
      expect(sut.getTitle(2), CoursesMock.generateMockCourseTitle(3));
    });
  });
}
