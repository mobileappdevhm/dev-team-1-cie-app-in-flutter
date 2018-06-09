import 'package:cie_team1/generated/i18n.dart';
import 'package:cie_team1/presenter/courseListPresenter.dart';
import 'package:cie_team1/utils/cieColor.dart';
import 'package:cie_team1/utils/cieStyle.dart';
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
  var _appTitle = '';

  //var _tabItems = new List<TabItem>(); comment is used to solve the string problem from the bottom

  int _tab = 2; //change this to the default tab page value

  @override
  void initState() {
    super.initState();
    _tabController = new PageController(initialPage: _tab);
    courseListPresenter = new CourseListPresenter();
    this._appTitle = _tabItems[_tab].title;
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //comment is used to solve the string problem from the bottom
    //_tabItems.add(new TabItem(S.of(context).tabs_courses, Icons.import_contacts));
    //_tabItems.add(new TabItem(S.of(context).tabs_maps, Icons.map));
    //_tabItems.add(new TabItem(S.of(context).tabs_schedule, Icons.event_note));
    //_tabItems.add(new TabItem(S.of(context).tabs_favorites, Icons.favorite_border));
    //_tabItems.add(new TabItem(S.of(context).tabs_settings, Icons.settings));
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          _appTitle,
          style: CiEStyle.getAppBarTitleStyle(context),
        ),
        elevation: CiEStyle.getAppBarElevation(context),
        backgroundColor: CiEColor.lightGray,
      ),
      body: new PageView(
        controller: _tabController,
        onPageChanged: _onPageChanged,
        children: <Widget>[
          new CourseList(courseListPresenter, false),
          // Behaves as Courses Page
          new MapPage(),
          new Schedule(),
          // Behaves as Favorites Page
          new CourseList(courseListPresenter, true),
          new Settings(),
        ],
      ),
      bottomNavigationBar: new BottomNavigationBar(
        currentIndex: _tab,
        onTap: _onTap,
        type: BottomNavigationBarType.fixed,
        items: _tabItems.map((tabItem) {
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
    this._appTitle = _tabItems[tab].title;
  }
}

//comment is used to solve the string problem from below
//class TabItem {
//  String title;
//  IconData icon;
//
//  TabItem(this.title, this.icon);
//}

class TabItem {
  const TabItem({this.title, this.icon});

  final String title;
  final IconData icon;
}

//TODO this string couldn't replaced yet, because there throwing errors at build state - fix will foloow
const List<TabItem> _tabItems = const <TabItem>[
  const TabItem(title: 'Courses', icon: Icons.import_contacts),
  const TabItem(title: 'Map', icon: Icons.map),
  const TabItem(title: 'Timetable', icon: Icons.event_note),
  const TabItem(title: 'Favorites', icon: Icons.favorite_border),
  const TabItem(title: 'Settings', icon: Icons.settings),
];
