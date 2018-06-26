import 'package:cie_team1/presenter/courseListPresenter.dart';
import 'package:cie_team1/presenter/currentUserPresenter.dart';
import 'package:cie_team1/utils/cieColor.dart';
import 'package:cie_team1/utils/cieStyle.dart';
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

  //TODO could this be done in a better way?
  void _maybeChangeCallback(bool didChange) {
    if (didChange == true) {
      setState(() => {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          _appTitle,
          style: CiEStyle.getAppBarTitleStyle(context),
          textAlign: TextAlign.center,
        ),
        elevation: CiEStyle.getAppBarElevation(context),
        backgroundColor: CiEColor.red,
      ),
      body: new PageView(
        controller: _tabController,
        onPageChanged: _onPageChanged,
        children: <Widget>[
          new CourseList(courseListPresenter, false, currentUserPresenter,
              new FocusNode()),
          // Behaves as Courses Page
          new MapPage(),
          new Schedule(courseListPresenter),
          // Behaves as Favorites Page
          new CourseList(
              courseListPresenter, true, currentUserPresenter, new FocusNode()),
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
    FocusScope.of(context).requestFocus(new FocusNode());
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
