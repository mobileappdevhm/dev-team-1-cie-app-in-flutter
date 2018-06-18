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

  static const String GUEST_FIRST_NAME = "Guest";
  static const String GUEST_LAST_NAME = "User";
  static const String GUEST_DEPARTMENT = "N/A";

  /* Settings/Taken Courses Page */
  static const String TOTAL_OF = 'Total of';
  static const String ECTS = 'ECTS';

  /* Alert Strings */
  static const String ALERT_YES = "COMPLETE";
  static const String ALERT_NO = "CANCEL";
  static const String ALERT_REGISTRATION_SUBMISSION = "Complete Registration?";

  /* Metrics Strings */
  static const String METRICS_ENABLED = "User Metrics Enabled";
  static const String METRICS_DISABLED = "User Metrics Disabled";
  static const String ALERT_OK = "OK";
  static const String ALERT_UNDERSTAND = "I UNDERSTAND";
  static const String ALERT_TIMECONFLICT_ACKNOWLEDGE =
      "Please consider that the commute between these two classes may take more than 45 minutes.\n" +
          "You may not arrive to class on time.";

  /* Course Detail Page */
  static const String FK = "DP";
  static const String DESCRIPTION = "Description";
  static const String HOURS_PER_WEEK = "Hours per Week";
  static const String CONTACT = "Contact";
  static const String COURSE_DETAILS = "Course Details";
  static const String NO_DESCRIPTION =
      "Sorry, there no description available for this course. Please check again later";
  static const String PROFESSOR = "Professor";
}
