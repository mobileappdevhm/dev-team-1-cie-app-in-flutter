import 'package:cie_app/model/course/details/appointment.dart';
import 'package:cie_app/model/course/details/courseAvailability.dart';
import 'package:cie_app/model/course/details/date.dart';
import 'package:cie_app/model/course/details/department.dart';
import 'package:cie_app/model/course/details/lecturer.dart';
import 'package:cie_app/model/course/details/room.dart';
import 'package:cie_app/model/course/details/weekday.dart';

class Course {
  String id;
  String description;
  bool isCoterie;
  bool hasHomeBias;
  String category;
  Department department;
  String level;
  int ects;
  int sws;
  int usCredits;
  List<Room> locations;
  List<Lecturer> lecturer;
  List<Appointment> appointments;
  List<Date> dates;
  bool blocked;
  String name;
  String shortName;
  List<dynamic> actions;

  CourseAvailability _available;
  bool isFavourite;

  Course(Map<String, dynamic> jsonData) {
    id = jsonData['id'];
    description = jsonData['description'] != null
        ? jsonData['description']
            .replaceAll('<o:', '<')
            .replaceAll('</o:', '</') //remove office specific
            .replaceAllMapped(
                new RegExp(
                    r'<([^>\s]+)[^>]*>(?:\s*(?:&nbsp;|&thinsp;|&ensp;|&emsp;|&#8201;|&#8194;|&#8195;)\s*)*<\/\1>'),
                (match) {
            return ''; //remove empty html tags such as <p></p> or some with whitespace <p>&nbsp;</p>
          })
        : "";
    isCoterie = jsonData['isCoterie'];
    hasHomeBias = jsonData['hasHomeBias'];
    category = jsonData['category'];
    department = Department(jsonData['department']);
    level = jsonData['level'];
    ects = jsonData['ects'].round();
    sws = jsonData['sws'].round();
    usCredits = jsonData['usCredits'].round();
    locations = Room.fromJson(jsonData['locations']);
    lecturer = Lecturer.fromJson(jsonData['lecturer']);
    appointments = Appointment.fromJson(jsonData['appointments'], this);
    dates = Date.fromJson(jsonData['dates']);
    blocked = dates.length <= 10 && appointments.length > 1;
    name = jsonData['name'];
    shortName = jsonData['shortName'];
    actions = jsonData['actions'];

    _available = CourseAvailabilityUtility.fromCategoryName(category);
    isFavourite = false;
  }

  String getNamesOfLecturers() {
    var names = "";
    for (var l in lecturer) {
      if (names != "") {
        names += ", ";
      }
      names += l.firstName + " " + l.lastName;
    }
    return names;
  }

  String getAllLocations(){
    var locs = "";
    for(var location in locations){
      if(locs != ""){
        locs += ", ";
      }
      locs += location.toString();
    }
    return locs;
  }

  CourseAvailability getAvailability() {
    return _available;
  }

  bool occursOnDay(Weekday weekDay) {
    //Is there a lecture on searched day
    return appointments.any((lecture) => lecture.weekday == weekDay);
  }

  bool equals(Course course) {
    // we can expect that ids will be unique from the nine API
    return (this.id == course.id);
  }

  static List<Course> fromJson(List<dynamic> jsonData) {
    if (jsonData == null) return null;
    var list = new List<Course>();
    for (int i = 0; i < jsonData.length; i++) {
      list.add(new Course(jsonData[i]));
    }
    return list;
  }
}
