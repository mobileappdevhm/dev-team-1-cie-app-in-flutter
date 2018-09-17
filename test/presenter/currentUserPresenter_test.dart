import 'package:cie_app/di/currentUser_di.dart';
import 'package:cie_app/model/course/courses_mock.dart';
import 'package:cie_app/presenter/currentUserPresenter.dart';
import 'package:cie_app/utils/staticVariables.dart';
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

    test('9', () {
      var name = new UserInjector().currentUser.getCurrentUser().firstName +
          " " +
          new UserInjector().currentUser.getCurrentUser().lastName;

      expect(sut.getCurrentUserName(), name);
    });

    test('10', () {
      expect(sut.getCurrentUser().isMetricsEnabled,
          new UserInjector().currentUser.getCurrentUser().isMetricsEnabled);
    });

    test('11', () {
      var metrics = sut.getCurrentUser().isMetricsEnabled;
      sut.toggleIsMetricsEnabled();
      expect(sut.getCurrentUser().isMetricsEnabled, !metrics);
    });
  });

  group("facultycheck", () {
    test('1', () {
      expect(
          sut.getFaculties(1).contains(CoursesMock.generateMockDepartment(2)),
          true);
    });

    test('2', () {
      expect(
          sut.getFaculties(2).contains(CoursesMock.generateMockDepartment(3)),
          true);
    });

    test('3', () {
      expect(
          sut.getFaculties(3).contains(CoursesMock.generateMockDepartment(4)),
          true);
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
