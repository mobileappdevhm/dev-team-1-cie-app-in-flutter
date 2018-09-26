import 'package:cie_app/utils/routes.dart';
import 'package:cie_app/views/login.dart';
import 'package:cie_app/views/start.dart';
import 'package:cie_app/views/tabs.dart';
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
  });

  group("Page belongs to route", () {
    final Map<String, WidgetBuilder> sut = Routes.getRoutes();

    test('contains welcome', () {
      expect(sut.containsKey(Routes.Welcome), true);
    });

    test('contains tabPages', () {
      expect(sut.containsKey(Routes.TabPages), true);
    });

    test('contains login', () {
      expect(sut.containsKey(Routes.Login), true);
    });
  });

  group('Routes Map', () {
    final Map<String, WidgetBuilder> sut = Routes.getRoutes();

    test('Welcome route is new page', () {
      expect(sut[Routes.Welcome].toString(),
          ((BuildContext context) => WelcomePage()).toString());
    });

    test('TabPages route is new page', () {
      expect(sut[Routes.TabPages].toString(),
          ((BuildContext context) => new TabsPage()).toString());
    });

    test('Login route is new page', () {
      expect(sut[Routes.Login].toString(),
          ((BuildContext context) => new LoginForm()).toString());
    });
  });
}
