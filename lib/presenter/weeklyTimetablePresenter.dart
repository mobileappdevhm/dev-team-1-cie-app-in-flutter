import 'package:cie_team1/di/currentUser_di.dart';
import 'package:cie_team1/model/course/course.dart';
import 'package:cie_team1/model/user/user.dart';
import 'package:cie_team1/model/user/currentUser.dart';


class WeeklyTimeTablePresenter {

  CurrentUser _currentUser;

  WeeklyTimeTablePresenter() {
    UserInjector.configure(Flavor.MOCK);
    _currentUser = new UserInjector().currentUser;
  }

  User getCurrentUser() {
    return _currentUser.getCurrentUser();
  }


  List<Course> getCurrentCourses() {
    return _currentUser
        .getCurrentUser()
        .currentCourses;
  }

  String getTitle(int id) {
    return _currentUser
        .getCurrentUser()
        .currentCourses[id].name;
  }

  int getCredits(int id) {
    return _currentUser
        .getCurrentUser()
        .currentCourses[id].ects;
  }


  String getFaculty(int id) {
    return _currentUser
        .getCurrentUser()
        .currentCourses[id].faculty.toString();
  }


  //List<String> days = ["Mo","Di","Mi","Do","Fr","Sa"];

  List<Course> getCoursesByDay(String day) {
    return null;
  }

}