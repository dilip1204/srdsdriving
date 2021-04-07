import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:srds/auth/Authentication.dart';
import 'package:srds/home/HomePage.dart';
import 'package:srds/mocktest/MockTestFifthScreen.dart';
import 'package:srds/mocktest/MockTestForthScreen.dart';
import 'package:srds/mocktest/MockTestPrimaryScreen.dart';
import 'package:srds/mocktest/MockTestSecondaryScreen.Dart';
import 'package:srds/mocktest/MockTestThirdScreen.dart';

class MockTest extends StatefulWidget {
  MockTest({
    this.auth,
    this.onSignedIn,
  });

  final AuthImplementation auth;
  final VoidCallback onSignedIn;

  @override
  State<StatefulWidget> createState() {
    return _MockTestState();
  }
}

class _MockTestState extends State<MockTest> {
  bool _isLoading = true;

  String get routeName => null;

  void _moveToPreviousPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MockTest()),
    );
  }

  void _moveToMainPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  _showAlert(BuildContext context) {
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        //_moveToTestPage1();
      },
    );

    Widget backButton = FlatButton(
      child: Text("Back"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
        _moveToMainPage();
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Test Begins"),
      content: Text(
          "Mock Up test is going to appear on screen. Be prepared to answer. Click OK to start the test or Click Back to go previous screen"),
      actions: [
        //okButton,
        // backButton,
      ],
    );

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void _moveToPrimaryTestPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MockTestPrimaryScreen()),
    );
  }

  void _moveToSecondaryTestPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MockTestSecondaryScreen()),
    );
  }

  void _moveToThirdTestPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MockTestThridScreen()),
    );
  }

  void _moveToForthTestPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MockTestForthScreen()),
    );
  }

  void _moveToFifthTestPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MockTestFifthScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          leading: new Container(),
          title: Text("MockTest Page"),
        ),
        body: Container(
            margin: EdgeInsets.all(20.0),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.red)),
                    padding: EdgeInsets.only(
                        top: 7.0, bottom: 7.0, right: 40.0, left: 7.0),
                    onPressed: _moveToPrimaryTestPage,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(
                              left: 120.0,
                              top: 1.0,
                              bottom: 4.0,
                            ),
                            child: new Text(
                              "Mock Test-1",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),
                            ))
                      ],
                    ),
                    textColor: Color(0xFF292929),
                    color: Colors.white10),
                SizedBox(height: 10),
                RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.red)),
                    padding: EdgeInsets.only(
                        top: 7.0, bottom: 7.0, right: 40.0, left: 7.0),
                    onPressed: _moveToSecondaryTestPage,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(
                                left: 120.0, top: 1.0, bottom: 4.0),
                            child: new Text(
                              "Mock Test-2",
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),
                            ))
                      ],
                    ),
                    textColor: Color(0xFF292929),
                    color: Colors.white10),
                SizedBox(height: 10),
                RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.red)),
                    padding: EdgeInsets.only(
                        top: 7.0, bottom: 7.0, right: 40.0, left: 7.0),
                    onPressed: _moveToThirdTestPage,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(
                                left: 120.0, top: 1.0, bottom: 4.0),
                            child: new Text(
                              "Mock Test-3",
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),
                            ))
                      ],
                    ),
                    textColor: Color(0xFF292929),
                    color: Colors.white10),
                SizedBox(height: 10),
                RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.red)),
                    padding: EdgeInsets.only(
                        top: 7.0, bottom: 7.0, right: 40.0, left: 7.0),
                    onPressed: _moveToForthTestPage,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(
                                left: 120.0, top: 1.0, bottom: 4.0),
                            child: new Text(
                              "Mock Test-4",
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),
                            ))
                      ],
                    ),
                    textColor: Color(0xFF292929),
                    color: Colors.white10),
                SizedBox(height: 10),
                RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.red)),
                    padding: EdgeInsets.only(
                        top: 7.0, bottom: 7.0, right: 40.0, left: 7.0),
                    onPressed: _moveToFifthTestPage,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(
                                left: 120.0, top: 1.0, bottom: 4.0),
                            child: new Text(
                              "Mock Test-5",
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),
                            ))
                      ],
                    ),
                    textColor: Color(0xFF292929),
                    color: Colors.white10),
                SizedBox(height: 10),
                RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.red)),
                    padding: EdgeInsets.only(
                        top: 7.0, bottom: 7.0, right: 40.0, left: 7.0),
                    onPressed: _moveToMainPage,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(
                                left: 156.0, top: 1.0, bottom: 4.0),
                            child: new Text(
                              "Exit",
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),
                            ))
                      ],
                    ),
                    textColor: Color(0xFF292929),
                    color: Colors.red),
              ],
            ))),
      ),
    );
  }
}
