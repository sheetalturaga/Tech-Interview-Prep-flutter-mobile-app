import 'package:blindspot_app/controllers/questions_controller.dart';
import 'package:blindspot_app/ui/shared/color.dart';
import 'package:blindspot_app/widgets/question_display_page_decor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../firestore_references/collection_refs.dart';

// Same as the quizz screen dart file - revised UI

class QuestionDisplayScreen extends GetView<QuestionsController> {
  const QuestionDisplayScreen({super.key});

  static const String routeName = "/questiondisplayscreen";

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: QuestionDisplayPageDecor(
  //         child: Column(
  //       children: [
  //         if (controller.loadStatus.value == LoadStatus.loading)
  //           const Expanded(child: CircularProgressIndicator()),
  //         if (controller.loadStatus.value == LoadStatus.complete)
  //           Expanded(
  //             child: SingleChildScrollView(
  //                 child: Column(
  //               children: [
  //                 Center(
  //                   child: Text(controller.currentQuestion.value!.question),
  //                 )
  //               ],
  //             )),
  //           )
  //       ],
  //     )),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: QuestionDisplayPageDecor(
        child: Center(child: Text("controller.questions!.question")),
      ),
    );
  }
}

class AnswerCard extends StatelessWidget {
  final String option;
  final bool isSelected;
  final VoidCallback onTap;

  const AnswerCard(
      {super.key,
      required this.option,
      this.isSelected = false,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10.0),
      onTap: onTap,
      child: Ink(
        decoration: BoxDecoration(
            border: Border.all(
                color: isSelected
                    ? selectionColor
                    : Theme.of(context).primaryColor),
            borderRadius: BorderRadius.circular(10.0),
            color: isSelected ? selectionColor : Theme.of(context).cardColor),
        child: Text(
          option,
          style: TextStyle(color: isSelected ? selectionColor : null),
        ),
      ),
    );
  }
}
