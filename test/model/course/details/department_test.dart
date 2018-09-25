import 'package:cie_app/model/course/details/department.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  final dynamic jsonData = {
  "color": "#008E7D",
  "name": "Fakultät 07",
  "shortName": "FK 07",
  "actions": []
  };

  test('department list', () {
    int counter = 1;
    for (String sut in Department.departments.toList()) {
      if (counter < 10)
        expect(sut, "0" + counter.toString());
      else
        expect(sut, counter.toString());
      counter++;
    }
  });

  test('departments fromJson', () {
    var departmentList = List<dynamic>();
    departmentList.add(jsonData);

    var department = Department.fromJson(departmentList)[0];

    expect(department.color, "#008E7D");
    expect(department.name, "Fakultät 07");
    expect(department.shortName, "FK 07");
  });


}
