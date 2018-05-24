import 'package:flutter/material.dart';

class CiEStyle {
  static TextStyle getDropdownTitleStyle() {
    return new TextStyle(
      //fontWeight: FontWeight.bold,
      fontSize: 16.0,
    );
  }

  static TextStyle getCoursesListFacultyStyle() {
    return new TextStyle(
      color: const Color.fromRGBO(0, 160, 210, 1.0),
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle getCoursesListTimeStyle() {
    return new TextStyle(
      fontWeight: FontWeight.bold,
      color: const Color.fromRGBO(79, 79, 79, 1.0),
    );
  }

  static TextStyle getCoursesTitleStyle() {
    return new TextStyle(
      color: const Color.fromRGBO(79, 79, 79, 1.0),
      fontSize: 18.0,
    );
  }

  static TextStyle getMapsDescriptionStyle() {
    return new TextStyle(
      color: const Color.fromRGBO(79, 79, 79, 1.0),
      fontSize: 18.0,
    );
  }

  static TextStyle getMapsTitleStyle() {
    return new TextStyle(
      color: const Color.fromRGBO(79, 79, 79, 1.0),
      fontWeight: FontWeight.w900,
      fontSize: 26.0,
    );
  }

  static double getCoursesListIconSize() {
    return 40.0;
  }

  static TextStyle getAppBarTitleStyle(BuildContext context){
    return new TextStyle(
      fontSize: Theme.of(context).platform == TargetPlatform.iOS ? 17.0 : 20.0,
      color: const Color.fromRGBO(235, 87, 87, 1.0),
      letterSpacing: 2.0
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

  static TextStyle getCourseDescriptionTitleStyle() {
    return new TextStyle(
      color: const Color.fromRGBO(79, 79, 79, 1.0),
      fontSize: 23.0,
    );
  }

  static TextStyle getCourseDescriptionFacultyStyle() {
    return new TextStyle(
      color: const Color.fromRGBO(0, 160, 210, 1.0),
      fontSize: 15.0,
      fontWeight: FontWeight.bold,
    );
  }

  static double getCourseDescriptionIconSize() {
    return 50.0;
  }

}


