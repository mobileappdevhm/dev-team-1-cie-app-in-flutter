import 'package:flutter/material.dart';
import 'package:cie_team1/model/course/course.dart';
import 'package:cie_team1/utils/cieStyle.dart';

class GenericIcon {
  static const int memStorageAvailable = 0xe86c;
  static const int memStoragePending = 0xe8fd;
  static const int memStorageUnavailable = 0xe888;
  static const String fontFamily = 'MaterialIcons';
  static Icon buildGenericAvailabilityIcon(CourseAvailability availability) {
    IconData iconData;
    switch (availability) {
      case CourseAvailability.AVAILABLE:
        iconData = const IconData(memStorageAvailable, fontFamily: fontFamily);
        break;
      case CourseAvailability.PENDING:
        iconData = const IconData(memStorageAvailable, fontFamily: fontFamily);
        break;
      case CourseAvailability.UNAVAILABLE:
        iconData = const IconData(memStorageAvailable, fontFamily: fontFamily);
        break;
    }
    return new Icon(iconData,
      size: CiEStyle.getCoursesListIconSize(),
      color: const Color.fromRGBO(111, 207, 151, 1.0),
    );
  }

  static Icon buildGenericFavoriteIcon(bool isActive) {
    return new Icon(
      (isActive ? const IconData(0xe87d, fontFamily: 'MaterialIcons'):
        const IconData(0xe87e, fontFamily: 'MaterialIcons')),
      size: CiEStyle.getCoursesListIconSize(),
      color: const Color.fromRGBO(235, 87, 87, 1.0),
    );
  }
}
