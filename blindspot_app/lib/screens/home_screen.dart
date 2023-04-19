import 'package:blindspot_app/screens/profile_screen.dart';
import 'package:blindspot_app/screens/topic_card.dart';
import 'package:blindspot_app/ui/shared/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/topic_controller.dart';
import '../custom_widgets/custom_appbar.dart';
import 'landing_screen.dart';
import 'notebook_screen.dart';

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
              color: mainAppColor,
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


          
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.blue,
        onTap: (int index) {
          switch (index) {
            case 0:
              Get.toNamed(HomeScreen.routeName);
              break;
            case 1:
              Get.toNamed(NotebookScreen.routeName);
              break;
            case 2:
              Get.toNamed(ProfileScreen.routeName);
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Notebook',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'User',
          ),
        ],
      ),
    );
  }
}
