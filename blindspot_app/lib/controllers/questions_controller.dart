import 'package:blindspot_app/models/quiz_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../firestore_references/collection_refs.dart';

// Controller class to extact the data from the database to populating the
// Questions page

class QuestionsController extends GetxController {
  final loadStatus = LoadStatus.loading.obs;
  late QuizModel _quizModel;
  final listOfAllQuestionsInTopic = <Questions>[];
  Rxn<Questions> currentQuestion = Rxn<Questions>();

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

      // print("Questions In Snapshot: $questionsFromTopicList");

      // final questionsFromTopicList = questionsInSnapshot.docs
      //     .map((json) => Questions.fromSnapshot(json))
      //     .toList();

      // print("Questions From Topic: ${questionsFromTopicList}");

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
        // final answersList = answersInSnapshot.docs
        //     .map((options) => Options.fromSnapshot(options))
        //     .toList();
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

          currentQuestion.value = topicBasedQuestionsInModel.questions![0];
          print(
              "Questions in Topic: ${topicBasedQuestionsInModel.questions!.length}");

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
}
