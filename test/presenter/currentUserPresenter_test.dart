import 'package:cie_team1/di/currentUser_di.dart';
import 'package:cie_team1/presenter/currentUserPresenter.dart';
import 'package:test/test.dart';
import 'package:cie_team1/model/course/courses_mock.dart';


void main() {

  CurrentUserPresenter sut;

  setUp((){
    sut = new CurrentUserPresenter();
  });

  group("User", (){
    test('1', () {
      expect(sut.getCurrentUser().username, new UserInjector().currentUser.getCurrentUser().username);
    });

    test('2', () {
      expect(sut.getCurrentUser().status, new UserInjector().currentUser.getCurrentUser().status);
    });

    test('3', () {
      expect(sut.getCurrentUserStatus(), new UserInjector().currentUser.getCurrentUser().status);
    });

    test('4', () {
      expect(sut.getCurrentUserFaculty(), new UserInjector().currentUser.getCurrentUser().department);
    });

    test('5', () {
      expect(sut.getCredits(1), new UserInjector().currentUser.getCurrentUser().prevCourses[1].ects);
    });
    test('6', () {
      expect(sut.getFullName(), new UserInjector().currentUser.getCurrentUser().firstName + " " + new UserInjector().currentUser.getCurrentUser().lastName);
    });
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


  });

}