import 'dart:ui';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:srds/auth/Authentication.dart';
import 'package:srds/mocktest/MockTest.dart';


class MockTestScreen1 extends StatefulWidget {
  MockTestScreen1({
    this.auth,
    this.onSignedIn,
  });
  final AuthImplementation auth;
  final VoidCallback onSignedIn;
  @override
  State<StatefulWidget> createState() {
    return _MockTestScreen1State();
  }
}

class _MockTestScreen1State extends State<MockTestScreen1> {
  @override
  Random random = new Random();
  var _indexQuestion = 0;
  var questionCount = 0;
  var mark = 0;
  var clickCount = 0;
  var wrong = 0;
  TextEditingController _c;
  String _text = "initial";
  bool buttonStatus = false;
  bool answerStatus = false;

  void _moveToPreviousPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MockTest()),
    );
  }

  var _questions = [
    'What is Wi-Fi',
    'What is Mobile',
    'What is A',
    'What is B',
    'What is C',
    'What is D'
  ];
  var _answers = [
    ['Mobile signal'],
    ['Cell Phone'],
    ['A'],
    ['B'],
    ['C'],
    ['D']
  ];
  var _dummies = [
    ['Just check', 'rock', 'Mobile signal', 'object'],
    ['lock', 'Cell Phone', 'plane', 'boat'],
    ['C', 'A', 'D', 'B'],
    ['B', 'D', 'A', 'C'],
    ['A', 'A', 'D', 'C'],
    ['B', 'A', 'D', 'C']
  ];

  _check(String ans, int questionNumber) {
    setState(() {
      // ignore: unrelated_type_equality_checks
      if (_answers[questionNumber].contains(ans)) {
        mark++;
        answerStatus = true;
        if (mark >= 10) {}
      } else {
        wrong++;
        answerStatus = false;
      }
      questionCount++;
    });
  }

  _showAlert(BuildContext context) {
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    Widget backButton = FlatButton(
      child: Text("Back"),
      onPressed: () {
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
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  _next() {
    setState(() {
      var lastIndex = _questions.length - 1;
      if (_indexQuestion < lastIndex) {
        _indexQuestion++;
      } else {
        // Is the last question
        _moveToPreviousPage();
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(_questions[_indexQuestion]),
              for (var answers in _dummies[_indexQuestion])
                RaisedButton(
                  shape: RoundedRectangleBorder(),
                  padding: EdgeInsets.only(
                      top: 15.0, bottom: 10.0, right: 40.0, left: 15.0),
                  child: Text(answers),
                  color: Colors.white,
                  splashColor: answerStatus ? Colors.green : Colors.red,
                  onPressed: () => {
                    _check(answers, _indexQuestion),
                    this.deactivate(),
                    WidgetSpan(
                      child: Icon(Icons.add, size: 14),
                    ),
                    setState(() => !answerStatus),
                    Row(children: <Widget>[
                      Text("Hi"),
                      Icon(Icons.add),
                      Text("GTR")
                    ]),
                    _next(),
                  },
                ),
              new TextField(
                onChanged: (v) => setState(() {
                  _text = v;
                }),
                controller: _c,
              ),
              FlatButton(
                color: Colors.blueGrey,
                child: Text('next'),
                onPressed: _next,
              ),
              new Text("Mark:$mark"),
              new Text("Wrong:$wrong")
            ],
          ),
        ),
      ),
    );
    //Column(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: <Widget>[
    //     Text(_questions[_indexQuestion]),
    //     for (var answer in _answers[_indexQuestion]) Text(answer),
    //     FlatButton(
    //       color: Colors.blueGrey,
    //       child: Text('next'),
    //       onPressed: _next,
    //     )
    //   ],
    // );
  }
}
