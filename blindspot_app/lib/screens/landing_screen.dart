import 'package:blindspot_app/screens/home_screen.dart';
import 'package:blindspot_app/screens/about_screen.dart';
import 'package:blindspot_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../custom_widgets/custom_appbar.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //total size of our screen
    // ignore: sized_box_for_whitespace
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 300,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        flexibleSpace: ClipPath(
          clipper: ReviseSize(),
          child: Container(
            height: 250,
            width: MediaQuery.of(context).size.width,
            color: Colors.blue,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Center(
                  heightFactor: 2,
                  child: Text(
                    "BLIND SPOT",
                    style: TextStyle(
                      fontSize: 45,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
                Text(
                  "Learning the Gap",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: 'Open Sans',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const LoginScreen();
                      },
                    ),
                  );
                },
                child: const Text('Login'),
              ),
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutScreen()),
                  );
                },
                child: const Text('About'),
              ),
            ),
            const SizedBox(height: 25),
            ArrowButton(
              onTap: () => {
                Get.offAndToNamed(HomeScreen.routeName),
              },
              childWidget: const Icon(Icons.arrow_forward_ios, size: 20),
            ),
          ],
        ),
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
      // type: MaterialType.transparency,
      clipBehavior: Clip.hardEdge,
      shape: const CircleBorder(),
      child: InkWell(onTap: onTap, child: childWidget),
    );
  }
}
