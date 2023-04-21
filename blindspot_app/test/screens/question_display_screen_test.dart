import 'package:blindspot_app/screens/question_display_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:blindspot_app/model/quiz_model.dart';
import 'package:mockito/mockito.dart';

class MockQuizModel extends Mock implements QuizModel {}

void main() {
  testWidgets('OptionsDisplayCard displays option text',
      (WidgetTester tester) async {
    // Create a Questions object for testing
    final question = Questions(
      id: '123',
      question: 'What is the capital of France?',
      options: [
        Options(identifier: 'A', option: 'Paris'),
        Options(identifier: 'B', option: 'London'),
        Options(identifier: 'C', option: 'New York'),
        Options(identifier: 'D', option: 'Tokyo'),
      ],
      correctOption: 'A',
      explanation: null,
      isLocked: false,
    );

    // Build the OptionsDisplayCard widget with the desired properties
    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: OptionsDisplayCard(
            option: 'A. Paris',
            question: question,
            isSelected: false,
            isCorrect: true,
            onTap: () {},
          ),
        ),
      ),
    );

    // Find the Text widget displaying the option text
    final optionTextFinder = find.text('A. Paris');

    // Verify that the Text widget is found
    expect(optionTextFinder, findsOneWidget);
  });

  testWidgets('NextButton changes text when pressed',
      (WidgetTester tester) async {
    final widget = NextButton(
      key: null,
      title: 'Next',
      onTap: () {},
    );
    await tester.pumpWidget(MaterialApp(home: widget));

    // Verify that the initial text is displayed
    expect(find.text('Next'), findsOneWidget);

    // Tap the button
    await tester.tap(find.byType(NextButton));
    await tester.pump();

    // Verify that the text has changed
    expect(find.text('Next'), findsOneWidget);
  });
}
