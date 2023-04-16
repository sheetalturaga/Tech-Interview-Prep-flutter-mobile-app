import 'dart:convert';
import 'package:blindspot_app/model/quiz_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../firestore_references/collection_refs.dart';

// Uploading data to Firestore to the backend
class DatabaseUploadService extends GetxController {
  @override
  void onReady() {
    addDatafromJson();
    super.onReady();
  }

  // initializing it as an observable variable from the Getx class
  final loadStatus = LoadStatus.loading.obs;

  // upload by reading the json files in the assets folder
  Future<void> addDatafromJson() async {
    loadStatus.value = LoadStatus.loading; // initial value is 0

    final db = FirebaseFirestore.instance;
    print("created db instance");
    print(db.toString());

    // Load the asset folder by passing the context
    var manifestContents = await rootBundle
        .loadString("AssetManifest.json"); // making sure it's not null

    // Whatever we load from the assets folder, is saved as a map
    final Map<String, dynamic> mapFromManifest = jsonDecode(manifestContents);

    // Specifying the path to pick only the database folder from the assets directory
    // Since the map of the file name and path is not iterable, we convert to list th
    final filesInDatabase = mapFromManifest.keys
        .where((path) =>
            path.startsWith("assets/database") && path.contains(".json"))
        .toList();

    List<QuizModel> listOfFiles = [];
    // Iterate through all files in the assets to read through the file contents
    for (var file in filesInDatabase) {
      String fileContent = await rootBundle.loadString(file);
      // Add the data into the model that was created
      // --> jsonDecode : Take a string and converts into a map
      listOfFiles.add(QuizModel.fromJson(jsonDecode(fileContent)));
    }

    // print("Items Number: ${questions[0].description}");
    // Creating for uploading batches of data to firestore
    print("reached batch ops");
    WriteBatch batchOps = db.batch();

    printInfo(info: batchOps.toString());

    // Loop through the list of all files and create the documents and
    // assign respective fields
    for (var file in listOfFiles) {
      batchOps.set(questionCollectionRef.doc(file.id), {
        "topic": file.topic,
        "image_url": file.imageUrl,
        "description": file.description,
        "question_count": file.questions == null ? 0 : file.questions!.length,
      });

      for (var questions in file.questions!) {
        final pathToQuestion =
            questionsRef(fileId: file.id, questionId: questions.id);
        batchOps.set(pathToQuestion, {
          "question": questions.question,
          "correct_option": questions.correctOption,
          "explanation": questions.explanation,
        });

        print("added questions");

        for (var options in questions.options!) {
          batchOps.set(
              pathToQuestion.collection("options").doc(options.identifier),
              {"identifier": options.identifier, "option": options.option});
        }
        print("added options");
      }
    }

    await batchOps.commit();
    loadStatus.value = LoadStatus.complete;
  }

  // Future<void> testDataPush() async {
  //   final db = FirebaseFirestore.instance;
  //   db.doc("questions");
  // }
}
