import 'package:cie_team1/generic/genericIcon.dart';
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
        _getInstructionWidget(new SingleChildScrollView(
          child: new Column(
            children: <Widget>[
              new Text(
                "Instructions",
                style: CiEStyle.getInstructionPageHeadingStyle(),
              ),
              new Padding(padding: new EdgeInsets.only(bottom: 10.0)),
              new Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  GenericIcon.buildGenericGetArchiveIcon(),
                  new Expanded(
                      child: new Text(
                    "Unfortunately, you have not downloaded any course data "
                        "yet. Please drag the screen down to load the current course "
                        "data.",
                    style: CiEStyle.getInstructionPageTextStyle(),
                  ))
                ],
              ),
              new Padding(padding: new EdgeInsets.only(bottom: 20.0)),
              new Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Expanded(
                      child: new Text(
                    "Afterwards you will be able to to select favorite courses.\n"
                        "Tipp: Use the filter at top of courses page to filter courses. Then press the heart icon.",
                    style: CiEStyle.getInstructionPageTextStyle(),
                  )),
                  GenericIcon.buildGenericGetHeartIcon(),
                ],
              ),
              new Padding(padding: new EdgeInsets.only(bottom: 20.0)),
              new Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  GenericIcon.buildGenericGetTrafficIcon(),
                  new Expanded(
                      child: new Text(
                    "You will notice that each course on the left side is dimpled "
                        "red, orange or green. Red means you can't attend this course. "
                        "Orange and green courses can be attended.",
                    style: CiEStyle.getInstructionPageTextStyle(),
                  )),
                ],
              ),
              new Padding(padding: new EdgeInsets.only(bottom: 20.0)),
              new Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Expanded(
                      child: new Text(
                        "If you add courses to your favorites, which may lead to a time "
                            "conflict, you can see this directly in the course selection. Click "
                            "on the course for details.",
                        style: CiEStyle.getInstructionPageTextStyle(),
                      )),
                  GenericIcon.buildGenericGetClockIcon(),
                ],
              ),
              new Padding(padding: new EdgeInsets.only(bottom: 20.0)),
              new Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  GenericIcon.buildGenericGetHappyIcon(),
                  new Expanded(
                      child: new Text(
                        "Now when you have selected your favorites visit Favorite "
                            "tab and hand in your courses for lottery.",
                        style: CiEStyle.getInstructionPageTextStyle(),
                      )),
                ],
              ),
            ],
          ),
        ))
      ],
    );
  }

  static Widget getAddFavouritesFirstWidget() {
    return _getInstructionWidget(
      new Text(
        "Your timetable is empty so far. It can only be "
            "displayed once you have added courses to your favorites. Open the Courses tab "
            "and add courses to your favorites.",
        style: CiEStyle.getInstructionPageTextStyle(),
      ),
    );
  }

  static Widget _getInstructionWidget(Widget text) {
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
              child: text,
              //new Text(text,
              //    style: CiEStyle.getInstructionPageTextStyle()),
            ))
          ],
        ),
      ),
    );
  }
}
