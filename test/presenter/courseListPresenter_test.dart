import 'package:cie_app/model/course/course.dart';
import 'package:cie_app/model/course/courses_mock.dart';
import 'package:cie_app/presenter/courseListPresenter.dart';
import 'package:cie_app/utils/staticVariables.dart';
import 'package:test/test.dart';

void main() {
  CourseListPresenter sut;

  setUp(() {
    sut = new CourseListPresenter(null, Flavor.MOCK);
  });

  group("facultycheck", () {
    test('1', () {
      expect(
          sut.getDepartmentShortName(1).contains(CoursesMock.generateMockDepartment(2).shortName),
          true);
    });

    test('2', () {
      expect(
          sut.getDepartmentShortName(2).contains(CoursesMock.generateMockDepartment(3).shortName),
          true);
    });

    test('3', () {
      expect(
          sut.getDepartmentShortName(3).contains(CoursesMock.generateMockDepartment(4).shortName),
          true);
    });

    test('4', () {
      for (int i = 1; i < 99; i++) {
        expect(
            sut
                .getDepartmentShortName(i)
                .contains(CoursesMock.generateMockDepartment(i + 1).shortName),
            true);
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

    /* TODO we should implemnt a test with the toggleFavorite(1, true) to get uncovered lines
    test('3', () {
      final bool testValue = sut.getFavourite(1);
      sut.toggleFavourite(1, true);
      expect(sut.getFavourite(1), !testValue);
    });
    */
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
      expect(localSut.getFavouriteAppointments().length, 0);
      localSut.getCourses().elementAt(0).isFavourite = true;
      expect(localSut.getFavouriteAppointments().length, 1);
    });
  });

  group('class functions', (){
    test('isNewCourseData 1', (){
      expect(sut.isNewCourseData(sut.getCourses(), sut.getCourses()[0]), false);
    });
    test('isNewCourseData 2', (){
      CourseListPresenter localSut = new CourseListPresenter(null, Flavor.MOCK);
      localSut.getCourses()[0].id = "completely new id";
      expect(sut.isNewCourseData(sut.getCourses(), localSut.getCourses()[0]), true);
    });

    //test('isNewCourseData 2', (){
    //  expect(sut.getFavourite(0), false);
    //  sut.toggleFavouriteWhenChangeView(0);
    //  expect(sut.getFavourite(0), true);
    //  sut.toggleFavouriteWhenChangeView(0);
    //  expect(sut.getFavourite(0), false);
    //});

    test('getProfileOfLecturer', (){
      expect(sut.getProfileOfLecturer(0), "https://hm.edu");
    });

    test('checkIfConflictsOtherFavoriteLecture', (){
      expect(sut.checkIfConflictsOtherFavoriteLecture(sut.getCourses()[0].appointments[0]), false);
    });
  });
}
