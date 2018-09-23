import 'package:cie_app/model/course/course.dart';
import 'package:cie_app/model/course/details/campus.dart';
import 'package:cie_app/model/course/details/dayTime.dart';
import 'package:cie_app/model/course/details/weekday.dart';

class Appointment {
  Weekday weekday;
  DayTime timeBegin;
  DayTime timeEnd;
  Course parent;

  Appointment(Map<String, dynamic> jsonData, Course parent) {
    this.weekday = WeekdayUtility.fromString(jsonData['dayOfWeekName']);
    this.timeBegin = DayTime.fromString(jsonData['timeBegin']);
    this.timeEnd = DayTime.fromString(jsonData['timeEnd']);
    this.parent = parent;
  }

  static List<Appointment> fromJson(List<dynamic> jsonData, Course parent) {
    if (jsonData == null) return null;
    var list = new List<Appointment>();
    for (int i = 0; i < jsonData.length; i++) {
      list.add(new Appointment(jsonData[i], parent));
    }
    return list;
  }

  int sortValue() {
    // result looks like: whhmm
    return WeekdayUtility.getWeekdayAsInt(weekday) * 10000 +
        timeBegin.hour * 100 +
        timeEnd.minute;
  }

  Campus getCampus() {
    return this.parent.locations[0].campus;
  }
}
