import 'package:flutter/material.dart';

class CiEStyle {
  static TextStyle getCoursesListFacultyStyle() {
    return new TextStyle(
      color: Colors.blue,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle getCoursesListTimeStyle() {
    return new TextStyle(
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle getCoursesTitleStyle() {
    return new TextStyle(
      fontSize: 18.0,
    );
  }

  static double getCoursesListIconSize() {
    return 40.0;
  }

  static TextStyle getAppBarTitleStyle(BuildContext context){
    return new TextStyle(
      fontSize: Theme.of(context).platform == TargetPlatform.iOS ? 17.0 : 20.0,
    );
  }
  static double getAppBarElevation(BuildContext context){
    return Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0;
  }
}
