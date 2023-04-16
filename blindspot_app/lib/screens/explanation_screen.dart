import 'dart:html';

import 'package:blindspot_app/controllers/questions_controller.dart';
import 'package:flutter/material.dart';
import 'package:blindspot_app/ui/shared/color.dart';
import 'package:get/get.dart';

// For every question, answer card changes color for right & wrong
// Upon the submission of answer, Submit button turns to next question
// Score Tracking: Right answer & Wrong answers
// Next Question button ->
// Star mark functionality to add to Notebook + also wrong answers
// Quit button -> homeScreen
// Counter for the number of questions

class ExplanationScreen extends GetView<QuestionsController> {
  const ExplanationScreen({super.key});
  static const String routeName = "/explanationscreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ClipPath(
        clipper: ExplanationScreenBackground(),
        child: Container(
          color: mainAppColor,
          height: double.infinity,
          // child: Column(
          //   children: const [
          //     Text("That's Correct!"),
          //   ],
          // ),
        ),
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
