class LecturerBuilder {
  static List<Lecturer> fromJson(List<dynamic> jsonLecturers){
    if(jsonLecturers == null)
      return null;
    var list = new List<Lecturer>();
    for(int i = 0; i < jsonLecturers.length; i++) {
      list.add(new Lecturer(jsonLecturers[i]));
    }
    return list;
  }
}

class Lecturer {
  String title;
  String firstName;
  String lastName;

  Lecturer(Map<String, dynamic> lecturerAsString){
    this.title = lecturerAsString['title'];
    this.firstName = lecturerAsString['firstName'];
    this.lastName = lecturerAsString['lastName'];
  }
}