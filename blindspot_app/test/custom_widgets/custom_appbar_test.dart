import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:blindspot_app/custom_widgets/custom_appbar.dart';

void main() {
  testWidgets('ReviseSize clipper should clip widget',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ClipPath(
            clipper: ReviseSize(),
            child: Container(
              height: 200,
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );

    expect(find.byType(ClipPath), findsOneWidget);
    expect(find.byType(Container), findsOneWidget);
  });
}
