import 'package:cie_team1/utils/staticVariables.dart';
import 'package:cie_team1/views/maps.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

@Timeout(const Duration(seconds: 20))
void main() {

  group('location test', (){

    MapPage sut;

    setUp((){
      sut = new MapPage();
    });


    test('lothstrasse', (){

      expect(sut.createState().lothLocation.length,2);

    });

    test('lothcord', (){

      expect(sut.createState().lothLocation.containsKey("latitude"),true);
      expect(sut.createState().lothLocation.entries.elementAt(0).value,"48.1542593");
      expect(sut.createState().lothLocation.containsKey("longitude"),true);
      expect(sut.createState().lothLocation.entries.elementAt(1).value,'11.5539808');

    });

    test('karlstrasse', (){

      expect(sut.createState().karlLocation.length,2);

    });

    test('karlcord', (){

      expect(sut.createState().karlLocation.containsKey("latitude"),true);
      expect(sut.createState().karlLocation.entries.elementAt(0).value,'48.1429336');
      expect(sut.createState().karlLocation.containsKey("longitude"),true);
      expect(sut.createState().karlLocation.entries.elementAt(1).value,'11.5677428');

    });


    test('pasing', (){

      expect(sut.createState().pasingLocation.length,2);

    });

    test('pasingcord', (){

      expect(sut.createState().pasingLocation.containsKey("latitude"),true);
      expect(sut.createState().pasingLocation.entries.elementAt(0).value,'48.1415925');
      expect(sut.createState().pasingLocation.containsKey("longitude"),true);
      expect(sut.createState().pasingLocation.entries.elementAt(1).value,'11.4501612');

    });

  });

  group('apikey',(){

    test('apikey',(){

      expect(new MapPage().apiKey,'AIzaSyAUIZOyUTUX4WWANlK-70eg8ixCqxWp9us');
    });
  });

  testWidgets('1 widgetTest for map', (WidgetTester tester) async {
    // Tells the tester to build a UI based on the widget tree passed to it
    await tester.pumpWidget(
      new StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return new MaterialApp(
            home: new Material(
              child: new Center(
                  child: new MapPage()
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
          expect(widget.data, "Lothstrasse Campus");
          counter++;
        } else if (counter == 2) {
          expect(widget.data, "Pasing Campus");
          counter++;
        } else if (counter == 4) {
         expect(widget.data, "Karlstrasse Campus");
          counter++;
        } 
      }
    }
  });

}
