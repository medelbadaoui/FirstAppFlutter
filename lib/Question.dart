class Question {
  String _QuestionText;
  List<String> _Choices;
  int _AnswerIndex;
  Question(String q, List<String> c, int i) {
    _QuestionText = q;
    _Choices = c;
    _AnswerIndex = i;
  }
  String getQuestionText() {
    return _QuestionText;
  }

  List<String> getChoices() {
    return _Choices;
  }

  int getAnswerIndex() {
    return _AnswerIndex;
  }
}
