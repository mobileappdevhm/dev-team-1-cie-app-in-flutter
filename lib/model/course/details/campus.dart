enum Campus { KARLSTRASSE, LOTHSTRASSE, PASING }

class CampusUtility {
  //TODO rename to fromString
  static Campus getStringAsCampus(String campus) {
    switch (campus) {
      case "Karlstrasse":
        return Campus.KARLSTRASSE;
      case "Pasing":
        return Campus.PASING;
      default:
        return Campus.LOTHSTRASSE;
    }
  }

  //TODO rename to toString
  static String getCampusAsString(Campus campus) {
    switch (campus) {
      case Campus.KARLSTRASSE:
        return "Karl.";
      case Campus.LOTHSTRASSE:
        return "Loth.";
      case Campus.PASING:
        return "Pasing";
    }
    return "";
  }

  static String getCampusAsLongString(Campus campus) {
    switch (campus) {
      case Campus.KARLSTRASSE:
        return "Karlstrasse";
      case Campus.LOTHSTRASSE:
        return "Lothstrasse";
      case Campus.PASING:
        return "Pasing";
    }
    return "";
  }
}
