import 'package:blindspot_app/firestore_references/collection_refs.dart';
import 'package:blindspot_app/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

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

  Future<void> SignInWithGoogle() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn(
        // clientId:
        //     '191832806771-nclver091dsstoqaj7iggmh05bkph0qt.apps.googleusercontent.com',
        // scopes: [
        //   'email',
        // ],
        );
    try {
      GoogleSignInAccount? account = await _googleSignIn.signIn();
      if (account != null) {
        final _googleauthentication = await account.authentication;
        final _userCred = GoogleAuthProvider.credential(
            idToken: _googleauthentication.idToken,
            accessToken: _googleauthentication.accessToken);
        await authorization.signInWithCredential(_userCred);
        await saveUserToDatabase(account);
        Get.offAllNamed(HomeScreen.routeName);
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) {
        //       return const HomeScreen();
        //     },
        //   ),
        // );
      } else {
        // TODO: Handle failed Google Sign-In
      }
    } catch (error) {
      print(error);
    }
  }

  // save user to database
  // Future<void> saveUserToDatabase(GoogleSignInAccount account) async {
  //   usersRef.doc(account.email).set({
  //     "email": account.email,
  //     "name": account.displayName,
  //     "profilepic": account.photoUrl
  //   });
  // }
  Future<void> saveUserToDatabase(GoogleSignInAccount account) async {
    print("saveUserToDatabase called with email: ${account.email}");
    await usersRef.doc(account.email).set({
      "email": account.email,
      "name": account.displayName,
      "profilepic": account.photoUrl
    }).then((value) {
      print("User data saved successfully!");
    }).catchError((error) {
      print("Failed to save user data: $error");
    });
    print("saveUserToDatabase completed");
  }
}
