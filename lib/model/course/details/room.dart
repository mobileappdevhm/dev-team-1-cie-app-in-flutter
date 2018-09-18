import 'package:cie_app/model/course/details/campus.dart';

class Room {
  String number;
  String building;
  Campus campus;
  List<dynamic> actions;

  Room(Map<String, dynamic> jsonData) {
    this.number = jsonData['number'];
    this.building = jsonData['building'];
    this.campus = CampusUtility.getStringAsCampus(jsonData['campus']);
    this.actions = jsonData['actions'];
  }

  String getLocation() {
    return number + ", " + CampusUtility.getCampusAsLongString(campus);
  }

  static List<Room> fromJson(List<dynamic> jsonData) {
    if (jsonData == null) return null;
    var list = new List<Room>();
    for (int i = 0; i < jsonData.length; i++) {
      list.add(new Room(jsonData[i]));
    }
    return list;
  }
}
