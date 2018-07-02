import 'package:cie_team1/generic/genericIcon.dart';
import 'package:cie_team1/utils/cieColor.dart';
import 'package:cie_team1/utils/cieStyle.dart';
import 'package:cie_team1/utils/routes.dart';
import 'package:cie_team1/utils/staticVariables.dart';
import 'package:flutter/material.dart';

class GenericShowInstruction {
  static Widget showInstructions(
      Function onPressRefresh, BuildContext context) {
    return _getInstructionWidget(new SingleChildScrollView(
      child: new Column(
        children: <Widget>[
          new Text(
            StaticVariables.INSTRUCTIONS_TITLE,
            style: CiEStyle.getInstructionPageHeadingStyle(),
          ),
          new Padding(padding: new EdgeInsets.only(bottom: 10.0)),
          new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              GenericIcon.buildGenericGetArchiveIcon(),
              new Expanded(
                  child: new Text(
                StaticVariables.INSTRUCTIONS_BASIC,
                style: CiEStyle.getInstructionPageTextStyle(),
              ))
            ],
          ),
          new Padding(padding: new EdgeInsets.only(bottom: 20.0)),
          new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Expanded(
                  child: new Text(
                StaticVariables.INSTRUCTIONS_TIP,
                style: CiEStyle.getInstructionPageTextStyle(),
              )),
              GenericIcon.buildGenericGetHeartIcon(),
            ],
          ),
          new Padding(padding: new EdgeInsets.only(bottom: 20.0)),
          new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              GenericIcon.buildGenericGetTrafficIcon(),
              new Expanded(
                  child: new Text(
                StaticVariables.INSTRUCTIONS_TRAFFIC_LIGHT,
                style: CiEStyle.getInstructionPageTextStyle(),
              )),
            ],
          ),
          new Padding(padding: new EdgeInsets.only(bottom: 20.0)),
          new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Expanded(
                  child: new Text(
                StaticVariables.INSTRUCTIONS_FAVORITES,
                style: CiEStyle.getInstructionPageTextStyle(),
              )),
              GenericIcon.buildGenericGetClockIcon(),
            ],
          ),
          new Padding(padding: new EdgeInsets.only(bottom: 20.0)),
          new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              GenericIcon.buildGenericGetHappyIcon(),
              new Expanded(
                  child: new Text(
                StaticVariables.INSTRUCTIONS_LOTTERY,
                style: CiEStyle.getInstructionPageTextStyle(),
              )),
            ],
          ),
          new Padding(padding: new EdgeInsets.only(bottom: 20.0)),
          onPressRefresh == null
              ? new Row(
                  children: <Widget>[
                    new Expanded(
                        child: new Text(
                            StaticVariables.INSTRUCTIONS_PLEASE_GO_TO,
                            style: CiEStyle.getInstructionPageTextStyle()))
                  ],
                )
              : new RaisedButton(
                  color: CiEColor.lightGray,
                  onPressed: () => _toggleRefresh(onPressRefresh, context),
                  child: new Text(StaticVariables.INSTRUCTIONS_BUTTON_TEXT)),
        ],
      ),
    ));
  }

  static _toggleRefresh(Function onPressRefresh, BuildContext context) {
    () => onPressRefresh();
    Navigator.pushReplacementNamed(context, Routes.TabPages);
  }

  static Widget _getInstructionWidget(Widget text) {
    return new Expanded(
      child: new Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            alignment: Alignment.bottomCenter,
            image: new AssetImage(
                StaticVariables.IMAGE_PATH + "AppLogo_Transparent.png"),
            fit: BoxFit.fitWidth,
          ),
        ),
        padding: new EdgeInsets.symmetric(vertical: 10.0),
        child: new Row(
          children: <Widget>[
            new Expanded(
                child: new Container(
              padding: new EdgeInsets.all(20.0),
              alignment: Alignment.topCenter,
              child: text,
              //new Text(text,
              //    style: CiEStyle.getInstructionPageTextStyle()),
            ))
          ],
        ),
      ),
    );
  }
}
