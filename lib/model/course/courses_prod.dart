import 'package:cie_app/model/course/course.dart';
import 'package:cie_app/model/course/courses.dart';

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
