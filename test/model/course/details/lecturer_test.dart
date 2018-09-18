import 'package:cie_app/model/course/details/lecturer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('1 lecturer', () {
    var lecturer = Map<String, dynamic>();
    lecturer['title'] = null;
    lecturer['firstName'] = "Vorname";
    lecturer['lastName'] = "Nachname";
    var lecturers = new List<Map<String, dynamic>>();
    lecturers.add(lecturer);

    var list = Lecturer.fromJson(lecturers);

    expect(list[0].firstName, "Vorname");
    expect(list[0].lastName, "Nachname");
    expect(list[0].title, '');
  });
  test('2 lecturer, empty firstname', () {
    var lecturer = Map<String, dynamic>();
    lecturer['title'] = null;
    lecturer['firstName'] = null;
    lecturer['lastName'] = "Nachname";
    var lecturers = new List<Map<String, dynamic>>();
    lecturers.add(lecturer);

    var list = Lecturer.fromJson(lecturers);

    expect(list[0].firstName, "");
    expect(list[0].lastName, "Nachname");
    expect(list[0].title, "");
  });
  test('3 lecturer, empty lastname', () {
    var lecturer = Map<String, dynamic>();
    lecturer['title'] = null;
    lecturer['firstName'] = "Vorname";
    lecturer['lastName'] = null;
    var lecturers = new List<Map<String, dynamic>>();
    lecturers.add(lecturer);

    var list = Lecturer.fromJson(lecturers);

    expect(list[0].firstName, "Vorname");
    expect(list[0].lastName, "");
    expect(list[0].title, "");
  });
  //TODO test profile
}
