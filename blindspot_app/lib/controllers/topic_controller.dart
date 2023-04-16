import 'package:blindspot_app/model/quiz_model.dart';
import 'package:blindspot_app/screens/question_display_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../firestore_references/collection_refs.dart';
import '../services/database_storageService.dart';

class TopicController extends GetxController {
  @override
  void onReady() {
    getAllTopics();
    super.onReady();
  }

  final allTopicsImages = <String>[].obs;
  final allTopics = <QuizModel>[].obs;

  Future<void> getAllTopics() async {
    try {
      // Get the data from the entire firestore questions collection
      //Query snapshot type that will used to look through the collection
      // we get from the firebase storage
      QuerySnapshot<Map<String, dynamic>> dataFromCollection =
          await questionCollectionRef.get();

      // print(dataFromCollection.docs.length);

      // Doc objects that lets us access each of the documents
      // in the questions collection --> topics documents
      final topicsDataList = dataFromCollection.docs
          .map((topic) => QuizModel.fromSnapshot(topic))
          .toList();
      allTopics.assignAll(topicsDataList);
      // print(topicsDataList);
      for (var topic in topicsDataList) {
        // Gives us the complete image path from the storage
        final imgRef =
            await Get.find<DatabaseStorageService>().getImage(topic.topic);

        topic.imageUrl = imgRef;

        allTopics.assignAll(topicsDataList);
        // print(allTopics.toString());
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  void navigateToQuestions({required QuizModel quiz, bool tryAgain = false}) {
    // TODO: CHeck for login
    Get.toNamed(QuestionDisplayScreen.routeName, arguments: quiz);
  }
}
