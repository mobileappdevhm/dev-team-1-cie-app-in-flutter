import 'package:cie_team1/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:test/test.dart';

@Timeout(const Duration(seconds: 10))
void main() {
  group("static var Test", () {
    setUp(() {});

    test('1', () {
      expect(Routes.Welcome, '/welcome');
    });

    test("2", () {
      expect(Routes.TabPages, '/tabPages');
    });

    test('3', () {
      expect(Routes.Login, '/login');
    });

    test('4', () {
      final Map<String,WidgetBuilder> sut = Routes.getRoutes();
      expect(sut.containsKey(Routes.Welcome),true);
      expect(sut.containsKey(Routes.TabPages),true);
      expect(sut.containsKey(Routes.Login),true);
    });
  });
}
