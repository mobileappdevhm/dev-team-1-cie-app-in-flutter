import 'package:cie_app/generic/genericAlert.dart';
import 'package:cie_app/generic/genericIcon.dart';
import 'package:cie_app/model/course/details/courseAvailability.dart';
import 'package:cie_app/presenter/courseListPresenter.dart';
import 'package:cie_app/utils/cieColor.dart';
import 'package:cie_app/utils/cieStyle.dart';
import 'package:cie_app/utils/staticVariables.dart';
import 'package:cie_app/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html_view/flutter_html_view.dart';

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
  static const double FOOTER_TILE_HEIGHT = 40.0;

  final CourseListPresenter presenter;
  final int id;

  _CourseDetailsState(this.id, this.presenter);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          StaticVariables.COURSE_DETAILS,
          style: CiEStyle.getAppBarTitleStyle(context),
        ),
        elevation: CiEStyle.getAppBarElevation(context),
        backgroundColor: CiEColor.red,
      ),
      body: new Center(
        child: new Padding(
          padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 10.0),
          child: new Column(
            children: <Widget>[
              buildTitleRow(),
              new Expanded(
                child: buildDescriptionRow(),
              ),
              buildFooterRow(),
            ],
          ),
        ),
      ),
      //bottomNavigationBar: buildFooterRow2(),
    );
  }

  void _toggleFavorite(int id) {
    setState(() {
      presenter.toggleFavourite(id, true);
    });
  }

  Widget buildDescriptionHeadingRow() {
    //Description heading row
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Padding(
            padding: const EdgeInsets.only(
                left: 0.0, top: 0.0, right: 0.0, bottom: 15.0)),
        _getSpacing(new EdgeInsets.fromLTRB(5.0, 20.0, 5.0, 30.0)),
        new Container(
          child: new Padding(
              padding: new EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 20.0),
              child: new Text(StaticVariables.DESCRIPTION,
                  style: CiEStyle.getCourseDetailsHeadingStyle())),
        ),
        _getSpacing(new EdgeInsets.fromLTRB(5.0, 20.0, 5.0, 30.0)),
      ],
    );
  }

  Widget buildDescriptionRow() {
    String textToShow;
    if (presenter.getDescription(id) == "" ||
        presenter.getDescription(id) == null) {
      textToShow = StaticVariables.NO_DESCRIPTION;
    } else {
      textToShow = presenter.getDescription(id);
    }

    TextStyle conflictTextStyle;
    if (presenter.getCourses()[id].isFavourite)
      conflictTextStyle = CiEStyle.getCourseDetailsConflictWarningText();
    else
      conflictTextStyle = CiEStyle.getCourseDetailsConflictNotificationText();

    TextStyle conflictReasonTextStyle;
    if (presenter.getCourses()[id].isFavourite)
      conflictReasonTextStyle =
          CiEStyle.getCourseDetailsConflictReasonWarningText();
    else
      conflictReasonTextStyle =
          CiEStyle.getCourseDetailsConflictReasonNotificationText();

    List<String> conflictText = presenter.getCourseDescriptionConflictText(id);

    return new SingleChildScrollView(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _blockedCourseInfo(presenter.getCourses()[id].blocked),
          presenter.checkIfConflictsOtherFavoriteCourse(id)
              ? new Padding(
                  padding: new EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        conflictText[0] != null
                            ? conflictText[0]
                            : "Ooops something went wront can't find conflicting course.",
                        style: conflictTextStyle,
                      ),
                      new Text(
                        conflictText[1] != null ? conflictText[1] : "",
                        style: conflictReasonTextStyle,
                      ),
                    ],
                  ))
              : new Container(),
          buildDescriptionHeadingRow(),
          new HtmlView(
            data: textToShow,
          ),
        ],
      ),
    );
  }

  Widget _blockedCourseInfo(bool blocked) {
    return blocked
        ? new Container(
            child: new Column(
              children: <Widget>[
                new Padding(
                    padding: new EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0)),
                new Row(
                  children: <Widget>[
                    Icon(Icons.info, color: CiEColor.yellow),
                    new Padding(
                      padding: new EdgeInsets.only(right: 5.0),
                    ),
                    new Container(
                      constraints: new BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width - 60),
                      child: new Text(
                          //TODO text to static variables
                          "This course is blocked, that means that it is maybe not fitting into the regular schedule.",
                          style: CiEStyle.getCourseBlockedTextStyle()),
                    ),
                  ],
                ),
              ],
            ),
          )
        : new Container();
  }

  Widget buildTitleRow() {
    String locations = presenter.getCourses()[id].getAllLocations();
    //Just for the cast that we don't have location
    if (locations.trim().isEmpty) locations = " N/A";

    //Above Description stuff
    return new Container(
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Expanded(
              child: new Align(
            alignment: Alignment.centerLeft,
            child: new Column(
              //Place at top
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  presenter.getTitle(id),
                  style: CiEStyle.getCourseDescriptionTitleStyle(),
                ),
                new Padding(padding: const EdgeInsets.only(top: 5.0)),
                new Text(
                  presenter.getDepartmentShortName(id),
                  style: CiEStyle.getCourseDescriptionFacultyStyle(),
                ),
                new Text(
                  presenter.getAppointmentTimesBeautiful(id),
                  style: CiEStyle.getCoursesListTimeStyle(),
                ),
                new Padding(padding: const EdgeInsets.only(top: 5.0)),
                new Text(
                    StaticVariables.PROFESSOR +
                        " " +
                        presenter.getNamesOfLecturers(id),
                    style: CiEStyle.getCoursesListTimeStyle()),
                new Text(StaticVariables.LOCATION + " " + locations,
                    style: CiEStyle.getCoursesListTimeStyle()),
              ],
            ),
          )),
          //Heart icon and toggler
          new Container(
            child: new Padding(
              padding: new EdgeInsets.only(left: 15.0),
              child: new IconButton(
                iconSize: CiEStyle.getCoursesListIconSize() + 15.0,
                icon: GenericIcon.buildGenericFavoriteIcon(
                    presenter.getFavourite(id)),
                onPressed: () => _toggleFavorite(id),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildFooterRow() {
    return //Bottom row with information about ects availability contact
        new Row(
      //Place right and left
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        //Left side of footer
        new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              height: FOOTER_TILE_HEIGHT,
              child: new Row(
                children: <Widget>[
                  new Text(StaticVariables.ECTS + ":",
                      style: CiEStyle.getCourseDetailsFooterTextStyle()),
                  new Text(
                    " " +
                        (presenter.getEcts(id) == "-1"
                            ? "N/A"
                            : presenter.getEcts(id).toString()),
                    style: CiEStyle.getCourseDetailsFooterTextStyleBolt(),
                  )
                ],
              ),
            ),
            new Container(
              height: FOOTER_TILE_HEIGHT,
              child: new Row(
                children: <Widget>[
                  new Text(
                    StaticVariables.HOURS_PER_WEEK + ":",
                    style: CiEStyle.getCourseDetailsFooterTextStyle(),
                  ),
                  new Text(
                      " " +
                          (presenter.getSWS(id) == "-1"
                              ? "N/A"
                              : presenter.getSWS(id).toString()),
                      style: CiEStyle.getCourseDetailsFooterTextStyleBolt()),
                ],
              ),
            ),
          ],
        ),
        //Right side of footer
        new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              height: FOOTER_TILE_HEIGHT,
              child: new Row(
                children: <Widget>[
                  GenericIcon.buildGenericAvailabilityIcon(
                      presenter.getAvailability(id)),
                  CourseAvailabilityUtility.intToColoredString(
                      presenter.getAvailability(id),
                      CiEStyle.getCourseDetailsFontSize()),
                ],
              ),
            ),
            new Container(
              height: FOOTER_TILE_HEIGHT,
              child: new FlatButton(
                  //There is padding by default we dont need this here
                  padding: new EdgeInsets.all(0.0),
                  onPressed: () => _launchContactProfURL(id),
                  child: new Row(
                    children: <Widget>[
                      GenericIcon.buildGenericContactIcon(),
                      new Text(
                        StaticVariables.CONTACT,
                        style: CiEStyle.getCourseDetailsFooterTextStyle(),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ],
    );
  }

  //Draws a line
  Widget _getSpacing(EdgeInsets padding) {
    return new Expanded(
        child: new Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        new Container(
          child: new Padding(
            padding: padding,
            child: new Container(
              decoration: new BoxDecoration(
                  border: new Border.all(color: CiEColor.gray, width: 0.5)),
            ),
          ),
        )
      ],
    ));
  }

  _launchContactProfURL(int id) async {
    var email = presenter.getEmailsOfLecturers(id);
    var profile = presenter.getProfileOfLecturer(id);
    print(email);
    if (email == StaticVariables.MOCK_EMAIL || !email.contains("@")) {
      GenericAlert.confirm(
          context,
          () => email = email,
          () => Utility.tryLaunch(profile),
          StaticVariables.NO_EMAIL_FOUND_DESCRIPTION,
          StaticVariables.ALERT_OK);
    } else {
      var url = "mailto:" + email;
      Utility.tryLaunch(url);
    }
  }
}
