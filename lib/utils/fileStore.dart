import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:simple_permissions/simple_permissions.dart';

class FileStore {
  static const String COURSES = "_courses";
  static const String LOGIN = "_login";
  static const String USER_SETTINGS = "_user";
  static const String ICS_EXPORT = "_calendar";
  static const String FAVORITES = "_favorites";

  static Future<File> getFile(String resource,
      [String extension = ".json", bool externalStorage = false]) async {
    String dir;
    if (externalStorage) {
      //requestPermission(Permission.ReadExternalStorage);
      dir = (await getExternalStorageDirectory()).path + "/download";
    } else {
      dir = (await getApplicationDocumentsDirectory()).path;
    }
    String filename = "$dir/" + resource + extension;
    return new File(filename);
  }

  static Future<String> readFileAsString(String resource,
      [String extension = ".json", bool externalStorage = false]) async {
    try {
      File file = await getFile(resource, extension, externalStorage);
      String contents = await file.readAsString();
      return contents;
    } on FileSystemException {
      return null;
    }
  }

  static Future<File> writeToFile(String resource, String data,
      [String extension = ".json", bool externalStorage = false]) async {
    String dir;
    if (externalStorage) {
      requestPermission(Permission.WriteExternalStorage);
      dir = (await getExternalStorageDirectory()).path + "/download";
    } else {
      dir = (await getApplicationDocumentsDirectory()).path;
    }
    String filename = "$dir/" + resource + extension;
    File f = new File(filename);
    await f.writeAsString(data);
    return f;
  }

  static void requestPermission(Permission permission) async {
    bool res = await SimplePermissions.requestPermission(permission);
    print("permission '" +
        permission.toString() +
        "' request result is " +
        res.toString());
  }
}
