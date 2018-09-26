class Department {
  String color;
  String name;
  String shortName;
  List<dynamic> actions;

  Department(Map<String, dynamic> jsonData) {
    this.color = jsonData['color'];
    this.name = jsonData['name'];
    this.shortName = jsonData['shortName'];
    this.actions = jsonData['actions'];
  }

  static List<Department> fromJson(List<dynamic> jsonData) {
    if (jsonData == null) return null;
    var list = new List<Department>();
    for (int i = 0; i < jsonData.length; i++) {
      list.add(new Department(jsonData[i]));
    }
    return list;
  }

//Todo: This needs to be replaced with enum style of implementation in future
  static List<String> departments = [
    "01",
    "02",
    "03",
    "04",
    "05",
    "06",
    "07",
    "08",
    "09",
    "10",
    "11",
    "12",
    "13",
    "14"
  ];
//  enum Faculty {
//  ZERO,
//  ONE,
//  TWO,
//  THREE,
//  FOUR,
//  FIVE,
//  SIX,
//  SEVEN,
//  EIGHT,
//  NINE,
//  TEN,
//  ELEVEN,
//  TWELVE,
//  THIRTEEN
//}
}
