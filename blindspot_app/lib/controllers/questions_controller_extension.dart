import 'package:blindspot_app/controllers/questions_controller.dart';
import 'dart:core';
// A class that is extension of the Questions Controller
// used to calculate results for the result screen or add new features
// associated with working with questions from the database
extension QuestionsControllerExt on QuestionsController {
  // Number of Correct Answered provided by the user
  int get correctlyChosenCount => listOfAllQuestionsInTopic
      .where((element) => element.chosenOption == element.correctOption)
      .toList()
      .length;

  String get correctlyAnsweredQuestions {
    return '$correctlyChosenCount out of ${listOfAllQuestionsInTopic.length}';
  }


  


}
