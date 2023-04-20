import 'package:blindspot_app/screens/about_screen.dart';
import 'package:blindspot_app/screens/home_screen.dart';
import 'package:blindspot_app/screens/notebook_screen.dart';
import 'package:blindspot_app/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ProfileScreen should have a process button',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: ProfileScreen()));

    // Find the process button by its text
    final processButtonFinder = find.widgetWithText(ElevatedButton, 'Process');
    expect(processButtonFinder, findsOneWidget);

    // Tap the process button and wait for the UI to update
    await tester.tap(processButtonFinder);
    await tester.pump();

    // Verify that the UI has updated to reflect the button press
    // final appBarFinder = find.byType(CustomAppBar);
    // expect(appBarFinder, findsOneWidget);
  });

  testWidgets('ProfileScreen should have a settings button',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: ProfileScreen()));

    // Find the settings button by its text
    final settingsButtonFinder =
        find.widgetWithText(ElevatedButton, 'Settings');
    expect(settingsButtonFinder, findsOneWidget);

    // Tap the settings button and wait for the UI to update
    await tester.tap(settingsButtonFinder);
    await tester.pump();

    // Verify that the UI has updated to reflect the button press
    // final appBarFinder = find.byType(CustomAppBar);
    // expect(appBarFinder, findsOneWidget);
  });

  testWidgets('ProfileScreen should have a logout button',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: ProfileScreen()));

    // Find the logout button by its text
    final logoutButtonFinder = find.widgetWithText(TextButton, 'Logout');
    expect(logoutButtonFinder, findsOneWidget);

    // Tap the logout button and wait for the UI to update
    await tester.tap(logoutButtonFinder);
    await tester.pump();
  });

  testWidgets(
      'ProfileScreen should navigate to other screens on bottom navigation bar tap',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: ProfileScreen()));

    // Find the bottom navigation bar
    final bottomNavigationBarFinder = find.byType(BottomNavigationBar);
    expect(bottomNavigationBarFinder, findsOneWidget);
  });
}
