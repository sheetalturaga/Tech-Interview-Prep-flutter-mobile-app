import 'package:blindspot_app/controllers/authorization_controller.dart';
import 'package:blindspot_app/screens/home_screen.dart';
import 'package:blindspot_app/screens/main_menu.dart';
import 'package:blindspot_app/screens/notebook_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter/material.dart';
import 'package:the_apple_sign_in/the_apple_sign_in.dart';
import 'package:blindspot_app/screens/quizz_screen.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:firebase_auth/firebase_auth.dart'
    hide EmailAuthProvider, PhoneAuthProvider;

import '../custom_widgets/custom_appbar.dart';

class LoginScreen extends GetView<AuthorizationController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //total size of our screen
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 300,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        flexibleSpace: ClipPath(
          clipper: ReviseSize(),
          child: Container(
            height: 250,
            width: MediaQuery.of(context).size.width,
            color: Colors.blue,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Center(
                  heightFactor: 2,
                  child: Text(
                    "BlindSpot",
                    style: TextStyle(
                      fontSize: 45,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
                Text(
                  "Learning the Gap",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: 'Open Sans',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // ignore: sized_box_for_whitespace
      body: Container(
        height: size.height,
        width: double.infinity,
        child: Stack(
          children: <Widget>[
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GetBuilder<AuthorizationController>(builder: (controller) {
                    return Container(
                      height: 40,
                      width: 200,
                      child: SignInButton(
                        Buttons.Google,
                        onPressed: () async {
                          User? user = await controller.signInWithGoogle(
                              context: context);
                          if (user != null) {
                            Get.offAll(() => const NotebookScreen());
                          }
                        },
                      ),
                    );
                  }),
                  const SizedBox(
                      height: 16), // add some spacing between the boxes
                  Container(
                    height: 40,
                    width: 200,
                    child: SignInButton(
                      Buttons.Facebook,
                      onPressed: () async {
                        User? user = await controller.signInWithFacebook(
                            context: context);
                      },
                    ),
                  ),
                  const SizedBox(
                      height: 16), // add some spacing between the boxes
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
