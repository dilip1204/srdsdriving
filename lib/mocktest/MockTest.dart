import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:srds/auth/Authentication.dart';
import 'package:srds/mocktest/MockTestScreen1.dart';


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

//void _moveToTestPage2() {
// Navigator.push(
//  context,
//  MaterialPageRoute(builder: (context) => Signs()),
//);
//}

class _MockTestState extends State<MockTest> {

  String get routeName => null;

  void _moveToPreviousPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MockTest()),
    );
  }

  _showAlert(BuildContext context) {
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        _moveToTestPage1();
      },
    );

    Widget backButton = FlatButton(
      child: Text("Back"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
        _moveToPreviousPage();
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Test Begins"),
      content: Text(
          "Mock Up test is going to appear on screen. Be prepared to answer. Click OK to start the test or Click Back to go previous screen"),
      actions: [
        okButton,
        backButton,
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

  void _moveToTestPage1() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MockTestScreen1()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MockTest Page"),
      ),
      body: Container(
          margin: EdgeInsets.all(20.0),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                  shape: RoundedRectangleBorder(),
                  padding: EdgeInsets.only(
                      top: 7.0, bottom: 7.0, right: 40.0, left: 7.0),
                  onPressed: _moveToTestPage1,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(
                            left: 95.0,
                            top: 1.0,
                            bottom: 4.0,
                          ),
                          child: new Text(
                            "Mock Test-1",
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                  textColor: Color(0xFF292929),
                  color: Colors.white10),
              RaisedButton(
                  shape: RoundedRectangleBorder(),
                  padding: EdgeInsets.only(
                      top: 7.0, bottom: 7.0, right: 40.0, left: 7.0),
                  onPressed: null,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(
                              left: 95.0, top: 1.0, bottom: 4.0),
                          child: new Text(
                            "Mock Test-2",
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                  textColor: Color(0xFF292929),
                  color: Colors.white10),
            ],
          ))),
    );
  }
}
