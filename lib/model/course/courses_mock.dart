import 'package:cie_app/model/course/course.dart';
import 'package:cie_app/model/course/courses.dart';
import 'package:cie_app/model/course/details/appointment.dart';
import 'package:cie_app/model/course/details/courseAvailability.dart';
import 'package:cie_app/model/course/details/date.dart';
import 'package:cie_app/model/course/details/dayTime.dart';
import 'package:cie_app/model/course/details/department.dart';
import 'package:cie_app/model/course/details/lecturer.dart';
import 'package:cie_app/model/course/details/room.dart';
import 'package:cie_app/model/course/details/weekday.dart';

class CoursesMock implements Courses {
  static const int GENERATE_COURSES = 100;

  List<Course> courses = [];

  CoursesMock() {
    var list = List<Map<String, dynamic>>();
    for (int i = 1; i < GENERATE_COURSES; i++) {
      var map = new Map<String, dynamic>();
      map['id'] = "AllCoursesWillHaveTheSameID" + i.toString();
      map['description'] = generateMockDescription(i);
      map['isCoterie'] = generateMockCoterie(i);
      map['hasHomeBias'] = generateMockHomeBias(i);
      map['category'] = 'Red';
      map['department'] = generateMockDepartmentJson(i);
      map['level'] = generateMockLevel(i);
      map['ects'] = generateMockECTS(i);
      map['sws'] = generateMockSWS(i);
      map['usCredits'] = generateMockUSCredits(i);
      map['locations'] = generateMockRooms(i);
      map['lecturer'] = generateMockLecturers();
      map['appointments'] = generateMockAppointments(i);
      map['dates'] = generateMockDates(i);
      map['name'] = generateMockCourseTitle(i);
      map['shortName'] = generateMockCourseTitle(i) + " (short)";
      map['actions'] = new List<Map<String, dynamic>>();
      list.add(map);
    }
    courses = Course.fromJson(list);
  }

  static String generateMockLevel(int i) {
    if (i % 5 == 0) return 'Master';
    return 'Bachelor';
  }

  static String generateMockCourseTitle(int i) {
    return "Title of Course " + i.toString();
  }

  static Department generateMockDepartment(int i) {
    return Department(generateMockDepartmentJson(i));
  }

  static Map<String, dynamic> generateMockDepartmentJson(int i) {
    var number =
        Department.departments[i.round() % Department.departments.length];
    var map = Map<String, dynamic>();
    map['color'] = "#009B71";
    map['name'] = "Fakultät " + number;
    map['shortName'] = "FK " + number;
    map['actions'] = new List<Map<String, dynamic>>();
    return map;
  }

  static String generateMockDescription(int i) {
    return "Course Description " + i.toString();
  }

  static int generateMockECTS(int i) {
    return i % 4;
  }

  static int generateMockSWS(int i) {
    return i % 4;
  }

  static int generateMockUSCredits(int i) {
    return i % 4;
  }

  static String generateMockEmail(int i) {
    return "testEmail" + i.toString() + "@test.de";
  }

  static String generateMockName(int i) {
    return "Professor name" + i.toString();
  }

  static CourseAvailability generateMockAvailability(int i) {
    return CourseAvailabilityUtility.intToCourseAvailability(i % 3);
  }

  static int generateMockAvailabilityLevel(int i) {
    return i % 2;
  }

  static bool generateMockFavorite(int i) {
    return false;
  }

  static List<Date> generateMockDateList(int i) {
    var list = generateMockDates(i);
    return Date.fromJson(list);
  }

  static List<Map<String, dynamic>> generateMockDates(int i) {
    var map = new Map<String, dynamic>();
    map['begin'] = "20180427T150000Z";
    map['end'] = "20180427T200000Z";
    map['title'] = null;
    map['isCanceled'] = false;

    map['rooms'] = generateMockRooms(i);

    map['lecturer'] = generateMockLecturers();

    var list = List<Map<String, dynamic>>();
    list.add(map);
    return list;
  }

  static List<Room> generateMockRoomList(int i) {
    var rooms = generateMockRooms(i);
    return Room.fromJson(rooms);
  }

  static List<Map<String, dynamic>> generateMockRooms(int i) {
    List<String> numbers = [
      "R0.001",
      "T0.001",
      "K0.011",
      "R3.024",
    ];

    List<String> campuses = [
      "Lothstrasse",
      "Karlsplatz",
      "Pasing",
    ];

    var room = new Map<String, dynamic>();
    room['number'] = numbers[i % numbers.length];
    room['building'] = room['number'].toString().substring(0, 1);
    room['campus'] = campuses[i % campuses.length];
    var rooms = new List<Map<String, dynamic>>();
    rooms.add(room);
    return rooms;
  }

  static List<Lecturer> generateMockLecturerList() {
    var lecturers = generateMockLecturers();
    return Lecturer.fromJson(lecturers);
  }

  static List<Map<String, dynamic>> generateMockLecturers() {
    var lecturer = Map<String, dynamic>();
    lecturer['title'] = null;
    lecturer['firstName'] = "Vorname";
    lecturer['lastName'] = "Nachname";
    var profile = Map<String, dynamic>();
    profile['title'] = "Profile";
    profile['href'] = "https://hm.edu";
    var actions = new List<Map<String, dynamic>>();
    actions.add(profile);
    lecturer['actions'] = actions;

    var list = new List<Map<String, dynamic>>();
    list.add(lecturer);
    return list;
  }

  static List<Appointment> generateMockAppointmentList(int i, Course parent) {
    var list = generateMockAppointments(i);
    return Appointment.fromJson(list, parent);
  }

  static List<Map<String, dynamic>> generateMockAppointments(int i) {
    var appointment = Map<String, dynamic>();
    appointment['dayOfWeekName'] = WeekdayUtility.getWeekdayAsLongString(
        Weekday.values[i % Weekday.values.length]);

    List<List<DayTime>> times = [
      [new DayTime(8, 15), new DayTime(9, 45)],
      [new DayTime(10, 00), new DayTime(11, 30)],
      [new DayTime(11, 45), new DayTime(13, 15)],
      [new DayTime(13, 30), new DayTime(15, 00)],
      [new DayTime(15, 15), new DayTime(16, 45)],
      [new DayTime(17, 00), new DayTime(18, 30)],
    ];

    appointment['timeBegin'] = times[i % times.length][0].toString() + ":00";
    appointment['timeEnd'] = times[i % times.length][1].toString() + ":00";

    var list = new List<Map<String, dynamic>>();
    list.add(appointment);
    return list;
  }

  static bool generateMockHomeBias(int i) {
    if (i % 2 == 0) {
      return true;
    }
    return false;
  }

  static bool generateMockCoterie(int i) {
    if (i % 5 == 0) {
      return true;
    }
    return false;
  }

  @override
  List<Course> getCourses() {
    return courses;
  }
}
