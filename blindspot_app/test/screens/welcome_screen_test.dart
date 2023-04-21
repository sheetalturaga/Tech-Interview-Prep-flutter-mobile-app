import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:blindspot_app/screens/welcome_screen.dart';

void main() {
  group('WelcomeScreen widget', () {
    testWidgets('renders image', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: WelcomeScreen(),
      ));

      final imageFinder = find.byType(Image);

      expect(imageFinder, findsOneWidget);
    });

    testWidgets('image has correct asset path', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: WelcomeScreen(),
      ));

      final imageFinder = find.byType(Image);

      expect((imageFinder.evaluate().first.widget as Image).image,
          const AssetImage('assets/images/BLINDSPOT.jpeg'));
    });

    testWidgets('image has correct dimensions', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: WelcomeScreen(),
      ));

      final imageFinder = find.byType(Image);

      expect((imageFinder.evaluate().first.widget as Image).width, 650);
      expect((imageFinder.evaluate().first.widget as Image).height, 650);
    });
  });
}
