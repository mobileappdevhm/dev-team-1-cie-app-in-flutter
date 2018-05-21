import 'package:cie_team1/di/courses_di.dart';
import 'package:cie_team1/model/course/course.dart';
import 'package:cie_team1/model/course/courses.dart';

abstract class CourseListViewContract {
  //Todo: Needed in future
}

class CourseListPresenter {
  //List<Course> courses = [];
  Courses _courses;
  
  CourseListPresenter() {
    CourseInjector.configure(Flavor.MOCK);
    _courses = new CourseInjector().courses;
  }
  
  void toggleFavourite(int id) {
    if (_courses.getCourses()[id].isFavourite) {
      _courses.getCourses()[id].isFavourite = false;
    } else {
      _courses.getCourses()[id].isFavourite = true;
    }
  }

  bool getFavourite(int id) {
    return _courses.getCourses()[id].isFavourite;
  }

  void toggleShowCourseDescription(int id) {
    //Todo: Implementation needed. See Issue #12
  }

  List<Course> getCourses() {
    return _courses.getCourses();
  }
}