import 'package:blindspot_app/screens/about_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  testWidgets('AboutScreen displays the correct content',
      (WidgetTester tester) async {
    // Build the AboutScreen widget
    await tester.pumpWidget(const GetMaterialApp(
      home: AboutScreen(),
    ));

    // Verify that the app bar contains the correct content
    expect(find.text('BLIND SPOT'), findsOneWidget);
    expect(find.text('Version 2.0.0'), findsNothing);
    expect(find.text('Learning The Gap'), findsOneWidget);

    // Verify that the body contains the correct content
    expect(find.text('Pick the topic of your choice and take the quiz'),
        findsNothing);
    expect(
        find.text(
            'Star mark the question that you want to dive deeper into, to save it to your notebook'),
        findsNothing);
    expect(find.text('Keep track of progress through your profile'),
        findsOneWidget);
  });
}
