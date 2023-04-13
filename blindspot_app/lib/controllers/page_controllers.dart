import 'package:get/get.dart';

class PageController extends GetxController {
  @override
  void onReady() {
    initPage();
    super.onReady();
  }

  void initPage() async {
    await Future.delayed(const Duration(seconds: 2));
    navigateToLandingScreen();
  }

  void navigateToLandingScreen() {
    Get.offAllNamed("/landingscreen");
  }

  
}
