class DayTime {
  final int hour;
  final int minute;

  DayTime(this.hour, this.minute);

  static DayTime fromString(String timeAsString){
    var splitTime = timeAsString.split(':');
    var hours = int.parse(splitTime[0]);
    var minutes = int.parse(splitTime[1]);
    return new DayTime(hours, minutes);
  }

  @override
  String toString() {
    String hourString = hour.toString();
    if (hour <= 9) hourString = "0" + hourString;

    String minuteString = minute.toString();
    if (minute <= 9) minuteString = "0" + minuteString;

    return '$hourString:$minuteString';
  }

  int getAsInt() {
    return hour * 60 + minute;
  }
}