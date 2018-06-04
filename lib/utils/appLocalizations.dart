import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  AppLocalizations(this.locale, this.defaultLocale);

  Locale locale;
  final Locale defaultLocale;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  Map<String, dynamic> _sentences;

  Future<bool> load() async {
    String data;
    try {
      data = await rootBundle
          .loadString('res/values/${this.locale.languageCode}_${this.locale
          .countryCode}.json');
    } catch (Exception) {
      print('res/values/${this.locale.languageCode}_${this.locale
          .countryCode}.json could not be found');
      try {
        data = await rootBundle
            .loadString('res/values/${this.locale.languageCode}.json');
      } catch (Exception) {
        print('res/values/${this.locale.languageCode}.json could not be found');
        data = await rootBundle.loadString(
            'res/values/${this.defaultLocale.languageCode}_${this.defaultLocale
                .countryCode}.json');
        this.locale = defaultLocale;
      }
    }

    this._sentences = json.decode(data);

    print("Load ${locale.languageCode} ${locale.countryCode}");

    return true;
  }

  String trans(String key) {
    return this._sentences[key].toString();
  }
}
