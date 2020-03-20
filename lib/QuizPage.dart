import 'package:flutter/material.dart';

import 'CustomDrawer.dart';
import 'Quiz.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  Quiz quiz = Quiz();

  void CheckAnswer(int response) {
    //The user picked true.
    setState(() {
      if (quiz.getRightAnswer() == response) {
        quiz.incrementscore();
        print(quiz.getScore());
      }
      quiz.nextQuestion();
    });
  }

  Widget generateChoice(int i) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: FlatButton(
          textColor: Colors.white,
          color: Colors.blue,
          child: Text(
            quiz.getAnswerText(i),
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
          onPressed: () {
            CheckAnswer(i);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (quiz.isFinished() == false)
      return Scaffold(
        resizeToAvoidBottomPadding: false,
        drawer: SafeArea(
          child: customDrawer(context, 1),
        ),
        appBar: AppBar(
          backgroundColor: Colors.teal,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text('Quiz'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Center(
              child: Text(
                'Question ' +
                    '${quiz.getQuestionIndex() + 1}' +
                    '/' +
                    '${quiz.getQuestionsList().length}',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    'Q' +
                        '${quiz.getQuestionIndex() + 1}' +
                        ':  ' +
                        quiz.getQuestionText(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ),
            for (int i = 0; i < 4; i++) generateChoice(i),
            //TODO: Add a Row here as your score keeper
          ],
        ),
      );
    else {
      return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomPadding: false,
          drawer: SafeArea(
            child: customDrawer(context, 0),
          ),
          appBar: AppBar(
            backgroundColor: Colors.teal,
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            title: Text('Quiz'),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 90),
                  child: (Text(
                    "You have Completed the Quiz !\n" +
                        "Your score is : " +
                        '${quiz.getScore()}' +
                        ' %',
                    style: TextStyle(fontSize: 20, fontFamily: 'SourceSansPro'),
                    textAlign: TextAlign.center,
                  )),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 30, 30, 200),
                  child: FlatButton(
                    color: Colors.teal,
                    textColor: Colors.white,
                    child: Text(
                      'Restart',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      setState(() {
                        quiz.reset();
                      });
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }
    ;
  }
}
