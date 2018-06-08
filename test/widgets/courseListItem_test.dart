import 'package:cie_team1/generic/genericIcon.dart';
import 'package:cie_team1/presenter/courseListPresenter.dart';
import 'package:cie_team1/widgets/courseListItem.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';


void main() {

  testWidgets('1 courseListPresenterTest', (WidgetTester tester) async {
    final CourseListPresenter courseListPresenter = new CourseListPresenter();
    final int id = 1;

    final CourseListItem courseListItem = new CourseListItem(
        courseListPresenter, id, new IconButton( icon: GenericIcon.buildGenericFavoriteIcon(courseListPresenter.getFavourite(id))));


    expect(courseListItem.courseListPresenter, courseListPresenter);

  });

  testWidgets('1 idTest', (WidgetTester tester) async {
    final CourseListPresenter courseListPresenter = new CourseListPresenter();
    final int id = 1;

    final CourseListItem courseListItem = new CourseListItem(
        courseListPresenter, id, new IconButton( icon: GenericIcon.buildGenericFavoriteIcon(courseListPresenter.getFavourite(id))));


    expect(courseListItem.id, 1);

  });

}
