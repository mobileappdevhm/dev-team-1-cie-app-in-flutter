import 'dart:async';

import 'package:cie_team1/generic/genericIcon.dart';
import 'package:cie_team1/utils/fileStore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class NineAPIEngine {
  static const String _NINE_BASE_URL = 'https://nine.wi.hm.edu/api/v2/';
  static const String NINE_COURSE_LIST_URL =
      _NINE_BASE_URL + 'courses/FK%2013/CIE/SoSe%2018';
  static const String NINE_AUTH_URL = _NINE_BASE_URL + 'account/login';

  static Future<Null> pullCourseJSON(
      BuildContext context, bool inBackground) async {
    var isConnected = await isInternetConnected();
    if (isConnected) {
      if (!inBackground) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return GenericIcon.buildGenericSpinner();
            });
      }
      final response = await get(NINE_COURSE_LIST_URL);
      FileStore.writeToFile(FileStore.COURSES, response.body);
      if (!inBackground) {
        Navigator.pop(context);
      }
    }
    return null;
  }

  static Future<Response> postAuth(
      BuildContext context, String username, String password) async {
    var isConnected = await isInternetConnected();
    if (isConnected == true) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return GenericIcon.buildGenericSpinner("Login");
          });
      var response = await post(NINE_AUTH_URL,
          body: {"username": username, "password": password});
      Navigator.pop(context);
      return response;
    }
    return null;
  }

  static Future<bool> isInternetConnected() async {
    var connectivityResult = await (new Connectivity().checkConnectivity());
    return (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi);
  }
}
