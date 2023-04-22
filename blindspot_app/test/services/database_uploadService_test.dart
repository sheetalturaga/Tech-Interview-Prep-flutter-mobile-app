import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:blindspot_app/services/database_uploadService.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mockito/mockito.dart';
import 'mock.dart';
import 'package:flutter/services.dart' show rootBundle;
import "dart:convert";

void main() {
  group('addDatafromJson', () {
    final data = {
      "topic": "topic",
      "image_url": "url",
      "description": "description",
      "question_count": 3,
    };

    // test('addDatafromJson method adds data to Firestore', () async {
    //   final firestore = FakeFirebaseFirestore();
    //   when(FirebaseFirestore.instanceFor(
    //     app: Firebase.app(),
    //   )).thenReturn(firestore);
    //   // call the method that adds data to Firestore
    //   await DatabaseUploadService().addDatafromJson();
    // });
  });

  // const String collectionPath = 'questionsCollection';
  // const String do
  // TestWidgetsFlutterBinding.ensureInitialized();
  // setupFirebaseAuthMocks();

  // setUpAll(() async {
  //   await Firebase.initializeApp();
  // });

  // // group('addDatafromJson', () {
  // //   final data = {
  // //     "topic": "topic",
  // //     "image_url": "url",
  // //     "description": "description",
  // //     "question_count": 3,
  // //   };

  // test("Add Data From Json", () async {
  //   DatabaseUploadService dbUploadService = DatabaseUploadService();
  //   dbUploadService.onReady();
  //   final testJson = await rootBundle.loadString("test/assets/test.json");
  //   final jsonMap = jsonDecode(testJson).toList();

  //   // Load mock JSON file
  //   final String mockJson =
  //       await rootBundle.loadString("test/assets/test.json");

  //   // Mock the AssetManifest.json file contents
  //   when(rootBundle.loadString("")).thenAnswer((_) async => '''{
  //       "assets/database/test.json": ""
  //     }''');

  //   // Mock the contents of the quiz JSON file
  //   when(rootBundle.loadString('assets/database/test.json'))
  //       .thenAnswer((_) async => mockJson);

  //   // Call the method to upload data from the JSON file
  //   await dbUploadService.addDatafromJson();
  // });
}
