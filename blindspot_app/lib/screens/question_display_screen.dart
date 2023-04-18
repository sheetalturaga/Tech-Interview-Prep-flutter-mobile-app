import 'package:blindspot_app/controllers/questions_controller.dart';
import 'package:blindspot_app/screens/home_screen.dart';
import 'package:blindspot_app/screens/result_screen.dart';
import 'package:blindspot_app/widgets/question_display_page_decor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../firestore_references/collection_refs.dart';
import '../widgets/content_area_size.dart';
import '../widgets/custom_question_display_navbar.dart';

// Same as the quizz screen dart file - revised UI - Done
// // Next Question button -> Done
// Quit button -> homeScreen -> Done
// Counter for the number of questions - Done

class QuestionDisplayScreen extends GetView<QuestionsController> {
  const QuestionDisplayScreen({super.key});

  static const String routeName = "/questiondisplayscreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomQuestionDisplayNavbar(
        secondaryWidget: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: const ShapeDecoration(
              shape: StadiumBorder(
                  side: BorderSide(color: Colors.white, width: 2))),
          child: const Text("Counter"),
        ),
        displayActionIcon: true,
        leadTitleWidget: Obx(
          () => Text(
            "Question ${(controller.questionIndex.value + 1).toString().padLeft(2, '0')}",
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
          ),
        ),
        onTapAction: () {
          Get.offAllNamed(HomeScreen.routeName);
        },
      ),
      body: QuestionDisplayPageDecor(
        child: Obx(() => Column(
              children: [
                if (controller.loadStatus.value == LoadStatus.loading)
                  const Expanded(child: LinearProgressIndicator()),
                if (controller.loadStatus.value == LoadStatus.complete)
                  Expanded(
                      child: ContentAreaSize(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.only(top: 25),
                      child: Column(
                        children: [
                          Text(
                            controller.currQ.value!.question,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w800),
                          ),
                          // Specifying which controller get builder needs to refer to
                          GetBuilder<QuestionsController>(
                              id: 'chosenOptionsList',
                              builder: (context) {
                                return ListView.separated(
                                  itemCount:
                                      controller.currQ.value!.options!.length,
                                  shrinkWrap: true,
                                  padding: const EdgeInsets.only(top: 25),
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final opts =
                                        controller.currQ.value!.options![index];

                                    // final optionString =
                                    //     '${opts.identifier}. ${opts.option}';

                                    // final chosenAnswer =
                                    //     controller.currQ.value!.chosenOption;
                                    // final correctAnswer =
                                    //     controller.currQ.value!.correctOption;

                                    // if (chosenAnswer == correctAnswer &&
                                    //     opts.identifier == chosenAnswer) {
                                    //   return CorrectOptionDisplay(
                                    //       optionString: optionString);
                                    // } else if (chosenAnswer == null) {
                                    //   return WrongOptionDisplay(
                                    //       optionString: optionString);
                                    // } else if (correctAnswer != chosenAnswer &&
                                    //     opts.identifier == chosenAnswer) {
                                    //   return WrongOptionDisplay(
                                    //       optionString: optionString);
                                    // } else if (correctAnswer ==
                                    //     opts.identifier) {
                                    //   return CorrectOptionDisplay(
                                    //       optionString: optionString);
                                    // }
                                    return OptionsDisplayCard(
                                      option:
                                          '${opts.identifier}. ${opts.option}',
                                      onTap: () {
                                        controller.choseOption(opts.identifier);
                                      },
                                      isSelected: opts.identifier ==
                                          controller.currQ.value!.chosenOption,
                                      isCorrect:
                                          controller.isCorrect(opts.identifier),
                                    );
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return const SizedBox(
                                      height: 10,
                                    );
                                  },
                                );
                              }),
                        ],
                      ),
                    ),
                  )),
                ColoredBox(
                  color: Theme.of(context).cardColor,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(children: [
                      Expanded(
                          child: Obx(
                        () => Visibility(
                            visible: controller.loadStatus.value ==
                                LoadStatus.complete,
                            child: NextButton(
                              onTap: () {
                                controller.isAnswerProvided()
                                    ? controller.nextQuestion()
                                    : null;
                                controller.isLastQuestion
                                    ? Get.toNamed(ResultScreen.routeName)
                                    : controller.nextQuestion();
                              },
                              title: controller.isLastQuestion
                                  ? "Complete"
                                  : "Next",
                            )),
                      )),
                    ]),
                  ),
                )
              ],
            )),
      ),
    );
  }
}

class OptionsDisplayCard extends StatelessWidget {
  final String option;
  final bool isSelected;
  final bool isCorrect;
  final VoidCallback onTap;

  const OptionsDisplayCard({
    super.key,
    required this.option,
    this.isSelected = false,
    this.isCorrect = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10.0),
      onTap: onTap,
      child: Ink(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        decoration: BoxDecoration(
            color: isSelected
                ? isCorrect
                    ? Colors.green.withOpacity(0.2)
                    : Colors.red.withOpacity(0.2)
                : const Color(0xFFACD3F7),
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: isSelected
                  ? isCorrect
                      ? Colors.green
                      : Colors.red
                  : const Color(0xFFACD3F7),
            )),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            option,
            style: TextStyle(color: isSelected ? Colors.black : null),
          ),
        ),
      ),
    );
  }
}

// class CorrectOptionDisplay extends StatelessWidget {
//   const CorrectOptionDisplay({
//     Key? key,
//     required this.optionString,
//   }) : super(key: key);

//   final String optionString;

//   @override
//   Widget build(BuildContext context) {
//     return Ink(
//       padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10.0),
//         color: Colors.green.withOpacity(0.2),
//       ),
//       child: Text(
//         optionString,
//         style: TextStyle(
//             color: Colors.green.withOpacity(0.2), fontWeight: FontWeight.bold),
//       ),
//     );
//   }
// }

// class WrongOptionDisplay extends StatelessWidget {
//   const WrongOptionDisplay({
//     Key? key,
//     required this.optionString,
//   }) : super(key: key);

//   final String optionString;

//   @override
//   Widget build(BuildContext context) {
//     return Ink(
//       padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10.0),
//         color: Colors.red.withOpacity(0.2),
//       ),
//       child: Text(
//         optionString,
//         style: TextStyle(
//             color: Colors.red.withOpacity(0.2), fontWeight: FontWeight.bold),
//       ),
//     );
//   }
// }

class NextButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool enabled;
  final Widget? child;
  final Color? color;
  const NextButton(
      {super.key,
      this.title = '',
      required this.onTap,
      this.enabled = true,
      this.child,
      this.color});

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: SizedBox(
          height: 55,
          child: InkWell(
            borderRadius: BorderRadius.circular(10.0),
            onTap: enabled == false ? null : onTap,
            child: Ink(
              width: double.maxFinite,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: color ?? Theme.of(context).cardColor),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: child ??
                    Center(
                      child: Text(
                        title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
              ),
            ),
          )),
    );
  }
}
