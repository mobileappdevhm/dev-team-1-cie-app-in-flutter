import 'package:cie_team1/di/currentUser_di.dart';
import 'package:cie_team1/model/course/course.dart';
import 'package:cie_team1/model/user/user.dart';
import 'package:cie_team1/model/user/currentUser.dart';




class TimeTablePresenter {

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

  //List<String> days = ["Mo","Di","Mi","Do","Fr","Sa"];

  List<Course> getCoursesByDay(String day){
  //List<Course> getCoursesByDay(){
    List<Course> newList =[];
    _currentUser.getCurrentUser().currentCourses.forEach((course) {
      if(course.date == day){
        newList.add(course);
      }
      //newList.sort((a,b) => a.date.compareTo(b.date));
    });
    return newList;
  }
}