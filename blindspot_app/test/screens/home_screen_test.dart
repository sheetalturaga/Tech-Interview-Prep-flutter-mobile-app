import 'package:blindspot_app/controllers/topic_controller.dart';
import 'package:blindspot_app/screens/home_screen.dart';
import 'package:blindspot_app/screens/topic_card.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  // Instantiate the controller for use in the tests
  late TopicController topicController;

  // Initialize the controller and the Get library before running the tests
  setUpAll(() async {
    topicController = Get.put(TopicController());
  });

  // Clean up the Get library after running the tests
  tearDownAll(() async {
    //await closeGetItTest();
  });

  // Test the HomeScreen widget
  testWidgets('HomeScreen displays the correct number of topic cards',
      (WidgetTester tester) async {
    // Build the HomeScreen widget
    await tester.pumpWidget(const GetMaterialApp(home: HomeScreen()));

    // Verify that the widget displays a certain number of TopicCard widgets
    expect(find.byType(TopicCard),
        findsNWidgets(topicController.allTopics.length));
  });
}
