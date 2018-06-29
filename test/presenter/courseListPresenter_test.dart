import 'package:cie_team1/model/course/courses_mock.dart';
import 'package:cie_team1/presenter/courseListPresenter.dart';
import 'package:cie_team1/utils/staticVariables.dart';
import 'package:test/test.dart';

void main() {
  CourseListPresenter sut;

  setUp(() {
    sut = new CourseListPresenter(null, Flavor.MOCK);
  });

  group("facultycheck", () {
    test('1', () {
      expect(sut.getFaculties(1).contains(CoursesMock.generateMockDepartment(2)), true);
    });

    test('2', () {
      expect(sut.getFaculties(2).contains(CoursesMock.generateMockDepartment(3)), true);
    });

    test('3', () {
      expect(sut.getFaculties(3).contains(CoursesMock.generateMockDepartment(4)), true);
    });

    test('4', () {
      for (int i = 1; i < 99; i++) {
        expect(sut.getFaculties(i).contains(CoursesMock.generateMockDepartment(i + 1)), true);
      }
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

    test('4', () {
      for (int i = 1; i < 99; i++) {
        expect(sut.getTitle(i), CoursesMock.generateMockCourseTitle(i + 1));
      }
    });
  });

  group("favorite", () {
    test('1', () {
      final bool testValue = sut.getFavourite(0);
      sut.toggleFavourite(0, false);
      expect(sut.getFavourite(0), !testValue);
    });

    test('2', () {
      final bool testValue = sut.getFavourite(1);
      sut.toggleFavourite(1, false);
      expect(sut.getFavourite(1), !testValue);
    });

    test('3', () {
      final bool testValue = sut.getFavourite(1);
      sut.toggleFavourite(1, true);
      expect(sut.getFavourite(1), !testValue);
    });
  });

  group("lecture", () {
    test('1', () {
      expect(sut.getLectureTimes(0) != null, true);
    });

    test('2', () {
      for (int i = 0; i < sut.getCourses().length; i++) {
        expect(sut.getLectureTimes(i) != null, true);
      }
    });
  });

  group("static", () {
    test('getFavouriteLectures 1', () {
      CourseListPresenter localSut = new CourseListPresenter(null, Flavor.MOCK);
      expect(localSut.getFavouriteLectures().length, 0);
      localSut.getCourses().elementAt(0).isFavourite = true;
      expect(localSut.getFavouriteLectures().length, 1);
    });
  });

  group("professor", () {
    test('mail', () {
      for (int i = 0; i < sut.getCourses().length; i++) {
        expect(sut.getProfessorEmail(i), CoursesMock.generateMockEmail(i + 1));
      }
    });
    test('name', () {
      for (int i = 0; i < sut.getCourses().length; i++) {
        expect(sut.getProfessorName(i), CoursesMock.generateMockName(i + 1));
      }
    });
  });
}
