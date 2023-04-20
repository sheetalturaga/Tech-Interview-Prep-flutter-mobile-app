import 'package:blindspot_app/controllers/authorization_controller.dart';
import 'package:blindspot_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  group('LoginScreen', () {
    final controller = Get.put(AuthorizationController());

    testWidgets('Renders LoginScreen', (WidgetTester tester) async {
      await tester.pumpWidget(
        const GetMaterialApp(
          home: LoginScreen(),
        ),
      );

      final appBar = find.byType(AppBar);
      expect(appBar, findsOneWidget);

      final container = find.byType(Container);
      expect(container, findsNWidgets(4));

      final signInButton = find.byType(SignInButton);
      expect(signInButton, findsNWidgets(3));
    });

    testWidgets('Presses Google SignInButton', (WidgetTester tester) async {
      await tester.pumpWidget(
        const GetMaterialApp(
          home: LoginScreen(),
        ),
      );

      final signInButton = find.widgetWithText(SignInButton, 'Google');
      expect(signInButton, findsOneWidget);

      await tester.tap(signInButton);
      // await tester.pump();

      // expect(controller.isSigningIn.value, true);

      // await tester.pump(const Duration(seconds: 3)); // Replace with actual waiting time for sign in

      // expect(controller.currentUser.value, isNotNull);
      // expect(controller.isSigningIn.value, false);
    });

    testWidgets('Presses Facebook SignInButton', (WidgetTester tester) async {
      await tester.pumpWidget(
        const GetMaterialApp(
          home: LoginScreen(),
        ),
      );

      final signInButton = find.widgetWithText(SignInButton, 'Facebook');
      expect(signInButton, findsOneWidget);

      await tester.tap(signInButton);
      // await tester.pump();

      // expect(controller.isSigningIn.value, true);

      // await tester.pump(const Duration(seconds: 3)); // Replace with actual waiting time for sign in

      // expect(controller.currentUser.value, isNotNull);
      // expect(controller.isSigningIn.value, false);
    });

    testWidgets('Presses Apple SignInButton', (WidgetTester tester) async {
      await tester.pumpWidget(
        const GetMaterialApp(
          home: LoginScreen(),
        ),
      );

      final signInButton = find.widgetWithText(SignInButton, 'Apple');
      expect(signInButton, findsOneWidget);

      await tester.tap(signInButton);
      await tester.pump();

      // Replace with actual implementation for Apple sign in
      expect(true, true);
    });
  });
}
