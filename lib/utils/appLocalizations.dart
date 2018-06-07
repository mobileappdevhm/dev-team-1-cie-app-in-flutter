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

  Future myLoadAsset(String path) async {
    String data;
    try {
      data = await rootBundle.loadString(path);
    } catch (_) {
      data = null;
    }

    if (data != null) {
      print("Load $path");
      this._sentences = json.decode(data);
    }
  }

  Future<bool> load() async {
    var assetPaths = [
      '${this.locale.languageCode}_${this.locale.countryCode}',
      this.locale.languageCode.toString(),
      '${this.defaultLocale.languageCode}_${this.defaultLocale.countryCode}'
    ];

    for (var assetPath in assetPaths) {
      await myLoadAsset('res/values/' + assetPath + '.json');
      if (_sentences != null) {
        break;
      }
    }

    if (_sentences == null) {
      throw "Asset and fallback assets couldn't be loaded";
    }

    return true;
  }

  String trans(String key) {
    return this._sentences[key].toString();
  }
}
