import 'package:cie_team1/model/course/course.dart';
import 'package:cie_team1/utils/staticVariables.dart';

class SchedulingUtility {
  // This method relies on the list of courses being displayed in chronological
  // order in terms of lecture time
  static bool isCloseTime(Lecture lectureOne, Lecture lectureTwo, timeRequired) {
    int startOne = convertToMinutes(lectureOne.startDayTime.hour,
        lectureOne.startDayTime.minute);
    int endOne = convertToMinutes(lectureOne.endDayTime.hour,
        lectureOne.endDayTime.minute);
    int startTwo = convertToMinutes(lectureTwo.startDayTime.hour,
        lectureTwo.startDayTime.minute);

    return ((startTwo - endOne).abs() < timeRequired ||
        (startOne >= startTwo && startTwo <= endOne));
  }

  static int convertToMinutes(int hours, int minutes) {
    return hours*StaticVariables.HOURS_TO_MIN + minutes;
  }

  static int timeRequired(Campus one, Campus two) {
    // Lothstrasse - Pasing
    if ((one == Campus.LOTHSTRASSE || two == Campus.LOTHSTRASSE) &&
        (one == Campus.PASING || two == Campus.PASING)) {
      return StaticVariables.LOTHSTRASSE_PASING_COMMUTE_MINS;
    }
    // Lothstrasse - Karlstrasse
    else if ((one == Campus.LOTHSTRASSE || two == Campus.LOTHSTRASSE) &&
        (one == Campus.KARLSTRASSE || two == Campus.KARLSTRASSE)) {
      return StaticVariables.LOTHSTRASSE_KARLSTRASSE_COMMUTE_MINS;
    }
    // Karlstrasse - Pasing
    else if ((one == Campus.KARLSTRASSE || two == Campus.KARLSTRASSE) &&
        (one == Campus.PASING || two == Campus.PASING)) {
      return StaticVariables.KARLSTRASSE_PASING_COMMUTE_MINS;
    }
    else {
      return StaticVariables.SAME_CAMPUS_COMMUTE_MINS;
    }
  }

  static bool isSchedulingConflict(Lecture lectureOne, Lecture lectureTwo) {
    return isCloseTime(lectureOne, lectureTwo, timeRequired(lectureOne.campus,
        lectureTwo.campus));
  }

  static String constructSchedulingConflictText(Lecture one, Lecture two) {
    int startOne = convertToMinutes(one.startDayTime.hour,
        one.startDayTime.minute);
    int endOne = convertToMinutes(one.endDayTime.hour,
        one.endDayTime.minute);
    int startTwo = convertToMinutes(two.startDayTime.hour,
        two.startDayTime.minute);
    if (startTwo >= startOne && startTwo <= endOne) {
      return "Please consider that the schedules between " + one.course.name +
          " and " + two.course.name + " overlap.";
    }
    String campusOne = CampusUtility.getCampusAsLongString(one.campus);
    String campusTwo = CampusUtility.getCampusAsLongString(two.campus);
    String time = SchedulingUtility.timeRequired(one.campus, two.campus).toString();
    return one.course.name + " is held in the " + campusOne + " campus, and " +
        two.course.name + " is held in the " + campusTwo  + " campus.\n\n"
        "Please consider that the commute between the " + campusOne + " and the "
        + campusTwo + " campus may take more than " + time
        + " minutes.\n\nYou may not arrive to class on time.";
  }
}
