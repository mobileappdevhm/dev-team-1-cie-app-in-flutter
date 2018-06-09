import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class FileStore {
  static const String COURSES = "_courses";
  static const String LOGIN = "_login";

  static Future<File> getFile(String resource) async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    String filename = "$dir/" + resource + ".txt";
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

  static Future<Map> readFileAsJson(String resource) async {
    try {
      File file = await getFile(resource);
      String contents = await file.readAsString();
      Map jsonMap = json.decode(contents);
      return jsonMap;
    } on FileSystemException {
      return null;
    }
  }
}
