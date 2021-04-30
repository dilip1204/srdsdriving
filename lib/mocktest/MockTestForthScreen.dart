import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:srds/auth/Authentication.dart';
import 'package:srds/controls/CustomButton.dart';
import 'package:srds/mocktest/MockTest.dart';

var finalScore = 0;
var questionNumber = 0;
var wrongAnswerCount = 0;
bool isAnswerCorrect = false;
var quiz = new TestQuiz();

class MockTestForthScreen extends StatefulWidget {
  MockTestForthScreen({
    this.auth,
    this.onSignedIn,
  });

  final AuthImplementation auth;
  final VoidCallback onSignedIn;

  @override
  State<StatefulWidget> createState() {
    return _MockTestForthScreenState();
  }
}

class TestQuiz {
  var images = [
    "None",
    "Stop",
    "None",
    "CompulsoryLeft",
    "None",
    "Giveway",
    "None",
    "Oneway",
    "None",
    "NoUTurn"
  ];

  var questions = [
    "Near a pedestrian crossing, when the pedestrians are waiting to cross the road, you should?",
    "The Following sign represents..",
    "You are approaching a narrow bridge, another vehicle is about to enter the bridge from opposite side you should?",
    "The Following sign represents..",
    "When a vehicle is involved in an accident causing injury to any person",
    "The Following sign represents..",
    "On a road designated as one way",
    "The following sign represents..",
    "You can overtake a vehicle in front",
    "The following sign represents..",
  ];

  var choices = [
    [
      "Sound horn and proceed",
      "Slow down, sound horn and pass",
      "Stop the vehicle and wait till the pedestrians cross the road and then proceed",
    ],
    ["Stop", "No Parking", "Hospital Ahead"],
    [
      "Increase the speed and try to cross the bridge as fast as possible",
      "Put on the head light and pass the bridge",
      "Wait till the other vehicle crosses the bridge and then proceed"
    ],
    ["Keep Right", "Keep Left", "Compulsary turn left"],
    [
      "Take the vehicle to the nearest police station and report the accident",
      "Stop the vehicle and report to the police station",
      "Take all reasonable steps to secure medical attention to the injured and report to the nearestpolice station within 24 hours"
    ],
    ["Give Away", "Hospital Ahead", "Traffic Island Ahead"],
    [
      "Parking is prohibited",
      "Overtaking is prohibited",
      "Should not drive in reverse gear"
    ],
    ["No entry", "One way", "Speed limit ends"],
    [
      "Through the right side of that vehicle",
      "Through the left side",
      "Through the left side, if the road is wide"
    ],
    ["Right turn prohibited", "Sharp curve to the right", "U-turn prohibited"]
  ];

  var correctAnswers = [
    "Stop the vehicle and wait till the pedestrians cross the road and then proceed",
    "Stop",
    "Wait till the other vehicle crosses the bridge and then proceed",
    "Keep Right",
    "Take all reasonable steps to secure medical attention to the injured and report to the nearestpolice station within 24 hours",
    "Give Away",
    "Should not drive in reverse gear",
    "One Way",
    "Through the right side of that vehicle",
    "U-turn prohibited"
  ];
}

class _MockTestForthScreenState extends State<MockTestForthScreen> {
  String _setImage() {
    if (quiz.images[questionNumber].contains("None")) {
      return "";
    } else {
      return "assets/images/${quiz.images[questionNumber]}.png";
    }
  }

