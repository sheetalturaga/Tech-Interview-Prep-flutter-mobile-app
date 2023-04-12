import 'package:blindspot_app/constants.dart';
import 'package:blindspot_app/screens/welcome/note_explain.dart';
import 'package:blindspot_app/screens/welcome/notebook_screen.dart';
import 'package:blindspot_app/screens/welcome/profile_screen.dart';
import 'package:blindspot_app/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'firebase_options.dart';
import 'package:flutter_facebook_sdk/flutter_facebook_sdk.dart';
import 'package:provider/provider.dart';
import 'custom_widgets/custom_appbar.dart';
import 'package:blindspot_app/screens/main_menu.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'blindspot_app',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: NoteExplainScreen(),
    );
  }
}
