import 'package:cie_team1/views/login.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

@Timeout(const Duration(seconds: 20))
void main() {

  testWidgets('1 widgetTest', (WidgetTester tester) async {
    // Tells the tester to build a UI based on the widget tree passed to it
    await tester.pumpWidget(
      new StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return new MaterialApp(
            home: new Material(
              child: new Center(
                  child: new LoginForm()
              ),
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
        }else if(counter == 1){
          expect(widget.data, 'E-Mail');
          counter++;
        }else if(counter == 2){
          expect(widget.data, 'Password');
          counter++;
        }else if(counter == 3){
          expect(widget.data, 'LOGIN');
          counter++;
        }else if(counter == 4){
          expect(widget.data, 'Don\'t have an Account?');
          counter++;
        }else if(counter == 5){
          expect(widget.data, 'Login as Guest');
          counter++;
        }else if(counter == 6){
          expect(widget.data, 'Forgot your password?');
          counter++;
        }

      }
    }


  });

}
