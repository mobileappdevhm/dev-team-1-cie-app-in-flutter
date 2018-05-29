import 'package:cie_team1/model/course/course.dart';
import 'package:cie_team1/model/course/courses_mock.dart';
import 'package:cie_team1/model/user/currentUser.dart';
import 'package:cie_team1/model/user/user.dart';

class CurrentUserMock implements CurrentUser {
  List<Course> prevCourses = [];
  List<Course> currentCourses = [];
  User currentUser;

  CurrentUserMock() {
    CoursesMock coursesMock = new CoursesMock();
    List<Course> courses = coursesMock.getCourses();
    prevCourses.add(courses[0]);
    prevCourses.add(courses[1]);
    prevCourses.add(courses[2]);
    prevCourses.add(courses[3]);

    currentCourses.add(courses[4]);
    currentCourses.add(courses[5]);
    currentCourses.add(courses[6]);
    currentCourses.add(courses[7]);
    currentCourses.add(courses[8]);

    currentUser = new User(
        1, "Jane1", "Jane", "Doe", "07", "Local", currentCourses, prevCourses);
  }

  @override
  User getCurrentUser() {
    return currentUser;
  }
}
