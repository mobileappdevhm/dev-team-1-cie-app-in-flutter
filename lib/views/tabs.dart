import 'package:cie_app/presenter/courseListPresenter.dart';
import 'package:cie_app/presenter/currentUserPresenter.dart';
import 'package:cie_app/utils/cieColor.dart';
import 'package:cie_app/utils/cieStyle.dart';
import 'package:cie_app/utils/staticVariables.dart';
import 'package:cie_app/views/maps.dart';
import 'package:cie_app/views/schedule.dart';
import 'package:cie_app/views/settings.dart';
import 'package:cie_app/widgets/courseList.dart';
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

    //NineAPIEngine.pullCourseJSON(context, true);
    _tabController = new PageController(initialPage: _tab);
    courseListPresenter = new CourseListPresenter(_maybeChangeCallback);
    currentUserPresenter =
        new CurrentUserPresenter(_maybeChangeCallback, Flavor.PROD);
    courseListPresenter.addCoursesFromMemory();
    courseListPresenter.updateLecturerInfoFromMemory();
    currentUserPresenter.loadUserSettingsFromMemory();

    this._appTitle = TabItems[_tab].title;
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
          new Settings(currentUserPresenter, courseListPresenter),
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

  // This method is necessary to allow children to use the ValueChanged flutter
  // Signature to force new rendering of widgets
  void _maybeChangeCallback(bool didChange) {
    if (didChange == true) {
      // Triggers Widget rebuild on completion of potentially asynchronous tasks
      setState(() => {});
    }
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
  const TabItem(
      title: StaticVariables.TAB_COURSES, icon: Icons.import_contacts),
  const TabItem(title: StaticVariables.TAB_MAP, icon: Icons.map),
  const TabItem(title: StaticVariables.TAB_SCHEDULE, icon: Icons.event_note),
  const TabItem(
      title: StaticVariables.TAB_FAVORITES, icon: Icons.favorite_border),
  const TabItem(title: StaticVariables.TAB_PROFILE, icon: Icons.person),
];
