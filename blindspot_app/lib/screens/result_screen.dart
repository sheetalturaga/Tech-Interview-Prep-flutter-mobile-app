import 'package:blindspot_app/controllers/questions_controller.dart';
import 'package:blindspot_app/ui/shared/color.dart';
import 'package:blindspot_app/widgets/content_area_size.dart';
import 'package:blindspot_app/widgets/custom_question_display_navbar.dart';
import 'package:blindspot_app/widgets/question_display_page_decor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

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
                secondaryWidget: SizedBox(height: 80), title: "You Did It!"),
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
                          color: mainAppColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      children: <Widget>[
                        Positioned(
                          right: 0,
                          left: 0,
                          child: Container(
                            color: const Color(0xFF5427D8),
                            height: 30,
                            width: MediaQuery.of(context).size.width / 2,
                            child: const Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text(
                                "Topic",
                                style: TextStyle(color: Colors.white),
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
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Java",
                                style: TextStyle(color: mainAppColor),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      children: <Widget>[
                        Positioned(
                          right: 0,
                          left: 0,
                          child: Container(
                            color: const Color(0xFF5427D8),
                            height: 30,
                            width: MediaQuery.of(context).size.width / 2,
                            child: const Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text(
                                "Final Score",
                                style: TextStyle(color: Colors.white),
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
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                controller.quizCompleted.toString(),
                                style: const TextStyle(color: mainAppColor),
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
        ));
  }
}
