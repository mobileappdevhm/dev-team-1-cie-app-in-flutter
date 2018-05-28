import 'package:cie_team1/model/course/course.dart';
import 'package:cie_team1/presenter/timeTablePresenter.dart';

class TodayTimeTablePresenter extends TimeTablePresenter {

  TodayTimeTablePresenter() :super();

  @override
  List<Course> getCourses() {
    List<Course> allCourses = super.getCourses();
    //Todo: Get weekday dynamically
    //Get all courses on day
    return allCourses.where((item) => item.occursOnDay(Weekday.Mon)).toList();
  }
}