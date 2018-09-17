import 'dart:async';
import 'package:cie_team1/generic/genericIcon.dart';
import 'package:cie_team1/utils/fileStore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class NineAPIEngine {
  static const String _NINE_BASE_URL = 'https://nine.wi.hm.edu/api/v2/';
  static const String _NINE_TRANSITION_URL = 'https://nine.wi.hm.edu/api2/';
  /*
  static const String NINE_COURSE_LIST_URL =
      _NINE_BASE_URL + 'courses/FK%2013/CIE/SoSe%2018';
      */
  // TODO: Revert back to Nine URL after the Nine Server fixes this
  static const String NINE_COURSE_LIST_URL = 'https://s3-us-west-2.amazonaws.com/seanwallace/2018SoSe.json';
  static const String NINE_COURSE_SUBSCRIPTION_URL =
      _NINE_BASE_URL + 'courses/subscribe';
  static const String NINE_AUTH_URL = _NINE_BASE_URL + 'account/login';
  static const String NINE_LECTURER_URL =
      _NINE_TRANSITION_URL + 'Lecturer/GetAllLecture';
  static const String NINE_PREV_COURSE_LIST_URL =
      _NINE_BASE_URL + 'courses/FK%2013/CIE/';

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
      final coursesResponse = await get(NINE_COURSE_LIST_URL);
      final lecturerResponse = await get(NINE_LECTURER_URL);
      FileStore.writeToFile(FileStore.COURSES, coursesResponse.body);
      FileStore.writeToFile(FileStore.LECTURERS, lecturerResponse.body);
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

  static Future<int> postJson(BuildContext context, String url, Map jsonMap) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return GenericIcon.buildGenericSpinner();
    });
    Response res = await post(url, body: jsonMap); // post api call
    Navigator.pop(context);
    return res.statusCode;
  }

  static Future<String> getJson(BuildContext context, String url) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return GenericIcon.buildGenericSpinner();
    });
    Response res = await get(url);
    Navigator.pop(context);
    return res.body;
  }

  static Future<Null> getJsonMulti(BuildContext context, List<String> urls) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return GenericIcon.buildGenericSpinner();
    });
    for (int i=0; i<urls.length; i++) {
      Response res = await get(urls.elementAt(i));
      FileStore.writeToFile(FileStore.OLD_COURSES+i.toString(), res.body);
    }
    Navigator.pop(context);
    return null;
  }

  static Future<bool> isInternetConnected() async {
    var connectivityResult = await (new Connectivity().checkConnectivity());
    return (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi);
  }
}
