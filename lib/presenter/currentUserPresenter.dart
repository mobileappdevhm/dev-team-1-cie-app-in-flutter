import 'package:cie_team1/di/currentUser_di.dart';
import 'package:cie_team1/model/course/course.dart';
import 'package:cie_team1/model/user/user.dart';
import 'package:cie_team1/model/user/currentUser.dart';



class CurrentUserPresenter {
  //List<Course> courses = [];
  CurrentUser _currentUser;

  CurrentUserPresenter() {
    UserInjector.configure(Flavor.MOCK);
    _currentUser = new UserInjector().currentUser;
  }


  User getCurrentUser() {
    return _currentUser.getCurrentUser();
  }

  String getCurrentUserFaculty() {
    return _currentUser.getCurrentUser().department;
  }

  String getCurrentUserStatus() {
    return _currentUser.getCurrentUser().status;
  }

  String getFullName() {
    return _currentUser.getCurrentUser().firstName + " " +  _currentUser.getCurrentUser().lastName ;
  }

  String getCurrentUserName() {
    return _currentUser.getCurrentUser().firstName + " " + _currentUser.getCurrentUser().lastName;
  }

  String getCurrentUserProfileDir() {
    return _currentUser.getCurrentUser().profileDir;
  }

  List<Course> getPrevCourses(){
    return _currentUser.getCurrentUser().prevCourses;
  }

  List<Course> getCurrentCourses(){
    return _currentUser.getCurrentUser().currentCourses;
  }

  int getTotalCredits() {
    var sum = 0;

    _currentUser.getCurrentUser().prevCourses.forEach((course) {
      sum = sum + course.ects;
    });
    return sum;
  }

  int getDep3Credits() {
    var sum = 0;
    _currentUser.getCurrentUser().prevCourses.forEach((course) {
      if(course.faculty == "3"){
        sum = sum + course.ects;
      }

    });
    return sum;
  }

/* Duplicated methods */
/* I'll try to find a proper way for these presenters to work together but this is what work for now */

  String getTitle(int id) {
    return _currentUser.getCurrentUser().prevCourses[id].name;
  }

  int getCredits(int id) {
    return _currentUser.getCurrentUser().prevCourses[id].ects;
  }


  String getFaculty(int id) {
    return _currentUser.getCurrentUser().prevCourses[id].faculty.toString();
  }


}