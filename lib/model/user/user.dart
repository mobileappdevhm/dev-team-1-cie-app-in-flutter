import 'package:cie_app/model/course/course.dart';

class UserBuilder {
  String language = "";
  String name = "";
  String department = "";
  String level = "";
  bool isLoggedIn = false;
  bool isMetricsEnabled = true;
  String id = "";
  String username = "";
  String firstName = "";
  String lastName = "";
  List<Course> currentCourses;
  List<Course> prevCourses;

  // Standard Builder Pattern Implementation
  UserBuilder withID(String id) {
    this.id = id != null ? id : null;
    return this;
  }

  UserBuilder withLanguage(String language) {
    this.language = language != null ? language : null;
    return this;
  }

  UserBuilder withName(String name) {
    this.name = name != null ? name : null;
    return this;
  }

  UserBuilder withDepartment(String department) {
    this.department = department != null ? department : "";
    return this;
  }

  UserBuilder withIsLoggedIn(bool isLoggedIn) {
    this.isLoggedIn = isLoggedIn != null ? isLoggedIn : null;
    return this;
  }

  UserBuilder withIsMetricsEnabled(bool isMetricsEnabled) {
    this.isMetricsEnabled = isMetricsEnabled != null ? isMetricsEnabled : null;
    return this;
  }

  UserBuilder withUsername(String username) {
    this.username = username != null ? username : null;
    return this;
  }

  UserBuilder withFirstName(String firstName) {
    this.firstName = firstName != null ? firstName : null;
    return this;
  }

  UserBuilder withLastName(String lastName) {
    this.lastName = lastName != null ? lastName : null;
    return this;
  }

  UserBuilder withLevel(String level) {
    this.level = level != null ? level : "";
    return this;
  }

  UserBuilder withCurrentCourses(List<Course> currentCourses) {
    this.currentCourses = currentCourses != null ? currentCourses : null;
    return this;
  }

  UserBuilder withPrevCourses(List<Course> prevCourses) {
    this.prevCourses = prevCourses != null ? prevCourses : null;
    return this;
  }

  factory UserBuilder.fromJson(Map<String, dynamic> jsonData) {
    return new UserBuilder(
        id: jsonData['id'],
        language: jsonData['language'],
        name: jsonData['name'],
        firstName: jsonData['firstName'],
        lastName: jsonData['lastName'],
        department: jsonData['department'],
        level: jsonData['level'],
        isLoggedIn: jsonData['isLoggedIn'] == 'true' ? true : false,
        isMetricsEnabled:
            jsonData['isMetricsEnabled'] == 'true' ? true : false);
  }

  UserBuilder(
      {this.id,
      this.language,
      this.name,
      this.firstName,
      this.lastName,
      this.department,
      this.level,
      this.isLoggedIn,
      this.isMetricsEnabled});

  User build() {
    return new User(
        this.id,
        this.language,
        this.name,
        this.department,
        this.level,
        this.isLoggedIn,
        this.isMetricsEnabled,
        this.username,
        this.firstName,
        this.lastName,
        this.currentCourses,
        this.prevCourses);
  }
}

class User {
  String id;
  String language;
  String name;
  String department;
  String level;
  bool isLoggedIn;
  bool isMetricsEnabled;
  String username;
  String firstName;
  String lastName;
  List<Course> currentCourses;
  List<Course> prevCourses;

  User(
      this.id,
      this.language,
      this.name,
      this.department,
      this.level,
      this.isLoggedIn,
      this.isMetricsEnabled,
      this.username,
      this.firstName,
      this.lastName,
      this.currentCourses,
      this.prevCourses);

  static Map<String, dynamic> toJson(User user) {
    Map<String, String> map = new Map<String, String>();
    map.putIfAbsent('id', () => user.id.toString());
    map.putIfAbsent('language', () => user.language);
    map.putIfAbsent('name', () => user.name);
    map.putIfAbsent('firstName', () => user.firstName);
    map.putIfAbsent('lastName', () => user.lastName);
    map.putIfAbsent('department', () => user.department);
    map.putIfAbsent('level', () => user.level);
    map.putIfAbsent('isLoggedIn', () => user.isLoggedIn.toString());
    map.putIfAbsent('isMetricsEnabled', () => user.isMetricsEnabled.toString());
    return map;
  }
}
