import 'package:cie_app/model/course/details/campus.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('getStringAsCampus', () {
    test('Loth', () {
      expect(CampusUtility.getStringAsCampus("Loth"), Campus.LOTHSTRASSE);
    });

    test('Pasing', () {
      expect(CampusUtility.getStringAsCampus("Pasing"), Campus.PASING);
    });

    test('Karlstrasse', () {
      expect(
          CampusUtility.getStringAsCampus("Karlstrasse"), Campus.KARLSTRASSE);
    });
  });

  group('getCampusAsString', () {
    test('Loth.', () {
      expect(CampusUtility.getCampusAsString(Campus.LOTHSTRASSE), "Loth.");
    });

    test('Pasing', () {
      expect(CampusUtility.getCampusAsString(Campus.PASING), "Pasing");
    });

    test('Karl.', () {
      expect(CampusUtility.getCampusAsString(Campus.KARLSTRASSE), "Karl.");
    });
  });

  group('getCampusAsLongString', () {
    test('Lothstrasse', () {
      expect(CampusUtility.getCampusAsLongString(Campus.LOTHSTRASSE),
          "Lothstrasse");
    });

    test('Pasing', () {
      expect(CampusUtility.getCampusAsLongString(Campus.PASING), "Pasing");
    });

    test('Karlstrasse', () {
      expect(CampusUtility.getCampusAsLongString(Campus.KARLSTRASSE),
          "Karlstrasse");
    });
  });
}
