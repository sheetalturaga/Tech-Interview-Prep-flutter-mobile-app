import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:blindspot_app/services/database_uploadService.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:blindspot_app/model/question_model.dart';

void main() {
  group('addDatafromJson', () {
    final data = {
      "topic": "topic",
      "image_url": "url",
      "description": "description",
      "question_count": 3,
    };

    test('addDatafromJson method adds data to Firestore', () async {
      final firestore = FakeFirebaseFirestore();
      when(FirebaseFirestore.instanceFor(
        app: Firebase.app(),
      )).thenReturn(firestore);
      // call the method that adds data to Firestore
      await DatabaseUploadService().addDatafromJson();
    });
  });
}
