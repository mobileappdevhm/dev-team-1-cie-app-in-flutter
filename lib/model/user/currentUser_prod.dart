import 'dart:convert';

import 'package:cie_app/model/course/course.dart';
import 'package:cie_app/model/user/currentUser.dart';
import 'package:cie_app/model/user/user.dart';
import 'package:cie_app/utils/dataManager.dart';

class CurrentUserProd implements CurrentUser {
  List<Course> prevCourses = [];
  List<Course> currentCourses = [];
  User currentUser;

  CurrentUserProd() {
    //TODO set previous courses
    //TODO set current courses
    currentUser = new UserBuilder()
        .withID("id-123")
        .withUsername("Guest")
        .withFirstName("Guest")
        .withLastName("User")
        .withDepartment("N/A")
        .withStatus("N/A")
        .withIsMetricsEnabled(true)
        .withCurrentCourses(currentCourses)
        .withPrevCourses(prevCourses)
        .build();

    DataManager.getResource(DataManager.LOCAL_USER_SETTINGS).then((String val) {
      if (val != null) {
        Map<String, dynamic> map = json.decode(val);
        User u = new UserBuilder.fromJson(map).build();
        currentUser.id = u.id;
        currentUser.isLoggedIn = u.isLoggedIn;
        currentUser.firstName = u.firstName;
        currentUser.lastName = u.lastName;
        currentUser.department = u.department;
      }
    });
  }

  @override
  User getCurrentUser() {
    return currentUser;
  }
}
