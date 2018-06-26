import 'package:cie_team1/model/course/details/room.dart';
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

    var list = RoomBuilder.fromJson(rooms);

    expect(list[0].campus, campus);
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

    expect(sut.getLocation(), number + ", " + campus);
  });
}
