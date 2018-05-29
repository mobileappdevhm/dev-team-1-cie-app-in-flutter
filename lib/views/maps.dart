import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cie_team1/utils/cieStyle.dart';
import 'package:cie_team1/utils/staticVariables.dart';

class MapPage extends StatefulWidget {
  final String apiKey = 'AIzaSyAUIZOyUTUX4WWANlK-70eg8ixCqxWp9us';

  MapPage();

  @override
  _MapPageState createState() => new _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Uri renderURL;
  static const int defaultWidth = 600;
  static const int defaultHeight = 400;
  static const String RESOURCE_KARLSTRASSE = StaticVariables.IMAGE_PATH + 'karlstrasse.png';
  static const String RESOURCE_LOTHSTRASSE = StaticVariables.IMAGE_PATH + 'lothstrasse.png';
  static const String RESOURCE_PASING  = StaticVariables.IMAGE_PATH + 'pasing.png';
  Map<String, String> lothLocation = {
    "latitude": '48.1542593',
    "longitude": '11.5539808'
  };
  Map<String, String> pasingLocation = {
    "latitude": '48.1415925',
    "longitude": '11.4501612'
  };
  Map<String, String> karlLocation = {
    "latitude": '48.1429336',
    "longitude": '11.5677428'
  };

  _buildUri(String campus) {
      var baseUri = new Uri(
          scheme: 'https',
          host: 'maps.googleapis.com',
          port: 443,
          path: '/maps/api/staticmap',
          queryParameters: {
            'size': '${defaultWidth}x$defaultHeight',
            'center':
                '${_getCoordinates(campus)['latitude']},${_getCoordinates(campus)['longitude']}',
            'zoom': '18',
            '${widget.apiKey}': ''
          });
      var finalUrl = baseUri;
  }

  _getCoordinates(String campus) {
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
    String googleUrl =
    'comgooglemaps://?center=${_getCoordinates(campus)['latitude']},${_getCoordinates(campus)['longitude']}';
    String appleUrl =
      'https://maps.apple.com/?sll=${_getCoordinates(campus)['latitude']},${_getCoordinates(campus)['longitude']}';
    if (await canLaunch("comgooglemaps://")) {
      print('launching googleUrl');
      await launch(googleUrl);
    } else if (await canLaunch(appleUrl)) {
      print('launching apple url');
      await launch(appleUrl);
    } else {
      throw 'Could not launch url';
    }
  }

  Widget buildMapCard(String resource, String campus) {
    return new GestureDetector(
        onTap: (){
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
                  Text(campus, style: CiEStyle.getMapsTitleStyle(),),
                  SizedBox(height: 8.0),
                  Text('Click on the map to get directions.', style: CiEStyle.getMapsDescriptionStyle())
              ],
            )
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _buildUri(StaticVariables.KARLSTRASSE);
    _buildUri(StaticVariables.LOTHSTRASSE);
    _buildUri(StaticVariables.PASING);
    return new ListView(
      children: <Widget>[
//        new Container(
//          padding: new EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
//          child: new Text(StaticVariables.message, textAlign: TextAlign.left, style: CiEStyle.getMapsDescriptionStyle()),
//      ),
        buildMapCard(RESOURCE_LOTHSTRASSE, StaticVariables.LOTHSTRASSE),
        buildMapCard(RESOURCE_PASING, StaticVariables.PASING),
        buildMapCard(RESOURCE_KARLSTRASSE, StaticVariables.KARLSTRASSE),
    ],
    );
  }
}

/*
  Location _location = new Location();
  dynamic deviceLocation;
  Future<Null> findUserLocation() async {
    Map<String, double> location;
    try {
      location = await _location.getLocation;
      setState(() {
        deviceLocation = location;
      });
    } catch (e) {
      location = null;
    }
  }
*/
