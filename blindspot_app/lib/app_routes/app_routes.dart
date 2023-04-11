import 'package:blindspot_app/screens/home_screen.dart';
import 'package:blindspot_app/screens/welcome/landing_screen.dart';
import 'package:blindspot_app/controllers/topic_controller.dart';
import 'package:get/get.dart';

import '../controllers/page_controllers.dart';
import '../screens/welcome/welcome_screen.dart';
import '../services/database_storageService.dart';

class AppRoutes {
  static List<GetPage> routesList() => [
        GetPage(
          name: "/",
          page: () => WelcomeScreen(),
        ),
        GetPage(
          name: "/landingscreen",
          page: () => LandingScreen(),
        ),
        GetPage(
            page: () => HomeScreen(),
            name: HomeScreen.routeName,
            binding: BindingsBuilder(
              () {
                Get.put(TopicController());
                Get.put(DatabaseStorageService());
              },
            )),
      ];
}
