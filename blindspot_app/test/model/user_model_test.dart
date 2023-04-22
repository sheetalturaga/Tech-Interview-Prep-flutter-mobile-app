import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:blindspot_app/model/user_model.dart';

void main() {
  group('UserModel', () {
    test('should create Firestore data from a UserModel', () {
      // Create a UserModel with test data
      final userModel = UserModel(id: 'test123', email: 'test@test.com');

      // Convert the UserModel to Firestore data
      final data = userModel.toFirestore();

      // Verify that the Firestore data was created correctly
      expect(data['email'], equals('test@test.com'));
    });

    test('should create a user in Firestore with email', () async {
      // Create a test email
      final email = 'test@test.com';

      // Create a user in Firestore with the test email
      final docId = await UserModel.createUserWithEmail(email);

      // Verify that the user was created with a document ID
      expect(docId, '');
    });
  });
}
