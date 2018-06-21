class RoomBuilder {
  static List<Room> fromJson(List<dynamic> jsonData) {
    if (jsonData == null) return null;
    var list = new List<Room>();
    for (int i = 0; i < jsonData.length; i++) {
      list.add(new Room(jsonData[i]));
    }
    return list;
  }
}

class Room {
  String number;
  String building;
  String campus;
  List<dynamic> actions;

  Room(Map<String, dynamic> jsonData) {
    this.number = jsonData['number'];
    this.building = jsonData['building'];
    this.campus = jsonData['campus'];
    this.actions = jsonData['actions'];
  }

  String getLocation() {
    return number + ", " + campus;
  }
}
