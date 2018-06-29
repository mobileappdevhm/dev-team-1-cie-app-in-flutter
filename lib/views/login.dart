import 'dart:convert';

import 'package:cie_team1/generic/genericAlert.dart';
import 'package:cie_team1/model/login/loginData.dart';
import 'package:cie_team1/model/user/user.dart';
import 'package:cie_team1/utils/analytics.dart';
import 'package:cie_team1/utils/cieColor.dart';
import 'package:cie_team1/utils/cieStyle.dart';
import 'package:cie_team1/utils/fileStore.dart';
import 'package:cie_team1/utils/nineAPIConsumer.dart';
import 'package:cie_team1/utils/routes.dart';
import 'package:cie_team1/utils/staticVariables.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key key}) : super(key: key);

  @override
  LoginFormState createState() => new LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  LoginFormState();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final usernameController = new TextEditingController();
  final passwordController = new TextEditingController();

  LoginData loginData = new LoginData();

  @override
  initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _openMetricDialog(context));
  }

  void _openMetricDialog(BuildContext context) {
    var no = () {
      Analytics.setAnalytics(false);
    };
    var yes = () {
      Analytics.setAnalytics(true);
    };

    GenericAlert.confirm(
        context,
        no,
        yes,
        "We are collecting anonymous user data to check which views and features are mainly used. Please decide if you want to allow this.",
        "It's ok!",
        "I don't want this!");

    Analytics.setCurrentScreen("login_screen");
  }

  void showInSnackBar(String value) {
    _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(value)));
  }

  bool _formWasEdited = false;
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final GlobalKey<FormFieldState<String>> _passwordFieldKey =
      new GlobalKey<FormFieldState<String>>();

  void _handleSubmitted() async {
    final FormState form = _formKey.currentState;

    if (form.validate() && _formWasEdited) {
      form.save();
      //do api call ------------------------
      final String username = usernameController.text;
      final String password = passwordController.text;

      try {
        NineAPIEngine.postAuth(context, username, password).then((response) {
          if (response == null) {
            GenericAlert.confirmDialog(context, 'No Internet connection',
                'It seems, that you have no internet connection. Please check and try again!');
          } else if (response.statusCode != 200) {
            GenericAlert.confirmDialog(context, 'Bad response',
                'Something went wrong. Please double check your credentials and try again!');
          } else {
            var jsonData = json.decode(response.body);
            if (jsonData['user'] == null) {
              GenericAlert.confirmDialog(context, 'Unvalid credentials',
                  'Please provide valid credentials (email & password) before submitting.');
            } else if (jsonData['curriculum'] == null) {
              //no curriculum was set by the user -> user can login but lottery should not be available
              updateUserSettings(context, jsonData['user']['firstName'],
                  jsonData['user']['lastName'], null);
              Analytics.logLogin();
            } else {
              updateUserSettings(
                  context,
                  jsonData['user']['firstName'],
                  jsonData['user']['lastName'],
                  jsonData['curriculum']['organiser']['name']);
              Analytics.logLogin();
            }
          }
        });
      } catch (_) {
        //TODO do error relevant things down here
        showInSnackBar("Some errors occured, please try again.");
      }
      //---------------------------
    } else {
      GenericAlert.confirmDialog(context, 'Unvalid credentials',
          'Please provide valid credentials (email & password) before submitting.');
    }
  }

  void _handleGuestLogin() {
    updateUserSettings(context, null, null, null);
    Analytics.logEvent("guest_login");
  }

  String validateMail(String value) {
    _formWasEdited = true;
    if (value.isEmpty) return 'Mail is required.';
    final RegExp mailExp = new RegExp(
        r"^((([a-z]|\d|[!#$%&'*+-/=?^_`{|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#$%&'*+\-/=?^_`{|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$");
    if (!mailExp.hasMatch(value)) return 'Please enter a valid e-mail address.';
    return null;
  }

  String validatePassword(String value) {
    _formWasEdited = true;
    if (value.isEmpty) return 'Password is required.';
    if (value.length < 8) return 'Password does not match requirements.';
    return null;
  }

  _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw ('Could not launch url $url');
    }
  }

  @override
  Widget build(BuildContext context) => new Scaffold(
        key: _scaffoldKey,
        body: new Container(
          child: new SafeArea(
            top: false,
            bottom: false,
            child: new Form(
              key: _formKey,
              autovalidate: false,
              child: new ListView(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 25.0),
                children: <Widget>[
                  new Image.asset(StaticVariables.IMAGE_PATH + 'hm_logo.png'),
                  new Padding(padding: const EdgeInsets.only(top: 20.0)),
                  new Text(
                    "Courses in English",
                    style: new TextStyle(
                        fontSize: 20.0,
                        color: CiEColor.red,
                        letterSpacing: 2.0),
                    textAlign: TextAlign.center,
                  ),
                  new Padding(padding: const EdgeInsets.only(top: 20.0)),
                  new TextFormField(
                    controller: usernameController,
                    decoration: const InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'E-Mail',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (String value) {
                      loginData.email = value;
                    },
                    validator: validateMail,
                  ),
                  new Padding(padding: const EdgeInsets.only(top: 20.0)),
                  new TextFormField(
                    controller: passwordController,
                    key: _passwordFieldKey,
                    decoration: const InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                    obscureText: true,
                    onSaved: (String value) {
                      loginData.password = value;
                    },
                    validator: validatePassword,
                  ),
                  new Container(
                    padding: const EdgeInsets.fromLTRB(25.0, 20.0, 25.0, 5.0),
                    child: new FlatButton(
                      color: CiEStyle.getLogoutButtonColor(),
                      shape: new RoundedRectangleBorder(
                          borderRadius: CiEStyle.getButtonBorderRadius()),
                      onPressed: _handleSubmitted,
                      child: new Text(
                        'LOGIN',
                        style: new TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  new FlatButton(
                    onPressed: () =>
                        _launchUrl("https://nine.wi.hm.edu/Account/Register"),
                    child: new Text(
                      "Don't have an Account?",
                      style: new TextStyle(color: CiEColor.red),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  new Container(
                    padding: const EdgeInsets.fromLTRB(25.0, 5.0, 25.0, 5.0),
                    child: new FlatButton(
                      color: CiEColor.red,
                      shape: new RoundedRectangleBorder(
                          borderRadius: CiEStyle.getButtonBorderRadius()),
                      onPressed: _handleGuestLogin,
                      child: new Text(
                        'Login as Guest',
                        style: new TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  new FlatButton(
                    onPressed: () => _launchUrl(
                        "https://nine.wi.hm.edu/Account/ForgotPassword"),
                    child: new Text(
                      "Forgot your password?",
                      style: new TextStyle(color: CiEColor.red),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  @override
  void dispose() {
    super.dispose();
    // Clean up the controller when the Widget is disposed
    usernameController.dispose();
    passwordController.dispose();
  }

  void updateUserSettings(BuildContext context, String firstName,
      String lastName, dynamic curriculum) {
    bool isLoggedIn = false;
    UserBuilder builder;
    if (firstName != null && lastName != null) {
      isLoggedIn = true;
      Analytics.setUserProperty("curriculum", curriculum);
    } else {
      // Continuing As Guest
      firstName = StaticVariables.GUEST_FIRST_NAME;
      lastName = StaticVariables.GUEST_LAST_NAME;
      curriculum = StaticVariables.GUEST_DEPARTMENT;
    }

    FileStore.readFileAsString(FileStore.USER_SETTINGS).then((String val) {
      if (val != null && val.isNotEmpty) {
        dynamic settings = json.decode(val);
        builder = UserBuilder.fromJson(settings);
      } else {
        builder = new UserBuilder();
      }

      User tempUserObj = builder
          .withFirstName(firstName)
          .withLastName(lastName)
          .withDepartment(curriculum)
          .withIsLoggedIn(isLoggedIn)
          .withIsMetricsEnabled(Analytics.getAnalytics())
          .build();

      String data = json.encode(User.toJson(tempUserObj));
      FileStore.writeToFile(FileStore.USER_SETTINGS, data).then((f) {
        Navigator.of(context).pushReplacementNamed(Routes.TabPages);
      });
    });
  }
}
