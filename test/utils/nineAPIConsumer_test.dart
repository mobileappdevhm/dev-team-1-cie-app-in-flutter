import 'package:cie_team1/utils/nineAPIConsumer.dart';
import 'package:flutter_test/flutter_test.dart';

@Timeout(const Duration(seconds: 40))
void main() {

  test('1 pullCourseJson', (){
    NineAPIEngine.pullCourseJSON(null, true);
    //maybe adding Fileread
  });
}
