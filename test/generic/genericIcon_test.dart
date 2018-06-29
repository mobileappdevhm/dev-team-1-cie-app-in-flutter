import 'package:cie_team1/generic/genericIcon.dart';
import 'package:cie_team1/model/course/course.dart';
import 'package:cie_team1/utils/cieColor.dart';
import 'package:cie_team1/utils/cieStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

@Timeout(const Duration(seconds: 10))
void main() {
  group("simpleRenderTest", () {
    test('rendersAvailableIcon', () {
      final Icon availableIcon = GenericIcon
          .buildGenericAvailabilityIcon(CourseAvailability.AVAILABLE);
      expect(availableIcon.color, CiEColor.green);
      expect(availableIcon.icon.codePoint, GenericIcon.memStorageAvailable);
      expect(availableIcon.icon.fontFamily, GenericIcon.fontFamily);
    });

    test('rendersPendingIcon', () {
      final Icon pendingIcon =
          GenericIcon.buildGenericAvailabilityIcon(CourseAvailability.PENDING);
      expect(pendingIcon.color, CiEColor.yellow);
      expect(pendingIcon.icon.codePoint, GenericIcon.memStoragePending);
      expect(pendingIcon.icon.fontFamily, GenericIcon.fontFamily);
    });

    test('rendersUnavailableIcon', () {
      final Icon unavailableIcon = GenericIcon
          .buildGenericAvailabilityIcon(CourseAvailability.UNAVAILABLE);
      expect(unavailableIcon.color, CiEColor.red);
      expect(unavailableIcon.icon.codePoint, GenericIcon.memStorageUnavailable);
      expect(unavailableIcon.icon.fontFamily, GenericIcon.fontFamily);
    });

    test('rendersActiveFavoriteIcon', () {
      final Icon activeFavoriteIcon =
          GenericIcon.buildGenericFavoriteIcon(true);
      expect(activeFavoriteIcon.color, CiEColor.red);
      expect(activeFavoriteIcon.icon.codePoint,
          GenericIcon.memStorageActiveFavorite);
      expect(activeFavoriteIcon.icon.fontFamily, GenericIcon.fontFamily);
    });

    test('rendersInactiveFavoriteIcon', () {
      final Icon inactiveFavoriteIcon =
          GenericIcon.buildGenericFavoriteIcon(false);
      expect(inactiveFavoriteIcon.color, CiEColor.red);
      expect(inactiveFavoriteIcon.icon.codePoint,
          GenericIcon.memStorageInactiveFavorite);
      expect(inactiveFavoriteIcon.icon.fontFamily, GenericIcon.fontFamily);
    });

    test('rendersActiveGenericSearchIcon', () {
      final Icon activeGenericSearchIcon =
          GenericIcon.buildGenericSearchIcon(true);
      expect(activeGenericSearchIcon.icon.codePoint,
          GenericIcon.memStorageInactiveSearch);
      expect(activeGenericSearchIcon.icon.fontFamily, GenericIcon.fontFamily);
    });

    test('rendersInactiveGenericSearchIcon', () {
      final Icon inactiveGenericSearchIcon =
          GenericIcon.buildGenericSearchIcon(false);
      expect(inactiveGenericSearchIcon.icon.codePoint,
          GenericIcon.memStorageactiveSearch);
      expect(inactiveGenericSearchIcon.icon.fontFamily, GenericIcon.fontFamily);
    });

    test('rendersGenericContactIcon', () {
      final Icon activeGenericSearchIcon =
          GenericIcon.buildGenericContactIcon();
      expect(activeGenericSearchIcon.icon.codePoint,
          GenericIcon.memStorageContact);
      expect(activeGenericSearchIcon.icon.fontFamily, GenericIcon.fontFamily);
    });

    testWidgets('rendersGenericConflictIcon', (WidgetTester tester) async {
      final String message = "Hallo";
      await tester.pumpWidget(new MaterialApp(home: new MyTestPage()));
      expect(find.text(message), findsOneWidget);
    });

    testWidgets('rendersGenericSpinner', (WidgetTester tester) async {
      await tester
          .pumpWidget(new MaterialApp(home: GenericIcon.buildGenericSpinner()));

      expect(find.text('Refreshing'), findsOneWidget);
    });
  });
}

class MyTestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(
            "Test",
            style: CiEStyle.getAppBarTitleStyle(context),
          ),
          elevation: CiEStyle.getAppBarElevation(context),
          backgroundColor: CiEColor.red,
        ),
        body: new Center(child: GenericIcon.buildGenericConflictIcon("Hallo")));
  }
}
