import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_database/firebase_database.dart';

// Creates the main questions collections in the Firestore to used
// throughout the app
final firestore = FirebaseFirestore.instance;

final realTimeFirebase = FirebaseDatabase.instance;

//Parent collection
final questionCollectionRef = firestore.collection("questionsCollection");

// real time reference to questions collection
final qcRef = realTimeFirebase.ref("questionsCollection");

// Method to call by passing the file ID and a question Id (as specified in each
// json file) and creating a new sub collection under each topic
DocumentReference questionsRef({
  required String fileId,
  required String questionId,
}) =>
    questionCollectionRef.doc(fileId).collection("questions").doc(questionId);

enum LoadStatus {
  loading, // value 0
  complete, // value 1
  error, // value 2
}

Reference get storage => FirebaseStorage.instance.ref();
