import 'package:cie_app/model/course/details/campus.dart';
import 'package:cie_app/model/course/details/room.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('1 room', () {
    String campus = "Lothstrasse";
    String building = "R";
    String number = "R 2.091";

    var room = new Map<String, dynamic>();
    room['number'] = number;
    room['building'] = building;
    room['campus'] = campus;
    var rooms = new List<Map<String, dynamic>>();
    rooms.add(room);

    var list = Room.fromJson(rooms);

    expect(list[0].campus, CampusUtility.getStringAsCampus(campus));
    expect(list[0].building, building);
    expect(list[0].number, number);
  });

  test('2 room get Location', () {
    String campus = "Lothstrasse";
    String building = "R";
    String number = "R 2.091";

    var room = new Map<String, dynamic>();
    room['number'] = number;
    room['building'] = building;
    room['campus'] = campus;

    final Room sut = new Room(room);

    expect(sut.getLocation(), campus + " (" + number + ")");
  });

  test('3 room toString', () {
    String campus = "Lothstrasse";
    String building = "R";
    String number = "R 2.091";

    var room = new Map<String, dynamic>();
    room['number'] = number;
    room['building'] = building;
    room['campus'] = campus;

    final Room sut = new Room(room);

    expect(sut.toString(), campus + " (" + number + ")");
  });
}
