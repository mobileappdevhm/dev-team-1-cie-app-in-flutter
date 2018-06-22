import 'package:cie_team1/model/course/details/lecturer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('1 lecturer', () {
    var lecturer = Map<String, dynamic>();
    lecturer['title'] = null;
    lecturer['firstName'] = "Vorname";
    lecturer['lastName'] = "Nachname";
    var lecturers = new List<Map<String, dynamic>>();
    lecturers.add(lecturer);

    var list = LecturerBuilder.fromJson(lecturers);

    expect(list[0].firstName, "Vorname");
    expect(list[0].lastName, "Nachname");
    expect(list[0].title, null);
  });
}
