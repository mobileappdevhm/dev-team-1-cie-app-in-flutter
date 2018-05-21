import 'package:flutter/material.dart';


class MapPage extends StatefulWidget {
  final String apiKey;
  final Map<String, double> currentLocation;

  MapPage(this.apiKey, {this.currentLocation});

  @override
  _MapPageState createState() => new _MapPageState();
}

class _MapPageState extends State<MapPage> {
    Uri renderURL;
    static const int defaultWidth = 600;
    static const int defaultHeight = 400;
    Map<String, String> defaultLocation = {
      "latitude": '48.1549123',
      "longitude": '11.5535108'
    };

    _buildUrl() {
    var baseUri = new Uri(
      scheme: 'https',
      host: 'maps.googleapis.com',
      port: 443, 
      path: '/maps/api/staticmap',
      queryParameters: {
        'size': '${defaultWidth}x$defaultHeight',
        'center': '${defaultLocation['latitude']},${defaultLocation['longitude']}',
        'zoom': '18', 
        '${widget.apiKey}': ''
      });
      var finalUrl = baseUri;

      if (widget.currentLocation != null) {
        finalUrl = baseUri.replace(queryParameters: {
          'center': '${widget.currentLocation['latitude']},${widget.currentLocation['longitude']}',
          'zoom': '19',
          '${widget.apiKey}': '',
          'size': '${defaultWidth}x$defaultHeight',
        });
      }

    setState(() {
      renderURL = finalUrl;
    });
  }

//  @override
//  _buildUrl();

  @override
  Widget build(BuildContext context) {
    _buildUrl();
    return new Container(
      child: new FadeInImage(
        placeholder: new NetworkImage(renderURL.toString()),
        image: new NetworkImage(renderURL.toString()),
      )
    );
  }
}

