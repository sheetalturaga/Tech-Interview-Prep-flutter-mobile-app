import 'package:blindspot_app/controllers/authorization_controller.dart';
import 'package:blindspot_app/screens/notebook_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import '../custom_widgets/custom_appbar.dart';

class LoginScreen extends GetView<AuthorizationController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 150,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        flexibleSpace: ClipPath(
          clipper: ReviseSize(),
          child: Container(
            height: 300,
            width: MediaQuery.of(context).size.width,
            color: Colors.blue,
            child: Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 5.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Center(
                    heightFactor: 1,
                    child: Text(
                      "BLIND SPOT",
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'AppIcons',
                      ),
                    ),
                  ),
                  Text(
                    "Learning The Gap",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontFamily: 'AppIcons',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      // ignore: sized_box_for_whitespace
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          image: DecorationImage(
              scale: 2.0,
              image: const AssetImage("assets/images/blindspot-notext.png"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.2), BlendMode.dstATop)),
        ),
        height: size.height,
        width: size.width,
        child: Stack(
          children: <Widget>[
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GetBuilder<AuthorizationController>(builder: (controller) {
                    return SizedBox(
                      height: 50,
                      width: 250,
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
                  SizedBox(
                    height: 50,
                    width: 250,
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
