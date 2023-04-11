import 'package:blindspot_app/controllers/topic_controller.dart';
import 'package:get/get.dart';

import '../controllers/page_controllers.dart';
import '../services/database_storageService.dart';

class InitAppBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(PageController(), permanent: true);
    // Get.put(TopicController(), permanent: true); // stay in memory
  }
}
