import 'package:cie_app/generic/genericIcon.dart';
import 'package:cie_app/utils/cieColor.dart';
import 'package:cie_app/utils/cieStyle.dart';
import 'package:cie_app/utils/dataManager.dart';
import 'package:cie_app/utils/routes.dart';
import 'package:cie_app/utils/staticVariables.dart';
import 'package:flutter/material.dart';

class GenericShowInstruction {
  static Widget showInstructions(BuildContext context, bool goToTabs, [Function onPressRefresh = null]) {
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
          new RaisedButton(
              color: CiEColor.lightGray,
              onPressed: () => _toggleRefresh(goToTabs, context, onPressRefresh),
              child: goToTabs
                  ? new Text(StaticVariables.INSTRUCTIONS_BUTTON_TEXT_REFRESH)
                  : new Text(StaticVariables.INSTRUCTIONS_BUTTON_TEXT)),
        ],
      ),
    ));
  }

  static _toggleRefresh(bool goToTabs, BuildContext context, [Function onPressRefresh = null]) {
    if(onPressRefresh != null){
      onPressRefresh();
    } else {
      DataManager.updateAll(context, true);
    }
    if (goToTabs) {
      Navigator.pushReplacementNamed(context, Routes.TabPages);
    }
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
