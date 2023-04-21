import 'package:blindspot_app/app_routes/app_routes.dart';
import 'package:blindspot_app/constants.dart';
import 'package:blindspot_app/firebase_options.dart';
import 'package:blindspot_app/services/database_storageService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'bindings/appinit_bindings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  InitAppBindings().dependencies();
  Get.put(DatabaseStorageService());
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
        fontFamily: 'AppIcons',
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      getPages: AppRoutes.routesList(),
    );
  }
}
