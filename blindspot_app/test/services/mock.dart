import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

// Source Citation for setting firebase firestore instance to test/mock
// StackOverflow:https://stackoverflow.com/questions/63634609/firebase-auth-unit-testing-error-no-firebase-app/63701588#63701588
// Flutter fire github: https://github.com/firebase/flutterfire/blob/master/packages/firebase_auth/firebase_auth/test/mock.dart

typedef Callback = void Function(MethodCall call);

void setupFirebaseAuthMocks([Callback? customHandlers]) {
  TestWidgetsFlutterBinding.ensureInitialized();

  setupFirebaseCoreMocks();
}

Future<T> neverEndingFuture<T>() async {
  // ignore: literal_only_boolean_expressions
  while (true) {
    await Future.delayed(const Duration(minutes: 5));
  }
}