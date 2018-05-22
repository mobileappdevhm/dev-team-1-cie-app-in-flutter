import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

class MapPage extends StatefulWidget {
  final String apiKey;
  final Map<String, double> currentLocation;

  MapPage(this.apiKey, {this.currentLocation});

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


_launchMaps() async {
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
        appBar: new AppBar(
          title: new Text('Maps',
              style: new TextStyle(
                  color: const Color.fromRGBO(235, 87, 87, 1.0),
                  letterSpacing: 2.0)),
          backgroundColor: const Color.fromRGBO(224, 224, 224, 1.0),
        ),
        body: new Container(
            color: Colors.white30,
            alignment: Alignment.topCenter,
            margin: const EdgeInsets.all(10.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    new RaisedButton(
                      onPressed: _launchMaps,
                      child: new Text('Lothstrasse',
                          style: new TextStyle(color: Colors.white)),
                      color: const Color.fromRGBO(235, 87, 87, 1.0),
                    ),
                    new RaisedButton(
                      onPressed: _launchMaps,
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
                        renderURL_loth.toString(),
                        renderURL_pasing.toString(),
                        renderURL_karl.toString(),
                      ].map((String url) {
                        return new GridTile(
                          child: new Image.network(url, fit: BoxFit.cover),
                        );
                      }).toList()),
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    new RaisedButton(
                      onPressed: _launchMaps,
                      child: new Text('Karlstrasse',
                          style: new TextStyle(color: Colors.white)),
                      color: const Color.fromRGBO(235, 87, 87, 1.0),
                    ),
                    new RaisedButton(
                      onPressed: _launchMaps,
                      child: new Text('Go to Google Maps',
                          style: new TextStyle(color: Colors.white)),
                      color: const Color.fromRGBO(235, 87, 87, 1.0),
                    )
                  ],
                ),
              ],
            )));
  }
}
