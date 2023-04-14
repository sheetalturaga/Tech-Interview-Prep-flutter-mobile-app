import 'package:get/get.dart';

import '../controllers/page_controllers.dart';

class InitAppBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(PageController(), permanent: true);
    // Get.put(TopicController(), permanent: true); // stay in memory
  }
}
