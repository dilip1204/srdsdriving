import 'dart:ui';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:srds/auth/Authentication.dart';
import 'package:srds/mocktest/MockTest.dart';


var finalScore = 0;
var questionNumber = 0;
var wrongAnswerCount = 0;
bool isAnswerCorrect = false;
var quiz = new TestQuiz();

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

class TestQuiz {
  var images = [
    "gtr",
    "gtrwhite",
    "None",
    "bathurst",
  ];

  var questions = [
    "What car is it?",
    "What color car is it?",
    "Is Image visible?",
    "This car color?",
  ];

  var choices = [
    ["gta", "welcome", "gtr", "safd"],
    ["gtrr", "GT", "white", 'priority'],
    ["Yes", "No", "YY", "NN"],
    ["yellow", "spa", "adelaide", "suzuka"],
  ];

  var correctAnswers = ["gtr", "white", "No", "yellow"];
}

class _MockTestScreen1State extends State<MockTestScreen1> {
  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: new Container(
          margin: const EdgeInsets.all(20.0),
          alignment: Alignment.topCenter,
          child: new Column(
            children: <Widget>[
              new Padding(padding: EdgeInsets.all(20.0)),

              new Container(
                alignment: Alignment.centerRight,
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Text(
                      "Question ${questionNumber + 1} of ${quiz.questions.length}",
                      style: new TextStyle(fontSize: 18.0),
                    ),
                    new Text(
                      "Correct: $finalScore",
                      style: new TextStyle(fontSize: 18.0),
                    ),
                    new Text(
                      "Wrong: $wrongAnswerCount",
                      style: new TextStyle(fontSize: 18.0),
                    )
                  ],
                ),
              ),

              //images upload
              new Padding(padding: EdgeInsets.all(15.0)),

              // new Image.asset(
              //   "assets/images/${quiz.images[questionNumber]}.jpg",
              // ),

              new Image.asset(_setImage(),
                  height: 150, width: 300, fit: BoxFit.fitWidth),

              //question no text
              new Text(
                quiz.questions[questionNumber],
                style: new TextStyle(
                  fontSize: 20.0,
                ),
              ),

              new Padding(padding: EdgeInsets.all(15.0)),

              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  //button1
                  new MaterialButton(
                    height: 40,
                    minWidth: 60,
                    animationDuration: Duration(seconds: 2),
                    shape: RoundedRectangleBorder(),
                    padding: EdgeInsets.only(
                        top: 7.0, bottom: 7.0, right: 40.0, left: 7.0),
                    color: Colors.white10,
                    child: new Text(
                      quiz.choices[questionNumber][0],
                      style: new TextStyle(fontSize: 20.0, color: Colors.black),
                    ),
                    onPressed: () {
                      if (quiz.choices[questionNumber][0] ==
                          quiz.correctAnswers[questionNumber]) {
                        debugPrint("Correct");
                        isAnswerCorrect = true;
                        finalScore++;
                      } else {
                        debugPrint("Wrong");
                        wrongAnswerCount++;
                      }
                      updateQuestion();
                    },
                    splashColor: !isAnswerCorrect ? Colors.green : Colors.red,
                  )
                ],
              ),

              new Padding(padding: EdgeInsets.all(10.0)),

              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  //button2
                  new MaterialButton(
                    minWidth: 60,
                    height: 40,
                    animationDuration: Duration(seconds: 2),
                    shape: RoundedRectangleBorder(),
                    padding: EdgeInsets.only(
                        top: 7.0, bottom: 7.0, right: 40.0, left: 7.0),
                    color: Colors.white10,
                    child: new Text(
                      quiz.choices[questionNumber][1],
                      style: new TextStyle(fontSize: 20.0, color: Colors.black),
                    ),
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
                      updateQuestion();
                    },
                    splashColor: !isAnswerCorrect ? Colors.green : Colors.red,
                  )
                ],
              ),

              new Padding(padding: EdgeInsets.all(10.0)),

              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  //button3
                  new MaterialButton(
                    minWidth: 60,
                    height: 40,
                    animationDuration: Duration(seconds: 2),
                    shape: RoundedRectangleBorder(),
                    padding: EdgeInsets.only(
                        top: 7.0, bottom: 7.0, right: 40.0, left: 7.0),
                    color: Colors.white10,
                    child: new Text(
                      quiz.choices[questionNumber][2],
                      style: new TextStyle(fontSize: 20.0, color: Colors.black),
                    ),
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
                      updateQuestion();
                    },
                    splashColor: !isAnswerCorrect ? Colors.green : Colors.red,
                  )
                ],
              ),

              new Padding(padding: EdgeInsets.all(10.0)),

              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  //button3
                  new MaterialButton(
                    minWidth: 60,
                    height: 40,
                    animationDuration: Duration(seconds: 4),
                    shape: RoundedRectangleBorder(),
                    padding: EdgeInsets.only(
                        top: 7.0, bottom: 7.0, right: 40.0, left: 10.0),
                    color: Colors.white10,
                    child: new Text(
                      quiz.choices[questionNumber][3],
                      style: new TextStyle(fontSize: 20.0, color: Colors.black),
                    ),
                    onPressed: () {
                      if (quiz.choices[questionNumber][3] ==
                          quiz.correctAnswers[questionNumber]) {
                        debugPrint("Correct");
                        isAnswerCorrect = true;
                        finalScore++;
                      } else {
                        debugPrint("Wrong");
                        isAnswerCorrect = false;
                        wrongAnswerCount++;
                      }
                      updateQuestion();
                    },
                    splashColor: !isAnswerCorrect ? Colors.green : Colors.red,
                  )
                ],
              ),

              new Padding(padding: EdgeInsets.all(15.0)),

              new Container(
                  alignment: Alignment.bottomCenter,
                  child: new MaterialButton(
                      minWidth: 240.0,
                      height: 35.0,
                      color: Colors.red,
                      onPressed: _moveToPreviousPage,
                      child: new Text(
                        "Quit",
                        style:
                            new TextStyle(fontSize: 18.0, color: Colors.white),
                      )))
            ],
          ),
        ),
      ),
    );
  }

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
                color: Colors.red,
                padding: EdgeInsets.only(
                    top: 15.0, bottom: 10.0, right: 20.0, left: 20.0),
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
                  style: new TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
