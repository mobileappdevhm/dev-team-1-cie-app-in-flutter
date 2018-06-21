import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class FileStore {
  static const String COURSES = "_courses";
  static const String LOGIN = "_login";
  static const String USER_SETTINGS = "_user";
  static const String FAVORITES = "_favorites";

  static Future<File> getFile(String resource) async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    String filename = "$dir/" + resource + ".json";
    return new File(filename);
  }

  static Future<String> readFileAsString(String resource) async {
    try {
      File file = await getFile(resource);
      String contents = await file.readAsString();
      return contents;
    } on FileSystemException {
      return null;
    }
  }

  static Future<File> writeToFile(String resource, String data) async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    String filename = "$dir/" + resource + ".json";
    File f = new File(filename);
    f.writeAsString(data);
    return f;
  }
}
