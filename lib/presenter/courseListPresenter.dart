import 'package:cie_team1/model/course.dart';

class CourseListPresenter {
  List<Course> courses = [];
  
  CourseListPresenter() {
    courses.add(new Course("Operating Systems", 07, "Mo 10:00-11:30", "Some description",
        1, 1, "test@test.de", "Test",
        1, false));
    courses.add(new Course("Operating Systems", 07, "Mo 10:00-11:30", "Some description",
        1, 1, "test@test.de", "Test",
        1, false));
    courses.add(new Course("Operating Systems", 07, "Mo 10:00-11:30", "Some description",
        1, 1, "test@test.de", "Test",
        1, false));
    courses.add(new Course("Operating Systems", 07, "Mo 10:00-11:30", "Some description",
        1, 1, "test@test.de", "Test",
        1, false));
    courses.add(new Course("Operating Systems", 07, "Mo 10:00-11:30", "Some description",
        1, 1, "test@test.de", "Test",
        1, false));
    courses.add(new Course("Operating Systems", 07, "Mo 10:00-11:30", "Some description",
        1, 1, "test@test.de", "Test",
        1, false));
    courses.add(new Course("Operating Systems", 07, "Mo 10:00-11:30", "Some description",
        1, 1, "test@test.de", "Test",
        1, false));
    courses.add(new Course("Operating Systems", 07, "Mo 10:00-11:30", "Some description",
        1, 1, "test@test.de", "Test",
        1, false));
    courses.add(new Course("Operating Systems", 07, "Mo 10:00-11:30", "Some description",
        1, 1, "test@test.de", "Test",
        1, false));
  }
  
  void toggleFavourite(int id) {
    if (courses[id].isFavourite) {
      courses[id].isFavourite = false;
    } else {
      courses[id].isFavourite = true;
    }
  }

  bool getFavourite(int id) {
    return courses[id].isFavourite;
  }
}