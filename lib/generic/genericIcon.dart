import 'package:cie_team1/model/course/course.dart';
import 'package:cie_team1/utils/cieColor.dart';
import 'package:cie_team1/utils/cieStyle.dart';
import 'package:flutter/material.dart';
import 'package:progress_hud/progress_hud.dart';

class GenericIcon {
  static const int memStorageAvailable = 0xe86c;
  static const int memStoragePending = 0xe8fd;
  static const int memStorageUnavailable = 0xe888;
  static const int memStorageActiveFavorite = 0xe87d;
  static const int memStorageInactiveFavorite = 0xe87e;
  static const int memStorageactiveSearch = 0xe8b6;
  static const int memStorageInactiveSearch = 0xe14c;
  static const int memStorageContact = 0xe0e1;
  static const String fontFamily = 'MaterialIcons';

  static Icon buildGenericAvailabilityIcon(CourseAvailability availability) {
    IconData iconData;
    Color color;
    switch (availability) {
      case CourseAvailability.AVAILABLE:
        iconData = const IconData(memStorageAvailable, fontFamily: fontFamily);
        color = CiEColor.green;
        break;
      case CourseAvailability.PENDING:
        iconData = const IconData(memStoragePending, fontFamily: fontFamily);
        color = CiEColor.yellow;
        break;
      case CourseAvailability.UNAVAILABLE:
        iconData =
            const IconData(memStorageUnavailable, fontFamily: fontFamily);
        color = CiEColor.red;
        break;
    }
    return new Icon(
      iconData,
      size: CiEStyle.getCoursesListIconSize(),
      color: color,
    );
  }

  static Icon buildGenericFavoriteIcon(bool isActive) {
    return new Icon(
      (isActive
          ? const IconData(memStorageActiveFavorite,
              fontFamily: 'MaterialIcons')
          : const IconData(memStorageInactiveFavorite,
              fontFamily: 'MaterialIcons')),
      size: CiEStyle.getCoursesListIconSize() + 15.0,
      color: CiEColor.red,
    );
  }

  static Icon buildGenericSearchIcon(bool isActive) {
    return new Icon(
      (isActive
          ? const IconData(memStorageInactiveSearch,
              fontFamily: 'MaterialIcons')
          : const IconData(memStorageactiveSearch,
              fontFamily: 'MaterialIcons')),
    );
  }

  static Icon buildGenericContactIcon() {
    return new Icon(
      const IconData(0xe0e1, fontFamily: 'MaterialIcons'),
      size: CiEStyle.getCoursesListIconSize(),
    );
  }

  static Widget buildGenericConflictIcon(String message) {
    return new Container(
        padding: new EdgeInsets.all(15.0),
        alignment: Alignment.center,
        child: new Chip(
          backgroundColor: Colors.redAccent,
          avatar: new CircleAvatar(
            backgroundColor: Colors.white,
            child: new Text('!'),
          ),
          label: new Text(
            message,
            style: new TextStyle(color: Colors.white),
          ),
        ));
  }

  static Widget buildGenericSpinner([String text = 'Refreshing']) {
    return new ProgressHUD(
        backgroundColor: Colors.black12,
        color: Colors.white,
        containerColor: Colors.red,
        borderRadius: 5.0,
        text: text);
  }

  static Widget buildGenericGetArchiveIcon() {
    return new Container(
      height: CiEStyle.getCoursesListIconSize()*2,
      alignment: Alignment.topCenter,
      padding: new EdgeInsets.only(right: 20.0),
        child: new Icon(
          const IconData(0xe149, fontFamily: 'MaterialIcons'),
          size: CiEStyle.getCoursesListIconSize()*2,
          color: CiEColor.gray,
        )
    );
  }

  static Widget buildGenericGetHeartIcon() {
    return new Container(
        height: CiEStyle.getCoursesListIconSize()*2,
        alignment: Alignment.topCenter,
        padding: new EdgeInsets.only(left: 20.0),
        child: new Icon(
          const IconData(0xe87e, fontFamily: 'MaterialIcons'),
          size: CiEStyle.getCoursesListIconSize()*2,
          color: CiEColor.red,
        )
    );
  }

  static Widget buildGenericGetClockIcon() {
    return new Container(
        height: CiEStyle.getCoursesListIconSize()*2,
        alignment: Alignment.topCenter,
        padding: new EdgeInsets.only(left: 20.0),
        child: new Icon(
          const IconData(0xe01b, fontFamily: 'MaterialIcons'),
          size: CiEStyle.getCoursesListIconSize()*2,
          color: CiEColor.green,
        )
    );
  }

  static Widget buildGenericGetTrafficIcon() {
    return new Container(
        height: CiEStyle.getCoursesListIconSize()*2,
        alignment: Alignment.topCenter,
        padding: new EdgeInsets.only(right: 20.0),
        child: new Icon(
          const IconData(0xe565, fontFamily: 'MaterialIcons'),
          size: CiEStyle.getCoursesListIconSize()*2,
          color: CiEColor.gray,
        )
    );
  }

  static Widget buildGenericGetHappyIcon() {
    return new Container(
        height: CiEStyle.getCoursesListIconSize()*2,
        alignment: Alignment.topCenter,
        padding: new EdgeInsets.only(right: 20.0),
        child: new Icon(
          const IconData(0xe815, fontFamily: 'MaterialIcons'),
          size: CiEStyle.getCoursesListIconSize()*2,
          color: CiEColor.green,
        )
    );
  }


}
