import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class FileStore {
  static const String COURSES = "_courses";
  static const String LOGIN = "_login";
  static const String USER_SETTINGS = "_user";
  static const String ICS_EXPORT = "_calendar";

  static Future<File> getFile(String resource, [String extension = ".json"]) async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    String filename = "$dir/" + resource + extension;
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

  static Future<File> writeToFile(String resource, String data, [String extension = ".json"]) async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    String filename = "$dir/" + resource + extension;
    File f = new File(filename);
    await f.writeAsString(data);
    return f;
  }
}
