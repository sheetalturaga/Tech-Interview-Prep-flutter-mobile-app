import 'package:blindspot_app/models/quiz_model.dart';
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

class TopicCard extends StatelessWidget {
  const TopicCard({super.key, required this.model});

  final QuizModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        height: 150,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            children: [
              // Image.network(
              //   model.imageUrl!,
              //   fit: BoxFit.cover,
              //   width: MediaQuery.of(context).size.width,
              // ),
              ColoredBox(
                color: Theme.of(context).cardColor,
              ),
              Container(
                color: Colors.black26,
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
    );
  }
}
