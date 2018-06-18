import 'package:cie_team1/generic/genericIcon.dart';
import 'package:cie_team1/model/course/course.dart';
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
        backgroundColor: CiEColor.lightGray,
      ),
      body: new Center(
        child: new Padding(
          padding: const EdgeInsets.fromLTRB(15.0, 25.0, 15.0, 10.0),
          child: new Column(
            children: <Widget>[
              //Title, Clickable heart
              buildTitleRow(),
              //Description title
              buildDescriptionHeadingRow(),
              //Description
              buildDescriptionRow(),
              //Footer, ects, hours, availability, contact
              buildFooterRow(),
            ],
          ),
        ),
      ),
    );
  }

  void _toggleFavorite(int id) {
    setState(() {
      presenter.toggleFavourite(id);
    });
  }

  void _toggleContact(int id) {
    setState(() {

    });
  }

  Widget buildDescriptionHeadingRow() {
    //Description heading row
    return new Row(
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
    );
  }

  Widget buildDescriptionRow() {
    if (presenter.getDescription(id) == "") {
      return new SingleChildScrollView(
        child: new Text(StaticVariables.NO_DESCRIPTION + "\n\n" + StaticVariables.PROFESSOR + ": " + presenter.getProfessorName(id),
          style: CiEStyle.getCourseDetailsDescription(),
        ),
      );
    }

    return new SingleChildScrollView(
      child: new Text(presenter.getDescription(id) + "\n\n" + StaticVariables.PROFESSOR + ": " + presenter.getProfessorName(id),
        style: CiEStyle.getCourseDetailsDescription(),
      ),
    );
    /*
    if (presenter.getDescription(id) == "") {
      return new Expanded(
          child: new SingleChildScrollView(
            child: Text(StaticVariables.NO_DESCRIPTION + "\n\n" + StaticVariables.PROFESSOR + ": " + presenter.getProfessorName(id),
              style: CiEStyle.getCourseDetailsDescription(),
            ),
          ),
      );
    }

    return new Expanded(
      child: new SingleChildScrollView(
        child: Text(presenter.getDescription(id) + "\n\n" + StaticVariables.PROFESSOR + ": " + presenter.getProfessorName(id),
          style: CiEStyle.getCourseDetailsDescription(),
        ),
      ),
    );
    */
  }

  Widget buildTitleRow() {
    //Obove Desription stuff
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
          //Heart icon and toggler
          new Container(
            child: new Padding(
              padding: new EdgeInsets.only(left: 15.0),
              child: new IconButton(
                iconSize: CiEStyle.getCoursesListIconSize() +
                    15.0,
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
      new Row (
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
                    new Text(
                      StaticVariables.HOURS_PER_WEEK + ":",
                      style: CiEStyle.getCourseDetailsFooterTextStyle(),
                    ),
                    new Text(
                        " " + presenter.getHoursPerWeek(id),
                        style: CiEStyle.getCourseDetailsFooterTextStyleBolt()
                    ),
                  ],
                ),
              ),
              new Container(
                height: FOOTER_TILE_HEIGHT,
                child: new Row(
                  children: <Widget>[
                    new Text(
                      StaticVariables.ECTS + ":",
                      style: new TextStyle(fontSize: 17.0),
                    ),
                    new Text(
                      " " + presenter.getEcts(id),
                      style: new TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold),
                    ),
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
                    onPressed: () => _toggleContact,
                    child: new Row(
                      children: <Widget>[
                        GenericIcon.buildGenericContactIcon(),
                        new Text(
                          StaticVariables.CONTACT,
                          style: CiEStyle.getCourseDetailsFooterTextStyle(),
                        ),
                      ],
                    )
                ),
              ),
            ],
          ),
        ],
      );
  }
}
