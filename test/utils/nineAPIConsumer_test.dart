import 'package:cie_team1/utils/nineAPIConsumer.dart';
import 'package:flutter_test/flutter_test.dart';

@Timeout(const Duration(seconds: 40))
void main() {
  //TODO tests without expect sometimes make trouble on travis
  //as a hint, I think because this function is a async one, maybe expectAsync is your friend (but I don't know :-) )
  //test('1 pullCourseJson', (){
  //  NineAPIEngine.pullCourseJSON(null, true);
  //  //maybe adding Fileread
  //});
}
