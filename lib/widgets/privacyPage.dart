import 'package:cie_team1/utils/cieColor.dart';
import 'package:flutter/material.dart';
import 'package:cie_team1/utils/cieStyle.dart';

class PrivacyPage extends StatefulWidget {
  PrivacyPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _PrivacyPageState createState() => new _PrivacyPageState();
}

class _PrivacyPageState extends State<PrivacyPage> {
  @override
  Widget build(BuildContext context) {
    double iconSize = CiEStyle.getCourseDescriptionIconSize();

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Privacy Policy",
          style: CiEStyle.getAppBarTitleStyle(context),
        ),
        elevation: CiEStyle.getAppBarElevation(context),
        backgroundColor: CiEColor.lightGray,
      ),
      body: new Center(
        child: new Padding(
          padding: const EdgeInsets.all(25.0),
          child: new Column(
            children: <Widget>[
              new Expanded(
                child: new Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: new Text(
                      privacyText,
                      style: new TextStyle(fontSize: 15.0),
                    )),
              ),
              new Row(
                children: <Widget>[
                  new Expanded(
                    child: new Column(
                      children: <Widget>[
                        new Padding(
                          padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                          child: new Row(
                            children: <Widget>[
                              new Icon(
                                const IconData(0xe0e1,
                                    fontFamily: 'MaterialIcons'),
                                size: 30.0,
                              ),
                              new Text(
                                "Contact",
                                style: new TextStyle(fontSize: 17.0),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  final String privacyText = "Diese Datenschutzerklärung klärt Sie über die Art, den Umfang und Zweck der Verarbeitung von personenbezogenen Daten (nachfolgend kurz „Daten“) innerhalb unseres Onlineangebotes und der mit ihm verbundenen Webseiten, Funktionen und Inhalte sowie externen Onlinepräsenzen, wie z.B. unser Social Media Profile auf (nachfolgend gemeinsam bezeichnet als „Onlineangebot“). Im Hinblick auf die verwendeten Begrifflichkeiten, wie z.B. „Verarbeitung“ oder „Verantwortlicher“ verweisen wir auf die Definitionen im Art. 4 der Datenschutzgrundverordnung (DSGVO)";

}