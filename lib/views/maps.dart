import 'package:cie_app/utils/analytics.dart';
import 'package:cie_app/utils/cieStyle.dart';
import 'package:cie_app/utils/staticVariables.dart';
import 'package:cie_app/utils/utility.dart';
import 'package:flutter/material.dart';

class MapPage extends StatefulWidget {
  MapPage();

  @override
  _MapPageState createState() => new _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Uri renderURL;
  static const int defaultWidth = 600;
  static const int defaultHeight = 400;
  static const String RESOURCE_KARLSTRASSE =
      StaticVariables.IMAGE_PATH + 'karlstrasse.png';
  static const String RESOURCE_LOTHSTRASSE =
      StaticVariables.IMAGE_PATH + 'lothstrasse.png';
  static const String RESOURCE_PASING =
      StaticVariables.IMAGE_PATH + 'pasing.png';
  Map<String, String> lothLocation = {
    "latitude": '48.1542593',
    "longitude": '11.5539808',
    "place_id": 'ChIJR46NWAp2nkcRzrlc_-tCycE'
  };
  Map<String, String> pasingLocation = {
    "latitude": '48.1415925',
    "longitude": '11.4501612',
    "place_id": 'ChIJt_1dCATYnUcRQWsB490oP9c'
  };
  Map<String, String> karlLocation = {
    "latitude": '48.1429336',
    "longitude": '11.5677428',
    "place_id": 'ChIJe2IFCPF1nkcRHuqVqOgDyvU'
  };

  initState() {
    super.initState();
    Analytics.setCurrentScreen("map_screen");
  }

  _getLocation(String campus) {
    switch (campus) {
      case StaticVariables.KARLSTRASSE:
        return karlLocation;
      case StaticVariables.LOTHSTRASSE:
        return lothLocation;
      case StaticVariables.PASING:
        return pasingLocation;
      default:
        return lothLocation;
    }
  }

  _launchMaps(String campus) async {
    var _mapLocation = _getLocation(campus);
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=${_mapLocation['latitude']},${_mapLocation['longitude']}&query_place_id=${_mapLocation['place_id']}';
    String appleUrl =
        'https://maps.apple.com/?sll=${_mapLocation['latitude']},${_mapLocation['longitude']}';
    Utility.tryLaunch(googleUrl, appleUrl);
  }

  Widget buildMapCard(String resource, String campus) {
    return new GestureDetector(
      onTap: () {
        _launchMaps(campus);
      },
      child: new Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 19.0 / 12.7,
              child: Image.asset(resource),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      campus,
                      style: CiEStyle.getMapsTitleStyle(),
                    ),
                    SizedBox(height: 8.0),
                    new Text(StaticVariables.MAP_CLICK_ON,
                        style: CiEStyle.getMapsDescriptionStyle())
                  ],
                )),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: <Widget>[
        buildMapCard(RESOURCE_LOTHSTRASSE, StaticVariables.LOTHSTRASSE),
        buildMapCard(RESOURCE_PASING, StaticVariables.PASING),
        buildMapCard(RESOURCE_KARLSTRASSE, StaticVariables.KARLSTRASSE),
      ],
    );
  }
}
