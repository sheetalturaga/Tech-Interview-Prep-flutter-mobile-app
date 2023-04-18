import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import '/Users/xiaoxiaoliu/Documents/5520mbile/final-project-sailor-senshi/blindspot_app/lib/screens/about_screen.dart';

void main() {
  testWidgets('AboutScreen displays the correct content', (WidgetTester tester) async {
    // Build the AboutScreen widget
    await tester.pumpWidget(const GetMaterialApp(
      home: AboutScreen(),
    ));

    // Verify that the app bar contains the correct content
    expect(find.text('BlindSpot'), findsOneWidget);
    expect(find.text('Version 2.0.0'), findsOneWidget);
    expect(find.text('All your coding quiz at one place'), findsOneWidget);

    // Verify that the body contains the correct content
    expect(find.text('Pick the topic of your choice and take the quiz'), findsOneWidget);
    expect(find.text('Star mark the question that you want to dive deeper into, to save it to your notebook'), findsOneWidget);
    expect(find.text('Visit your profile to see how much progress you’ve made and also personalize your profile using the setting button'), findsOneWidget);
    expect(find.text('© BlindSpot. All Rights Reversed'), findsOneWidget);
  });
}
