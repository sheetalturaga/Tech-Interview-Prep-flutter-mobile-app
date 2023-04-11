import 'package:blindspot_app/app_routes/app_routes.dart';
import 'package:blindspot_app/bindings/appinit_bindings.dart';
import 'package:blindspot_app/constants.dart';
import 'package:blindspot_app/firebase_options.dart';
import 'package:blindspot_app/screens/data_upload_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized;
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  InitAppBindings().dependencies();
  // Get.put(PageController(), permanent: true);
  // PageController pageController = Get.find();

  // if (kDebugMode) {
  //   try {
  //     FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);
  //   } catch (e) {
  //     print(e);
  //   }
  // }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      getPages: AppRoutes.routesList(),
      // home: DataUploadScreen(),
    );
  }
}
