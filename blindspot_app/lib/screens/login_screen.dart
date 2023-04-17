import 'package:blindspot_app/controllers/authorization_controller.dart';
import 'package:blindspot_app/screens/home_screen.dart';
import 'package:blindspot_app/screens/main_menu.dart';
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

  // @override
  // _LoginScreenState createState() => _LoginScreenState();

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
                  fontSize: 50,
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
                "All your coding quiz at one place",
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

// class _LoginScreenState extends State<LoginScreen> {
//   Map<String, dynamic>? _userData;
//   AccessToken? _accessToken;
//   bool _checking = true;

//   @override
//   void initState() {
//     super.initState();
//     _checkIfisLoggedIn();
//   }

//   _checkIfisLoggedIn() async {
//     final accessToken = await FacebookAuth.instance.accessToken;

//     setState(() {
//       _checking = false;
//     });

//     if (accessToken != null) {
//       // print(accessToken.toJson());
//       final userData = await FacebookAuth.instance.getUserData();
//       _accessToken = accessToken;
//       setState(() {
//         _userData = userData;
//       });
//     } else {
//       _login();
//     }
//   }

//   _login() async {
//     final LoginResult result = await FacebookAuth.instance.login();
//     if (result.status == LoginStatus.success) {
//       // ignore: avoid_print
//       print("Login successful!");
//       // ignore: avoid_print
//       print("Access token: ${result.accessToken}");

//       // ... rest of your code
//     } else {
//       // ignore: avoid_print
//       print("Login failed.");
//       // ignore: avoid_print
//       print("Error message: ${result.message}");
//     }

//     if (result.status == LoginStatus.success) {
//       _accessToken = result.accessToken;
//       final userData = await FacebookAuth.instance.getUserData();
//       _userData = userData;
//       // ignore: use_build_context_synchronously
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) {
//             return const MainMenu();
//           },
//         ),
//       );
//     } else {
//       // ignore: avoid_print
//       print(result.status);
//       // ignore: avoid_print
//       print(result.message);
//     }
//     setState(() {
//       _checking = false;
//     });
//   }

//   void _logout() async {
//     await FacebookAuth.instance.logOut();
//     _accessToken = null;
//     _userData = null;
//     setState(() {});
//   }

//   bool _isLoggedIn = false;
//   GoogleSignInAccount? _user;

//   final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);

//   late User _googleUser;
//   late Map<String, dynamic> _facebookUserData;
//   late String _appleUserId;

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size; //total size of our screen
//     return Scaffold(
//       // ignore: sized_box_for_whitespace
//       body: Container(
//         height: size.height,
//         width: double.infinity,
//         child: Stack(
//           children: <Widget>[
//             Positioned(
//               top: 0,
//               left: 0,
//               right: 0,
//               child: Image.asset(
//                 "assets/images/top.jpeg",
//                 width: size.width * 1,
//                 height: 300,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             const Positioned(
//               top: 50,
//               left: 0,
//               right: 0,
//               child: Text(
//                 "BlindSpot",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 50,
//                   fontWeight: FontWeight.bold,
//                   decoration: TextDecoration.none,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//             const Positioned(
//               top: 130,
//               left: 0,
//               right: 0,
//               child: Text(
//                 "All your coding quiz at one place",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   decoration: TextDecoration.none,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//             Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                     height: 40,
//                     width: 200,
//                     child: SignInButton(
//                       Buttons.Google,
//                       onPressed: () {
//                         // _googleSignIn();
//                       },
//                     ),
//                   ),
//                   const SizedBox(
//                       height: 16), // add some spacing between the boxes
//                   Container(
//                     height: 40,
//                     width: 200,
//                     child: SignInButton(
//                       Buttons.Facebook,
//                       onPressed: () {
//                         _login();
//                       },
//                     ),
//                   ),
//                   const SizedBox(
//                       height: 16), // add some spacing between the boxes
//                   Container(
//                     height: 40,
//                     width: 200,
//                     child: SignInButton(
//                       Buttons.Apple,
//                       onPressed: () {
//                         _signInWithApple();
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Align(
//               alignment: Alignment.bottomCenter,
//               child: Padding(
//                 padding: const EdgeInsets.only(bottom: 40),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: const [
//                     Text(
//                       "Copyright BlindSpot All Rights Reversed",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.w100,
//                         fontSize: 12,
//                         decoration: TextDecoration.none,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

  // Future<void> _googleSignIn() async {
  //   try {
  //     final account = await GoogleSignIn(
  //       clientId:
  //           '191832806771-nclver091dsstoqaj7iggmh05bkph0qt.apps.googleusercontent.com',
  //       scopes: [
  //         'email',
  //       ],
  //     ).signIn();
  //     if (account != null) {
  //       // TODO: Handle successful Google Sign-In
  //       setState(() {
  //         _isLoggedIn = true;
  //         _user = account;
  //       });
  //       Get.offAllNamed(HomeScreen.routeName);
  //       // ignore: use_build_context_synchronously
  //       // Navigator.push(
  //       //   context,
  //       //   MaterialPageRoute(
  //       //     builder: (context) {
  //       //       return const HomeScreen();
  //       //     },
  //       //   ),
  //       // );
  //     } else {
  //       // TODO: Handle failed Google Sign-In
  //     }
  //   } catch (error) {
  //     print(error);
  //   }
  // }

//   Future<void> _signInWithApple() async {
//     try {
//       final AuthorizationResult result = await TheAppleSignIn.performRequests([
//         const AppleIdRequest(requestedScopes: [Scope.email, Scope.fullName])
//       ]);

//       switch (result.status) {
//         case AuthorizationStatus.authorized:
//           final AppleIdCredential? appleIdCredential = result.credential;
//           final String fullName = appleIdCredential?.fullName?.toString() ?? '';
//           final String email = appleIdCredential?.email ?? '';

//           // Use the credential data to authenticate with your server...
//           break;
//         case AuthorizationStatus.error:
//           // ignore: use_build_context_synchronously
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//                 content: Text('Error: ${result.error?.localizedDescription}')),
//           );
//           break;
//         case AuthorizationStatus.cancelled:
//           // ignore: use_build_context_synchronously
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text('User cancelled')),
//           );
//           break;
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error: $e')),
//       );
//     }
//   }

// //   Future<void> _signInWithApple() async {
// //   try {
// //     final credential = await SignInWithApple.getAppleIDCredential(
// //       scopes: [
// //         AppleIDAuthorizationScopes.email,
// //         AppleIDAuthorizationScopes.fullName,
// //       ],
// //       webAuthenticationOptions: WebAuthenticationOptions(
// //         // TODO: Replace with your own client ID and redirect URI
// //         clientId: 'your_client_id',
// //         redirectUri: Uri.parse('https://your-redirect-uri.com'),
// //       ),
// //     );

// //     // TODO: Use the credential to sign in with Firebase or your own backend
// //     print('Credential: $credential');
// //   } catch (e) {
// //     // TODO: Handle errors
// //     print('Error: $e');
// //   }
// // }
// }
