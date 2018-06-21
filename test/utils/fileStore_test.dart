@Skip("Flutter Bug regarding Path")
import 'package:cie_team1/utils/fileStore.dart';
import 'package:flutter_test/flutter_test.dart';

@Timeout(const Duration(seconds: 40))
void main() {
  test('1 widgetTest', (){

    FileStore.writeToFile("test","data");

    FileStore.getFile("test");

    expect(FileStore.readFileAsString("test").runtimeType, new Future.value("data").runtimeType);

  });


}