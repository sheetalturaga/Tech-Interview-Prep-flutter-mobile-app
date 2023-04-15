import 'package:blindspot_app/app_routes/app_routes.dart';
import 'package:blindspot_app/bindings/appinit_bindings.dart';
import 'package:blindspot_app/constants.dart';
import 'package:blindspot_app/controllers/questions_controller.dart';
import 'package:blindspot_app/firebase_options.dart';
import 'package:blindspot_app/screens/data_upload_screen.dart';
import 'package:blindspot_app/screens/home_screen.dart';
import 'package:blindspot_app/screens/question_display_screen.dart';
import 'package:blindspot_app/screens/welcome/landing_screen.dart';
import 'package:blindspot_app/screens/welcome/login_screen.dart';
import 'package:blindspot_app/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  InitAppBindings().dependencies();
  await FacebookAuth.instance.webAndDesktopInitialize(
    appId: "6506823019329362",
    cookie: true,
    xfbml: true,
    version: "v15.0",
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'blindspot_app',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      // getPages: AppRoutes.routesList(),
      home: const LandingScreen(),
      // home: QuizzScreen(),
    );
  }
}
