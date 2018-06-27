import 'package:firebase_analytics/firebase_analytics.dart';

class Analytics {
  static FirebaseAnalytics analytics;

  static bool getAnalytics() {
    return analytics != null;
  }

  static setAnalytics(bool isEnabled) {
    if (isEnabled) {
      analytics = new FirebaseAnalytics();
    } else {
      analytics = null;
    }
  }

  static setCurrentScreen(String screenName) {
    if (analytics != null) {
      analytics.setCurrentScreen(screenName: screenName);
    }
  }

  static logEvent(String name, [Map<String, dynamic> parameters]) {
    if (analytics != null) {
      analytics.logEvent(name: name, parameters: parameters);
    }
  }

  static logSearch(String searchTerm) {
    if (analytics != null) {
      analytics.logSearch(searchTerm: searchTerm);
    }
  }

  static setUserProperty(String name, String value) {
    if (analytics != null) {
      analytics.setUserProperty(name: name, value: value);
    }
  }

  static logLogin() {
    if (analytics != null) {
      analytics.logLogin();
    }
  }
}
