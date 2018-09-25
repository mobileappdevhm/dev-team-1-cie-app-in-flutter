enum Weekday { Mon, Tue, Wed, Thu, Fri, Sat, Sun }

//This is not beautiful but there are no enums with assigned values since yet
class WeekdayUtility {
  static const String MONDAY = "Monday";
  static const String TUESDAY = "Tuesday";
  static const String WEDNESDAY = "Wednesday";
  static const String THURSDAY = "Thursday";
  static const String FRIDAY = "Friday";
  static const String SATURDAY = "Saturday";
  static const String SUNDAY = "Sunday";
  static const String MONDAY_SHORT = "Mon";
  static const String TUESDAY_SHORT = "Tue";
  static const String WEDNESDAY_SHORT = "Wed";
  static const String THURSDAY_SHORT = "Thu";
  static const String FRIDAY_SHORT = "Fri";
  static const String SATURDAY_SHORT = "Sat";
  static const String SUNDAY_SHORT = "Sun";

  static Weekday fromString(String day) {
    switch (day) {
      case MONDAY:
        return Weekday.Mon;
      case TUESDAY:
        return Weekday.Tue;
      case WEDNESDAY:
        return Weekday.Wed;
      case THURSDAY:
        return Weekday.Thu;
      case FRIDAY:
        return Weekday.Fri;
      case SATURDAY:
        return Weekday.Sat;
      case SUNDAY:
        return Weekday.Sun;
      default:
        return Weekday.Mon;
    }
  }

  static String getWeekdayAsString(Weekday day) {
    switch (day) {
      case Weekday.Mon:
        return MONDAY_SHORT;
      case Weekday.Tue:
        return TUESDAY_SHORT;
      case Weekday.Wed:
        return WEDNESDAY_SHORT;
      case Weekday.Thu:
        return THURSDAY_SHORT;
      case Weekday.Fri:
        return FRIDAY_SHORT;
      case Weekday.Sat:
        return SATURDAY_SHORT;
      case Weekday.Sun:
        return SUNDAY_SHORT;
    }
    // Not reachable.
    return "";
  }

  static String getWeekdayAsLongString(Weekday day) {
    switch (day) {
      case Weekday.Mon:
        return MONDAY;
      case Weekday.Tue:
        return TUESDAY;
      case Weekday.Wed:
        return WEDNESDAY;
      case Weekday.Thu:
        return THURSDAY;
      case Weekday.Fri:
        return FRIDAY;
      case Weekday.Sat:
        return SATURDAY;
      case Weekday.Sun:
        return SUNDAY;
    }
    // Not reachable.
    return "";
  }

  static int getWeekdayAsInt(Weekday day) {
    switch (day) {
      case Weekday.Mon:
        return 0;
      case Weekday.Tue:
        return 1;
      case Weekday.Wed:
        return 2;
      case Weekday.Thu:
        return 3;
      case Weekday.Fri:
        return 4;
      case Weekday.Sat:
        return 5;
      case Weekday.Sun:
        return 6;
    }
    // Not reachable.
    return 0;
  }

  static Weekday intToWeekday(int day) {
    switch (day) {
      case 0:
        return Weekday.Mon;
      case 1:
        return Weekday.Tue;
      case 2:
        return Weekday.Wed;
      case 3:
        return Weekday.Thu;
      case 4:
        return Weekday.Fri;
      case 5:
        return Weekday.Sat;
      case 6:
        return Weekday.Sun;
    }
    // Not reachable.
    return Weekday.Sun;
  }

  static Weekday getCurrentWeekday() {
    var now = new DateTime.now();
    return intToWeekday(now.weekday - 1);
  }
}
