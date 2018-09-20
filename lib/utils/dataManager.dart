import 'dart:async';
import 'dart:convert';

import 'package:cie_app/generic/genericIcon.dart';
import 'package:cie_app/utils/fileStore.dart';
import 'package:cie_app/utils/nineAPIConsumer.dart';
import 'package:flutter/material.dart';

class DataManager {
  //TODO think about to restructure all those methods
  //public methods will call a private one which will open dialog
  //after dialog is opend a private method given as attribute will executed
  //after execusion pop is called

  static Future<String> getResource(String local, String remote) async {
    var result = await FileStore.readFileAsString(local);
    if (result == null) {
      NineAPIEngine.getJson(remote).then((value) {
        FileStore.writeToFile(local, value);
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
    NineAPIEngine.getJson(remote).then((value) {
      FileStore.writeToFile(local, value);
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
      NineAPIEngine.getJson(remotes[i]).then((value) {
        FileStore.writeToFile(locals[i], value);
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
    var semestersData =
        await NineAPIEngine.getJson(NineAPIEngine.NINE_CIE_BASE_URL);
    await FileStore.writeToFile(FileStore.SEMESTERS, semestersData);
    var jsonData = json.decode(semestersData);
    for (var semester in jsonData) {
      semesters.add(semester['name']);
    }
    if (oldSemesters) {
      for (int i = 0; i < semesters.length; i++) {
        var url = NineAPIEngine.NINE_CIE_COURSES_BASE_URL +
            semesters[i].replaceAll(' ', '%20');
        var courseData = await NineAPIEngine.getJson(url);
        await FileStore.writeToFile(
            FileStore.COURSES + semesters[i], courseData);
      }
    } else {
      var url = NineAPIEngine.NINE_CIE_COURSES_BASE_URL +
          semesters[0].replaceAll(' ', '%20');
      var courseData = await NineAPIEngine.getJson(url);
      await FileStore.writeToFile(FileStore.COURSES + semesters[0], courseData);
    }

    var lecturersData =
        await NineAPIEngine.getJson(NineAPIEngine.NINE_LECTURERS_URL);
    await FileStore.writeToFile(FileStore.LECTURERS, lecturersData);

    if (!inBackground) {
      Navigator.pop(context);
    }
  }

  static Future<String> getLatestSemester() async {
    var semesters = await getResource(FileStore.SEMESTERS, NineAPIEngine.NINE_CIE_BASE_URL);
    try{
      return json.decode(semesters)[0]['name'];
    } catch (e){
      print('dataManager, error: ' + e.toString());
      return "";
    }
  }
}
