import 'package:blindspot_app/controllers/questions_controller.dart';
import 'package:blindspot_app/screens/explanation_screen.dart';
import 'package:blindspot_app/screens/result_screen.dart';
import 'package:blindspot_app/ui/shared/color.dart';
import 'package:blindspot_app/widgets/question_display_page_decor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../firestore_references/collection_refs.dart';
import '../model/quiz_model.dart';
import '../widgets/content_area_size.dart';
import '../widgets/custom_question_display_navbar.dart';
import 'home_screen.dart';

class QuestionDisplayScreen extends GetView<QuestionsController> {
  static const String routeName = "/questiondisplayscreen";
  bool isTappedOn = false;

  QuestionDisplayScreen({super.key});

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
          child: GestureDetector(
            onTap: () {
              isTappedOn = true;
            },
            child: Icon(
              Icons.star_border_outlined,
              color: isTappedOn ? Colors.amber : Colors.white,
            ),
          ),
        ),
        // decoration: const ShapeDecoration(
        //     shape: StadiumBorder(
        //         side: BorderSide(color: Colors.white, width: 2)))
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
                                    final currentQuestion =
                                        controller.currQ.value!;

                                    return OptionsDisplayCard(
                                      question: currentQuestion,
                                      option:
                                          '${opts.identifier}. ${opts.option}',
                                      onTap: () {
                                        if (!controller
                                            .currQ.value!.isLocked!) {
                                          controller
                                              .choseOption(opts.identifier);
                                        }
                                      },
                                      isSelected: opts.identifier ==
                                          controller.currQ.value!.chosenOption,
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
                                controller.isLastQuestion
                                    ? Get.toNamed(ResultScreen.routeName)
                                    : controller.nextQuestion();
                              },
                              title: controller.isLastQuestion
                                  ? "Complete"
                                  : "Next Question",
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
  final String option; // identifier : A, Option: String text
  final Questions question;
  final bool isSelected;
  final bool isCorrect;
  final VoidCallback onTap;

  const OptionsDisplayCard({
    super.key,
    required this.option,
    this.isSelected = false,
    this.isCorrect = false,
    required this.onTap,
    required this.question,
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
                ? question.chosenOption == question.correctOption
                    ? Colors.green.withOpacity(0.5)
                    : Colors.red.withOpacity(0.5)
                : const Color(0xFFACD3F7),
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: isSelected
                  ? question.chosenOption == question.correctOption
                      ? Colors.green.withOpacity(0.5)
                      : Colors.red.withOpacity(0.5)
                  : const Color(0xFFACD3F7),
            )),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            option,
            style: TextStyle(color: isSelected ? Colors.black : null),
          ),
        ),
      ),
    );
  }
}

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
            borderRadius: BorderRadius.circular(0.1),
            onTap: enabled == false ? null : onTap,
            child: Ink(
              width: double.maxFinite,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: color ?? mainAppColor),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: child ??
                    Center(
                      child: Text(
                        title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).cardColor,
                        ),
                      ),
                    ),
              ),
            ),
          )),
    );
  }
}
