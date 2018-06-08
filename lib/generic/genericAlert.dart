import 'dart:async';

import 'package:cie_team1/generated/i18n.dart';
import 'package:flutter/material.dart';

class GenericAlert {
  static Future<Null> confirm(
      BuildContext context, void no(), void yes(), String msg) {
    return showDialog<Null>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: new Text(msg),
            actions: <Widget>[
              new FlatButton(
                child: new Text(S.of(context).alert_button_yes),
                onPressed: () {
                  Navigator.of(context).pop();
                  yes();
                },
              ),
              new FlatButton(
                child: new Text(S.of(context).alert_button_no),
                onPressed: () {
                  Navigator.of(context).pop();
                  no();
                },
              ),
            ],
          );
        });
  }
}
