import 'package:cie_team1/presenter/courseListPresenter.dart';
import 'package:test/test.dart';
import 'package:cie_team1/model/course/courses_mock.dart';


void main() {

  CourseListPresenter sut;

  setUp((){
    sut = new CourseListPresenter();
  });

  group("facultycheck", (){
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
      for (int i=1; i< 100; i++) {
        expect(sut.getFaculty(i), CoursesMock.generateMockDepartment(i+1));
      }
    });
  });

  group("title", (){
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
      for (int i=1; i< 100; i++) {
        expect(sut.getTitle(i), CoursesMock.generateMockCourseTitle(i+1));
      }
    });
  });

}