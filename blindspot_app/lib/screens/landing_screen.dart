import 'package:blindspot_app/screens/home_screen.dart';
import 'package:blindspot_app/screens/about_screen.dart';
import 'package:blindspot_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //total size of our screen
    // ignore: sized_box_for_whitespace
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
                fontSize: 30,
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
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return LoginScreen();
                          },
                        ),
                      );
                      //TODO: Implement button functionality
                    },
                    style: ButtonStyle(
                      minimumSize:
                          MaterialStateProperty.all(const Size(150, 50)),
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 24)),
                      textStyle: MaterialStateProperty.all(
                          const TextStyle(fontSize: 20)),
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                    ),
                    child: const Text("Login"),
                  ),
                  const SizedBox(height: 25),
                  ElevatedButton(
                    // TODO:Implement signup button functionality
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AboutScreen()),
                      );
                    },
                    style: ButtonStyle(
                      minimumSize:
                          MaterialStateProperty.all(const Size(150, 50)),
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 24)),
                      textStyle: MaterialStateProperty.all(
                          const TextStyle(fontSize: 20)),
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                    ),
                    child: const Text("About"),
                  ),
                  const SizedBox(height: 25),
                  ArrowButton(
                    onTap: () => {
                      Get.offAndToNamed(HomeScreen.routeName),
                    },
                    childWidget: const Icon(Icons.arrow_forward_ios, size: 20),
                  ),
                  const SizedBox(height: 100),

                  const SizedBox(height: 25),
                  ArrowButton(
                    onTap: () => {
                      Get.offAndToNamed(HomeScreen.routeName),
                    },
                    childWidget: const Icon(Icons.arrow_forward_ios, size: 20),
                  ),
                  // const SizedBox(height: 100),
                  // TextButton(
                  //   onPressed: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) {
                  //           return const AboutScreen();
                  //         },
                  //       ),
                  //     );
                  //   },
                  //   style: ButtonStyle(
                  //     foregroundColor: MaterialStateProperty.all(Colors.blue),
                  //     textStyle: MaterialStateProperty.all(
                  //         const TextStyle(fontSize: 16)),
                  //     padding: MaterialStateProperty.all(
                  //         const EdgeInsets.symmetric(
                  //             vertical: 16, horizontal: 24)),
                  //     backgroundColor:
                  //         MaterialStateProperty.all(Colors.transparent),
                  //   ),
                  //   child: const Text("About"),
                  // ),
                  const SizedBox(height: 140),
                  const Text(
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

class ArrowButton extends StatelessWidget {
  const ArrowButton(
      {super.key,
      required this.childWidget,
      this.color,
      this.width = 60,
      this.onTap});

  final Widget childWidget;
  final Color? color;
  final double width;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      clipBehavior: Clip.hardEdge,
      shape: const CircleBorder(),
      child: InkWell(onTap: onTap, child: childWidget),
    );
  }
}
