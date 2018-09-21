enum Weekday { Mon, Tue, Wed, Thu, Fri, Sat, Sun }

//This is not beautiful but there are no enums with assigned values since yet
class WeekdayUtility {
  static Weekday fromString(String day) {
    switch (day) {
      case "Monday":
        return Weekday.Mon;
      case "Tuesday":
        return Weekday.Tue;
      case "Wednesday":
        return Weekday.Wed;
      case "Thursday":
        return Weekday.Thu;
      case "Friday":
        return Weekday.Fri;
      case "Saturday":
        return Weekday.Sat;
      case "Sunday":
        return Weekday.Sun;
      default:
        return Weekday.Mon;
    }
  }

  static String getWeekdayAsString(Weekday day) {
    switch (day) {
      case Weekday.Mon:
        return "Mon";
      case Weekday.Tue:
        return "Tue";
      case Weekday.Wed:
        return "Wed";
      case Weekday.Thu:
        return "Thu";
      case Weekday.Fri:
        return "Fri";
      case Weekday.Sat:
        return "Sat";
      case Weekday.Sun:
        return "Sun";
    }
    // Not reachable.
    return "";
  }

  static String getWeekdayAsLongString(Weekday day) {
    switch (day) {
      case Weekday.Mon:
        return "Monday";
      case Weekday.Tue:
        return "Tuesday";
      case Weekday.Wed:
        return "Wednesday";
      case Weekday.Thu:
        return "Thursday";
      case Weekday.Fri:
        return "Friday";
      case Weekday.Sat:
        return "Saturday";
      case Weekday.Sun:
        return "Sunday";
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
