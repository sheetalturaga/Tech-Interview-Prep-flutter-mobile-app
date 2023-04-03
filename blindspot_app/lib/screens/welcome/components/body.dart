import 'package:blindspot_app/screens/welcome/landing_screen.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //total size of our screen
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset("assets/images/BLINDSPOT.jpeg",
                width: size.width * 1),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 40),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return LandingScreen();
                          },
                        ),
                      );
                      //TODO: Implement button functionality
                    },
                    child: const Text("Let's get started"),
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(Size(150, 50)),
                      padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(vertical: 16, horizontal: 24)),
                      textStyle:
                          MaterialStateProperty.all(TextStyle(fontSize: 20)),
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                    ),
                  ),
                  const SizedBox(height: 100),
                  const Text(
                    "Copyright BlindSpot All Rights Reversed",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w100,
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
