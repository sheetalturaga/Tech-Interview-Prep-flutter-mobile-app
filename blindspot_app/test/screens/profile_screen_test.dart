import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ElevatedButton and TextButton test',
      (WidgetTester tester) async {
    // Build the UI
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('Elevated'),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {},
                child: const Text('Text'),
              ),
            ],
          ),
        ),
      ),
    );

    // Find the buttons
    final elevatedButton = find.widgetWithText(ElevatedButton, 'Elevated');
    final textButton = find.widgetWithText(TextButton, 'Text');

    // Verify that buttons are visible
    expect(elevatedButton, findsOneWidget);
    expect(textButton, findsOneWidget);

    // Tap the buttons and verify that they are pressed
    await tester.tap(elevatedButton);
    await tester.pumpAndSettle();
    expect(find.byType(ElevatedButton), findsOneWidget);

    await tester.tap(textButton);
    await tester.pumpAndSettle();
    expect(find.byType(TextButton), findsOneWidget);
  });
}
