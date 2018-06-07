import 'package:cie_team1/utils/fileStore.dart';
import 'package:test/test.dart';

@Timeout(const Duration(seconds: 10))

void main() {
  group("getFile", () {
    test('1', () {
      try {
        FileStore.getFile(FileStore.LOGIN);
      } catch(e) {
        fail("Failed to retrieve file");
      }
    });
  });
}