import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  final String email;

  UserModel({
    required this.id,
    required this.email,
  });

  factory UserModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return UserModel(
      id: doc.id,
      email: data['email'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'email': email,
    };
  }

  static Future<String> createUserWithEmail(String email) async {
    try {
      CollectionReference usersCollection =
          FirebaseFirestore.instance.collection('users');
      DocumentReference docRef = await usersCollection.add({'email': email});
      return docRef.id;
    } catch (e) {
      print('Error creating user: $e');
      return '';
    }
  }
}
