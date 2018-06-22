import 'package:cie_team1/generic/genericIcon.dart';
import 'package:cie_team1/utils/fileStore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:connectivity/connectivity.dart';
import 'dart:async';

class NineAPIEngine {
  static const String NINE_COURSE_LIST_URL = 'https://nine.wi.hm.edu/api/v2/courses/FK%2013/CIE/SoSe%2018';

  static Future<String> pullCourseJSON(BuildContext context, bool inBackground, bool save) async {
    var isConnected  = await isInternetConnected();
    if (isConnected == true) {
      if (inBackground == false) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return GenericIcon.buildGenericSpinner();
            });
      }
      final response = await get(NINE_COURSE_LIST_URL);
      if (save == true) {
        FileStore.writeToFile(FileStore.COURSES, response.body);
      }
      if (inBackground == false) {
        Navigator.pop(context);
      }
      return response.body;
    }
    return null;
  }

  static Future<bool> isInternetConnected() async {
    var connectivityResult = await (new Connectivity().checkConnectivity());
    return (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi);
  }
}
