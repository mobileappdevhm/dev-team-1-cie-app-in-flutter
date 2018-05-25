import 'package:flutter/material.dart';
import 'package:cie_team1/model/course/course.dart';
import 'package:cie_team1/utils/cieStyle.dart';

class GenericIcon {
  static const int memStorageAvailable = 0xe86c;
  static const int memStoragePending = 0xe8fd;
  static const int memStorageUnavailable = 0xe888;
  static const String fontFamily = 'MaterialIcons';
  static Icon buildGenericAvailabilityIcon(int availability) {
    IconData iconData;
    Color color;
    switch (availability) {
      case CourseDefinitions.AVAILABILITY_AVAILABLE:
        iconData = const IconData(memStorageAvailable, fontFamily: fontFamily);
        color = const Color.fromRGBO(111, 207, 151, 1.0);
        break;
      case CourseDefinitions.AVAILABILITY_PENDING:
        iconData = const IconData(memStoragePending, fontFamily: fontFamily);
        color = const Color.fromRGBO(242, 201, 76, 1.0);
    break;
      case CourseDefinitions.AVAILABILITY_UNAVAILABLE:
        iconData = const IconData(memStorageUnavailable, fontFamily: fontFamily);
        color = const Color.fromRGBO(235, 87, 87, 1.0);
        break;
    }
    return new Icon(iconData,
      size: CiEStyle.getCoursesListIconSize(),
      color: color,
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
