import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cie_team1/utils/cieStyle.dart';
import 'package:cie_team1/utils/staticVariables.dart';

class MapPage extends StatefulWidget {
  final String apiKey = 'AIzaSyAUIZOyUTUX4WWANlK-70eg8ixCqxWp9us';
  final Map<String, double> currentLocation = null;

  MapPage();
  //MapPage(this.apiKey, {this.currentLocation});

  @override
  _MapPageState createState() => new _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Uri renderURL;
  static const int defaultWidth = 600;
  static const int defaultHeight = 400;
  static const String RESOURCE_KARLSTRASSE ='images/karlstrasse.png';
  static const String RESOURCE_LOTHSTRASSE ='images/lothstrasse.png';
  static const String RESOURCE_PASING  ='images/pasing.png';
  Map<String, String> lothLocation = {
    "latitude": '48.1549123',
    "longitude": '11.5535108'
  };
  Map<String, String> pasingLocation = {
    "latitude": '48.1415132',
    "longitude": '11.4507926'
  };
  Map<String, String> karlLocation = {
    "latitude": '48.1428538',
    "longitude": '11.568344'
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
      if (widget.currentLocation != null) {
        finalUrl = baseUri.replace(queryParameters: {
          'center':
              '${widget.currentLocation['latitude']},${widget.currentLocation['longitude']}',
          'zoom': '19',
          '${widget.apiKey}': '',
          'size': '${defaultWidth}x$defaultHeight',
        });
      }
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
        // TODO: Decide if it makes sense to default to this
        return lothLocation;
    }
  }

  _launchMaps(String campus) async {
    String googleUrl =
    'comgooglemaps://?center=${_getCoordinates(campus)['latitude']},${_getCoordinates(campus)['longitude']}';
    String appleUrl =
      'https://maps.apple.com/?sll=${_getCoordinates(campus)['latitude']},${_getCoordinates(campus)['longitude']}';
    if (await canLaunch("comgooglemaps://")) {
      print('launching com googleUrl');
      await launch(googleUrl);
    } else if (await canLaunch(appleUrl)) {
      print('launching apple url');
      await launch(appleUrl);
    } else {
      throw 'Could not launch url';
    }
  }

  Widget buildMapItem(String resource, String campus) {
    return new GestureDetector(
        onTap: (){
          _launchMaps(campus);
        },
    child: new Container(
      decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage(resource),
            fit: BoxFit.cover,
          ),
          //image: new Image.asset(resource, fit: BoxFit.cover),
          border: new Border(
              top: new BorderSide(color: Colors.grey, width: 1.0),
              right: new BorderSide(color: Colors.grey, width: 1.0),
              bottom: new BorderSide(color: Colors.grey,  width: 1.0),
              left: new BorderSide(color: Colors.grey, width: 1.0)),
      ),
      margin: new EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
      height: 125.0,
      alignment: Alignment.center,
      child: new Text(campus, style: CiEStyle.getMapsTitleStyle()),
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
        new Container(
          padding: new EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
          child: new Text(StaticVariables.message, textAlign: TextAlign.left, style: CiEStyle.getMapsDescriptionStyle()),
      ),
        buildMapItem(RESOURCE_LOTHSTRASSE, StaticVariables.LOTHSTRASSE),
        buildMapItem(RESOURCE_PASING, StaticVariables.PASING),
        buildMapItem(RESOURCE_KARLSTRASSE, StaticVariables.KARLSTRASSE),
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
