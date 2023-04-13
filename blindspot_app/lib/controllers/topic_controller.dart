import 'package:blindspot_app/models/quiz_model.dart';
import 'package:blindspot_app/screens/question_display_screen.dart';
import 'package:blindspot_app/screens/quizz_screen.dart';
import 'package:blindspot_app/services/database_storageService.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:blindspot_app/screens/quizz_screen.dart';

import '../firestore_references/collection_refs.dart';

class TopicController extends GetxController {
  @override
  void onReady() {
    getAllTopics();
    super.onReady();
  }

  final allTopicsImages = <String>[].obs;
  final allTopics = <QuizModel>[].obs;

  Future<void> getAllTopics() async {
    // List<String> imageName = [
    //   "java",
    //   "python",
    //   "ood",
    //   "behavioral",
    //   "datainterpretation"
    // ];
    try {
      // Get the data from the entire firestore questions collection
      //Query snapshot type that will used to look through the collection
      // we get from the firebase storage
      QuerySnapshot<Map<String, dynamic>> dataFromCollection =
          await questionCollectionRef.get();

      // Doc objects that lets us access each of the documents
      // in the questions collection --> topics documents
      final topicsDataList = dataFromCollection.docs
          .map((topic) => QuizModel.fromSnapshot(topic))
          .toList();
      allTopics.assignAll(topicsDataList);

      for (var topic in topicsDataList) {
        // Gives us the complete image path from the storage
        final imgRef =
            await Get.find<DatabaseStorageService>().getImage(topic.topic);

        topic.imageUrl = imgRef;

        allTopics.assignAll(topicsDataList);
      }
    } catch (e) {
      print(e);
    }
  }

  void navigateToQuestions({required QuizModel quiz, bool tryAgain = false}) {
    // TODO: CHeck for login
    Get.toNamed(QuestionDisplayScreen.routeName, arguments: quiz);
  }
}
