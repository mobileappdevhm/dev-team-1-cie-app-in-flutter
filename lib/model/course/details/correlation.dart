
class CorrelationBuilder {
  static List<Correlation> fromJson(List<dynamic> jsonData) {
    if (jsonData == null) return null;
    var list = new List<Correlation>();
    for (int i = 0; i < jsonData.length; i++) {
      list.add(new Correlation(jsonData[i]));
    }
    return list;
  }
}

class Correlation {
  String organiser;
  String curriculum;
  List<dynamic> actions;

  Correlation(Map<String, dynamic> jsonData) {
    this.organiser = jsonData['organiser'];
    this.curriculum = jsonData['curriculum'];
    this.actions = jsonData['actions'];
  }
}