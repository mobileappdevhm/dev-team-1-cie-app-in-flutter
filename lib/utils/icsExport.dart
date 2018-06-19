import 'package:cie_team1/model/course/course.dart';
import 'package:cie_team1/model/course/details/date.dart';

class IcsExporter {
  static const String HEADER =
      "BEGIN:VCALENDAR\r\nVERSION:2.0\r\nPRODID:-//Courses in Englisch by HM//Calendar 1.0//EN\r\nCALSCALE:GREGORIAN\r\nMETHOD:PUBLISH\r\n";
  static const String END = "End:VCALENDAR\r\n";

  static String getFavoritesAsIcsString(List<Course> favorites) {
    String result = HEADER;
    favorites.forEach((course) => result += getCourseAsIcsString(course));
    result += END;
    return result;
  }

  static String getCourseAsIcsString(Course course) {
    String result = "";
    course.dates.forEach((date) =>
        result += getDateInfoAsIcsString(course.name, course.id, date));

    return result;
  }

  static String getDateInfoAsIcsString(
      String courseName, String courseId, Date date) {
    String result = "BEGIN:VEVENT\r\n";
    result += "LOCATION:" + date.rooms[0].getLocation() + "\r\n";
    result += "DESCRIPTION:" + date.title + "\r\n";
    result += "DTSTART:" + date.begin + "\r\n";
    result += "DTEND:" + date.end + "\r\n";
    result += "SUMMARY:" + courseName + "\r\n";
    result += "DTSTAMP:" + new DateTime.now().toIso8601String() + "\r\n";
    result += "UID:" + courseId + "\r\n";
    result += "TRANSP:TRANSPARENT\r\n";
    result += "STATUS:CONFIRMED\r\n";
    result += "SEQUENCE:0\r\n";
    result += "END:VEVENT\r\n";
    return result;
  }
}
