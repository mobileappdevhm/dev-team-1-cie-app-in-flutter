import 'package:cie_team1/di/currentUser_di.dart';
import 'package:cie_team1/model/course/course.dart';
import 'package:cie_team1/model/user/currentUser.dart';
import 'package:cie_team1/model/user/user.dart';
import 'package:cie_team1/utils/fileStore.dart';
import 'package:flutter/material.dart';
import 'package:cie_team1/utils/staticVariables.dart';
import 'dart:convert';

class CurrentUserPresenter {
  CurrentUser _currentUser;
  final ValueChanged<bool> onChanged;
  final Flavor flavor;

  CurrentUserPresenter(this.onChanged, this.flavor) {
    UserInjector.configure(flavor);
    _currentUser = new UserInjector().currentUser;
  }

  User getCurrentUser() {
    return _currentUser.getCurrentUser();
  }

  String getCurrentUserFaculty() {
    return _currentUser.getCurrentUser().department;
  }

  String getCurrentUserStatus() {
    return _currentUser.getCurrentUser().status;
  }

  String getFullName() {
    return _currentUser.getCurrentUser().firstName +
        " " +
        _currentUser.getCurrentUser().lastName;
  }

  String getCurrentUserName() {
    return _currentUser.getCurrentUser().firstName +
        " " +
        _currentUser.getCurrentUser().lastName;
  }

  List<Course> getPrevCourses() {
    return _currentUser.getCurrentUser().prevCourses;
  }

  List<Course> getCurrentCourses() {
    return _currentUser.getCurrentUser().currentCourses;
  }

  int getTotalCredits() {
    var sum = 0;

    _currentUser.getCurrentUser().prevCourses.forEach((course) {
      sum = sum + course.ects;
    });
    return sum;
  }

  int getDep3Credits() {
    var sum = 0;
    _currentUser.getCurrentUser().prevCourses.forEach((course) {
      if (course.faculty == "3") {
        sum = sum + course.ects;
      }
    });
    return sum;
  }

/* Duplicated methods */
/* I'll try to find a proper way for these presenters to work together but this is what work for now */

  String getTitle(int id) {
    return _currentUser.getCurrentUser().prevCourses[id].name;
  }

  int getCredits(int id) {
    return _currentUser.getCurrentUser().prevCourses[id].ects;
  }

  String getFaculty(int id) {
    return _currentUser.getCurrentUser().prevCourses[id].faculty.toString();
  }

  void toggleIsMetricsEnabled() {
    bool isMetricsEnabled = _currentUser.getCurrentUser().isMetricsEnabled;
    _currentUser.getCurrentUser().isMetricsEnabled = !isMetricsEnabled;
    this.onChanged(true);
  }

  void loadUserSettingsFromMemory() {
    FileStore.readFileAsString(FileStore.USER_SETTINGS).then((String val) {
      if (val != null) {
        dynamic settings = json.decode(val);
        bool isMetricsEnabled = settings['isMetricsEnabled'] == 'true' ? true: false;
        if (_currentUser.getCurrentUser().isMetricsEnabled != isMetricsEnabled) {
          _currentUser.getCurrentUser().isMetricsEnabled = isMetricsEnabled;
          this.onChanged(true);
        }
        bool isLoggedIn = settings['isLoggedIn'] == 'true' ? true: false;
        if (_currentUser.getCurrentUser().isLoggedIn != isLoggedIn) {
          _currentUser.getCurrentUser().isLoggedIn = isLoggedIn;
          this.onChanged(true);
        }
        String firstName = settings['firstName'];
        String lastName = settings['lastName'];
        String department = settings['department'];
        /*
        print(firstName);
        print(lastName);
        print(department);
        */
        /*
        _currentUser.getCurrentUser().firstName = firstName;
        _currentUser.getCurrentUser().lastName = lastName;
        _currentUser.getCurrentUser().department = department;
        */
      } else {
        loadUserSettingsAsFirstUse();
      }
    });
  }

  void loadUserSettingsAsFirstUse() {
    /*
    print("FIRST USE");
    _currentUser.getCurrentUser().isMetricsEnabled = true;
    FileStore.readFileAsString(FileStore.USER_SETTINGS).then((String val) {
      if (val != null) {
        dynamic settings = json.decode(val);
        print(".\t\tFROM LOGIN" + settings.toString());
        UserBuilder builder = UserBuilder.fromJson(settings);
        User tempUserObj = builder
            .withIsMetricsEnabled(true)
            .build();
      } else {
        print("ERR 134");
      }
    });
    this.onChanged(true);
    */
  }

  void saveUserSettings() {
    print("BAD");
    String data = json.encode(User.toJson(_currentUser.getCurrentUser()));
    print ("SaveUserSettings - " + data);
    FileStore.writeToFile(FileStore.USER_SETTINGS, data);
  }
}
