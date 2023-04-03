import 'package:flutter/material.dart';
import 'package:blindspot_app/screens/welcome/about_screen.dart';

class AboutScreen extends StatelessWidget {
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
              "Version 1.7",
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
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 300),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text.rich(
                    TextSpan(
                      children: [
                        WidgetSpan(
                          child: Icon(
                            Icons.arrow_right,
                            color: Colors.blue,
                          ),
                        ),
                        TextSpan(
                          text:
                              "Pick the topic of your choice and take the quiz\n",
                          style: TextStyle(
                            fontSize: 16,
                            decoration: TextDecoration.none,
                            fontFamily: 'Arial',
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        WidgetSpan(
                          child: Icon(
                            Icons.arrow_right,
                            color: Colors.blue,
                          ),
                        ),
                        TextSpan(
                          text:
                              "Star mark the question that you want to dive deeper into, to save it to your notebook\n",
                          style: TextStyle(
                            fontSize: 16,
                            decoration: TextDecoration.none,
                            fontFamily: 'Arial',
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        WidgetSpan(
                          child: Icon(
                            Icons.arrow_right,
                            color: Colors.blue,
                          ),
                        ),
                        TextSpan(
                          text:
                              "Visit your profile to see how much progress you’ve made and also personalize your profile using the setting button\n",
                          style: TextStyle(
                            fontSize: 16,
                            decoration: TextDecoration.none,
                            fontFamily: 'Arial',
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
    );
  }
}
