class Lecturer {
  String title;
  String firstName;
  String lastName;
  String email;
  List<dynamic> actions;

  Lecturer(Map<String, dynamic> jsonData) {
    this.title = jsonData['title'] != null ? jsonData['title'] : '';
    this.firstName = jsonData['firstName'] != null ? jsonData['firstName'] : '';
    this.lastName = jsonData['lastName'] != null ? jsonData['lastName'] : '';
    this.actions = LecturerProfile.fromJson(jsonData['actions']);
  }

  static List<Lecturer> fromJson(List<dynamic> jsonData) {
    if (jsonData == null) return null;
    var list = new List<Lecturer>();
    for (int i = 0; i < jsonData.length; i++) {
      list.add(new Lecturer(jsonData[i]));
    }
    return list;
  }
}

class LecturerProfile {
  String title;
  String href;

  LecturerProfile(Map<String, dynamic> jsonData) {
    this.title = jsonData['title'];
    this.href = jsonData['href'];
  }

  static List<LecturerProfile> fromJson(List<dynamic> jsonData) {
    if (jsonData == null) return null;
    var list = new List<LecturerProfile>();
    for (int i = 0; i < jsonData.length; i++) {
      list.add(new LecturerProfile(jsonData[i]));
    }
    return list;
  }
}
