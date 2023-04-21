import 'package:blindspot_app/controllers/authorization_controller.dart';
import 'package:blindspot_app/controllers/questions_controller.dart';
import 'package:blindspot_app/screens/home_screen.dart';
import 'package:blindspot_app/screens/notebook_screen.dart';
import 'package:blindspot_app/screens/profile_screen.dart';
import 'package:blindspot_app/screens/progress_screen.dart';
import 'package:blindspot_app/screens/question_display_screen.dart';
import 'package:blindspot_app/screens/landing_screen.dart';
import 'package:blindspot_app/controllers/topic_controller.dart';
import 'package:blindspot_app/screens/result_screen.dart';
import 'package:get/get.dart';
import '../screens/welcome_screen.dart';

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
            page: () => QuestionDisplayScreen(),
            binding: BindingsBuilder(
              () {
                Get.put(QuestionsController());
              },
            )),
        GetPage(
            name: "/resultscreen",
            page: () => const ResultScreen(),
            binding: BindingsBuilder(
              () {
                Get.put(QuestionsController());
              },
            )),
        GetPage(
          name: "/notebookscreen",
          page: () => const NotebookScreen(),
        ),
        GetPage(
          name: "/profilescreen",
          page: () => const ProfileScreen(),
        ),
        GetPage(name: "/progressscreen", page: () => const ProgressScreen()),
      ];
}
