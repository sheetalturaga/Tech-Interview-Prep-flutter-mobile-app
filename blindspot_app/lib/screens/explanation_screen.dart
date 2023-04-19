import 'package:blindspot_app/controllers/questions_controller.dart';
import 'package:blindspot_app/screens/question_display_screen.dart';
import 'package:blindspot_app/screens/result_screen.dart';
import 'package:blindspot_app/widgets/question_display_page_decor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../firestore_references/collection_refs.dart';
import '../widgets/content_area_size.dart';
import '../widgets/custom_question_display_navbar.dart';

// This class was created to display the explanation to each question answered
// However, we came to the conclusion that lesser the number of switches we do to
// different, the better it is for user experience. So, this was omitted out of
// the planned execution

class ExplanationScreen extends GetView<QuestionsController> {
  const ExplanationScreen({super.key});
  static const String routeName = "/explanationscreen";

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
          child: const Icon(
            Icons.star_border_outlined,
            color: Colors.white,
          ),
        ),
        displayActionIcon: true,
        leadTitleWidget: Obx(
          () => Text(
            "Question ${(controller.questionIndex.value + 1).toString().padLeft(2, '0')} Explanation",
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
          ),
        ),
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
                        children: const [],
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
                                    : Navigator.pop(context);
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

class ExplanationScreenBackground extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0.0, 100);
    path.quadraticBezierTo(size.width * 0.5, 0.0, size.width, 100);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();

    // path.lineTo(0.0, size.height - 30);
    // path.quadraticBezierTo(
    //     size.width / 4, size.height, size.width / 2, size.height);
    // path.quadraticBezierTo(size.width - (size.width / 4), size.height,
    //     size.width, size.height - 30);
    // path.lineTo(size.width, 0.0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }
}

// class _ExplanationScreenState extends State<ExplanationScreen> {
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
//               "THAT'S CORRECT!",
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 60.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 45.0,
//           ),
//           const Text(
//             "Explanation",
//             style: TextStyle(color: Colors.white, fontSize: 25.0),
//           ),
//           const Divider(
//             color: Colors.white,
//           ),
//           const SizedBox(
//             height: 20.0,
//           ),
//           Container(
//             margin: const EdgeInsets.all(20),
//           ),
//           const Text(
//             "Abstract: Abstract is a keyword that is used with a class or a method. An abstract class or abstract method is used for further modification. If a class is declared as ‘abstract’, the class cannot be instantiated.",
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 25.0,
//             ),
//           ),
//           const SizedBox(
//             height: 100.0,
//           ),
//           RawMaterialButton(
//             onPressed: () {
//               Navigator.pop(
//                 context,
//               );
//             },
//             shape: const StadiumBorder(),
//             fillColor: const Color.fromARGB(255, 62, 85, 218),
//             padding: const EdgeInsets.all(18.0),
//             elevation: 0.0,
//             // shape: StadiumBorder(),
//             // color: AppColor.secondaryColor,
//             // padding: EdgeInsets.all(18.0),
//             child: const Text(
//               "Next Question",
//               style: TextStyle(color: Colors.white),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
