import 'package:cie_app/di/courses_di.dart';
import 'package:cie_app/model/course/courses_mock.dart';
import 'package:cie_app/model/course/courses_prod.dart';
import 'package:cie_app/utils/staticVariables.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('1 course_di', () {
    CourseInjector.configure(Flavor.MOCK);
    var courses = new CourseInjector().courses;
    expect(courses is CoursesMock, true);
  });

  test('2 course_di', () {
    CourseInjector.configure(Flavor.PROD);
    var courses = new CourseInjector().courses;
    expect(courses is CoursesProd, true);
  });
}
