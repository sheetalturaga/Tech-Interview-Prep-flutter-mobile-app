import 'package:blindspot_app/controllers/questions_controller.dart';
import 'package:blindspot_app/widgets/question_display_page_decor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../firestore_references/collection_refs.dart';

// Same as the quizz screen dart file - revised UI

class QuestionDisplayScreen extends GetView<QuestionsController> {
  const QuestionDisplayScreen({super.key});

  static const String routeName = "/questiondisplayscreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: QuestionDisplayPageDecor(
          child: Column(
        children: [
          if (controller.loadStatus.value == LoadStatus.loading)
            const Expanded(child: CircularProgressIndicator()),
          if (controller.loadStatus.value == LoadStatus.loading)
            Expanded(
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  Center(
                    child: Text(controller.currentQuestion.value!.question),
                  )
                ],
              )),
            )
        ],
      )),
    );
  }
}
