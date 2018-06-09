import 'package:flutter/material.dart';
import 'package:cie_team1/utils/staticVariables.dart';
import 'dart:async';

class GenericAlert {
  static Future<Null> confirm(BuildContext context, void no(), void yes(), String msg) {
    return showDialog<Null>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: new Text(msg),
            actions: <Widget>[
              new FlatButton(
                child: const Text(StaticVariables.ALERT_YES),
                onPressed: () {
                  Navigator.of(context).pop();
                  yes();
                },
              ),
              new FlatButton(
                child: const Text(StaticVariables.ALERT_NO),
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
