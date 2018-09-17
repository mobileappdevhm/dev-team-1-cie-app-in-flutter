import 'package:cie_app/model/course/courses.dart';
import 'package:cie_app/model/course/courses_mock.dart';
import 'package:cie_app/model/course/courses_prod.dart';
import 'package:cie_app/utils/staticVariables.dart';

//DI
class CourseInjector {
  static final CourseInjector _singleton = new CourseInjector._internal();
  static Flavor _flavor;

  static void configure(Flavor flavor) {
    _flavor = flavor;
  }

  factory CourseInjector() {
    return _singleton;
  }

  CourseInjector._internal();

  Courses get courses {
    switch (_flavor) {
      case Flavor.MOCK:
        return new CoursesMock();
      default:
        return new CoursesProd();
    }
  }
}
