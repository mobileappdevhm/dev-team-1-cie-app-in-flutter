import 'package:cie_team1/generic/genericIcon.dart';
import 'package:cie_team1/model/course/course.dart';
import 'package:cie_team1/utils/cieColor.dart';
import 'package:flutter/material.dart';
import 'package:test/test.dart';

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
  });
}
