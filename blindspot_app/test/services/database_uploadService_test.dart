import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:blindspot_app/services/database_uploadService.dart';
import 'package:blindspot_app/model/quiz_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mockito/mockito.dart';

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



// void main() {
//   late FirebaseFirestore firestore;
  
//   setUp(() {
//     firestore = MockFirebaseFirestore();
//   });

//   test('addDatafromJson method adds data to Firestore', () async {
//     final mockCollectionReference = firestore.collection('test-collection');
//     final mockDocumentReference = mockCollectionReference.doc('test-doc');
//     final mockDocumentSnapshot = MockDocumentSnapshot(
//       data: {'field1': 'value1', 'field2': 'value2'},
//       documentReference: mockDocumentReference,
//     );
//     final mockQuerySnapshot = MockQuerySnapshot(
//       [mockDocumentSnapshot],
//       mockCollectionReference,
//     );

//     when(firestore.collection(any)).thenReturn(mockCollectionReference);
//     when(mockCollectionReference.doc(any)).thenReturn(mockDocumentReference);
//     when(mockDocumentSnapshot.data()).thenReturn({
//       'field1': 'value1',
//       'field2': 'value2',
//     });
//     when(mockCollectionReference.get()).thenAnswer((_) async => mockQuerySnapshot);

//     // call the method that adds data to Firestore
//     await DatabaseUploadService().addDatafromJson();

//     // assert that the data was added successfully
//     final querySnapshot = await mockCollectionReference.get();
//     expect(querySnapshot.docs.length, 1);
//     expect(querySnapshot.docs[0].data(), {
//       'topic': 'test topic',
//       'image_url': 'test image URL',
//       'description': 'test description',
//       'question_count': 1,
//     });
//   });
// }
