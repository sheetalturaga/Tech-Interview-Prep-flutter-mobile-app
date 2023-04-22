import 'package:blindspot_app/screens/about_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('AboutScreen UI Test', (WidgetTester tester) async {
    // Build the AboutScreen widget.
    await tester.pumpWidget(
      const MaterialApp(
        home: AboutScreen(),
      ),
    );

    // Verify that the app bar title and subtitle are displayed.
    expect(find.text('BLIND SPOT'), findsOneWidget);
    expect(find.text('Learning The Gap'), findsOneWidget);

    // Verify that the body text is displayed.
    expect(
      find.text(
        'Pick the topic of your choice and take the quiz. Each Quiz renders 10 questions with multiple option to choose from. The option tile will turn red if the answer is incorrect, else it will turn green You can always quit by clicking the home button',
      ),
      findsOneWidget,
    );
    expect(
      find.text(
        'The questions answered incorrectly are automatically saved to your notebook so you can read the right explanation for it.',
      ),
      findsOneWidget,
    );
    expect(
      find.text(
        'Keep track of progress through your profile',
      ),
      findsOneWidget,
    );

    // Verify that the footer text is displayed.
    expect(
      find.text(
        '© BlindSpot App - A CS5520 Project by Team Sailor Senshi',
      ),
      findsOneWidget,
    );
  });
}
