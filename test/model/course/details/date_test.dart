import 'package:cie_app/model/course/details/date.dart';
import 'package:cie_app/model/course/details/lecturer.dart';
import 'package:cie_app/model/course/details/room.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('1 date', () {
    var map = new Map<String, dynamic>();
    map['begin'] = "20180427T150000Z";
    map['end'] = "20180427T200000Z";
    map['title'] = null;
    map['isCanceled'] = false;

    var room = new Map<String, dynamic>();
    room['number'] = "R 2.091";
    room['building'] = "R";
    room['campus'] = "Lothstrasse";
    var rooms = new List<Map<String, dynamic>>();
    rooms.add(room);
    map['rooms'] = rooms;

    var lecturer = Map<String, dynamic>();
    lecturer['title'] = null;
    lecturer['firstName'] = "Vorname";
    lecturer['lastName'] = "Nachname";
    var lecturers = new List<Map<String, dynamic>>();
    lecturers.add(lecturer);
    map['lecturer'] = lecturers;

    var list = List<Map<String, dynamic>>();
    list.add(map);
    var dates = Date.fromJson(list);

    expect(dates[0].begin, DateTime.parse("20180427T150000Z"));
    expect(dates[0].end, DateTime.parse("20180427T200000Z"));
    expect(dates[0].title, null);
    expect(dates[0].rooms is List<Room>, true);
    expect(dates[0].lecturers is List<Lecturer>, true);
  });
}
