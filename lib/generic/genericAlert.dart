import 'dart:async';

import 'package:cie_team1/utils/cieStyle.dart';
import 'package:cie_team1/utils/staticVariables.dart';
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

  static Future<bool> confirmDialog(
      BuildContext context, String title, String content) {
    return showDialog<bool>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return new AlertDialog(
            title: new Text(
              title,
            ),
            content: new Text(
              content,
              style: CiEStyle.getWarningTextStyle(),
            ),
            actions: <Widget>[
              new FlatButton(
                child: const Text(StaticVariables.ALERT_UNDERSTAND),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
            ],
          );
        });
  }
}
