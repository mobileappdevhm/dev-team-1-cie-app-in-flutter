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

  static TextStyle getSettingsContactStyle() {
    return new TextStyle(
      fontSize: 14.0,
    );
  }

  static TextStyle getSettingsStyle() {
    return new TextStyle(
      fontSize: 16.0,
    );
  }

  static TextStyle getSettingsInfoStyle() {
    return new TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle getSettingsLogoutStyle() {
    return new TextStyle(
      color: Colors.white
    );
  }

  static TextStyle getPrevCoursesTitleStyle() {
    return new TextStyle(
      fontSize: 16.0,
    );
  }

  static TextStyle getPrevCoursesCreditsStyle() {
    return new TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: new Color.fromRGBO(235, 87, 87, 1.0)
    );
  }



  static BorderRadius getButtonBorderRadius(){
    return new BorderRadius.circular(30.0);
  }

  static Color getLogoutButtonColor(){
    return new Color.fromRGBO(235, 87, 87, 1.0);
  }

}


