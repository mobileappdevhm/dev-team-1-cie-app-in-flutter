import 'package:cie_team1/model/course/course.dart';
import 'package:cie_team1/model/course/courses.dart';

class CoursesProd implements Courses {
  List<Course> courses = [];

  CoursesProd() {
    //Todo: In the next Sprints
  }

  @override
  List<Course> getCourses() {
    return courses;
  }
}