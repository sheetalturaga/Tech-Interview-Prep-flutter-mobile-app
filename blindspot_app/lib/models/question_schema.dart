class QuestionSchema {
  late int questionId;
  late String question;
  late String topic;
  late List<Option> answerOptions;
  late String correctAnswer;
  Option? selectedOrNot;
  late bool savedToNotebook;
}

class Option {
  late String text;
  late bool isCorrect;
}
