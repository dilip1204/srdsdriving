import 'dart:ui';

import 'package:flutter/material.dart';
import '../auth/Authentication.dart';
import '../signs/SignsReport.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

class Signs extends StatefulWidget {
  Signs({
    this.auth,
    this.onSignedIn,
  });
  final AuthImplementation auth;
  final VoidCallback onSignedIn;
  State<StatefulWidget> createState() {
    return _SignsState();
  }
}

class _SignsState extends State<Signs> {
  bool _isLoading = true;
  PDFDocument doc;
  String name;

  void _navigateToRoute(String name) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => SignsReport(name)));
  }

  //Design
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Signs Page"),
      ),
      body: Container(
        margin: EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                  shape: RoundedRectangleBorder(),
                  padding: EdgeInsets.only(
                      top: 7.0, bottom: 7.0, right: 40.0, left: 7.0),
                  onPressed: () =>
                      _navigateToRoute('assets/pdf/warning_signs.pdf'),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new Image.asset(
                        'assets/images/warning.png',
                        height: 40.0,
                        width: 40.0,
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: new Text(
                            "Warning Signs",
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                  textColor: Color(0xFF292929),
                  color: Colors.white10),

              RaisedButton(
                  shape: RoundedRectangleBorder(),
                  padding: EdgeInsets.only(
                      top: 7.0, bottom: 7.0, right: 40.0, left: 7.0),
                  onPressed: () =>
                      _navigateToRoute('assets/pdf/priority_signs.pdf'),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new Image.asset(
                        'assets/images/priority.png',
                        height: 40.0,
                        width: 40.0,
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: new Text(
                            "Priority Signs",
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                  textColor: Color(0xFF292929),
                  color: Colors.white10),
              RaisedButton(
                  shape: RoundedRectangleBorder(),
                  padding: EdgeInsets.only(
                      top: 7.0, bottom: 7.0, right: 40.0, left: 7.0),
                  onPressed: () =>
                      _navigateToRoute('assets/pdf/prohibitory_signs.pdf'),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new Image.asset(
                        'assets/images/prohibitory.png',
                        height: 40.0,
                        width: 40.0,
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: new Text(
                            "prohibitory Signs",
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                  textColor: Color(0xFF292929),
                  color: Colors.white10),
              RaisedButton(
                  shape: RoundedRectangleBorder(),
                  padding: EdgeInsets.only(
                      top: 7.0, bottom: 7.0, right: 40.0, left: 7.0),
                  onPressed: () =>
                      _navigateToRoute('assets/pdf/mandatory_signs.pdf'),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new Image.asset(
                        'assets/images/mandatory.png',
                        height: 40.0,
                        width: 40.0,
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: new Text(
                            "Mandatory Signs",
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                  textColor: Color(0xFF292929),
                  color: Colors.white10),
              RaisedButton(
                  shape: RoundedRectangleBorder(),
                  padding: EdgeInsets.only(
                      top: 7.0, bottom: 7.0, right: 40.0, left: 7.0),
                  onPressed: () =>
                      _navigateToRoute('assets/pdf/information_signs.pdf'),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new Image.asset(
                        'assets/images/information.png',
                        height: 40.0,
                        width: 40.0,
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: new Text(
                            "Information Signs",
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                  textColor: Color(0xFF292929),
                  color: Colors.white10),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
