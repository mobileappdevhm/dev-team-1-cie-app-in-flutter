import 'package:cie_app/model/course/details/lecturer.dart';
import 'package:cie_app/model/course/details/room.dart';

class Date {
  DateTime begin;
  DateTime end;
  String title;
  bool isCanceled;
  List<Room> rooms;
  List<Lecturer> lecturers;
  List<dynamic> actions;

  Date(Map<String, dynamic> jsonData) {
    this.begin = DateTime.parse(jsonData['begin']);
    this.end = DateTime.parse(jsonData['end']);
    this.title = jsonData['title'];
    this.isCanceled = jsonData['isCanceled'];
    this.rooms = Room.fromJson(jsonData['rooms']);
    this.lecturers = Lecturer.fromJson(jsonData['lecturer']);
    this.actions = jsonData['actions'];
  }

  static List<Date> fromJson(List<dynamic> jsonData) {
    if (jsonData == null) return null;
    var list = new List<Date>();
    for (int i = 0; i < jsonData.length; i++) {
      list.add(new Date(jsonData[i]));
    }
    return list;
  }
}
