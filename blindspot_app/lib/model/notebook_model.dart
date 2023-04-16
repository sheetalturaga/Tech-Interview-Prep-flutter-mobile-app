import 'package:cloud_firestore/cloud_firestore.dart';

class NotebookModel {
  String? questionId;
  String? topicId;
  String? topic;
  String? question;
  String? correctOption;
  String? explanation;
  String? userId;

  NotebookModel({
    this.questionId,
    this.topicId,
    this.topic,
    this.question,
    this.correctOption,
    this.explanation,
    this.userId,
  });

  factory NotebookModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    return NotebookModel(
      questionId: doc.id,
      topicId: data['topicId'],
      topic: data['topic'],
      question: data['question'],
      correctOption: data['correctOption'],
      explanation: data['explanation'],
      userId: data['userId'],
    );
  }
}
