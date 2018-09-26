import 'package:cie_app/utils/cieColor.dart';
import 'package:flutter/material.dart';

enum CourseAvailability { AVAILABLE, PENDING, UNAVAILABLE }

class CourseAvailabilityUtility {
  static CourseAvailability fromCategoryName(String colorName) {
    switch (colorName) {
      case 'Green':
        return CourseAvailability.AVAILABLE;
      case 'Yellow':
        return CourseAvailability.PENDING;
      case 'Red':
        return CourseAvailability.UNAVAILABLE;
      default:
        return CourseAvailability.UNAVAILABLE;
    }
  }

  //TODO rename this function to fromInt
  static CourseAvailability intToCourseAvailability(int i) {
    switch (i) {
      case 0:
        return CourseAvailability.AVAILABLE;
      case 1:
        return CourseAvailability.PENDING;
      case 2:
        return CourseAvailability.UNAVAILABLE;
      default:
        return CourseAvailability.AVAILABLE;
    }
  }

  //TODO rename this function?
  static Widget intToColoredString(CourseAvailability i, double size) {
    switch (i) {
      case CourseAvailability.AVAILABLE:
        return new Text(
          "Available",
          style: new TextStyle(
            fontSize: size,
            color: CiEColor.green,
          ),
        );
      case CourseAvailability.PENDING:
        return new Text(
          "Pending",
          style: new TextStyle(
            fontSize: size,
            color: CiEColor.yellow,
          ),
        );
      case CourseAvailability.UNAVAILABLE:
        return new Text(
          "Unavailable",
          style: new TextStyle(
            fontSize: size,
            color: CiEColor.red,
          ),
        );
    }
    return null;
  }
}
