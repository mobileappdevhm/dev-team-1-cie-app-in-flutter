import 'dart:async';
import 'package:location/location.dart';
import 'package:flutter/material.dart';
import 'maps.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'CiE',
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      home: new MyHomePage(title: 'CiE'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Location _location = new Location();
  dynamic deviceLocation;
  Future<Null> findUserLocation() async {
    Map<String, double> location;
    try {
      location = await _location.getLocation;
      setState(() {
        deviceLocation = location;
      });
    } catch (e) {
      location = null;
    }
  }

  final String apiKey = 'AIzaSyAUIZOyUTUX4WWANlK-70eg8ixCqxWp9us';
    @override
    Widget build(BuildContext context) {
      return new Scaffold(body: new MapPage(apiKey, currentLocation: deviceLocation),
      );
    }


}
