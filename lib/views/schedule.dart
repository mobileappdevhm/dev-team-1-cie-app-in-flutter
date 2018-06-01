import 'package:cie_team1/presenter/timeTableImplementations/todayTimetablePresenter.dart';
import 'package:cie_team1/presenter/timeTableImplementations/weeklyTimetablePresenter.dart';
import 'package:cie_team1/presenter/timeTablePresenter.dart';
import 'package:cie_team1/utils/cieColor.dart';
import 'package:cie_team1/utils/cieStyle.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'dart:math';

class Schedule extends StatelessWidget {


  //@override
  //void initState() {
  //  weeklyTimeTablePresenter = new WeeklyTimeTablePresenter();
  //  todayTimeTablePresenter = new TodayTimeTablePresenter();
  //}

  @override
  Widget build(BuildContext context) {
    TimeTablePresenter weeklyTimeTablePresenter = new WeeklyTimeTablePresenter();
    TimeTablePresenter todayTimeTablePresenter = new TodayTimeTablePresenter();

    SliverPersistentHeader todayHeader = new SliverPersistentHeader(
      delegate: new _SliverAppBarDelegate(
        "Today",
        collapsedHeight: 70.0,
        expandedHeight: 100.0,
      ),
      pinned: true,
    );

    SliverPersistentHeader weeklyHeader = new SliverPersistentHeader(
      delegate: new _SliverAppBarDelegate(
        "Weekly",
        collapsedHeight: 70.0,
        expandedHeight: 100.0,
      ),
      pinned: true,
    );

    return new Scaffold(
        body: new CustomScrollView(
          slivers: <Widget>[
            todayHeader,
            new SliverList(
                delegate: new SliverChildListDelegate(
                    todayTimeTablePresenter.getTimeTableItems()
                )
            ),
            weeklyHeader,
            new SliverList(
                delegate: new SliverChildListDelegate(
                    weeklyTimeTablePresenter.getTimeTableItems()
                )
            ),
          ],
        )
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this.text,{
    @required this.collapsedHeight,
    @required this.expandedHeight,});

  final double expandedHeight;
  final double collapsedHeight;
  final String text;

  @override double get minExtent => collapsedHeight;

  @override double get maxExtent => [expandedHeight, minExtent].reduce(max);

  @override
  Widget build(BuildContext context, double shrinkOffset,
      bool overlapsContent) {
    return new Container(
      color: Colors.white,
      child: new ScheduleDivider(text),
    );
  }

  @override
  bool shouldRebuild(@checked _SliverAppBarDelegate oldDelegate) {
    return expandedHeight != oldDelegate.expandedHeight
        || collapsedHeight != oldDelegate.collapsedHeight;
  }
}


class ScheduleDivider extends StatelessWidget {
  final String _heading;

  const ScheduleDivider(this._heading);

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Padding(padding: new EdgeInsets.fromLTRB(0.0, 35.0, 0.0, 0.0)),
        new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _getSpacing(new EdgeInsets.fromLTRB(5.0, 0.0, 15.0, 0.0)),
            new Container(
              child: new Padding(
                  padding: new EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                  child: new Text(_heading,
                      style: CiEStyle.getTimeTableSectionHeadingStyle())
              ),
            ),
            _getSpacing(new EdgeInsets.fromLTRB(5.0, 0.0, 15.0, 0.0)),
          ],
        )
      ],
    );
  }

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
                      border: new Border.all(color: CiEColor.gray)
                  ),
                ),
              ),
            )
          ],
        )
    );
  }
}


