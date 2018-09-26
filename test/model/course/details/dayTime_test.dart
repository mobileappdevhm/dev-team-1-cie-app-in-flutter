import 'package:cie_app/model/course/details/dayTime.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('name', (){
    test('testname', () {
      expect(new DayTime(5, 59).getAsInt(), 359);
    });
  });
}
