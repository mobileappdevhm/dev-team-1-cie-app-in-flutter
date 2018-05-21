import 'package:cie_team1/presenter/courseListPresenter.dart';
import 'package:cie_team1/widgets/courseList.dart';
import 'package:cie_team1/widgets/courseListItem.dart';
import 'package:flutter/material.dart';

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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new CourseList(new CourseListPresenter()),
      ),
    );
  }
}
