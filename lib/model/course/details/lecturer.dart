class Lecturer {
  String title;
  String firstName;
  String lastName;
  String email;
  String profile;

  Lecturer(Map<String, dynamic> jsonData) {
    this.title = jsonData['title'] != null ? jsonData['title'] : '';
    this.firstName = jsonData['firstName'] != null ? jsonData['firstName'] : '';
    this.lastName = jsonData['lastName'] != null ? jsonData['lastName'] : '';
    this.profile = profileFromJson(jsonData['actions'], lastName);
  }

  static List<Lecturer> fromJson(List<dynamic> jsonData) {
    if (jsonData == null) return null;
    var list = new List<Lecturer>();
    for (int i = 0; i < jsonData.length; i++) {
      list.add(new Lecturer(jsonData[i]));
    }
    return list;
  }

  static String profileFromJson(List<dynamic> actions, String lastName) {
    if (actions == null) return "";
    for (var action in actions) {
      if(action['title'] == "Profile"){
        return action['href'];
      }
    }
    return "https://hm.edu/suche/suchergebnisse.de.jsp?query=" + lastName.replaceAll(',', '');
  }
}