import 'package:cie_team1/model/login/loginData.dart';
import 'package:cie_team1/utils/routes.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key key}) : super(key: key);

  @override
  LoginFormState createState() => new LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  LoginData loginData = new LoginData();

  bool _loggedIn = false;

  void showInSnackBar(String value) {
    _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(value)));
  }

  bool _autoValidate = false;
  bool _formWasEdited = false;
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final GlobalKey<FormFieldState<String>> _passwordFieldKey =
      new GlobalKey<FormFieldState<String>>();

  void _handleSubmitted() async {
    //TODO remove the line below and use the comments to activate form validation
    Navigator.of(context).pushReplacementNamed(Routes.TabPages);
    //
    //final FormState form = _formKey.currentState;
    //if (!form.validate()) {
    //  _autoValidate = true; // Start validating on every change.
    //  showInSnackBar('Please fix the errors in red before submitting.');
    //} else {
    //  form.save();
//
    //  setState(() {
    //    _loggedIn = true;
    //  });
//
    //  Navigator.of(context).pushReplacementNamed(Routes.TabPages);
    //}
  }

  String _validateMail(String value) {
    _formWasEdited = true;
    //TODO remove the line below and use the comments to activate form validation
    return null;
    //if (value.isEmpty) return 'Mail is required.';
    //final RegExp mailExp = new RegExp(
    //    r"^((([a-z]|\d|[!#$%&'*+-/=?^_`{|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#$%&'*+\-/=?^_`{|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$");
    //if (!mailExp.hasMatch(value)) return 'Please enter a valid e-mail address.';
    //return null;
  }

  String _validatePassword(String value) {
    _formWasEdited = true;
    //TODO remove the line below and use the comments to activate form validation
    return null;
    //if (value.isEmpty) return 'Password is required.';
    //if (value.length < 8) return 'Password is to short.';
    //return null;
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
              autovalidate: _autoValidate,
              child: new ListView(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 25.0),
                children: <Widget>[
                  new Image.asset('images/hm_logo.png'),
                  new Padding(padding: const EdgeInsets.only(top: 25.0)),
                  new Text(
                    "Courses in English",
                    style: new TextStyle(color: Colors.red, fontSize: 30.0),
                    textAlign: TextAlign.center,
                  ),
                  new Padding(padding: const EdgeInsets.only(top: 25.0)),
                  new TextFormField(
                    decoration: const InputDecoration(
                      fillColor: const Color.fromRGBO(224, 224, 224, 1.0),
                      filled: true,
                      border: InputBorder.none,
                      labelText: 'E-mail',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (String value) {
                      loginData.email = value;
                    },
                    //initialValue: Storage.getEmail(),
                    validator: _validateMail,
                  ),
                  new Padding(padding: const EdgeInsets.only(top: 25.0)),
                  new TextFormField(
                    key: _passwordFieldKey,
                    decoration: const InputDecoration(
                      fillColor: const Color.fromRGBO(224, 224, 224, 1.0),
                      filled: true,
                      border: InputBorder.none,
                      labelText: 'Password',
                    ),
                    obscureText: true,
                    onSaved: (String value) {
                      loginData.password = value;
                    },
                    //initialValue: Storage.getPassword(),
                    validator: _validatePassword,
                  ),
                  new Container(
                    padding:
                        const EdgeInsets.fromLTRB(125.0, 25.0, 125.0, 25.0),
                    child: new FlatButton(
                      color: Colors.red,
                      onPressed: _handleSubmitted,
                      child: new Text(
                        'Login',
                        style: new TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  new Text(
                    "Don't have an Account?",
                    style: new TextStyle(
                        color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                  new Text(
                    "Sign up!",
                    style: new TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  new Text(
                    "Forgot your password?",
                    style: new TextStyle(
                        color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
