import 'package:cie_team1/model/course/course.dart';
import 'package:cie_team1/model/course/courses_mock.dart';
import 'package:cie_team1/model/user/user.dart';
import 'package:cie_team1/model/user/currentUser.dart';
import 'package:cie_team1/utils/staticVariables.dart';

class CurrentUserMock implements CurrentUser {
  List<Course> prevCourses = [];
  List<Course> currentCourses = [];
  User testUser;

  CurrentUserMock() {
    prevCourses.add(CoursesMock.staticGetCourses()[0]);
    prevCourses.add(CoursesMock.staticGetCourses()[1]);
    prevCourses.add(CoursesMock.staticGetCourses()[2]);

    currentCourses.add(CoursesMock.staticGetCourses()[0]);
    currentCourses.add(CoursesMock.staticGetCourses()[1]);
    currentCourses.add(CoursesMock.staticGetCourses()[2]);
    currentCourses.add(CoursesMock.staticGetCourses()[3]);
    currentCourses.add(CoursesMock.staticGetCourses()[4]);
    currentCourses.add(CoursesMock.staticGetCourses()[5]);

    testUser = new User(1, "Jane1","Jane","Doe", "07",  "Local", StaticVariables.IMAGE_PATH + "profile.png" , currentCourses,prevCourses);
  }
  @override
  User getCurrentUser() {
    return testUser;
  }
}