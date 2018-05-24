import 'package:cie_team1/model/course/course.dart';
import 'package:cie_team1/model/course/courses_mock.dart';
import 'package:test/test.dart';


@Timeout(const Duration(seconds: 20))
void main() {

  CoursesMock sut;
  List<String> courses;

  setUp((){
    sut = new CoursesMock();
    courses = [
    "Title of Course 1",
    "Title of Course 2",
    "Title of Course 3",
    "Title of Course 4",
    "Title of Course 5",
    "Title of Course 6",
    "Title of Course 7",
    "Title of Course 8",
    "Title of Course 9"
    ];
  });

  test('1 name', () {

    final Iterator<Course> itera = sut.getCourses().iterator;

    int counter = 0;
    while(itera.moveNext()) {
      expect(itera.current.name, courses[counter]);
      counter++;
    }
  });

  test('2 fk', () {

    final Iterator<Course> itera = sut.getCourses().iterator;

    while(itera.moveNext()) {
      expect(itera.current.faculty, "07");
    }
  });

}