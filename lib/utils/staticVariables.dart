enum Flavor { MOCK, PROD }
class StaticVariables {
  static const internationalOfficeEmail = 'mailto:international-office@hm.edu';

  /* Maps Page */
  static const String KARLSTRASSE = 'Karlstrasse Campus';
  static const String LOTHSTRASSE = 'Lothstrasse Campus';
  static const String PASING = 'Pasing Campus';

  static const int SAME_CAMPUS_COMMUTE_MINS = 0;
  static const int LOTHSTRASSE_PASING_COMMUTE_MINS = 45;
  static const int LOTHSTRASSE_KARLSTRASSE_COMMUTE_MINS = 20;
  static const int KARLSTRASSE_PASING_COMMUTE_MINS = 25;


  static const String RESSOURCE_PATH = 'res/';
  static const String IMAGE_PATH = RESSOURCE_PATH + 'images/';

  static const int HOURS_TO_MIN = 60;
  static const int CAMPUS_COMMUTE_MIN = 45;

  static const String TIME_CONFLICT_MESSAGE = "Possible Scheduling Conflict";

  static const String FAVORITES_REGISTRATION_BUTTON =
      "Register Favorited Courses";
  static const String FAVORITES_REGISTRATION_BUTTON_INACTIVE =
      "Courses Already Submitted";

  /* Settings Page */
  static const String LOGGED_IN_AS = 'Logged in as';
  static const String LOGOUT_BUTTON = 'Log Out';
  static const String LOGIN_BUTTON = 'Log In';
  static const String STATUS = 'Status';
  static const String DEPARTMENT = 'Department';
  static const String CONTACT_OFFICE = 'Contact International Office';
  static const String CIE_CERTIFICATE = 'Courses in English Certificate';
  static const String IE_CERTIFICATE = 'International Engineering Certificate';
  static const String TAKEN_COURSES = 'Taken Courses';
  static const String PRIVACY_BUTTON = 'Our Privacy Policy';

  /* Settings/Taken Courses Page */
  static const String TOTAL_OF = 'Total of';
  static const String ECTS = 'ECTS';

  /* Alert Strings */
  static const String ALERT_YES = "COMPLETE";
  static const String ALERT_NO = "CANCEL";
  static const String ALERT_REGISTRATION_SUBMISSION = "Complete Registration?";

  /* Metrics Strings */
  static const String METRICS_ENABLED = "User Statistics Enabled";
  static const String METRICS_DISABLED = "User Statistics Disabled";
}
