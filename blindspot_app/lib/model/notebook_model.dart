import 'package:cloud_firestore/cloud_firestore.dart';

class NoteBookModel {
  String? questionId;
  String? topic;
  String? question;
  String? correctOption;
  String? explanation;
  String? userId;

  NoteBookModel({
    this.questionId,
    this.topic,
    this.question,
    this.correctOption,
    this.explanation,
    this.userId,
  });

  factory NoteBookModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    return NoteBookModel(
      questionId: doc.id,
      topic: data['topic'],
      question: data['question'],
      correctOption: data['correctOption'],
      explanation: data['explanation'],
      userId: data['userId'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "questionId": questionId,
      "topic": topic,
      "question": question,
      "correctOption": correctOption,
      "explanation": explanation,
      "userId": userId,
    };
  }
}