  void _moveToPreviousPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MockTest()),
    );
    finalScore = 0;
    questionNumber = 0;
    wrongAnswerCount = 0;
  }

  void resetQuiz() {
    setState(() {
      Navigator.pop(context);
      finalScore = 0;
      questionNumber = 0;
      wrongAnswerCount = 0;
    });
  }

  void updateQuestion() {
    setState(() {
      if (questionNumber == quiz.questions.length - 1) {
        Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => new Summary(
                      score: finalScore,
                    )));
      } else {
        questionNumber++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: new Container(
          margin: const EdgeInsets.all(11.0),
          alignment: Alignment.topCenter,
          child: new Column(
            children: <Widget>[
              new Padding(padding: EdgeInsets.all(11.0)),

              new Container(
                alignment: Alignment.centerRight,
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Text(
                      "Question ${questionNumber + 1} of ${quiz.questions.length}",
                      style: new TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    new Text(
                      "Correct: $finalScore",
                      style: new TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    new Text(
                      "Wrong: $wrongAnswerCount",
                      style: new TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),

              //images upload
              new Padding(padding: EdgeInsets.all(9.0)),

              new Image.asset(_setImage(),
                  height: 120, width: 150, fit: BoxFit.fitWidth),

              new Container(
                height: 84,
                child: new Row(
                  children: <Widget>[
                    SizedBox(
                      width: 350,
                      child: new Text(
                        quiz.questions[questionNumber],
                        style: new TextStyle(
                            fontSize: 21, fontWeight: FontWeight.bold),
                        maxLines: 3,
                        softWrap: true,
                      ),
                    )
                  ],
                ),
              ),

              new Padding(padding: EdgeInsets.all(9.0)),

              new Container(
                  child: new Row(
                children: <Widget>[
                  // new Chip(label: Text(''),avatar: CircleAvatar(backgroundColor: Colors.grey.shade800,child: Text('A'),),),

                  new CustomButton(
                    questionname: "A)",
                    questionorder: quiz.choices[questionNumber][0],
                    onPressed: () {
                      if (quiz.choices[questionNumber][0] ==
                          quiz.correctAnswers[questionNumber]) {
                        debugPrint("Correct");
                        isAnswerCorrect = true;
                        finalScore++;
                      } else {
                        debugPrint("Wrong");
                        isAnswerCorrect = false;
                        wrongAnswerCount++;
                      }
                      setState(() {
                        isAnswerCorrect = !isAnswerCorrect;
                      });
                      isAnswerCorrect = false;
                      updateQuestion();
                    },
                    splash: !isAnswerCorrect ? Colors.green : Colors.red,
                  ),
                ],
              )),

              new Padding(padding: EdgeInsets.all(9.0)),

              new Container(
                alignment: Alignment.centerLeft,
                child: new Row(
                  children: <Widget>[
                    new CustomButton(
                      questionname: "B)",
                      questionorder: quiz.choices[questionNumber][1],
                      onPressed: () {
                        if (quiz.choices[questionNumber][1] ==
                            quiz.correctAnswers[questionNumber]) {
                          debugPrint("Correct");
                          isAnswerCorrect = true;
                          finalScore++;
                        } else {
                          debugPrint("Wrong");
                          isAnswerCorrect = false;
                          wrongAnswerCount++;
                        }
                        setState(() {
                          isAnswerCorrect = !isAnswerCorrect;
                        });
                        isAnswerCorrect = false;
                        updateQuestion();
                      },
                      splash: !isAnswerCorrect ? Colors.green : Colors.red,
                    ),
                  ],
                ),
              ),

              new Padding(padding: EdgeInsets.all(9.0)),

              new Container(
                child: new Row(
                  children: <Widget>[
                    new CustomButton(
                      questionname: "C)",
                      questionorder: quiz.choices[questionNumber][2],
                      onPressed: () {
                        if (quiz.choices[questionNumber][2] ==
                            quiz.correctAnswers[questionNumber]) {
                          debugPrint("Correct");
                          isAnswerCorrect = true;
                          finalScore++;
                        } else {
                          debugPrint("Wrong");
                          isAnswerCorrect = false;
                          wrongAnswerCount++;
                        }
                        setState(() {
                          isAnswerCorrect = !isAnswerCorrect;
                        });
                        isAnswerCorrect = false;
                        updateQuestion();
                      },
                      splash: !isAnswerCorrect ? Colors.green : Colors.red,
                    ),
                  ],
                ),
              ),

              new Padding(padding: EdgeInsets.all(9.0)),

              new Container(
                  alignment: Alignment.bottomCenter,
                  child: new MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.red)),
                      minWidth: 240.0,
                      height: 35.0,
                      color: Colors.red,
                      onPressed: _moveToPreviousPage,
                      child: new Text(
                        "Quit",
                        style: new TextStyle(
                            fontSize: 21.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}

class Summary extends StatelessWidget {
  final int score;

  Summary({Key key, @required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: new Container(
          alignment: Alignment.center,
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                "Final Score: $score",
                style: new TextStyle(fontSize: 35.0),
              ),
              new Padding(
                  padding: EdgeInsets.only(
                      top: 15.0, bottom: 10.0, right: 20.0, left: 15.0)),
              new MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.red)),
                color: Colors.red,
                padding: EdgeInsets.only(
                    top: 15.0, bottom: 10.0, right: 20.0, left: 15.0),
                onPressed: () {
                  questionNumber = 0;
                  finalScore = 0;
                  wrongAnswerCount = 0;
                  //Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MockTest()));
                },
                child: new Text(
                  "Reset Quiz",
                  style: new TextStyle(fontSize: 20.0, color: Colors.black),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
