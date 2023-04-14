//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:blindspot_app/screens/quizz_screen.dart';
import 'package:blindspot_app/ui/shared/color.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  MainMenuState createState() => MainMenuState();
}

class MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.pripmaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 48.0,
          horizontal: 12.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            headerText("Quiz Page"),
            const SizedBox(height: 200),
            // const Center(
            //   child: Text(
            //     "Quiz Page",
            //     style: TextStyle(
            //       color: Colors.white,
            //       fontSize: 48,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),

            ListTile(
              title: Row(children: <Widget>[
                Expanded(
                  child: Center(
                    child: RawMaterialButton(
                      onPressed: () {
                        //Navigating the the Quizz Screen
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const QuizzScreen(),
                            ));
                      },
                      shape: const StadiumBorder(),
                      fillColor: AppColor.secondaryColor,
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 24.0),
                        child: Text(
                          "JAVA",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 26.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: RawMaterialButton(
                      onPressed: () {
                        //Navigating the the Quizz Screen
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const QuizzScreen(),
                            ));
                      },
                      shape: const StadiumBorder(),
                      fillColor: AppColor.secondaryColor,
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 24.0),
                        child: Text(
                          "PYTHON",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 26.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: RawMaterialButton(
                      onPressed: () {
                        //Navigating the the Quizz Screen
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const QuizzScreen(),
                            ));
                      },
                      shape: const StadiumBorder(),
                      fillColor: AppColor.secondaryColor,
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 24.0),
                        child: Text(
                          "C++",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 26.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}

Text headerText(String text) {
  return Text(
    text,
    style: const TextStyle(
      fontSize: 48,
      color: Color.fromARGB(255, 10, 10, 10),
      fontWeight: FontWeight.bold,
    ),
  );
}
