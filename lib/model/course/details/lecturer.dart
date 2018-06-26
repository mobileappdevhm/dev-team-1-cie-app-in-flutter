class LecturerBuilder {
  static List<Lecturer> fromJson(List<dynamic> jsonData) {
    if (jsonData == null) return null;
    var list = new List<Lecturer>();
    for (int i = 0; i < jsonData.length; i++) {
      list.add(new Lecturer(jsonData[i]));
    }
    return list;
  }
}

class Lecturer {
  String title;
  String firstName;
  String lastName;
  List<dynamic> actions;

  Lecturer(Map<String, dynamic> jsonData) {
    this.title = jsonData['title'];
    this.firstName = jsonData['firstName'];
    this.lastName = jsonData['lastName'];
    this.actions = jsonData['actions'];
  }
}
