import 'package:cie_team1/model/user/currentUser.dart';
import 'package:cie_team1/model/user/user.dart';

class CurrentUserProd implements CurrentUser {
  User testUser;

  CoursesProd() {
    //Todo: In the next Sprints
  }

  @override
  User getCurrentUser() {
    return testUser;
  }
}
