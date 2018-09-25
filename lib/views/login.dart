import 'dart:convert';

import 'package:cie_app/generic/genericAlert.dart';
import 'package:cie_app/model/login/loginData.dart';
import 'package:cie_app/model/user/user.dart';
import 'package:cie_app/utils/analytics.dart';
import 'package:cie_app/utils/cieColor.dart';
import 'package:cie_app/utils/cieStyle.dart';
import 'package:cie_app/utils/dataManager.dart';
import 'package:cie_app/utils/routes.dart';
import 'package:cie_app/utils/staticVariables.dart';
import 'package:cie_app/utils/utility.dart';
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
        StaticVariables.ALERT_METRICS_MESSAGE,
        StaticVariables.ALERT_ALLOW,
        StaticVariables.ALERT_DISABLE);

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
        DataManager.postJson(context, DataManager.REMOTE_AUTH,
            {"username": username, "password": password}).then((response) {
          if (response == null) {
            GenericAlert.confirmDialog(context, StaticVariables.LOGIN_ERROR_TITLE_NO_INTERNET_CONNECTION,
                StaticVariables.LOGIN_ERROR_NO_INTERNET_CONNECTION);
          } else if (response.statusCode != 200) {
            GenericAlert.confirmDialog(context, StaticVariables.LOGIN_ERROR_TITLE_BAD_RESPONSE,
                StaticVariables.LOGIN_ERROR_BAD_RESPONSE);
          } else {
            var jsonData = json.decode(response.body);
            if (jsonData['user'] == null) {
              GenericAlert.confirmDialog(context, StaticVariables.LOGIN_ERROR_TITLE_INVALID_CREDENTIALS,
                  StaticVariables.LOGIN_ERROR_INVALID_CREDENTIALS);
            } else if (jsonData['curriculum'] == null) {
              //no curriculum was set by the user -> user can login but lottery should not be available
              updateUserSettings(context, jsonData['user']['firstName'],
                  jsonData['user']['lastName'], jsonData['user']['id'], null);
              Analytics.logLogin();
            } else {
              updateUserSettings(
                  context,
                  jsonData['user']['firstName'],
                  jsonData['user']['lastName'],
                  jsonData['user']['id'],
                  jsonData['curriculum']['organiser']['name']);
              Analytics.logLogin();
            }
          }
        });
      } catch (_) {
        showInSnackBar(StaticVariables.LOGIN_ERROR_UNKNOWN);
      }
      //---------------------------
    } else {
      GenericAlert.confirmDialog(context, StaticVariables.LOGIN_ERROR_TITLE_INVALID_CREDENTIALS,
          StaticVariables.LOGIN_ERROR_INVALID_CREDENTIALS);
    }
  }

  void _handleGuestLogin() {
    updateUserSettings(context, null, null, null, null);
    Analytics.logEvent("guest_login");
  }

  String validateMail(String value) {
    _formWasEdited = true;
    if (value.isEmpty) return StaticVariables.LOGIN_ERROR_REQUIRED_MAIL;
    final RegExp mailExp = new RegExp(
        r"^((([a-z]|\d|[!#$%&'*+-/=?^_`{|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#$%&'*+\-/=?^_`{|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$");
    if (!mailExp.hasMatch(value)) return StaticVariables.LOGIN_ERROR_INVALID_MAIL;
    return null;
  }

  String validatePassword(String value) {
    _formWasEdited = true;
    if (value.isEmpty) return StaticVariables.LOGIN_ERROR_REQUIRED_PASSWORD;
    if (value.length < 8) return StaticVariables.LOGIN_ERROR_INVALID_PASSWORD;
    return null;
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
                    StaticVariables.COURSES_IN_ENGLISH,
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
                      labelText: StaticVariables.LOGIN_LABEL_MAIL,
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
                      labelText: StaticVariables.LOGIN_LABEL_PASSWORD,
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
                        StaticVariables.LOGIN_BUTTON,
                        style: new TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  new FlatButton(
                    onPressed: () =>
                        Utility.tryLaunch(DataManager.REMOTE_REGISTER),
                    child: new Text(
                      StaticVariables.LOGIN_BUTTON_NO_ACCOUNT,
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
                        StaticVariables.LOGIN_BUTTON_GUEST,
                        style: new TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  new FlatButton(
                    onPressed: () => Utility.tryLaunch(
                        DataManager.REMOTE_FORGOT_PASSWORD),
                    child: new Text(
                      StaticVariables.LOGIN_BUTTON_FORGOT_PASSWORD,
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
      String lastName, String id, dynamic curriculum) {
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

    DataManager.getResource(DataManager.LOCAL_USER_SETTINGS).then((String val) {
      if (val != null && val.isNotEmpty) {
        dynamic settings = json.decode(val);
        builder = UserBuilder.fromJson(settings);
      } else {
        builder = new UserBuilder();
      }

      User tempUserObj = builder
          .withID(id)
          .withFirstName(firstName)
          .withLastName(lastName)
          .withDepartment(curriculum)
          .withIsLoggedIn(isLoggedIn)
          .withIsMetricsEnabled(Analytics.getAnalytics())
          .build();

      String data = json.encode(User.toJson(tempUserObj));
      DataManager.writeToFile(DataManager.LOCAL_USER_SETTINGS, data).then((f) {
        Navigator.of(context).pushReplacementNamed(Routes.TabPages);
      });
    });
  }
}
