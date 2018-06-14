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
