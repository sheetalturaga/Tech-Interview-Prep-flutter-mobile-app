import 'package:blindspot_app/controllers/authorization_controller.dart';
import 'package:blindspot_app/controllers/questions_controller.dart';
import 'package:blindspot_app/screens/data_upload_screen.dart';
import 'package:blindspot_app/screens/explanation_screen.dart';
import 'package:blindspot_app/screens/home_screen.dart';
import 'package:blindspot_app/screens/question_display_screen.dart';
import 'package:blindspot_app/screens/landing_screen.dart';
import 'package:blindspot_app/controllers/topic_controller.dart';
import 'package:get/get.dart';
// import '../controllers/page_controllers.dart';
import '../screens/welcome_screen.dart';
import '../services/database_storageService.dart';
import '../services/database_uploadService.dart';

class AppRoutes {
  static List<GetPage> routesList() => [
        GetPage(
          name: "/",
          page: () => const WelcomeScreen(),
        ),
        GetPage(
            name: "/landingscreen",
            page: () => const LandingScreen(),
            binding: BindingsBuilder(
              () {
                Get.put(AuthorizationController());
              },
            )),
        GetPage(
            page: () => const HomeScreen(),
            name: HomeScreen.routeName,
            binding: BindingsBuilder(
              () {
                Get.put(TopicController());
              },
            )),
        GetPage(
            name: "/questiondisplayscreen",
            page: () => const QuestionDisplayScreen(),
            binding: BindingsBuilder(
              () {
                Get.put(QuestionsController());
              },
            )),
        GetPage(
            name: "/explanationscreen",
            page: () => const ExplanationScreen(),
            binding: BindingsBuilder(
              () {
                Get.put(QuestionsController());
              },
            )),
      ];
}
