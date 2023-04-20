import 'package:blindspot_app/screens/home_screen.dart';
import 'package:blindspot_app/screens/landing_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
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

  static SnackBar customSnackBar({required String content}) {
    return SnackBar(
      backgroundColor: Colors.black,
      content: Text(
        content,
        style: const TextStyle(color: Colors.redAccent, letterSpacing: 0.5),
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
        await _writeUserData(user);
        Get.offAllNamed(HomeScreen.routeName);
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
          await _writeUserData(user!);
          Get.offAllNamed(HomeScreen.routeName);
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

  Future<void> signOutGoogle({required BuildContext context}) async {
    if (kIsWeb) {
      // Sign out from Firebase Authentication
      await authorization.signOut();
      // Redirect to login screen
      Get.offAllNamed(LandingScreen.routeName);
    } else {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      try {
        // Sign out from Google Sign-In
        await googleSignIn.signOut();
        // Sign out from Firebase Authentication
        await authorization.signOut();
        // Redirect to login screen
        Get.offAllNamed(LandingScreen.routeName);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          customSnackBar(
            content: 'Error occurred while signing out. Try again.',
          ),
        );
      }
    }
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
        await _writeUserData(user!);
        Get.offAllNamed(HomeScreen.routeName);
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
        await _writeUserData(user);
        Get.offAllNamed(HomeScreen.routeName);
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

  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  Future<void> _writeUserData(User user) async {
    try {
      await users.doc(user.uid).set({
        'userId': user.uid,
        'name': user.displayName,
        'email': user.email,
        'photoUrl': user.photoURL,
      });
    } catch (e) {
      print(e);
    }
  }
}
