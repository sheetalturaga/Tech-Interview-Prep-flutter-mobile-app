import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ElevatedButton should display text',
      (WidgetTester tester) async {
    final buttonKey = UniqueKey();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ElevatedButton(
            key: buttonKey,
            onPressed: () {},
            child: const Text('Submit'),
          ),
        ),
      ),
    );

    final buttonFinder = find.byKey(buttonKey);
    final buttonTextFinder = find.text('Submit');

    expect(buttonFinder, findsOneWidget);
    expect(buttonTextFinder, findsOneWidget);
  });

  testWidgets('Container should display child widget',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Container(
            width: 100,
            height: 100,
            child: const Text('Hello, world!'),
          ),
        ),
      ),
    );

    final containerFinder = find.byType(Container);
    final textFinder = find.text('Hello, world!');

    expect(containerFinder, findsOneWidget);
    expect(textFinder, findsOneWidget);
  });

  testWidgets('Container should have correct size and color',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Container(
            width: 200,
            height: 200,
            color: Colors.blue,
          ),
        ),
      ),
    );
    final containerFinder = find.byType(Container);

    expect(containerFinder, findsOneWidget);
    expect(tester.getSize(containerFinder), const Size(200, 200));
    expect(
        tester.widget<Container>(containerFinder).color, equals(Colors.blue));
  });
}
