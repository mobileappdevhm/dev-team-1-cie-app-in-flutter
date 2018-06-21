import 'package:cie_team1/di/courses_di.dart';
import 'package:cie_team1/presenter/courseListPresenter.dart';
import 'package:cie_team1/presenter/currentUserPresenter.dart';
import 'package:cie_team1/utils/cieColor.dart';
import 'package:cie_team1/utils/cieStyle.dart';
import 'package:cie_team1/utils/icsExport.dart';
import 'package:cie_team1/utils/nineAPIConsumer.dart';
import 'package:cie_team1/utils/staticVariables.dart';
import 'package:cie_team1/views/maps.dart';
import 'package:cie_team1/views/schedule.dart';
import 'package:cie_team1/views/settings.dart';
import 'package:cie_team1/widgets/courseList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabsPage extends StatefulWidget {
  @override
  TabsPageState createState() => new TabsPageState();
}

class TabsPageState extends State<TabsPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  PageController _tabController;
  CourseListPresenter courseListPresenter;
  CurrentUserPresenter currentUserPresenter;
  var _appTitle = '';

  int _tab = 2; //change this to the default tab page value

  @override
  void initState() {
    super.initState();
    // TODO: Investigate scenarios where internet is not available/request fails
    NineAPIEngine.pullCourseJSON(context, true);
    _tabController = new PageController(initialPage: _tab);
    courseListPresenter = new CourseListPresenter(_maybeChangeCallback);
    currentUserPresenter =
        new CurrentUserPresenter(_maybeChangeCallback, Flavor.PROD);
    courseListPresenter.addCoursesFromMemory();
    currentUserPresenter.loadUserSettingsFromMemory();
    this._appTitle = TabItems[_tab].title;
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  void _maybeChangeCallback(bool didChange) {
    if (didChange == true) {
      setState(() => {});
    }
  }

  void _savePressed() {
    IcsExporter
        .exportAsIcs(new CourseInjector()
            .courses
            .getCourses()
            .where((c) => c.isFavourite)
            .toList())
        .then((String path) {
      print("path: " + path.toString());
      if (path.length > 0) {
        showInSnackBar("The Calendar-File was stored locally: " + path);
      } else {
        showInSnackBar("The Calendar-File could not be stored locally!");
      }
    });
  }

  void showInSnackBar(String value) {
    _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(value)));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        title: new Text(
          _appTitle,
          style: CiEStyle.getAppBarTitleStyle(context),
          textAlign: TextAlign.center,
        ),
        elevation: CiEStyle.getAppBarElevation(context),
        backgroundColor: CiEColor.red,
        actions: <Widget>[
          ((_appTitle == 'Schedule')
              ? new IconButton(
                  icon: new Icon(Icons.save_alt),
                  color: CiEColor.white,
                  highlightColor: CiEColor.white,
                  splashColor: CiEColor.white,
                  disabledColor: CiEColor.white,
                  iconSize: 30.0,
                  tooltip: 'action button',
                  onPressed: () => _savePressed())
              : new Text("")),
        ],
      ),
      body: new PageView(
        controller: _tabController,
        onPageChanged: _onPageChanged,
        children: <Widget>[
          new CourseList(courseListPresenter, false, currentUserPresenter),
          // Behaves as Courses Page
          new MapPage(),
          new Schedule(courseListPresenter),
          // Behaves as Favorites Page
          new CourseList(courseListPresenter, true, currentUserPresenter),
          new Settings(currentUserPresenter),
        ],
      ),
      bottomNavigationBar: new BottomNavigationBar(
        currentIndex: _tab,
        onTap: _onTap,
        type: BottomNavigationBarType.fixed,
        items: TabItems.map((tabItem) {
          return new BottomNavigationBarItem(
            title: new Text(
              tabItem.title,
            ),
            icon: new Icon(tabItem.icon),
          );
        }).toList(),
      ),
    );
  }

  void _onTap(int tab) {
    _tabController.jumpToPage(tab);
  }

  void _onPageChanged(int tab) {
    setState(() {
      this._tab = tab;
    });
    this._appTitle = TabItems[tab].title;
  }
}

class TabItem {
  const TabItem({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<TabItem> TabItems = const <TabItem>[
  const TabItem(title: 'Courses', icon: Icons.import_contacts),
  const TabItem(title: 'Map', icon: Icons.map),
  const TabItem(title: 'Schedule', icon: Icons.event_note),
  const TabItem(title: 'Favorites', icon: Icons.favorite_border),
  const TabItem(title: 'Profile', icon: Icons.person),
];
