import 'package:cie_team1/presenter/timetablePresenter.dart';
import 'package:cie_team1/utils/cieStyle.dart';
import 'package:flutter/material.dart';

class TimeTableItem extends StatefulWidget {

  final TimeTablePresenter timeTablePresenter;
  final int id;

  TimeTableItem(this.timeTablePresenter, this.id);

  @override
  State<StatefulWidget> createState() {
    return new TimeTableItemState(timeTablePresenter, id);
  }
}

class TimeTableItemState extends State<TimeTableItem> {
  final int id;
  final TimeTablePresenter timeTablePresenter;

  TimeTableItemState(this.timeTablePresenter, this.id);


  @override
  Widget build(BuildContext context) {
    Icon availabilityIcon;
    double iconSize = CiEStyle.getCoursesListIconSize();
    // Ugly! Please replace
    //if (timeTablePresenter.getDate(id) == "Mo") {
    //  availabilityIcon = new Icon(
    //    const IconData(0xe3a6, fontFamily: 'MaterialIcons'),
    //    size: iconSize,
    //    color: Color.fromRGBO(242, 255, 48, 1.0),
    //  );
    //}
    //if (timeTablePresenter.getDate(id) == "Di") {
    //  availabilityIcon = new Icon(
    //    const IconData(0xe3a6, fontFamily: 'MaterialIcons'),
    //    size: iconSize,
    //    color: Color.fromRGBO(255, 55, 223, 1.0),
    //  );
    //}
    //if (timeTablePresenter.getDate(id) == "Mi") {
    //  availabilityIcon = new Icon(
    //    const IconData(0xe3a6, fontFamily: 'MaterialIcons'),
    //    size: iconSize,
    //    color: Color.fromRGBO(0, 255, 34, 1.0),
    //  );
    //}
    //if (timeTablePresenter.getDate(id) == "Do") {
    //  availabilityIcon = new Icon(
    //    const IconData(0xe3a6, fontFamily: 'MaterialIcons'),
    //    size: iconSize,
    //    color: Color.fromRGBO(255, 213, 0, 1.0),
    //  );
    //}
    //if (timeTablePresenter.getDate(id) == "Fr") {
    //  availabilityIcon = new Icon(
    //    const IconData(0xe3a6, fontFamily: 'MaterialIcons'),
    //    size: iconSize,
    //    color: Color.fromRGBO(12, 138, 247, 1.0),
    //  );
    //}
    //if (timeTablePresenter.getDate(id) == "Sa") {
    //  availabilityIcon = new Icon(
    //    const IconData(0xe3a6, fontFamily: 'MaterialIcons'),
    //    size: iconSize,
    //    color: Color.fromRGBO(195, 53, 255, 1.0),
    //  );
    //}
    //if (timeTablePresenter.getDate(id) == "So") {
    //  availabilityIcon = new Icon(
    //    const IconData(0xe3a6, fontFamily: 'MaterialIcons'),
    //    size: iconSize,
    //    color: Color.fromRGBO(242, 19, 19, 1.0),
    //  );
    //}

      return new ListTile(
        leading: availabilityIcon,
        title: new Text(timeTablePresenter.getTitle(id),
          style: CiEStyle.getCoursesTitleStyle(),),
        //subtitle: new Row(
        //  children: <Widget>[
        //    new Padding (
        //      padding: new EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
        //      child: new Text("FK " + timeTablePresenter.getFaculty(id),
        //        style: CiEStyle.getCoursesListFacultyStyle(),),
        //    ),
        //    new Text(timeTablePresenter.getStartTime(id),
        //      style: CiEStyle.getCoursesListTimeStyle(),),
        //    new Text("-" + timeTablePresenter.getEndTime(id),
        //      style: CiEStyle.getCoursesListTimeStyle(),),
        //  ],
        //),
      );
  }
}



