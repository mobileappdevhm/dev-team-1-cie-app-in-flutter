import 'package:cie_team1/model/course/course.dart';
import 'package:cie_team1/model/course/courses_mock.dart';
import 'package:cie_team1/model/user/user.dart';
import 'package:cie_team1/model/user/currentUser.dart';

class CurrentUserMock implements CurrentUser {
  List<Course> prevCourses = [];
  List<Course> currentCourses = [];
  User testUser;

  CurrentUserMock() {
    prevCourses.add(CoursesMock.staticGetCourses()[0]);
    prevCourses.add(CoursesMock.staticGetCourses()[1]);
    prevCourses.add(CoursesMock.staticGetCourses()[2]);

    testUser = new User(1, "Jane1","Jane","Doe", "07",  "Local", "assets/profiles/01.png" , currentCourses,prevCourses);
  }
  @override
  User getCurrentUser() {
    return testUser;
  }
}