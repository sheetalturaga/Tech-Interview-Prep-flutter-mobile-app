import 'package:flutter/material.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart' show Icons;

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
  );

  bool _isLoggedIn = false;
  GoogleSignInAccount? _user;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //total size of our screen
    return Scaffold(
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
                "Please login with your account",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton.icon(
                icon: Icon(Icons.login),
                label: Text("Sign In with Google"),
                onPressed: _isLoggedIn ? null : _handleSignIn,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 40),
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

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
      setState(() {
        _isLoggedIn = true;
        _user = _googleSignIn.currentUser;
      });
    } catch (error) {
      print(error);
    }
  }
}
