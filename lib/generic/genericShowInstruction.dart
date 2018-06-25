import 'package:cie_team1/utils/cieColor.dart';
import 'package:cie_team1/utils/cieStyle.dart';
import 'package:cie_team1/utils/staticVariables.dart';
import 'package:flutter/material.dart';

class GenericShowInstruction {
  static Widget getDownloadCourseListFirstWidget() {
    /*return _getInstructionWidget(
        "Unfortunately, you have not downloaded any course data "
        "yet. Please drag the screen down to load the current course "
        "data. If you want to update the course data later, drag the screen "
        "down again to update.");*/
    return new Column(
      children: <Widget>[
        new Container(
            color: CiEColor.white,
            padding: new EdgeInsets.symmetric(vertical: 10.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text("Pull down to Refresh",
                    style: CiEStyle.getCourseListRefreshText()),
                new Icon(Icons.arrow_downward, color: CiEColor.mediumGray)
              ],
            )),
        _getInstructionWidget(
            "Unfortunately, you have not downloaded any course data "
            "yet. Please drag the screen down to load the current course "
            "data. If you want to update the course data later, drag the screen "
            "down again to update."),
      ],
    );
  }

  static Widget getAddFavouritesFirstWidget() {
    return _getInstructionWidget(
        "Your timetable is empty so far. It can only be "
        "displayed once you have added courses to your favorites. Open the Courses tab "
        "and add courses to your favorites.");
  }

  static Widget _getInstructionWidget(String text) {
    return new Expanded(
      child: new Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            alignment: Alignment.bottomCenter,
            image: new AssetImage(
                StaticVariables.IMAGE_PATH + "AppLogo_45Transparent.png"),
            fit: BoxFit.fitWidth,
          ),
        ),
        padding: new EdgeInsets.symmetric(vertical: 10.0),
        child: new Row(
          children: <Widget>[
            new Expanded(
                child: new Container(
              padding: new EdgeInsets.all(20.0),
              alignment: Alignment.topCenter,
              child: new Text(text,
                  style: CiEStyle.getCourseDescriptionTitleStyle()),
            ))
          ],
        ),
      ),
    );
  }
}
