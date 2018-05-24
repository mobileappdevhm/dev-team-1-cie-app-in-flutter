import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
  Uri renderURL_loth;
  Uri renderURL_pasing;
  Uri renderURL_karl;
  static const int defaultWidth = 600;
  static const int defaultHeight = 400;
  static const String RESOURCE_KARLSTRASSE ='images/karlstrasse.png';
  static const String RESOURCE_LOTHSTRASSE ='images/lothstrasse.png';
  static const String RESOURCE_PASING  ='images/pasing.png';
  //child: new Image.asset('images/karlstrasse.png', fit: BoxFit.cover),
  Map<String, String> defaultLocation = {
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

  _buildUrl(String campus) {
    if (campus == 'l') {
      var baseUri = new Uri(
          scheme: 'https',
          host: 'maps.googleapis.com',
          port: 443,
          path: '/maps/api/staticmap',
          queryParameters: {
            'size': '${defaultWidth}x$defaultHeight',
            'center':
                '${defaultLocation['latitude']},${defaultLocation['longitude']}',
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

      setState(() {
        renderURL_loth = finalUrl;
      });
    } else if (campus == 'p') {
      var baseUri = new Uri(
          scheme: 'https',
          host: 'maps.googleapis.com',
          port: 443,
          path: '/maps/api/staticmap',
          queryParameters: {
            'size': '${defaultWidth}x$defaultHeight',
            'center':
                '${pasingLocation['latitude']},${pasingLocation['longitude']}',
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

      setState(() {
        renderURL_pasing = finalUrl;
      });

    } else if (campus == 'k') {
      var baseUri = new Uri(
          scheme: 'https',
          host: 'maps.googleapis.com',
          port: 443,
          path: '/maps/api/staticmap',
          queryParameters: {
            'size': '${defaultWidth}x$defaultHeight',
            'center':
                '${karlLocation['latitude']},${karlLocation['longitude']}',
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

      setState(() {
        renderURL_karl = finalUrl;
      });
    } else {
      setState(() {
        renderURL = new Uri(
            scheme: 'https',
            host: 'w3-mediapool.hm.edu',
            path:
                'mediapool/media/fk07/fk07_lokal/kontakt_4/anfahrt_lageplan/Lageplan_2009_Lothstr.jpg');
      });
    }
  }


_launchMaps_Loth() async {
  String googleUrl =
    'comgooglemaps://?center=${defaultLocation['latitude']},${defaultLocation['longitude']}';
  String appleUrl =
    'https://maps.apple.com/?sll=${defaultLocation['latitude']},${defaultLocation['longitude']}';
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

_launchMaps_Pasing() async {
  String googleUrl =
    'comgooglemaps://?center=${pasingLocation['latitude']},${pasingLocation['longitude']}';
  String appleUrl =
    'https://maps.apple.com/?sll=${pasingLocation['latitude']},${pasingLocation['longitude']}';
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

_launchMaps_Karl() async {
  String googleUrl =
    'comgooglemaps://?center=${karlLocation['latitude']},${karlLocation['longitude']}';
  String appleUrl =
    'https://maps.apple.com/?sll=${karlLocation['latitude']},${karlLocation['longitude']}';
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

  @override
  Widget build(BuildContext context) {
    _buildUrl('k');
    _buildUrl('l');
    _buildUrl('p');
    return new Scaffold(
        body: new Container(
            color: Colors.white30,
            alignment: Alignment.topCenter,
            margin: const EdgeInsets.all(10.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new RaisedButton(
                      onPressed: _launchMaps_Loth,
                      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                      child: new Text('Lothstrasse',
                          style: new TextStyle(color: Colors.white)),
                      color: const Color.fromRGBO(235, 87, 87, 1.0),
                    ),
                    new RaisedButton(
                      onPressed: _launchMaps_Pasing,
                      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                      child: new Text('Pasing',
                          style: new TextStyle(color: Colors.white)),
                      color: const Color.fromRGBO(235, 87, 87, 1.0),
                    )
                  ],
                ),
                new Container(
                  padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
                  child: new GridView.count(
                      primary: true,
                      crossAxisCount: 2,
                      childAspectRatio: 1.0,
                      shrinkWrap: true,
                      mainAxisSpacing: 20.0,
                      crossAxisSpacing: 20.0,
                      children: <String>[
                        RESOURCE_LOTHSTRASSE,
                        RESOURCE_PASING,
                        RESOURCE_KARLSTRASSE,
                      ].map((String resource) {
                        return new GridTile(
                          child: new Image.asset(resource, fit: BoxFit.cover),
                        );
                      }).toList()),
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new RaisedButton(
                      onPressed: _launchMaps_Karl,
                      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                      child: new Text('Karlstrasse',
                          style: new TextStyle(color: Colors.white)),
                      color: const Color.fromRGBO(235, 87, 87, 1.0),
                    ),
                  ],
                ),
              ],
            )));
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
