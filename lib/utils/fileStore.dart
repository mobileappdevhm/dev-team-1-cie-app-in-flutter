import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class FileStore {
  static const String COURSES = "_courses";
  static const String LECTURERS = "_lecturers";
  static const String LOGIN = "_login";
  static const String USER_SETTINGS = "_user";
  static const String FAVORITES = "_favorites";
  static const String TAKEN_COURSES = "_takencourses";
  static const String SEMESTERS= "_semesters";

  static Future<File> getFile(String resource) async {
    resource = resource.replaceAll(' ', '');
    String dir = (await getApplicationDocumentsDirectory()).path;
    String filename = "$dir/" + resource + ".json";
    return new File(filename);
  }

  static Future<String> readFileAsString(String resource) async {
    resource = resource.replaceAll(' ', '');
    try {
      File file = await getFile(resource);
      String contents = await file.readAsString();
      return contents;
    } catch (e) {
      print(resource + " => null, error: " + e.toString());
      return null;
    }
  }

  static Future<File> writeToFile(String resource, String data) async {
    resource = resource.replaceAll(' ', '');
    try {
      String dir = (await getApplicationDocumentsDirectory()).path;
      String filename = "$dir/" + resource + ".json";
      File f = new File(filename);
      f.writeAsString(data);
      return f;
    } catch(e) {
      print(resource + " => null, error: " + e.toString());
      return null;
    }
  }
}
