import 'Question.dart';

class Quiz {
  int index = 0;
  double score = 0.0;
  int getQuestionIndex() {
    return index;
  }

  List<Question> _QuestionsList = [
    Question("What is the best programming language ?",
        ['Java', 'C', 'C++', 'Python'], 0),
    Question("What is the best Serie ever  ?",
        ['The Peaky Blinders', 'Breaking Bad', 'Game of Thrones', 'You'], 0),
    Question("What is the name of Ronaldo ?",
        ['Lionel', 'Cristiano', 'Fernando', 'Carlos'], 0),
    Question("What is the name of EL BADAOUI ?",
        ['Mohammed', 'Ahmed', 'Ayman', 'None'], 0),
  ];

  List<Question> getQuestionsList() {
    return _QuestionsList;
  }

  String getQuestionText() {
    return _QuestionsList[index].getQuestionText();
  }

  String getAnswerText(int i) {
    return _QuestionsList[index].getChoices()[i];
  }

  int getRightAnswer() {
    return _QuestionsList[index].getAnswerIndex();
  }

  double getScore() {
    return score;
  }

  void incrementscore() {
    score = score + ((1 / this.getQuestionsList().length) * 100);
  }

  void nextQuestion() {
    if (index < _QuestionsList.length) index++;
  }

  bool isFinished() {
    if (index >= _QuestionsList.length) return true;
    return false;
  }

  void reset() {
    index = 0;
    score = 0.0;
  }
}
