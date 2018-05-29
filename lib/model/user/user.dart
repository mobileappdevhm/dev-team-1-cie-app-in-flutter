import 'package:cie_team1/model/course/course.dart';

class User {
  final int id;
  final String username;
  final String firstName;
  final String lastName;
  final String department;
  final String status;
  List<Course> currentCourses;
  List<Course> prevCourses;

  User(this.id, this.username, this.firstName, this.lastName, this.department, this.status,this.currentCourses, this.prevCourses);

}
