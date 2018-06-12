import 'package:cie_team1/generic/genericIcon.dart';
import 'package:cie_team1/utils/fileStore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class NineAPIEngine {
  static const String NINE_COURSE_LIST_URL = 'https://nine.wi.hm.edu/api/v2/courses/FK%2013/CIE/SoSe%2018';

  static pullCourseJSON(BuildContext context, bool inBackground) async {
    if (inBackground == false) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return GenericIcon.buildGenericSpinner();
          });
    }
    final response = await get(NINE_COURSE_LIST_URL);
    FileStore.writeToFile(FileStore.COURSES, response.body);
    if (inBackground == false) {
      Navigator.pop(context);
    }
  }
}

// TODO: Merge this implementation with course.dart, then delete this class
class NineCourse {
  final String id;
  final String description;
  final bool isCoterie;
  final bool hasHomeBias;
  final List<dynamic> correlations;
  final List<dynamic> dates;
  final String name;
  final String shortName;
  final List<dynamic> actions;

  NineCourse({this.id, this.description, this.isCoterie, this.hasHomeBias,
    this.correlations, this.dates, this.name, this.shortName, this.actions});

  factory NineCourse.fromJson(Map<String, dynamic> jsonData) {
    return new NineCourse(
      id: jsonData['id'],
      description: jsonData['description'],
      isCoterie: jsonData['isCoterie'],
      hasHomeBias: jsonData['hasHomeBias'],
      correlations: jsonData['correlations'],
      dates: jsonData['dates'],
      name: jsonData['name'],
      shortName: jsonData['shortName'],
      actions: jsonData['actions'],
    );
  }
}
