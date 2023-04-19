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
  group('TopicCard', () {
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
              topic: '',
              topicController: null,
            ),
          ),
        ),
      );

      final topicFinder = find.text('Test Topic');
      final descriptionFinder = find.text('Test Description');

      expect(topicFinder, findsOneWidget);
      expect(descriptionFinder, findsOneWidget);
    });
  });

//unit test not working
  group('TopicCard', () {
    late TopicController topicController;
    late QuizModel quizModel;

    setUp(() {
      topicController = MockTopicController();
      quizModel = MockQuizModel();

      when(topicController.getQuizModel())
          .thenAnswer((_) => Future.value(quizModel));
      when(quizModel.topic).thenReturn('Java');
      when(quizModel.description).thenReturn('A quiz about Java');
    });

    testWidgets('displays topic and description', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: TopicCard(
            topicController: topicController,
            model: quizModel,
            topic: 'Java',
          ),
        ),
      );

      expect(find.text('Java'), findsOneWidget);
      expect(find.text('A quiz about Java'), findsOneWidget);
    });
  });
}
