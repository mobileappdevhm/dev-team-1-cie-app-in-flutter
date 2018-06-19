class RoomBuilder {
  static List<Room> fromJson(Map<String, dynamic> jsonRooms) {
    if (jsonRooms == null) return null;
    var list = new List<Room>();
    for (int i = 0; i < jsonRooms.length; i++) {
      list.add(new Room(jsonRooms[i]));
    }
    return list;
  }
}

class Room {
  String number;
  String building;
  String campus;

  Room(Map<String, dynamic> roomAsJson) {
    this.number = roomAsJson['number'];
    this.building = roomAsJson['building'];
    this.campus = roomAsJson['campus'];
  }

  String getLocation() {
    return number + ", " + campus;
  }
}
