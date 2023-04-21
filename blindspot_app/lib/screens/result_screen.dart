import 'package:blindspot_app/controllers/questions_controller.dart';
import 'package:blindspot_app/screens/profile_screen.dart';
import 'package:blindspot_app/ui/shared/color.dart';
import 'package:blindspot_app/widgets/content_area_size.dart';
import 'package:blindspot_app/widgets/custom_question_display_navbar.dart';
import 'package:blindspot_app/widgets/question_display_page_decor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'landing_screen.dart';
import 'notebook_screen.dart';

class ResultScreen extends GetView<QuestionsController> {
  static const String routeName = "/resultscreen";

  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: QuestionDisplayPageDecor(
        child: Column(children: [
          const CustomQuestionDisplayNavbar(
              secondaryWidget: SizedBox(height: 80)),
          Expanded(
            child: ContentAreaSize(
                child: Column(
              children: [
                SvgPicture.asset('assets/images/trophy.svg',
                    height: 100, width: 100, fit: BoxFit.scaleDown),
                const Padding(
                  padding: EdgeInsets.only(top: 20.0, bottom: 20),
                  child: Text(
                    "RESULTS",
                    style: TextStyle(
                        color: Color(0xFF062543),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Column(
                    children: <Widget>[
                      Positioned(
                        right: 0,
                        left: 0,
                        child: Container(
                          color: const Color(0xFF9891C6),
                          height: 30,
                          width: MediaQuery.of(context).size.width / 2,
                          child: const Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Text(
                              "Topic",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        child: Container(
                          // color: Color(0xFFD6EAFF),
                          color: mainAppColor.withOpacity(0.1),
                          height: 100,
                          width: MediaQuery.of(context).size.width,
                          child: const Padding(
                            padding: EdgeInsets.only(top: 30),
                            child: Text(
                              // controller.currTopic.value!,
                              "Java",
                              style: TextStyle(
                                  color: Color(0xFF062543), fontSize: 25),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Column(
                    children: <Widget>[
                      Positioned(
                        right: 0,
                        left: 0,
                        child: Container(
                          color: const Color(0xFF9891C6),
                          height: 30,
                          width: MediaQuery.of(context).size.width / 2,
                          child: const Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Text(
                              "Final Score",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        child: Container(
                          color: mainAppColor.withOpacity(0.1),
                          height: 100,
                          width: MediaQuery.of(context).size.width,
                          child: const Padding(
                            padding: EdgeInsets.only(top: 30.0),
                            child: Text(
                              // controller.quizCompleted.toString(),
                              "10 out of 10",
                              style: TextStyle(
                                  color: Color(0xFF062543), fontSize: 25),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
          )
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: const Color(0xFF1683E9),
        unselectedItemColor: const Color(0xFF1683E9),
        onTap: (int index) {
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LandingScreen()),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NotebookScreen()),
              );
              // Handle navigation to Notebook screen
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
              // Handle navigation to User screen
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
