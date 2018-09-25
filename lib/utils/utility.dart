import 'package:url_launcher/url_launcher.dart';

class Utility {
  static void tryLaunch(String url, [String url2 = ""]) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else if (url2 != "" && await canLaunch(url2)) {
      await launch(url2);
    } else {
      throw 'Could not launch $url';
    }
  }
}
