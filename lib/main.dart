import 'package:cie_team1/utils/routes.dart';
import 'package:cie_team1/views/start.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_analytics/observer.dart';

FirebaseAnalytics analytics = new FirebaseAnalytics();


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of our application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return new MaterialApp(
        title: 'CiE',
        theme: new ThemeData(
          primarySwatch: Colors.red,
        ),
        home: new WelcomePage(),
        routes: Routes.getRoutes(),

        //track page route transitions
        navigatorObservers: [
          new FirebaseAnalyticsObserver(analytics: analytics),
        ],);
  }
}


