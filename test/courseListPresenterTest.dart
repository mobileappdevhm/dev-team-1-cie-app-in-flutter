import 'package:cie_team1/presenter/courseListPresenter.dart';
import 'package:test/test.dart';


void main() {
  test('1', () {
    final CourseListPresenter sut = new CourseListPresenter();


    expect(sut.getFaculty(1), "07");
  });
}