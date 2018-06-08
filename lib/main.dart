import 'package:cie_team1/generated/i18n.dart';
import 'package:cie_team1/utils/routes.dart';
import 'package:cie_team1/views/start.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of our application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        localizationsDelegates: [S.delegate],
        supportedLocales: S.delegate.supportedLocales,
        localeResolutionCallback:
            S.delegate.resolution(fallback: new Locale("en", "")),
        onGenerateTitle: (context) => S.of(context).main_title,
        theme: new ThemeData(
          primarySwatch: Colors.red,
        ),
        home: new WelcomePage(),
        routes: Routes.getRoutes());
  }
}
