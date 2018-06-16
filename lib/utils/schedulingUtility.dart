import 'package:cie_team1/model/course/course.dart';
import 'package:cie_team1/utils/staticVariables.dart';

class SchedulingUtility {
  // This method relies on the list of courses being displayed in chronological
  // order in terms of lecture time
  static bool isCloseTime(DayTime one, DayTime two, timeRequired) {
    int time1 = one.hour * StaticVariables.HOURS_TO_MIN + one.minute;
    int time2 = two.hour * StaticVariables.HOURS_TO_MIN + two.minute;
    return (time2 - time1).abs() < timeRequired;
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

  static bool isSchedulingConflict(DayTime dayTimeOne, DayTime dayTimeTwo,
      Campus campusOne, Campus campusTwo) {
    return isCloseTime(dayTimeOne, dayTimeTwo, timeRequired(campusOne, campusTwo));
  }

  static String constructSchedulingConflictText(Lecture one, Lecture two) {
    String campusOne = CampusUtility.getCampusAsString(one.campus);
    String campusTwo = CampusUtility.getCampusAsString(two.campus);
    String time = SchedulingUtility.timeRequired(one.campus, two.campus).toString();
    return one.course.name + " is held in the " + campusOne + " campus, and " +
        two.course.name + " is held in the " + campusTwo  + " campus.\n\n"
        "Please consider that the commute between the " + campusOne + " and the "
        + campusTwo + " campus may take more than " + time
        + " minutes.\n\nYou may not arrive to class on time.";
  }
}
