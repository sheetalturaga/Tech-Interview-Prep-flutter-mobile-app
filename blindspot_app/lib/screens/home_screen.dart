import 'package:blindspot_app/screens/topic_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/topic_controller.dart';
import '../custom_widgets/custom_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    final TopicController topicController = Get.find();
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 100,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          flexibleSpace: ClipPath(
            clipper: ReviseSize(),
            child: Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              color: Colors.blue,
            ),
          )),
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
