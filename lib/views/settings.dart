import 'package:flutter/material.dart';
import 'package:cie_team1/utils/cieStyle.dart';




class Settings extends StatefulWidget {
  Settings({Key key, this.title}) : super(key: key);
  final String title;


  @override
  _SettingsState createState() => new _SettingsState();
}

class _SettingsState extends State<Settings> {
  /* Get these two from somewhere */
  final credits = 13;
  final engCredits = 6;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Padding(
          padding: const EdgeInsets.all(16.0),

          child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Row(
                  children: <Widget>[
                    new Expanded(
                      child: new Text("-Pic here-"),
                    ),
                    new Column(
                      children: <Widget>[
                        new Container(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: new Row(
                            children: <Widget>[
                              new Text(
                                'Logged in as ',
                                style: CiEStyle.getSettingsStyle(),
                              ),
                              new Text(
                                ' Jane Doe',
                                style: CiEStyle.getSettingsUserNameStyle(),
                              ),
                            ],
                          )
                        ),

                        new RaisedButton(
                          onPressed: null,
                          shape: new RoundedRectangleBorder(borderRadius: CiEStyle.getButtonBorderRadius()),
                          color: CiEStyle.getLogoutButtonColor() ,
                          child: new Text("Log out", style: CiEStyle.getSettingsLogoutStyle(),),

                        ),

                      ],
                    )
                  ],
                ),



              new Container(
                padding: const EdgeInsets.only(top:16.0),
                child: new Column(
                  children: <Widget>[
                    new Row(
                      children: <Widget>[
                        new Icon(Icons.mail_outline),
                        new Text(" Contact International Office", style: CiEStyle.getSettingsContactStyle(),),
                      ],
                    ),
                    new Divider(),
                  ],
                  )
                ),





              new Container(
                padding: const EdgeInsets.only(top:16.0,bottom: 16.0),
                child: new Row(
                    children: <Widget>[
                      new Expanded(child: new Text("Courses in English Certificate", style: CiEStyle.getSettingsStyle(),)),
                      new Text( "$credits /15" ,  style: CiEStyle.getSettingsStyle()),
                      // Calculate ECTS/15 !! but one of the courses need to be from department 13
                    ]

                ),
              ),
              new LinearProgressIndicator(value: credits/15),


              new Container(
                padding: const EdgeInsets.only(top:20.0,bottom: 16.0),
                child: new Row(
                    children: <Widget>[
                      new Expanded(child: new Text("International Engineering Certificate",  style: CiEStyle.getSettingsStyle())),
                      new Text( "$engCredits /15",  style: CiEStyle.getSettingsStyle()),
                      // Calculate max (ECTS of each engineering departments (mechanical, automotive, aeroautical))/15 with at least 2 ects from dep. 13
                    ]

                ),
              ),
              new LinearProgressIndicator(value: engCredits /15),


              new Container(
                padding: const EdgeInsets.only(top:32.0,bottom: 16.0),
                child: new Row(
                  children: <Widget>[
                    new Expanded(child:  new Text("Taken Courses", style: CiEStyle.getSettingsStyle() )),
                    new Icon(Icons.arrow_drop_down),
                   
                  ],
                ),

              )

              /* Get a List of courses enrolled.*/








            ],
          ),
        ),

      ),
    );


  }
}
