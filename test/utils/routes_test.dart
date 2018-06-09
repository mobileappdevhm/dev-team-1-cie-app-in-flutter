import 'package:cie_team1/utils/routes.dart';
import 'package:test/test.dart';

@Timeout(const Duration(seconds: 10))
void main() {
  group("static var Test", () {
    setUp(() {});

    test('1', () {
      expect(Routes.Welcome, '/welcome');
    });

    test('1', () {
      expect(Routes.TabPages, '/tabPages');
    });

    test('1', () {
      expect(Routes.Login, '/login');
    });
  });
}
