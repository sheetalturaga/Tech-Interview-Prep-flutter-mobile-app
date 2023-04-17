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

class LoginScreen extends GetView<AuthorizationController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //total size of our screen
    return Scaffold(
      // ignore: sized_box_for_whitespace
      body: Container(
        height: size.height,
        width: double.infinity,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                "assets/images/top.jpeg",
                width: size.width * 1,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            const Positioned(
              top: 50,
              left: 0,
              right: 0,
              child: Text(
                "BlindSpot",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Positioned(
              top: 130,
              left: 0,
              right: 0,
              child: Text(
                "Choose Your Login Method",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                ),
                textAlign: TextAlign.center,
              ),
            ),
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
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      "Copyright BlindSpot All Rights Reversed",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w100,
                        fontSize: 12,
                        decoration: TextDecoration.none,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
