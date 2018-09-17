import 'package:cie_app/utils/cieColor.dart';
import 'package:flutter/material.dart';

class GenericBorderContainer {
  static Widget buildGenericBorderedElement(Widget child) {
    return new Container(
        decoration: new BoxDecoration(
          border: new Border(
              bottom: new BorderSide(color: CiEColor.lightGray, width: 1.0)),
        ),
        child: child);
  }

  static Widget buildGenericBlurredLine() {
    return new Container(
        height: 0.5,
        decoration: new BoxDecoration(
          boxShadow: [
            new BoxShadow(
              color: Colors.black87,
              blurRadius: 5.0,
            ),
          ],
        ));
  }
}
