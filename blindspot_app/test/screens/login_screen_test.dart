import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:blindspot_app/screens/login_screen.dart';

void main() {
  testWidgets('Login screen title text UI', (WidgetTester tester) async {
    // Build the LoginScreen widget
    await tester.pumpWidget(MaterialApp(home: LoginScreen()));

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
