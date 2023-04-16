import 'package:blindspot_app/controllers/questions_controller.dart';
import 'package:blindspot_app/screens/explanation_screen.dart';
import 'package:blindspot_app/screens/result_screen.dart';
import 'package:blindspot_app/ui/shared/color.dart';
import 'package:blindspot_app/widgets/question_display_page_decor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../firestore_references/collection_refs.dart';
import '../widgets/content_area_size.dart';

// Same as the quizz screen dart file - revised UI

class QuestionDisplayScreen extends GetView<QuestionsController> {
  const QuestionDisplayScreen({super.key});

  static const String routeName = "/questiondisplayscreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                              id: 'options_list',
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
                                    return OptionsDisplayCard(
                                      option:
                                          '(${opts.identifier}) ${opts.option}',
                                      onTap: () {
                                        controller.choseOption(opts.identifier);
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
                          // const SizedBox(height: 10),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: SizedBox(
                              width: 400,
                              child: Padding(
                                padding: const EdgeInsets.all(30.0),
                                child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Text(
                                      "Submit",
                                      style: TextStyle(color: Colors.black),
                                    )),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ))
              ],
            )),
      ),
    );
  }
}

class OptionsDisplayCard extends StatelessWidget {
  final String option;
  final bool isSelected;
  final VoidCallback onTap;

  const OptionsDisplayCard(
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
        // padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        decoration: BoxDecoration(
            border: Border.all(
                color: isSelected
                    ? answerSelectionColor
                    : const Color(0xFFACD3F7)),
            borderRadius: BorderRadius.circular(10.0),
            color: isSelected ? answerSelectionColor : const Color(0xFFACD3F7)),
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
