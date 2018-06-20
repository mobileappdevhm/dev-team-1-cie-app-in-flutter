import 'package:cie_team1/model/course/course.dart';
import 'package:cie_team1/model/course/details/date.dart';
import 'package:cie_team1/utils/fileStore.dart';

class IcsExporter {
  static const String _HEADER =
      "BEGIN:VCALENDAR\r\nVERSION:2.0\r\nPRODID:-//Courses in Englisch by HM//Calendar 1.0//EN\r\nCALSCALE:GREGORIAN\r\nMETHOD:PUBLISH\r\n";
  static const String _END = "End:VCALENDAR\r\n";

  static void exportAsIcs(List<Course> favorites) {
    String result = getFavoritesAsIcsString(favorites);
    FileStore.writeToFile(FileStore.ICS_EXPORT, result, ".ics");
  }

  static String getFavoritesAsIcsString(List<Course> favorites) {
    String result = _HEADER;
    favorites.forEach((course) => result += _getCourseAsIcsString(course));
    result += _END;
    return result;
  }

  static String _getCourseAsIcsString(Course course) {
    String result = "";
    if (course != null && course.dates != null) {
      course.dates.forEach((date) =>
          result += _getDateInfoAsIcsString(course.name, course.id, date));

      return result;
    }
    return "";
  }

  static String _getDateInfoAsIcsString(
      String courseName, String courseId, Date date) {
    if (date.isCanceled) return "";

    var now = new DateTime.now().toUtc().toIso8601String();
    now = now.replaceAll(':', '').replaceAll('-', '').substring(0, 15) + 'Z';

    String result = "BEGIN:VEVENT\r\n";
    result += "LOCATION:" + date.rooms[0].getLocation() + "\r\n";
    if (date.title != null) result += "DESCRIPTION:" + date.title + "\r\n";
    result += "DTSTART:" + date.begin + "\r\n";
    result += "DTEND:" + date.end + "\r\n";
    result += "SUMMARY:" + courseName + "\r\n";
    result += "DTSTAMP:" + now + "\r\n";
    result += "UID:" + courseId + "\r\n";
    result += "TRANSP:TRANSPARENT\r\n";
    result += "STATUS:CONFIRMED\r\n";
    result += "SEQUENCE:0\r\n";
    result += "END:VEVENT\r\n";
    return result;
  }
}
