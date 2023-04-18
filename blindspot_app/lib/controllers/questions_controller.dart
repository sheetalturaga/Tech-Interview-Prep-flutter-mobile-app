import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../firestore_references/collection_refs.dart';
import '../model/quiz_model.dart';

// Controller class to extact the data from the database to populating the
// Questions page

class QuestionsController extends GetxController {
  final loadStatus = LoadStatus.loading.obs;
  late QuizModel _quizModel;
  final listOfAllQuestionsInTopic = <Questions>[];
  final currentSessionQuestionList = <Questions>[];
  bool get isFirstQuestion => questionIndex.value > 0;
  bool get isLastQuestion => questionIndex.value >= 10 - 1;

  get correctQuestionsCount => null;

  @override
  void onReady() {
    final questionsInTopic = Get.arguments as QuizModel;
    // print(questionsInTopic.id);
    loadDataFromTopic(questionsInTopic);
    super.onReady();
  }

  void loadDataFromTopic(QuizModel topicBasedQuestionsInModel) async {
    _quizModel = topicBasedQuestionsInModel; // Java/Python etc
    loadStatus.value = LoadStatus.loading;
    try {
      // Step 1: Get all the questions based on the topicID in the questions
      // collection
      final QuerySnapshot<Map<String, dynamic>> questionsInSnapshot =
          await questionCollectionRef
              .doc(topicBasedQuestionsInModel.id)
              .collection('questions')
              .get();

      final questionsFromTopicList = <Questions>[];

      for (var i in questionsInSnapshot.docs) {
        final data = i.data();
        questionsFromTopicList.add(Questions(
            id: i.id,
            question: data['question'],
            options: data['options'],
            explanation: data['explanation']));
      }
      topicBasedQuestionsInModel.questions = questionsFromTopicList;

      // Step 2 traversing through all questions in that particular topic
      // to store the answers list

      for (Questions question in topicBasedQuestionsInModel.questions!) {
        final QuerySnapshot<Map<String, dynamic>> answersInSnapshot =
            await questionCollectionRef
                .doc(topicBasedQuestionsInModel.id)
                .collection('questions')
                .doc(question.id)
                .collection('options')
                .get();
        final listOfOptions = <Options>[];
        for (var j in answersInSnapshot.docs) {
          final data = j.data();
          listOfOptions.add(Options(
              identifier: data['identifier'] as String,
              option: data['option'] as String));
        }
        question.options =
            listOfOptions; // assigning options to the respective question

        // We check if the questions we got from the database is not empty,
        // Then save the collections and subcollections
        // into the 'list of all questions in topic' variable
        if (topicBasedQuestionsInModel.questions != null &&
            topicBasedQuestionsInModel.questions!.isNotEmpty) {
          listOfAllQuestionsInTopic
              .assignAll(topicBasedQuestionsInModel.questions!);

          currQ.value = topicBasedQuestionsInModel.questions![0];
          // print(topicBasedQuestionsInModel.questions![0]);
          loadStatus.value = LoadStatus.complete;
        } else {
          loadStatus.value = LoadStatus.error;
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  // Rxn reactive class is a list type
  Rxn<Questions> currQ = Rxn<Questions>();
  final questionIndex = 0.obs;

  // The option selected by the user
  void choseOption(String? answerProvided) {
    currQ.value!.chosenOption = answerProvided;
    // list to update that points to QuestionController/GetBuilder
    update(['chosenOptionsList']);
  }

  bool isCorrect(String? answer) {
    // id provided as answer
    // correctAnswer == chosenAnswer && opts.identifier == chosenAnswer
    // correctAnswer == opts.identifier
    if ((answer == currQ.value!.correctOption &&
            answer == currQ.value!.chosenOption) ||
        (answer == currQ.value!.correctOption)) {
      return true;
    }
    return false;
  }

  bool isAnswerProvided() {
    if (currQ.value!.chosenOption != null) {
      return true;
    }
    return false;
  }

  String get quizCompleted {
    // returns the length of all the chosen options selected
    final numOfQuestionsAnswered = listOfAllQuestionsInTopic
        .where((element) => element.chosenOption == element.correctOption)
        .toList()
        .length;

    return "$numOfQuestionsAnswered out of ${listOfAllQuestionsInTopic.length} answered correctly";
  }

  void nextQuestion() {
    if (questionIndex.value >= listOfAllQuestionsInTopic.length - 1) return;
    if (listOfAllQuestionsInTopic[questionIndex.value].chosenOption == null) {
      // pop up please provide an answer
    } else {
      questionIndex.value++;
    }

    currQ.value = listOfAllQuestionsInTopic[questionIndex.value];
  }
}
