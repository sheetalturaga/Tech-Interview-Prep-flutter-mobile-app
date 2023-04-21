import 'package:flutter/material.dart';
//import 'package:blindspot_app/screens/progress_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

void main() {
  testWidgets('testing circular percent indicator widget',
      (WidgetTester tester) async {
    CircularPercentIndicator localWidget =
        CircularPercentIndicator(radius: 20.0);
    await tester.pumpWidget(MaterialApp(home: localWidget));
    expect(localWidget.percent, 0.0);
  });
}
