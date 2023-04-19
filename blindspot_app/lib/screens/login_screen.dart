import 'package:blindspot_app/controllers/authorization_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:firebase_auth/firebase_auth.dart'
    hide EmailAuthProvider, PhoneAuthProvider;
import '../custom_widgets/custom_appbar.dart';

class LoginScreen extends GetView<AuthorizationController> {
  const LoginScreen({super.key});
  static const String routeName = '/loginscreen';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                  Container(
                    height: 40,
                    width: 200,
                    child: SignInButton(
                      Buttons.Apple,
                      onPressed: () {
                        // _signInWithApple();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
