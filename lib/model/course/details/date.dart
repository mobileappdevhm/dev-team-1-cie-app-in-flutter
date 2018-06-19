import 'package:cie_team1/model/course/details/lecturer.dart';
import 'package:cie_team1/model/course/details/room.dart';

class DateBuilder {
  static List<Date> fromJson(Map<String, dynamic> jsonDates) {
    if (jsonDates == null) return null;
    var list = new List<Date>();
    for (int i = 0; i < jsonDates.length; i++) {
      list.add(new Date(jsonDates[i]));
    }
    return list;
  }
}

class Date {
  String begin;
  String end;
  String title;
  bool isCanceld;
  List<Room> rooms;
  List<Lecturer> lecturers;

  Date(Map<String, dynamic> dateAsJson) {
    this.begin = dateAsJson['begin'];
    this.end = dateAsJson['end'];
    this.title = dateAsJson['title'];
    this.isCanceld = dateAsJson['isCanceled'];
    this.rooms = RoomBuilder.fromJson(dateAsJson['rooms']);
    this.lecturers = LecturerBuilder.fromJson(dateAsJson['lecturer']);
  }
}
