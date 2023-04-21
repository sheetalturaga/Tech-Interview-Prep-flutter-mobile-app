import 'package:blindspot_app/controllers/authorization_controller.dart';
import 'package:blindspot_app/controllers/questions_controller.dart';
import 'package:get/get.dart';
import '../screens/home_screen.dart';
import '../screens/notebook_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/progress_screen.dart';
import '../screens/question_display_screen.dart';
import '../screens/landing_screen.dart';
import '../controllers/topic_controller.dart';
import '../screens/result_screen.dart';
import '../screens/User_setting.dart';
import '../screens/about_screen.dart';
import '../screens/login_screen.dart';
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
            name: "/profilescreen",
            page: () => const ProfileScreen(),
            binding: BindingsBuilder(
              () {
                Get.put(AuthorizationController());
              },
            )),
        GetPage(
            name: "/loginscreen",
            page: () => const LoginScreen(),
            binding: BindingsBuilder(
              () {
                Get.put(AuthorizationController());
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
        GetPage(
          name: "/progressscreen",
          page: () => const ProgressScreen(),
        ),
        GetPage(
          name: "/aboutscreen",
          page: () => const AboutScreen(),
        ),
        GetPage(
            name: "/settingscreen",
            page: () => const SettingScreen(),
            binding: BindingsBuilder(
              () {
                Get.put(AuthorizationController());
              },
            )),
      ];
}
