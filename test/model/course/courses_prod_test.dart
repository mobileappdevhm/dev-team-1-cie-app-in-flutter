import 'package:cie_team1/model/course/courses_prod.dart';
import 'package:test/test.dart';

@Timeout(const Duration(seconds: 10))
void main() {
  group("smokeTest", () {
    test('1', () {
      final CoursesProd sut = new CoursesProd();
      expect(sut.getCourses(), []);
    });
  });
}
