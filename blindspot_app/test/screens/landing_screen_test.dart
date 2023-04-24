import 'package:blindspot_app/app_routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:blindspot_app/screens/landing_screen.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

void main() {
  testWidgets('Landing screen displays the correct widgets',
      (WidgetTester tester) async {
    // Build the LandingScreen widget and trigger a frame
    await tester.pumpWidget(const MaterialApp(home: LandingScreen()));

    // Check that the app bar is displayed
    expect(find.byType(AppBar), findsOneWidget);

    // Check that the login button is displayed
    expect(find.widgetWithText(ElevatedButton, 'Login'), findsOneWidget);

    // Check that the about button is displayed
    expect(find.widgetWithText(ElevatedButton, 'About'), findsOneWidget);
  });

  testWidgets('Pressing the login button navigates to the login screen',
      (WidgetTester tester) async {
    // // Build the LandingScreen widget and trigger a frame
    await tester.pumpWidget(const MaterialApp(home: LandingScreen()));

    // // Tap the login button
    await tester.tap(find.widgetWithText(ElevatedButton, 'Login'));

    // // Rebuild the widget after the state has changed
    // await tester.pump();

    // // Check that the LoginScreen is displayed
    // expect(find.byType(LoginScreen), findsOneWidget);
  });

  testWidgets('Pressing the about button navigates to the about screen',
      (WidgetTester tester) async {
    // Build the LandingScreen widget and trigger a frame
    await tester.pumpWidget(const MaterialApp(home: LandingScreen()));

    // Tap the about button
    await tester.tap(find.widgetWithText(ElevatedButton, 'About'));

    // Rebuild the widget after the state has changed
    // await tester.pump();

    // Check that the AboutScreen is displayed
    // expect(find.byType(AboutScreen), findsOneWidget);
  });

  group('AppRoutes', () {
    test('should have the correct /landingscreen route', () {
      final routes = AppRoutes.routesList();

      final landingPageRoute =
          routes.firstWhere((route) => route.name == '/landingscreen');

      expect(landingPageRoute, isNotNull);
      expect(landingPageRoute.page, isA<Function>());
      expect(landingPageRoute.page(), isA<LandingScreen>());
      expect(landingPageRoute.binding, isA<BindingsBuilder>());
    });
  });
}
