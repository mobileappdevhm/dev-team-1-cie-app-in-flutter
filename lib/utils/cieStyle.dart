import 'package:cie_team1/utils/cieColor.dart';
import 'package:flutter/material.dart';

class CiEStyle {
  static TextStyle getTimeTableSectionHeadingStyle() {
    return new TextStyle(
      color: CiEColor.gray,
      fontSize: 18.0,
    );
  }

  static TextStyle getCoursesListFacultyStyle() {
    return new TextStyle(
      color: CiEColor.turquoise,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle getCoursesListTimeStyle() {
    return new TextStyle(
      color: CiEColor.mediumGray,
      fontSize: 11.0,
    );
  }

  static TextStyle getCoursesTitleStyle() {
    return new TextStyle(
      color: CiEColor.gray,
      fontSize: 18.0,
    );
  }

  static TextStyle getMapsDescriptionStyle() {
    return new TextStyle(
      color: CiEColor.mediumGray,
      fontSize: 14.0,
    );
  }

  static TextStyle getMapsTitleStyle() {
    return new TextStyle(
      color: CiEColor.gray,
      letterSpacing: 2.0,
      fontSize: 25.0,
    );
  }

  static double getCoursesListIconSize() {
    return 30.0;
  }

  static TextStyle getAppBarTitleStyle(BuildContext context) {
    return new TextStyle(
        fontSize: 20.0, color: CiEColor.white, letterSpacing: 2.0);
  }

  static double getAppBarElevation(BuildContext context) {
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

  static TextStyle getSettingsEnabledStyle() {
    return new TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w200,
      color: CiEColor.black
    );
  }

  static TextStyle getSettingsDisabledStyle() {
    return new TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w200,
      color: CiEColor.mediumGray
    );
  }

  static TextStyle getSettingsLogoutStyle() {
    return new TextStyle(color: Colors.white);
  }

  static TextStyle getSettingsPrivacyStyle() {
    return new TextStyle(color: Colors.white);
  }

  static TextStyle getPrevCoursesTitleStyle() {
    return new TextStyle(
      fontSize: 16.0,
    );
  }

  static TextStyle getPrevCoursesCreditsStyle() {
    return new TextStyle(
        fontSize: 20.0, fontWeight: FontWeight.bold, color: CiEColor.red);
  }

  static Color getLogoutButtonColor() {
    return CiEColor.red;
  }

  static BorderRadius getButtonBorderRadius() {
    return new BorderRadius.circular(30.0);
  }

  static TextStyle getCourseDescriptionTitleStyle() {
    return new TextStyle(
      color: CiEColor.gray,
      fontSize: 23.0,
    );
  }

  static TextStyle getWarningTextStyle() {
    return new TextStyle(
        color: CiEColor.gray, fontSize: 17.0, fontWeight: FontWeight.w300);
  }

  static TextStyle getCourseDescriptionFacultyStyle() {
    return new TextStyle(
      color: CiEColor.turquoise,
      fontSize: 15.0,
      fontWeight: FontWeight.bold,
    );
  }

  static double getCourseDescriptionIconSize() {
    return 50.0;
  }

  static TextStyle getTimeTableListMediumGray() {
    return new TextStyle(
      color: CiEColor.mediumGray,
      fontSize: 15.0,
    );
  }

  static TextStyle getTimeTableListVariable() {
    return new TextStyle(
      color: CiEColor.gray,
      fontSize: 15.0,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle getTimeTableCourseTitle() {
    return new TextStyle(
      color: CiEColor.gray,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle getCourseListRefreshText() {
    return new TextStyle(
        color: CiEColor.mediumGray, fontSize: 17.0, fontWeight: FontWeight.w300);
  }

  static TextStyle getCourseDetailsFooterTextStyle() {
    return new TextStyle(
      fontSize: getCourseDetailsFontSize(),
      color: CiEColor.gray,
    );
  }

  static TextStyle getCourseDetailsFooterTextStyleBolt() {
    return new TextStyle(
      fontSize: getCourseDetailsFontSize(),
      color: CiEColor.gray,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle getCourseDetailsHeadingStyle() {
    return new TextStyle(
        fontSize: 20.0,
        color: CiEColor.gray,
        letterSpacing: 2.0
    );
  }

  static double getCourseDetailsFontSize() {
    return 18.0;
  }

  static TextStyle getCourseDetailsDescription() {
    return new TextStyle(
      fontSize: 15.0,
      color: CiEColor.gray,
    );
  }
}
