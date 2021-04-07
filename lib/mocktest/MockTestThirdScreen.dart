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

class MockTestThridScreen extends StatefulWidget {
  MockTestThridScreen({
    this.auth,
    this.onSignedIn,
  });

  final AuthImplementation auth;
  final VoidCallback onSignedIn;

  @override
  State<StatefulWidget> createState() {
    return _MockTestThridScreenState();
  }
}

class TestQuiz {
  var images = [
    "None",
    "Hospital",
    "None",
    "FirstAidPost",
    "RestingPlace",
    "None",
    "None",
    "EndOfSpeedRestriction",
    "NarrowRoadAhead",
    "None"
  ];

  var questions = [
    "Vehicles proceeding from opposite direction should be allowed to pass through?",
    "The Following sign represents..",
    "Driver of a vehicle may overtake ?",
    "The Following sign represents..",
    "The Following sign represents..",
    "Driver of a motor vehicle shall drive through",
    "When a Vehicle is parked on the road side during night",
    "The following sign represents..",
    "The following sign represents..",
    "Fog lamps are used for?",
  ];

  var choices = [
    [
      "Your right side",
      "Your left side",
      "The convenient side",
    ],
    ["First aid post", "Hospital", "Resting place"],
    [
      "while driving down hil",
      "If the road is sufficiently wide",
      "When the driver of the vehicle in front shows the signal to overtake"
    ],
    ["Resting place", "First Aid Post", "Hospital"],
    ["Resting Place", "Hospital", "First aid post"],
    [
      "The right side of the road",
      "The left side of the road",
      "The Center of the road"
    ],
    [
      "The vehicle should be locked",
      "The person having licence to drive such a vehicle should be in the drivers seat",
      "The park light shall remain lit"
    ],
    ["Road closed", "No parking", "End of speed restriction"],
    ["Narrow road ahead", "Narrow bridge ahead", "Roads on both sides ahead"],
    [
      "During night",
      "When there is mist",
      "When the opposite vehicle is not using dim light"
    ]
  ];

  var correctAnswers = [
    "Your right side",
    "Hospital",
    "When the driver of the vehicle in front shows the signal to overtake",
    "First Aid Post",
    "Resting Place",
    "The left side of the road",
    "The park light shall remain lit",
    "End of speed restriction",
    "Narrow road ahead",
    "When there is mist"
  ];
}

class _MockTestThridScreenState extends State<MockTestThridScreen> {
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
                      width: 385,
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
