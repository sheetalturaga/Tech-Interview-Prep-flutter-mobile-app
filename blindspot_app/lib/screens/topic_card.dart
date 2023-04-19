import 'package:blindspot_app/controllers/topic_controller.dart';
import 'package:blindspot_app/model/quiz_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopicCard extends GetView<TopicController> {
  const TopicCard(
      {super.key,
      required this.model,
      required String topic,
      required topicController});

  final QuizModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ClipRRect(
          // borderRadius: BorderRadius.circular(8),
          child: InkWell(
            onTap: () {
              // check if user is logged
              controller.navigateToQuestions(quiz: model);
            },
            child: Stack(
              children: [
                Container(
                  height: 100,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      gradient: LinearGradient(colors: [
                        // Color(0xFF0061ff),
                        // // Color(0xFF60efff),
                        // Color(0xff30c5d2),
                        // Color(0xFF8711c1),
                        Color(0xFF767689),
                        Color(0xFF767689),
                        // Color(0xFF7BAFD4),
                      ])),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          model.topic,
                          style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          model.description,
                          style: const TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
