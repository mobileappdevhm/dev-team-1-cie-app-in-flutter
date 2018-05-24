import 'package:cie_team1/di/currentUser_di.dart';
import 'package:cie_team1/model/course/course.dart';
import 'package:cie_team1/model/user/user.dart';
import 'package:cie_team1/model/user/currentUser.dart';



class TimeTablePresenter {
  //List<Course> courses = [];
  CurrentUser _currentUser;

  TimeTablePresenter() {
    UserInjector.configure(Flavor.MOCK);
    _currentUser = new UserInjector().currentUser;
  }


  User getCurrentUser() {
    return _currentUser.getCurrentUser();
  }


  List<Course> getCurrentCourses(){
    return _currentUser.getCurrentUser().currentCourses;
  }


/* Duplicated methods */
/* I'll try to find a proper way for these presenters to work together but this is what work for now */

  String getTitle(int id) {
    return _currentUser.getCurrentUser().currentCourses[id].name;
  }

  int getCredits(int id) {
    return _currentUser.getCurrentUser().currentCourses[id].ects;
  }


  String getFaculty(int id) {
    return _currentUser.getCurrentUser().currentCourses[id].faculty.toString();
      }
  String getDate(int id) {
    return _currentUser.getCurrentUser().currentCourses[id].date.toString();
  }

  String getStartTime(int id) {
    return _currentUser.getCurrentUser().currentCourses[id].startTime.toString();
  }

  String getEndTime(int id) {
    return _currentUser.getCurrentUser().currentCourses[id].endTime.toString();
  }

}