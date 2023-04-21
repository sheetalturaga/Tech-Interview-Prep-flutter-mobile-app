import 'package:blindspot_app/widgets/content_area_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ContentAreaSize should wrap child in a container',
      (tester) async {
    final childWidget = Container(
      width: 100,
      height: 100,
      color: Colors.blue,
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ContentAreaSize(child: childWidget),
        ),
      ),
    );
    // Find the container that should wrap the child widget
    final containerFinder = find.byType(Container);

    // Expect one container to be found
    expect(containerFinder, findsOneWidget);
    // // Expect one child widget to be found inside the container
    expect(find.byWidget(childWidget), findsOneWidget);
  });
}
