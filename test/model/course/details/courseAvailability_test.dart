import 'package:cie_app/model/course/details/courseAvailability.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('name', () {
    test('25', () {
      expect(CourseAvailabilityUtility.intToCourseAvailability(0),
          CourseAvailability.AVAILABLE);
    });

    test('26', () {
      expect(CourseAvailabilityUtility.intToCourseAvailability(1),
          CourseAvailability.PENDING);
    });

    test('27', () {
      expect(CourseAvailabilityUtility.intToCourseAvailability(2),
          CourseAvailability.UNAVAILABLE);
    });
  });

  group('intToColoredString', () {
    test('Available', () {
      expect(
          CourseAvailabilityUtility.intToColoredString(
                  CourseAvailability.AVAILABLE, 3.0)
              .toString(),
          "Text(\"Available\", inherit: true, color: Color(0xff6fcf97), size: 3.0)");
    });

    test('Pending', () {
      expect(
          CourseAvailabilityUtility.intToColoredString(
                  CourseAvailability.PENDING, 4.0)
              .toString(),
          "Text(\"Pending\", inherit: true, color: Color(0xfff2c94c), size: 4.0)");
    });

    test('Unavailable', () {
      expect(
          CourseAvailabilityUtility.intToColoredString(
                  CourseAvailability.UNAVAILABLE, 5.0)
              .toString(),
          "Text(\"Unavailable\", inherit: true, color: Color(0xffeb5757), size: 5.0)");
    });
  });
}
