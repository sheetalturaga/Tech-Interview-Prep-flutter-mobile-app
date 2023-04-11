import 'dart:html';

import 'package:blindspot_app/firestore_references/collection_refs.dart';
import 'package:flutter/material.dart';
import 'package:blindspot_app/firestore_references/collection_refs.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:blindspot_app/services/database_uploadService.dart';
import 'package:get/get.dart';

class TopicPage extends StatelessWidget {
  TopicPage({super.key});

  DatabaseUploadService controller = Get.put(DatabaseUploadService());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(() => Text(controller.loadStatus.value == LoadStatus.complete
            ? "Uploading Complete"
            : "Uploading..")),
      ),
    );
  }

//   // Using stream builder to use the data from the firestore,
//   Widget topicsList() {
//     return StreamBuilder(
//         stream: topicStream,
//         builder: (context, snapshot) {
//           return snapshot.data == null
//               ? Container()
//               : ListView.builder(
//                   // itemCount: snapshot.data.documents.length,
//                   itemBuilder: (context, index) {
//                   return const TopicTile(
//                     topic: "Python",
//                   );
//                 });
//         });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("topic page"),
//         backgroundColor: Colors.blue,
//         elevation: 0.0,
//       ),
//       body: topicsList(),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {},
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }

// // Individual topic tiles that contain an image
// // and text in the center & stacked vertically
// class TopicTile extends StatelessWidget {
//   final String topic;
//   const TopicTile({super.key, required this.topic});

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Image.network("assets/images/topicpagebackgroundimage1.jpeg"),
//         Column(children: const [
//           Text("Java"),
//           Text("Answer questions related to Java concepts")
//         ]),
//       ],
//     );
//   }
}
