import 'package:blindspot_app/controllers/topic_controller.dart';
import 'package:blindspot_app/models/quiz_model.dart';
import 'package:blindspot_app/ui/shared/color.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// class TopicCard extends StatelessWidget {
//   const TopicCard({super.key, required this.model});

//   final QuizModel model;

//   @override
//   Widget build(BuildContext context) {
//     const double padding = 10.0;
//     return Padding(
//       padding: const EdgeInsets.all(padding),
//       child: Stack(
//         children: [
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(10),
//                 child: ColoredBox(
//                   color: Theme.of(context).primaryColor.withOpacity(0.2),
//                   child: SizedBox(
//                     height: Get.width * 0.15,
//                     width: Get.width * 0.15,
//                     child: CachedNetworkImage(
//                       imageUrl: model.imageUrl!,
//                       fit: BoxFit.fill,
//                       placeholder: ((context, url) => Container(
//                             alignment: Alignment.center,
//                             child: const CircularProgressIndicator(),
//                           )),
//                       errorWidget: (context, url, error) =>
//                           Image.asset("assets/images/BLINDSPOT.jpeg"),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 width: 12,
//               ),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       model.topic,
//                       style: const TextStyle(
//                           color: Color(0xFFf85187),
//                           fontSize: 15,
//                           fontWeight: FontWeight.bold),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 10),
//                       child: Text(model.description),
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }

class TopicCard extends GetView<TopicController> {
  const TopicCard({super.key, required this.model});

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
                // Image.network(
                //   model.imageUrl!,
                //   height: 150,
                //   fit: BoxFit.cover,
                //   width: MediaQuery.of(context).size.width,
                // ),
                Container(
                  // height: 150,
                  // decoration: const BoxDecoration(
                  //   gradient: mainBackgroundGradient,
                  // ),
                  // color: Colors.pink,
                  height: 150,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Color(0xFF0061ff),
                    Color(0xFF60efff),
                  ])),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          model.topic,
                          style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          model.description,
                          style: const TextStyle(
                              fontSize: 13,
                              color: Colors.black,
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
