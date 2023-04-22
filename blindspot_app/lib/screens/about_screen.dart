import 'package:flutter/material.dart';

import '../custom_widgets/custom_appbar.dart';
import '../ui/shared/color.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});
  static const String routeName = '/aboutscreen';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //total size of our screen
    // ignore: sized_box_for_whitespace
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 150,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        flexibleSpace: ClipPath(
          clipper: ReviseSize(),
          child: Container(
            height: 300,
            width: MediaQuery.of(context).size.width,
            color: mainAppColor,
            child: Padding(
              padding: const EdgeInsets.only(top: 35, bottom: 5.0),
              child: Column(
                children: const [
                  Text(
                    "BLIND SPOT",
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'AppIcons',
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
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          image: DecorationImage(
              scale: 2.0,
              image: const AssetImage("assets/images/blindspot-notext.png"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.1), BlendMode.dstATop)),
        ),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.arrow_right,
                    color: mainAppColor,
                    size: 50,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "Pick the topic of your choice and take the quiz. Each Quiz renders 10 questions with multiple option to choose from. The option tile will turn red if the answer is incorrect, else it will turn green, You can always quit by clicking the home button",
                      maxLines: 8,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'AppIcons',
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.arrow_right,
                    color: mainAppColor,
                    size: 50,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "The questions answered incorrectly are automatically saved to your notebook so you can read the right explanation for it.",
                      maxLines: 3,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'AppIcons',
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.arrow_right,
                    color: mainAppColor,
                    size: 50,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "The Results will be provided at the end of each quiz that tells you how many questions you answered correctly and in which topic",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'AppIcons',
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.arrow_right,
                    color: mainAppColor,
                    size: 50,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "Keep track of progress through your profile",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'AppIcons',
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: const [
                Text(
                  "© BlindSpot App - A CS5520 Project by Team Sailor Senshi",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w100,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
