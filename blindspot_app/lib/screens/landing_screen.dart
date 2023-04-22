import 'package:blindspot_app/screens/about_screen.dart';
import 'package:blindspot_app/screens/login_screen.dart';
import 'package:blindspot_app/ui/shared/color.dart';
import 'package:flutter/material.dart';
import '../custom_widgets/custom_appbar.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});
  static const String routeName = '/landingscreen';

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
                  Colors.white.withOpacity(0.2), BlendMode.dstATop)),
        ),
        child: Center(
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
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 20, fontFamily: "AppIcons"),
                  ),
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
                      MaterialPageRoute(
                          builder: (context) => const AboutScreen()),
                    );
                  },
                  child: const Text(
                    'About',
                    style: TextStyle(fontSize: 20, fontFamily: "AppIcons"),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              // ArrowButton(
              //   onTap: () => {
              //     Get.offAndToNamed(HomeScreen.routeName),
              //   },
              //   childWidget: const Icon(Icons.arrow_forward_ios, size: 20),
              // ),
            ],
          ),
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
      type: MaterialType.transparency,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: childWidget,
          )),
    );
  }
}
