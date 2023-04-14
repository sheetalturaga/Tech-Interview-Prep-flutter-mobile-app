import 'package:cloud_firestore/cloud_firestore.dart';

// The Quiz model that can convert all the json files into their respective
// files to be fed into the firestore database
class QuizModel {
  String id;
  String topic;
  String? imageUrl;
  String description;
  List<Questions>? questions;
  int questionCount;

  QuizModel(
      {required this.id,
      required this.topic,
      this.imageUrl,
      required this.description,
      this.questions,
      required this.questionCount});

  QuizModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        topic = json['topic'] as String,
        imageUrl = json['image_url'] as String,
        description = json['description'] as String,
        questionCount = 0,
        questions = (json['questions'] as List)
            .map((e) => Questions.fromJson(e as Map<String, dynamic>))
            .toList();

  // Get a snapshot from the database
  QuizModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> json)
      : id = json.id,
        topic = json['topic'],
        imageUrl = json['image_url'],
        description = json['description'],
        questionCount = json['question_count'] as int,
        questions = [];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['topic'] = topic;
    data['image_url'] = imageUrl;
    data['description'] = description;
    if (questions != null) {
      data['questions'] = questions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Questions {
  String id;
  String question;
  List<Options>? options;
  String? correctOption;
  String? explanation;

  Questions(
      {required this.id,
      required this.question,
      required this.options,
      this.correctOption,
      required this.explanation});

  Questions.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        question = json['question'],
        options =
            (json['options'] as List).map((e) => Options.fromJson(e)).toList(),
        correctOption = json['correct_option'],
        explanation = json['explanation'];

  Questions.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> json)
      : id = json['id'],
        question = json['question'],
        options = [],
        correctOption = json['correct_option'],
        explanation = json['explanation'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['question'] = question;
    if (options != null) {
      data['options'] = options!.map((v) => v.toJson()).toList();
    }
    data['correct_option'] = correctOption;
    data['explanation'] = explanation;
    return data;
  }
}

class Options {
  String? identifier;
  String? option;

  Options({this.identifier, this.option});

  Options.fromJson(Map<String, dynamic> json)
      : identifier = json['identifier'],
        option = json['option'];

  Options.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> json)
      : identifier = json['identifier'] as String?,
        option = json['option'] as String?;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['identifier'] = identifier;
    data['option'] = option;
    return data;
  }
}
