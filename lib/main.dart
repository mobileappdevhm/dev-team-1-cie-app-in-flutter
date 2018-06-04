import 'package:cie_team1/utils/appLocalizationsDelegate.dart';
import 'package:cie_team1/utils/routes.dart';
import 'package:cie_team1/views/start.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        supportedLocales: [
          const Locale('en', 'US'),
          const Locale('en', 'UK'),
          const Locale('de', 'DE'),
        ],
        localizationsDelegates: [
          const AppLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        localeResolutionCallback:
            (Locale locale, Iterable<Locale> supportedLocales) {
          for (Locale supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale.languageCode ||
                supportedLocale.countryCode == locale.countryCode) {
              return supportedLocale;
            }
          }

          return supportedLocales.first;
        },
        title: 'CiE',
        theme: new ThemeData(
          primarySwatch: Colors.red,
        ),
        home: new WelcomePage(),
        routes: Routes.getRoutes());
  }
}
