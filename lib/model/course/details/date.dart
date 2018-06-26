import 'package:cie_team1/model/course/details/lecturer.dart';
import 'package:cie_team1/model/course/details/room.dart';

class DateBuilder {
  static List<Date> fromJson(List<dynamic> jsonData) {
    if (jsonData == null) return null;
    var list = new List<Date>();
    for (int i = 0; i < jsonData.length; i++) {
      list.add(new Date(jsonData[i]));
    }
    return list;
  }
}

class Date {
  String begin;
  String end;
  String title;
  bool isCanceled;
  List<Room> rooms;
  List<Lecturer> lecturers;
  List<dynamic> actions;

  Date(Map<String, dynamic> jsonData) {
    this.begin = jsonData['begin'];
    this.end = jsonData['end'];
    this.title = jsonData['title'];
    this.isCanceled = jsonData['isCanceled'];
    this.rooms = RoomBuilder.fromJson(jsonData['rooms']);
    this.lecturers = LecturerBuilder.fromJson(jsonData['lecturer']);
    this.actions = jsonData['actions'];
  }
}
