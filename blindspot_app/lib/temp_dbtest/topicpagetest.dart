import 'package:blindspot_app/firestore_references/collection_refs.dart';
import 'package:flutter/material.dart';
import 'package:blindspot_app/services/database_uploadService.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
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
}
