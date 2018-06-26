import 'package:cie_team1/views/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

@Timeout(const Duration(seconds: 20))
void main() {
  testWidgets('1 widgetTest', (WidgetTester tester) async {
    // Tells the tester to build a UI based on the widget tree passed to it
    await tester.pumpWidget(
      new StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return new MaterialApp(
            home: new Material(
              child: new Center(child: new LoginForm()),
            ),
          );
        },
      ),
    );

    final Iterable<Widget> listOfWidgets = tester.allWidgets;
    int counter = 0;
    for (Widget widget in listOfWidgets) {
      if (widget is Text) {
        if (counter == 0) {
          expect(widget.data, 'Courses in English');
          counter++;
        } else if (counter == 1) {
          expect(widget.data, 'E-Mail');
          counter++;
        } else if (counter == 2) {
          expect(widget.data, 'Password');
          counter++;
        } else if (counter == 3) {
          expect(widget.data, 'LOGIN');
          counter++;
        } else if (counter == 4) {
          expect(widget.data, 'Don\'t have an Account?');
          counter++;
        } else if (counter == 5) {
          expect(widget.data, 'Login as Guest');
          counter++;
        } else if (counter == 6) {
          expect(widget.data, 'Forgot your password?');
          counter++;
        }
      }
    }
  });

  group('Login', () {
    testWidgets('1 Login press', (WidgetTester tester) async {
      // Tells the tester to build a UI based on the widget tree passed to it
      await tester.pumpWidget(
        new StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return new MaterialApp(
              home: new Material(
                child: new Center(child: new LoginForm()),
              ),
            );
          },
        ),
      );

      final Iterable<Widget> listOfWidgets = tester.allWidgets;
      int counter = 0;
      for (Widget widget in listOfWidgets) {
        if (widget is Text) {
          if (counter == 0) {
            expect(widget.data, 'Courses in English');
            counter++;
          } else if (counter == 1) {
            expect(widget.data, 'E-Mail');
            await tester.tap(find.byWidget(widget));
            //write dummy stuff
            counter++;
          } else if (counter == 2) {
            expect(widget.data, 'Password');
            await tester.tap(find.byWidget(widget));
            //write dummy stuff
            counter++;
          } else if (counter == 3) {
            expect(widget.data, 'LOGIN');
            await tester.tap(find.byWidget(widget));
            counter++;
          }
        }
      }
    });

    testWidgets('1 Guest press', (WidgetTester tester) async {
      // Tells the tester to build a UI based on the widget tree passed to it
      await tester.pumpWidget(
        new StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return new MaterialApp(
              home: new Material(
                child: new Center(child: new LoginForm()),
              ),
            );
          },
        ),
      );

      final Iterable<Widget> listOfWidgets = tester.allWidgets;
      int counter = 0;
      for (Widget widget in listOfWidgets) {
        if (widget is Text) {
          if (counter == 0) {
            expect(widget.data, 'Courses in English');
            counter++;
          } else if (counter == 1) {
            expect(widget.data, 'E-Mail');
            counter++;
          } else if (counter == 2) {
            expect(widget.data, 'Password');
            counter++;
          } else if (counter == 3) {
            expect(widget.data, 'LOGIN');
            await tester.tap(find.byWidget(widget));
            counter++;
          } else if (counter == 4) {
            expect(widget.data, 'Don\'t have an Account?');
            counter++;
          } else if (counter == 5) {
            expect(widget.data, 'Login as Guest');
            await tester.tap(find.byWidget(widget));
            counter++;
          }
        }
      }
    });

    testWidgets('1 Guest press', (WidgetTester tester) async {
      // Tells the tester to build a UI based on the widget tree passed to it
      await tester.pumpWidget(
        new StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return new MaterialApp(
              home: new Material(
                child: new Center(child: new LoginForm()),
              ),
            );
          },
        ),
      );

      final Iterable<Widget> listOfWidgets = tester.allWidgets;
      int counter = 0;
      for (Widget widget in listOfWidgets) {
        if (widget is Text) {
          if (counter == 0) {
            expect(widget.data, 'Courses in English');
            counter++;
          } else if (counter == 1) {
            expect(widget.data, 'E-Mail');
            counter++;
          } else if (counter == 2) {
            expect(widget.data, 'Password');
            counter++;
          } else if (counter == 3) {
            expect(widget.data, 'LOGIN');
            await tester.tap(find.byWidget(widget));
            counter++;
          } else if (counter == 4) {
            expect(widget.data, 'Don\'t have an Account?');
            counter++;
          } else if (counter == 5) {
            expect(widget.data, 'Login as Guest');
            counter++;
          } else if (counter == 6) {
            expect(widget.data, 'Forgot your password?');
            await tester.tap(find.byWidget(widget));
            counter++;
          }
        }
      }
    });
  });

  group('validate mail', () {
    var login = new LoginFormState();

    test('1 valid mail', () {
      expect(login.validateMail("valid@mail.com"), null);
    });
    test('2 valid mail', () {
      expect(login.validateMail("v.alid@mail.com"), null);
    });
    test('2 valid mail', () {
      expect(login.validateMail("valid@mail.all.com"), null);
    });
    test('4 invalid mail', () {
      expect(login.validateMail("@mail.com"),
          'Please enter a valid e-mail address.');
    });
    test('5 invalid mail', () {
      expect(login.validateMail("@mail.com"),
          'Please enter a valid e-mail address.');
    });
    test('6 invalid mail', () {
      expect(login.validateMail("validmail.com"),
          'Please enter a valid e-mail address.');
    });
    test('7 invalid mail', () {
      expect(login.validateMail("valid@.com"),
          'Please enter a valid e-mail address.');
    });
    test('8 invalid mail', () {
      expect(login.validateMail("valid@mailcom"),
          'Please enter a valid e-mail address.');
    });
    test('9 invalid mail', () {
      expect(login.validateMail("valid@mail."),
          'Please enter a valid e-mail address.');
    });
    test('10 invalid mail', () {
      expect(login.validateMail(""), 'Mail is required.');
    });
  });

  group('validate password', () {
    var login = new LoginFormState();

    test('1 valid password', () {
      expect(login.validatePassword("passwordIsLargerThan8"), null);
    });
    test('2 invalid password', () {
      expect(login.validatePassword("passwor"),
          'Password does not match requirements.');
    });
    test('3 invalid password', () {
      expect(login.validatePassword("pwd"),
          'Password does not match requirements.');
    });
    test('4 invalid password', () {
      expect(login.validatePassword(""), 'Password is required.');
    });
  });
}
