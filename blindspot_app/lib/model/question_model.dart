class QuestionModel {
  String? question;
  Map<String, bool>? answers;
  QuestionModel(this.question, this.answers);
}

class AnswerModel {
  String? question;
  Map<String, bool>? answers;
  AnswerModel(this.question, this.answers);
}
