import 'package:blindspot_app/constants.dart';
import 'package:blindspot_app/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'custom_widgets/custom_appbar.dart';
import 'package:blindspot_app/screens/main_menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const MainMenu(),
    );
  }
}
