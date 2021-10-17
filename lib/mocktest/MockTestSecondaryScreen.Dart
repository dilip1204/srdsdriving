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

class MockTestSecondaryScreen extends StatefulWidget {
  MockTestSecondaryScreen({
    this.auth,
    this.onSignedIn,
  });

  final AuthImplementation auth;
  final VoidCallback onSignedIn;

  @override
  State<StatefulWidget> createState() {
    return _MockTestSecondaryScreenState();
  }
}

class TestQuiz {
  var images = [
    "None",
    "PedestriansCrossing",
    "ParkingRightAllowed",
    "None",
    "None",
    "RightTurnProhibited",
    "None",
    "HornProhiBited",
    "None",
    "NarrowBridgeAhead"
  ];

  var questions = [
    "When a vehicle approaches an unguarded railway level crossing, before crossing it, the driver shall?",
    "The Following sign represents?",
    "The Following sign represents?",
    "How can you distinguish a transport vehicle.?",
    "Validity of learners licence",
    "The following sign represents..",
    "In a road without footpath, the pedestrians",
    "The following sign represents..",
    "Free passage should be given to the following types of vehicles",
    "The following sign represents..",
  ];

  var choices = [
    [
      "Stop the vehicle on the left side of the road, get down from the vehicle, go to the railway track,and ensure that no train or trolley is coming from either side",
      "Sound horn and cross the track as fast as possible",
      "Wait till the train passes",
    ],
    ["Pedestrians Crossing", "Pedestrians may enter", "Pedestrians prohibited"],
    [
      "Keep right side",
      "Parking on the right allowed",
      "Compulsory turn to right"
    ],
    [
      "By looking at the tyre size",
      "By colour of the vehicle",
      "By looking at the number plate of the vehicle"
    ],
    ["Till the driving licence is obtained", "6 months", "30 days"],
    [
      "U- Turn prohibited",
      "Right turn prohibited",
      "Overtaking through left prohibited"
    ],
    [
      "Should walk on the left side of the road",
      "Should walk on the right side of the road",
      "May walk on either side of the road"
    ],
    ["Horn prohibited", "Compulsory sound horn", "May sound horn"],
    [
      "Police vehicles",
      "Ambulance and fire service vehicles",
      "Express, Super Express buses"
    ],
    ["Roads on both sides in front", "Narrow road ahead", "Narrow bridge ahead"]
  ];

  var correctAnswers = [
    "Stop the vehicle on the left side of the road, get down from the vehicle, go to the railway track,and ensure that no train or trolley is coming from either side",
    "Pedestrians Crossing",
    "Parking on the right allowed",
    "By looking at the number plate of the vehicle",
    "6 months",
    "Right turn prohibited",
    "Should walk on the right side of the road",
    "Horn prohibited",
    "Ambulance and fire service vehicles",
    "Narrow bridge ahead"
  ];
}

class _MockTestSecondaryScreenState extends State<MockTestSecondaryScreen> {
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
              new Padding(padding: EdgeInsets.all(13.0)),

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
                  height: 120, width: 150, fit: BoxFit.fitHeight),

              new Container(
                height: 90,
                child: new Row(
                  children: <Widget>[
                    SizedBox(
                      width: 350,
                      child: new Text(
                        quiz.questions[questionNumber],
                        style: new TextStyle(
                            fontSize: 21.0, fontWeight: FontWeight.bold),
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
