import 'package:cie_team1/presenter/courseListPresenter.dart';
import 'package:test/test.dart';


void main() {

  CourseListPresenter sut;

  setUp((){
    sut = new CourseListPresenter();
  });

  group("facultycheck", (){

    test('1', () {
      expect(sut.getFaculty(1), "07");
    });

    test('2', () {
      expect(sut.getFaculty(2), "07");
    });

    test('3', () {
      expect(sut.getFaculty(1), "07");
    });

  });

  group("title", (){

    test('1', () {
      expect(sut.getTitle(0), "Title of Course 1");
    });

    test('2', () {
      expect(sut.getTitle(1), "Title of Course 2");
    });

    test('3', () {
      expect(sut.getTitle(2), "Title of Course 3");
    });

  });

}