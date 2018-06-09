import 'package:cie_team1/utils/cieColor.dart';
import 'package:cie_team1/utils/cieStyle.dart';
import 'package:flutter/material.dart';

class CourseDetails extends StatefulWidget {
  CourseDetails({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CourseDetailsState createState() => new _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  @override
  Widget build(BuildContext context) {
    double iconSize = CiEStyle.getCourseDescriptionIconSize();

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Course Details",
          style: CiEStyle.getAppBarTitleStyle(context),
        ),
        elevation: CiEStyle.getAppBarElevation(context),
        backgroundColor: CiEColor.lightGray,
      ),
      body: new Center(
        child: new Padding(
          padding: const EdgeInsets.all(25.0),
          child: new Column(
            children: <Widget>[
              new Container(
                child: new Row(
                  children: <Widget>[
                    new Expanded(
                        child: new Align(
                      alignment: Alignment.centerLeft,
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Text(
                            "Title of course",
                            style: CiEStyle.getCourseDescriptionTitleStyle(),
                          ),
                          new Text(
                            "FK 07",
                            style: CiEStyle.getCourseDescriptionFacultyStyle(),
                          ),
                        ],
                      ),
                    )),
                    new Expanded(
                      child: new Align(
                        alignment: Alignment.centerRight,
                        child: new IconButton(
                          icon: new Icon(
                            const IconData(0xe87e, fontFamily: 'MaterialIcons'),
                            size: iconSize,
                            color: CiEColor.red,
                          ),
                          onPressed: null,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Padding(
                      padding: const EdgeInsets.only(
                          left: 0.0, top: 25.0, right: 0.0, bottom: 25.0),
                      child: new Text(
                        "Description",
                        style: new TextStyle(
                            fontSize: 25.0,
                            color: CiEColor.gray,
                            letterSpacing: 2.0),
                      )),
                ],
              ),
              new Expanded(
                child: new Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: new Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                          "Curabitur congue nisl porttitor enim tempor, nec venenatis nibh congue. "
                          "Donec congue eleifend libero, sit amet eleifend augue mattis quis. "
                          "Fusce in luctus dolor. Curabitur sodales tellus sit amet faucibus aliquet. "
                          "Cras eget congue diam. Maecenas aliquam tortor a lorem aliquam, ac pellentesque odio aliquam. "
                          "Morbi vulputate dolor mi, sit amet consectetur odio hendrerit eu. Aenean efficitur at nibh in placerat. "
                          "Vestibulum sodales metus eleifend metus malesuada commodo. "
                          "Vivamus eleifend, tellus non eleifend tempus, massa lorem commodo tellus, in condimentum elit eros vel dolor. "
                          "Donec tincidunt bibendum bibendum. "
                          "Praesent lectus leo, fringilla in mattis ut, semper at mauris. ",
                      style: new TextStyle(fontSize: 15.0),
                    )),
              ),
              new Row(
                children: <Widget>[
                  new Expanded(
                    flex: 2,
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Row(
                          children: <Widget>[
                            new Text(
                              "Hours per Week:",
                              style: new TextStyle(fontSize: 17.0),
                            ),
                            new Text(
                              "2",
                              style: new TextStyle(
                                  fontSize: 17.0, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        new Row(
                          children: <Widget>[
                            new Text(
                              "ECTS:",
                              style: new TextStyle(fontSize: 17.0),
                            ),
                            new Text(
                              "2",
                              style: new TextStyle(
                                  fontSize: 17.0, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  new Expanded(
                    child: new Column(
                      children: <Widget>[
                        new Padding(
                          padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                          child: new Row(
                            children: <Widget>[
                              new Icon(
                                const IconData(0xe86c,
                                    fontFamily: 'MaterialIcons'),
                                size: 30.0,
                                color: CiEColor.green,
                              ),
                              new Text(
                                "Available",
                                style: new TextStyle(
                                  fontSize: 17.0,
                                  color: CiEColor.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                        new Padding(
                          padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                          child: new Row(
                            children: <Widget>[
                              new Icon(
                                const IconData(0xe0e1,
                                    fontFamily: 'MaterialIcons'),
                                size: 30.0,
                              ),
                              new Text(
                                "Contact",
                                style: new TextStyle(fontSize: 17.0),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
