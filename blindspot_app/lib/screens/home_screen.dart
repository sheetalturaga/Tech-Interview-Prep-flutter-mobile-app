import 'package:blindspot_app/screens/topic_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/topic_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    final TopicController topicController = Get.find();
    return Scaffold(
      body: Obx(() => ListView.separated(
          itemBuilder: (context, int index) {
            return TopicCard(model: topicController.allTopics[index]);
          },
          separatorBuilder: (context, int index) {
            return const SizedBox(
              height: 20,
            );
          },
          itemCount: topicController.allTopics.length)),
    );
  }
}
