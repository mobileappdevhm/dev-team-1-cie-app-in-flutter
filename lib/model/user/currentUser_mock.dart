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
    currentCourses.add(courses[8]);
    currentCourses.add(courses[9]);
    currentCourses.add(courses[10]);
    currentCourses.add(courses[11]);
    currentCourses.add(courses[12]);
    currentCourses.add(courses[17]);
    currentCourses.add(courses[43]);

    currentUser = new UserBuilder()
        .withID("id-123")
        .withUsername("Guest")
        .withFirstName("Guest")
        .withLastName("User")
        .withDepartment("N/A")
        .withStatus("N/A")
        .withIsMetricsEnabled(true)
        .withCurrentCourses(currentCourses)
        .withPrevCourses(prevCourses)
        .build();
  }

  @override
  User getCurrentUser() {
    return currentUser;
  }
}
