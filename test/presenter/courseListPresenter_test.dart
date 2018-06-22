import 'package:cie_team1/model/course/courses_mock.dart';
import 'package:cie_team1/presenter/courseListPresenter.dart';
import 'package:test/test.dart';

void main() {
  CourseListPresenter sut;

  setUp(() {
    sut = new CourseListPresenter(null);
  });

  group("facultycheck", () {
    test('1', () {
      expect(sut.getFaculty(1), CoursesMock.generateMockDepartment(2));
    });

    test('2', () {
      expect(sut.getFaculty(2), CoursesMock.generateMockDepartment(3));
    });

    test('3', () {
      expect(sut.getFaculty(3), CoursesMock.generateMockDepartment(4));
    });

    test('4', () {
      for (int i = 1; i < 99; i++) {
        expect(sut.getFaculty(i), CoursesMock.generateMockDepartment(i + 1));
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
  });

  group("lecture", () {
    test('1', () {
      expect(sut.getLectureTimes(0)!=null, true);
    });

    test('2', () {
      for (int i=0; i<sut.getCourses().length; i++) {
        expect(sut.getLectureTimes(i)!=null, true);
      }
    });
  });

  group("static", () {
    test('getFavouriteLectures 1', () {
      CourseListPresenter localSut = new CourseListPresenter(null);
      expect(localSut.getFavouriteLectures().length, 0);
      localSut.getCourses().elementAt(0).isFavourite = true;
      expect(localSut.getFavouriteLectures().length, 1);
    });
  });


}
