import 'package:cie_team1/model/course/course.dart';
import 'package:cie_team1/utils/staticVariables.dart';

class SchedulingUtility {
  // This method relies on the list of courses being displayed in chronological
  // order in terms of lecture time
  static bool isCloseTime(DayTime one, DayTime two) {
    int time1=one.hour*StaticVariables.HOURS_TO_MIN+one.minute;
    int time2=two.hour*StaticVariables.HOURS_TO_MIN+two.minute;
    return (time2-time1).abs() < StaticVariables.CAMPUS_COMMUTE_MIN;
  }

  static bool isFarCampus(Campus one, Campus two) {
    return one != two && (one == Campus.PASING || two == Campus.PASING);
  }

  static bool isSchedulingConflict(DayTime dayTimeOne, DayTime dayTimeTwo,
      Campus campusOne, Campus campusTwo) {
    return isCloseTime(dayTimeOne, dayTimeTwo) && isFarCampus(campusOne, campusTwo);
  }
}


