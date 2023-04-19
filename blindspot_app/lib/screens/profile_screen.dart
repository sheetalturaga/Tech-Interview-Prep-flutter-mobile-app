import 'package:blindspot_app/screens/about_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../custom_widgets/custom_appbar.dart';
import '../controllers/authorization_controller.dart';
import 'home_screen.dart';
import 'main_menu.dart';
import 'notebook_screen.dart';

class ProfileScreen extends GetView<AuthorizationController> {
  const ProfileScreen({super.key});
  static const String routeName = '/profilescreen';

  @override
  Widget build(BuildContext context) {
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
                children: [
                  Row(
                    children: [
                      Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: IconButton(
                              icon: const Icon(Icons.person),
                              onPressed: () {},
                              color: Colors.white,
                            ),
                          )),
                      const Spacer(),
                      const Align(
                        alignment: Alignment.center,
                      ),
                    ],
                  ),
                  const Center(
                      heightFactor: 5,
                      child: Text(
                        "User name",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      )),
                ],
              )),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width *
                  0.6, // Set button width to 80% of screen width
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: ElevatedButton(
                onPressed: () {
                  // Handle process button press
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(
                      double.infinity, 64), // Set button height to 64
                ),
                child: const Text('Process'),
              ),
            ),
            const SizedBox(height: 16), // Add some spacing between the buttons
            Container(
              width: MediaQuery.of(context).size.width *
                  0.6, // Set button width to 80% of screen width
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: ElevatedButton(
                onPressed: () {
                  // Handle setting button press
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(
                      double.infinity, 64), // Set button height to 64
                ),
                child: const Text('Setting'),
              ),
            ),
            const SizedBox(height: 35),
            TextButton(
              onPressed: () async {
                await controller.signOutGoogle(context: context);
              },
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.blue),
                textStyle:
                    MaterialStateProperty.all(const TextStyle(fontSize: 16)),
                padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 24)),
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
              ),
              child: const Text("Logout"),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.blue,
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
