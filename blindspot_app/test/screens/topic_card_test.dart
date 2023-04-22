import 'package:blindspot_app/model/quiz_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:blindspot_app/screens/topic_card.dart';
import 'package:blindspot_app/controllers/topic_controller.dart';
import 'package:mockito/mockito.dart';

class MockTopicController extends Mock implements TopicController {}

class MockQuizModel extends Mock implements QuizModel {}

void main() {
  //widget test
  testWidgets('should render TopicCard widget', (WidgetTester tester) async {
    await tester.pumpWidget(
      GetMaterialApp(
        home: Scaffold(
          body: TopicCard(
            model: QuizModel(
                id: '123',
                topic: 'Test Topic',
                description: 'Test Description',
                questionCount: 0),
            // topic: '',
            // topicController: null,
          ),
        ),
      ),
    );

    final topicFinder = find.text('Test Topic');
    final descriptionFinder = find.text('Test Description');

    expect(topicFinder, findsOneWidget);
    expect(descriptionFinder, findsOneWidget);
  });
}
