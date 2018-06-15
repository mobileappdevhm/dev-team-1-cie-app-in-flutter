import 'package:cie_team1/generic/genericIcon.dart';
import 'package:cie_team1/presenter/courseListPresenter.dart';
import 'package:cie_team1/utils/cieColor.dart';
import 'package:cie_team1/utils/cieStyle.dart';
import 'package:cie_team1/utils/staticVariables.dart';
import 'package:flutter/material.dart';

class CourseDetails extends StatefulWidget {
  CourseDetails(this.id, this.presenter, {Key key, this.title})
      : super(key: key);
  final String title;
  final int id;
  final CourseListPresenter presenter;

  @override
  _CourseDetailsState createState() => new _CourseDetailsState(id, presenter);
}

class _CourseDetailsState extends State<CourseDetails> {
  final CourseListPresenter presenter;
  final int id;

  _CourseDetailsState(this.id, this.presenter);

  @override
  Widget build(BuildContext context) {
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
                                presenter.getTitle(id),
                                style: CiEStyle
                                    .getCourseDescriptionTitleStyle(),
                              ),
                              new Text(
                                presenter.getFacultyBeautiful(id),
                                style: CiEStyle
                                    .getCourseDescriptionFacultyStyle(),
                              ),
                            ],
                          ),
                        )),
                    new Expanded(
                      child: new Align(
                        alignment: Alignment.centerRight,
                        child: new IconButton(
                          icon: GenericIcon.buildGenericFavoriteIcon(false),
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
                          StaticVariables.DESCRIPTION,
                          style: CiEStyle.getCourseDetailsHeadingStyle()
                      )),
                ],
              ),
              new Expanded(
                child: new Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: new Text(presenter.getDescription(id),
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
                              StaticVariables.HOURS_PER_WEEK + ":",
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
                              StaticVariables.ECTS + ":",
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
                                StaticVariables.CONTACT,
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
