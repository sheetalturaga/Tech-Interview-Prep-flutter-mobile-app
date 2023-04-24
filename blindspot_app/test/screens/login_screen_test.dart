import 'package:blindspot_app/controllers/authorization_controller.dart';
import 'package:blindspot_app/firebase_options.dart';
import 'package:blindspot_app/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:blindspot_app/screens/login_screen.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mockito/mockito.dart';

class MockAuthorizationController extends Mock
    implements AuthorizationController {}

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockGoogleSignIn extends Mock implements GoogleSignIn {}

// ignore: must_be_immutable
class MockGoogleSignInAccount extends Mock implements GoogleSignInAccount {}

class MockGoogleSignInAuthentication extends Mock
    implements GoogleSignInAuthentication {}

class MockUserCredential extends Mock implements UserCredential {}

class MockUser extends Mock implements User {}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  testWidgets('Login screen title text UI', (WidgetTester tester) async {
    // Build the LoginScreen widget
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

    // Find the title text widget
    final titleTextFinder = find.text('BLIND SPOT');

    // Check if the title text is displayed
    expect(titleTextFinder, findsOneWidget);

    // Check the font size of the title text
    final titleTextWidget = tester.widget<Text>(titleTextFinder);
    expect(titleTextWidget.style!.fontSize, equals(40.0));

    // Check the font weight of the title text
    expect(titleTextWidget.style!.fontWeight, equals(FontWeight.bold));

    // Check the font family of the title text
    expect(titleTextWidget.style!.fontFamily, equals('AppIcons'));
  });
}
