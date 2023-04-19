// import 'package:blindspot_app/controllers/authorization_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:get/get.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:mockito/mockito.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class MockFirebaseAuth extends Mock implements FirebaseAuth {}

// void main() {
//   late AuthorizationController authController;
//   late MockFirebaseAuth mockFirebaseAuth;

//   setUp(() {
//     mockFirebaseAuth = MockFirebaseAuth();
//     authController = AuthorizationController();
//     authController.authorization = mockFirebaseAuth;
//     authController.initialAuth();
//   });

//   group('signInWithGoogle', () {
//     test('should sign in successfully on web', () async {
//       // given
//       when(mockFirebaseAuth.signInWithPopup(any)).thenAnswer((_) async =>
//           UserCredential(
//               additionalUserInfo: AdditionalUserInfo(isNewUser: true),
//               user: User(uid: '123')));

//       // when
//       final user = await authController.signInWithGoogle(context: Get.context!);

//       // then
//       expect(user!.uid, '123');
//       verify(mockFirebaseAuth.signInWithPopup(any));
//     });

//     test('should sign in successfully on mobile', () async {
//       // given
//       final mockGoogleSignIn = MockGoogleSignIn();
//       final mockAccount = MockGoogleSignInAccount();
//       final mockAuth = MockGoogleSignInAuthentication();

//       when(mockGoogleSignIn.signIn()).thenAnswer((_) async => mockAccount);
//       when(mockAccount.authentication)
//           .thenAnswer((_) async => mockAuth);
//       when(mockAuth.accessToken).thenReturn('access_token');
//       when(mockAuth.idToken).thenReturn('id_token');
//       when(mockFirebaseAuth.signInWithCredential(any)).thenAnswer((_) async =>
//           UserCredential(
//               additionalUserInfo: AdditionalUserInfo(isNewUser: true),
//               user: User(uid: '123')));

//       // when
//       final user = await authController.signInWithGoogle(context: Get.context!);

//       // then
//       expect(user!.uid, '123');
//       verify(mockGoogleSignIn.signIn());
//       verify(mockAccount.authentication);
//       verify(mockFirebaseAuth.signInWithCredential(any));
//     });
//   });

//   // group('signInWithFacebook', () {
//   //   test('should sign in successfully on web', () async {
//   //     // given
//   //     when(mockFirebaseAuth.signInWithPopup(any)).thenAnswer((_) async =>
//   //         UserCredential(
//   //             additionalUserInfo: AdditionalUserInfo(isNewUser: true),
//   //             user: User(uid: '123')));

//   //     // when
//   //     final user =
//   //         await authController.signInWithFacebook(context: Get.context!);

//   //     // then
//   //     expect(user!.uid, '123');
//   //     verify(mockFirebaseAuth.signInWithPopup(any));
//   //   });

//   //   test('should sign in successfully on mobile', () async {
//   //     // given
//   //     final mockLoginResult = MockLoginResult();
//   //     final mockAccessToken = MockAccessToken();
//   //     final mockAuthCredential = MockOAuthCredential();

//   //     when(mockLoginResult.accessToken).thenReturn(mockAccessToken);
//   //     when(mockAccessToken.token).thenReturn('access_token');
//   //     when(mockAuthCredential.accessToken).thenReturn(mockAccessToken);
//   //     when(mockFirebaseAuth.signInWithCredential(any)).thenAnswer((_) async =>
//   //         UserCredential(
//   //             additionalUserInfo: AdditionalUserInfo(isNewUser: true),
//   //             user: User(uid: '123')));

//   //     // when
//   //     final user =
//   //         await authController.signInWithFacebook(context: Get.context!);

//   //     // then
//   //     expect(user!.uid, '123');
//   //     verify(mockFirebaseAuth.signInWithCredential(any));
//   //   });
//   // });
// }

// class MockGoogleSignIn extends Mock implements GoogleSignIn {}

// class MockGoogleSignInAccount extends Mock implements GoogleSignInAccount {}

// class MockGoogleSignInAuthentication extends Mock
//     implements GoogleSignInAuthentication {}

