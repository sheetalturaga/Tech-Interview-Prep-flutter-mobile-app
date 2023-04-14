import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../firestore_references/collection_refs.dart';
import '../services/database_uploadService.dart';

class DataUploadScreen extends StatelessWidget {
  DataUploadScreen({Key? key}) : super(key: key);
  final DatabaseUploadService controller = Get.put(DatabaseUploadService());

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
