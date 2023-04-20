import 'package:blindspot_app/screens/profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../custom_widgets/custom_appbar.dart';
import '../controllers/authorization_controller.dart';
import 'home_screen.dart';
import 'notebook_screen.dart';

class SettingScreen extends GetView<AuthorizationController> {
  const SettingScreen({super.key});
  static const String routeName = '/settingscreen';

  @override
  Widget build(BuildContext context) {
    User user = FirebaseAuth.instance.currentUser!;
    String displayName = user.displayName ?? 'Unknown';
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
                  Center(
                      heightFactor: 5,
                      child: Text(
                        displayName,
                        style:
                            const TextStyle(fontSize: 25, color: Colors.white),
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
              child: Image.asset(
                'assets/images/settingImg.png',
                height: 64, // Set image height to 64
              ),
            ),
            const SizedBox(height: 16), // Add some spacing between the buttons

            const SizedBox(height: 35),
            const Text(
              'Want to change your username?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 35),
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter your new username',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) async {
                  user.updateDisplayName(value);
                  controller.writeUserData(user);
                },
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle submit button press
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(100, 40),
              ),
              child: Text('Submit'),
            ),
            //  Container(
            //   width: MediaQuery.of(context).size.width * 0.4,
            //   child: ElevatedButton(
            //     onPressed: () async {
            //       await controller._writeUserData(user);
            //       ScaffoldMessenger.of(context).showSnackBar(
            //         const SnackBar(
            //           content: Text('Username updated successfully!'),
            //         ),
            //       );
            //     },
            //     style: ElevatedButton.styleFrom(
            //       minimumSize: const Size(double.infinity, 48),
            //       padding: const EdgeInsets.symmetric(horizontal: 16),
            //     ),
            //     child: const Text('Submit'),
            //   ),
            // ),
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
