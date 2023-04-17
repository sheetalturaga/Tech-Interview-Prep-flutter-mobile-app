// import 'dart:html';
// import 'dart:js';

import 'package:blindspot_app/firestore_references/collection_refs.dart';
// import 'package:blindspot_app/screens/home_screen.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:google_sign_in_web/google_sign_in_web.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class AuthorizationController extends GetxController {
  @override
  void onReady() {
    initialAuth();
    super.onReady();
  }

  late FirebaseAuth authorization;
  final user = Rxn<User>();
  // this is dynamic user

  void initialAuth() {
    authorization = FirebaseAuth.instance;
  }

  // Future<void> SignInWithGoogle() async {
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

  //       Get.offAllNamed(HomeScreen.routeName);
  //       // ignore: use_build_context_synchronously
  //       // Navigator.push(
  //       //   context as BuildContext,
  //       //   MaterialPageRoute(
  //       //     builder: (context) {
  //       //       return const HomeScreen();
  //       //     },
  //       //   ),
  //       // );
  //       final auth = FirebaseAuth.instance;
  //       final googleAuth = await account.authentication;
  //       final credential = GoogleAuthProvider.credential(
  //         accessToken: googleAuth.accessToken,
  //         idToken: googleAuth.idToken,
  //       );
  //       final userCredential = await auth.signInWithCredential(credential);
  //       final user = userCredential.user;
  //       if (user != null) {
  //         await saveUserToDatabase(account, user.uid);
  //         Get.offAllNamed(HomeScreen.routeName);
  //       }
  //     } else {
  //       // TODO: Handle failed Google Sign-In
  //     }
  //   } catch (error) {
  //     print(error);
  //   }
  // }

  static SnackBar customSnackBar({required String content}) {
    return SnackBar(
      backgroundColor: Colors.black,
      content: Text(
        content,
        style: TextStyle(color: Colors.redAccent, letterSpacing: 0.5),
      ),
    );
  }

  Future<User?> signInWithGoogle({required BuildContext context}) async {
    User? user;

    if (kIsWeb) {
      // Create a new provider
      GoogleAuthProvider googleProvider = GoogleAuthProvider();

      try {
        final UserCredential userCredential =
            await authorization.signInWithPopup(googleProvider);

        user = userCredential.user!;
        await saveUserToDatabase(user);
        // Get.offAllNamed(HomeScreen.routeName);
      } catch (e) {
        print(e);
      }
    } else {
      final GoogleSignIn googleSignIn = GoogleSignIn();

      final GoogleSignInAccount? account = await googleSignIn.signIn();

      if (account != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await account.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        try {
          final UserCredential userCredential =
              await authorization.signInWithCredential(credential);

          user = userCredential.user;
          await saveUserToDatabase(user!);
          // Get.offAllNamed(HomeScreen.routeName);
        } on FirebaseAuthException catch (e) {
          if (e.code == 'account-exists-with-different-credential') {
            ScaffoldMessenger.of(context).showSnackBar(
              customSnackBar(
                content:
                    'The account already exists with a different credential',
              ),
            );
          } else if (e.code == 'invalid-credential') {
            ScaffoldMessenger.of(context).showSnackBar(
              customSnackBar(
                content:
                    'Error occurred while accessing credentials. Try again.',
              ),
            );
          }
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            customSnackBar(
              content: 'Error occurred using Google Sign In. Try again.',
            ),
          );
        }
      }
    }

    return user;
  }

  Future<User?> signInWithFacebook({required BuildContext context}) async {
    User? user;

    if (kIsWeb) {
      // Create a new provider
      FacebookAuthProvider facebookProvider = FacebookAuthProvider();

      facebookProvider.addScope('email');
      facebookProvider.setCustomParameters({
        'display': 'popup',
      });

      try {
        final UserCredential userCredential =
            await authorization.signInWithPopup(facebookProvider);

        user = userCredential.user;
        await saveUserToDatabase(user!);
        // Get.offAllNamed(HomeScreen.routeName);
      } catch (e) {
        print(e);
      }
    } else {
      final LoginResult loginResult = await FacebookAuth.instance.login();
      final AccessToken accessToken = loginResult.accessToken!;

      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(accessToken.token);

      try {
        final UserCredential userCredential =
            await authorization.signInWithCredential(facebookAuthCredential);

        user = userCredential.user!;
        await saveUserToDatabase(user);
        // Get.offAllNamed(HomeScreen.routeName);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          ScaffoldMessenger.of(context).showSnackBar(
            customSnackBar(
              content: 'The account already exists with a different credential',
            ),
          );
        } else if (e.code == 'invalid-credential') {
          ScaffoldMessenger.of(context).showSnackBar(
            customSnackBar(
              content: 'Error occurred while accessing credentials. Try again.',
            ),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          customSnackBar(
            content: 'Error occurred using Google Sign In. Try again.',
          ),
        );
      }
    }

    return user;
  }

  // save user to database
  // Future<void> saveUserToDatabase(GoogleSignInAccount account) async {
  //   usersRef.doc(account.email).set({
  //     "email": account.email,
  //     "name": account.displayName,
  //     "profilepic": account.~l
  //   });
  // }
  Future<void> saveUserToDatabase(User user) async {
    print("saveUserToDatabase called with email: ${user.email}");
    await usersRef.doc(user.email).set({
      "email": user.email,
      "name": user.displayName,
      "profilepic": user.photoURL
    }).then((value) {
      print("User data saved successfully!");
    }).catchError((error) {
      print("Failed to save user data: $error");
    });
    print("saveUserToDatabase completed");
  }
}
