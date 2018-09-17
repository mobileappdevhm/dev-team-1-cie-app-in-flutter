import 'package:cie_app/views/login.dart';
import 'package:cie_app/views/start.dart';
import 'package:cie_app/views/tabs.dart';
import 'package:flutter/widgets.dart';

class Routes {
  static const String Welcome = '/welcome';
  static const String Login = '/login';
  static const String TabPages = '/tabPages';

  static Map<String, WidgetBuilder> getRoutes() {
    return <String, WidgetBuilder>{
      Routes.Login: (BuildContext context) => new LoginForm(),
      Routes.Welcome: (BuildContext context) => new WelcomePage(),
      Routes.TabPages: (BuildContext context) => new TabsPage(),
    };
  }
}
