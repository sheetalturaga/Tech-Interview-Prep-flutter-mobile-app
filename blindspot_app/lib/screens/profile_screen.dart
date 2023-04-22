import 'package:blindspot_app/screens/landing_screen.dart';
import 'package:blindspot_app/screens/progress_screen.dart';
import 'package:blindspot_app/ui/shared/color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../custom_widgets/custom_appbar.dart';
import '../controllers/authorization_controller.dart';
import 'User_setting.dart';
import 'home_screen.dart';
import 'notebook_screen.dart';

class ProfileScreen extends GetView<AuthorizationController> {
  const ProfileScreen({super.key});
  static const String routeName = '/profilescreen';

  @override
  Widget build(BuildContext context) {
    User user = FirebaseAuth.instance.currentUser!;
    String displayName = user.displayName ?? 'Unknown';
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
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(top: 50.0, bottom: 5.0),
                child: Center(
                  child: Text(
                    "Hello, $displayName!",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
              )
            ]),
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
                width: 250,
                height: 75,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProgressScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(
                        double.infinity, 64), // Set button height to 64
                  ),
                  child: const Text('Progress',
                      style: TextStyle(fontSize: 20, fontFamily: "AppIcons")),
                ),
              ),
              const SizedBox(
                  height: 25), // Add some spacing between the buttons
              SizedBox(
                width: 250,
                height: 75,
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(SettingScreen.routeName);
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(
                        double.infinity, 64), // Set button height to 64
                  ),
                  child: const Text('Settings',
                      style: TextStyle(fontSize: 20, fontFamily: "AppIcons")),
                ),
              ),
              const SizedBox(height: 40),
              TextButton(
                onPressed: () async {
                  await controller.signOutGoogle(context: context);
                  Get.offAll(() => const LandingScreen());
                },
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.blue),
                  textStyle: MaterialStateProperty.all(const TextStyle(
                      fontSize: 16,
                      fontFamily: "AppIcons",
                      color: Colors.white)),
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 24)),
                  backgroundColor:
                      MaterialStateProperty.all(mainAppColor.withOpacity(0.3)),
                ),
                child: const Text("Logout"),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: mainAppColor,
        currentIndex: 0,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        onTap: (int index) {
          switch (index) {
            case 0:
              Get.toNamed(HomeScreen.routeName);
              break;
            case 1:
              Get.toNamed(NotebookScreen.routeName);
              break;
            case 2:
              Get.toNamed(ProfileScreen.routeName);
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Notebook',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'User',
          ),
        ],
      ),
    );
  }
}
