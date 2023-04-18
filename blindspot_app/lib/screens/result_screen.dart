import 'package:blindspot_app/controllers/questions_controller.dart';
import 'package:blindspot_app/controllers/questions_controller_extension.dart';
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
                leadTitleWidget: SizedBox(height: 80), title: "You Did It!"),
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
                                controller.correctlyAnsweredQuestions
                                    .toString(),
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

//   @override
//   _ResultScreenState createState() => _ResultScreenState();
// }

// class _ResultScreenState extends State<ResultScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColor.pripmaryColor,
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           const SizedBox(
//             width: double.infinity,
//             child: Text(
//               "Congratulations",
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 40.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 45.0,
//           ),
//           const Text(
//             "You Score is",
//             style: TextStyle(color: Colors.white, fontSize: 34.0),
//           ),
//           const SizedBox(
//             height: 20.0,
//           ),
//           Text(
//             "${widget.score}",
//             style: const TextStyle(
//               color: Colors.orange,
//               fontSize: 85.0,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(
//             height: 100.0,
//           ),
//           RawMaterialButton(
//             onPressed: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => const MainMenu(),
//                   ));
//             },
//             shape: const StadiumBorder(),
//             fillColor: Colors.blue,
//             padding: const EdgeInsets.all(18.0),
//             elevation: 0.0,
//             // shape: StadiumBorder(),
//             // color: AppColor.secondaryColor,
//             // padding: EdgeInsets.all(18.0),
//             child: const Text(
//               "Try another quiz",
//               style: TextStyle(color: Colors.white),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
