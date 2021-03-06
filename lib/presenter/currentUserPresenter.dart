import 'dart:convert';

import 'package:cie_app/di/currentUser_di.dart';
import 'package:cie_app/model/course/course.dart';
import 'package:cie_app/model/user/currentUser.dart';
import 'package:cie_app/model/user/user.dart';
import 'package:cie_app/utils/dataManager.dart';
import 'package:cie_app/utils/staticVariables.dart';
import 'package:flutter/material.dart';

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

  String getCurrentUserLevel() {
    return _currentUser.getCurrentUser().level;
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

  //TODO maybe use this method in settings
  //int getTotalCredits() {
  //  var sum = 0;
  //
  //  _currentUser.getCurrentUser().prevCourses.forEach((course) {
  //    sum = sum + course.ects;
  //  });
  //  return sum;
  //}

  int getDep3Credits() {
    var sum = 0;
    _currentUser
        .getCurrentUser()
        .prevCourses
        .where((course) => course.department.shortName.contains("03"))
        .forEach((course) {
      sum = sum + course.ects;
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

  String getDepartmentShortName(int id) {
    return _currentUser.getCurrentUser().prevCourses[id].department.shortName;
  }

  void toggleIsMetricsEnabled() {
    bool isMetricsEnabled = _currentUser.getCurrentUser().isMetricsEnabled;
    _currentUser.getCurrentUser().isMetricsEnabled = !isMetricsEnabled;
    this.onChanged(true);
  }

  void loadUserSettingsFromMemory() {
    DataManager.getResource(DataManager.LOCAL_USER_SETTINGS).then((String val) {
      if (val != null) {
        dynamic settings = json.decode(val);
        bool isMetricsEnabled =
            settings['isMetricsEnabled'] == 'true' ? true : false;
        if (_currentUser.getCurrentUser().isMetricsEnabled !=
            isMetricsEnabled) {
          _currentUser.getCurrentUser().isMetricsEnabled = isMetricsEnabled;
          this.onChanged(true);
        }
        bool isLoggedIn = settings['isLoggedIn'] == 'true' ? true : false;
        if (_currentUser.getCurrentUser().isLoggedIn != isLoggedIn) {
          _currentUser.getCurrentUser().isLoggedIn = isLoggedIn;
          this.onChanged(true);
        }
      }
    });
  }

  void saveUserSettings() {
    String data = json.encode(User.toJson(_currentUser.getCurrentUser()));
    DataManager.writeToFile(DataManager.LOCAL_USER_SETTINGS, data);
  }
}
