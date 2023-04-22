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
  group('FireStore Upload Service', () {
    FakeFirebaseFirestore? fakeFirebaseFirestore;

    // Creates a fake firestore object
    setUp(() {
      fakeFirebaseFirestore = FakeFirebaseFirestore();
    });

    group("AddDataFromJson", () async {
      DatabaseUploadService dbUploadService = DatabaseUploadService();
      dbUploadService.onReady();
      final testJson = await rootBundle.loadString("test/assets/test.json");
      final jsonMap = jsonDecode(testJson).toList();

      // Mock the AssetManifest.json file contents
      when(rootBundle.loadString("")).thenAnswer((_) async => '''{
        "assets/database/mock_quiz.json": ""
      }''');

      // Mock the contents of the quiz JSON file
      when(rootBundle.loadString('assets/database/mock_quiz.json'))
          .thenAnswer((_) async => testJson);

      // Call the method to upload data from the JSON file
      await dbUploadService.addDatafromJson();

      // Verify that the correct data was uploaded to Firestore
      // verify(fakeFirebaseFirestore?.batch()).commit();
      // var mockCollectionReference;
      // verify(mockCollectionReference.doc('mock_quiz_id')).set({
      //   'topic': 'Mock Quiz',
      //   'description': 'This is a mock quiz.',
      //   'image_url': 'https://www.example.com/mock_quiz_image.jpg',
      //   'question_count': 3

      // });
    });
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
