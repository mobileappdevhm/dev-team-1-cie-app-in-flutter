import 'package:cie_app/model/course/details/department.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('1', () {
    int counter = 1;
    for (String sut in Department.departments.toList()) {
      if (counter < 10)
        expect(sut, "0" + counter.toString());
      else
        expect(sut, counter.toString());
      counter++;
    }
  });


}
