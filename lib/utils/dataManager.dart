import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cie_app/generic/genericIcon.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';

class DataManager {
  //Remotes
  static const String _REMOTE_BASE = 'https://nine.wi.hm.edu/api/v2/';
  static const String _REMOTE_TRANSITION_BASE = 'https://nine.wi.hm.edu/api2/';
  static const String REMOTE_CIE_BASE = _REMOTE_BASE + 'apps/cie/';
  static const String REMOTE_CIE_COURSES_BASE = REMOTE_CIE_BASE + 'courses/';
  static const String REMOTE_SUBSCRIBE = _REMOTE_BASE + 'courses/subscribe';
  static const String REMOTE_AUTH = _REMOTE_BASE + 'account/login';
  static const String REMOTE_LECTURERS =
      _REMOTE_TRANSITION_BASE + 'Lecturer/GetAllLecture';

  //Locals
  static const String LOCAL_COURSES = "_courses";
  static const String LOCAL_LECTURERS = "_lecturers";
  static const String LOCAL_LOGIN = "_login";
  static const String LOCAL_USER_SETTINGS = "_user";
  static const String LOCAL_FAVORITES = "_favorites";
  static const String LOCAL_TAKEN_COURSES = "_takencourses";
  static const String LOCAL_SEMESTERS = "_semesters";

  static Future<File> writeToFile(String resource, String data) async {
    resource = resource.replaceAll(' ', '');
    try {
      String dir = (await getApplicationDocumentsDirectory()).path;
      String filename = "$dir/" + resource + ".json";
      File f = new File(filename);
      f.writeAsString(data);
      return f;
    } catch (e) {
      print(resource + " => null, error: " + e.toString());
      return null;
    }
  }

  static Future<String> _readFileAsString(String resource) async {
    resource = resource.replaceAll(' ', '');
    try {
      String dir = (await getApplicationDocumentsDirectory()).path;
      String filename = "$dir/" + resource + ".json";
      var file = new File(filename);
      String contents = await file.readAsString();
      return contents;
    } catch (e) {
      print(resource + " => null, error: " + e.toString());
      return null;
    }
  }

  //TODO think about to restructure all those methods
  //public methods will call a private one which will open dialog
  //after dialog is opend a private method given as attribute will executed
  //after execusion pop is called

  static Future<String> getResource(String local,
      [String remote = null]) async {
    var result = await DataManager._readFileAsString(local);
    if (remote != null && result == null) {
      getJson(remote).then((value) {
        writeToFile(local, value);
        return value;
      });
    }
    return result;
  }

  static void updateResource(
      BuildContext context, String local, String remote) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return GenericIcon.buildGenericSpinner();
        });
    getJson(remote).then((value) {
      writeToFile(local, value);
    });
    Navigator.pop(context);
  }

  static void updateMultipleResources(
      BuildContext context, List<String> locals, List<String> remotes) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return GenericIcon.buildGenericSpinner();
        });

    for (int i = 0; i < locals.length; i++) {
      getJson(remotes[i]).then((value) {
        writeToFile(locals[i], value);
      });
    }

    Navigator.pop(context);
  }

  static Future updateAll(BuildContext context,
      [bool oldSemesters = false, bool inBackground = false]) async {
    if (!inBackground) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return GenericIcon.buildGenericSpinner();
          });
    }

    var semesters = new List<String>();
    var semestersData = await getJson(REMOTE_CIE_BASE);
    await writeToFile(LOCAL_SEMESTERS, semestersData);
    var jsonData = json.decode(semestersData);
    for (var semester in jsonData) {
      semesters.add(semester['name']);
    }
    if (oldSemesters) {
      for (int i = 0; i < semesters.length; i++) {
        var url = REMOTE_CIE_COURSES_BASE + semesters[i].replaceAll(' ', '%20');
        var courseData = await getJson(url);
        await writeToFile(LOCAL_COURSES + semesters[i], courseData);
      }
    } else {
      var url = REMOTE_CIE_COURSES_BASE + semesters[0].replaceAll(' ', '%20');
      var courseData = await getJson(url);
      await writeToFile(LOCAL_COURSES + semesters[0], courseData);
    }

    var lecturersData = await getJson(REMOTE_LECTURERS);
    await writeToFile(LOCAL_LECTURERS, lecturersData);

    if (!inBackground) {
      Navigator.pop(context);
    }
  }

  static Future<String> getLatestSemester() async {
    var semesters =
        await getResource(DataManager.LOCAL_SEMESTERS, REMOTE_CIE_BASE);
    try {
      return json.decode(semesters)[0]['name'];
    } catch (e) {
      print('dataManager.dart, error: ' + e.toString());
      return "";
    }
  }

  static Future<Response> postJson(
      BuildContext context, String url, Map jsonMap) async {
    var isConnected = await isInternetConnected();
    if (isConnected == true) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return GenericIcon.buildGenericSpinner();
          });

      Response res = await post(url, body: jsonMap); // post api call
      Navigator.pop(context);
      return res;
    }
    return null;
  }

  //TODO is this function necessary?
  static Future<String> getJson(String url) async {
    var isConnected = await isInternetConnected();
    if (isConnected) {
      Response res = await get(url);
      return res.body;
    }
    return null;
  }

  static Future<bool> isInternetConnected() async {
    var connectivityResult = await (new Connectivity().checkConnectivity());
    return (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi);
  }
}
