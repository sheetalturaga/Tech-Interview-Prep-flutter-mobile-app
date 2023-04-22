import 'package:blindspot_app/screens/profile_screen.dart';
import 'package:blindspot_app/ui/shared/color.dart';
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                // width: MediaQuery.of(context).size.width * 0.6,
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: const CircleAvatar(
                  radius: 120,
                  backgroundImage: AssetImage('assets/images/settingImg.png'),
                ),
              ),
              const SizedBox(height: 16),
              const SizedBox(height: 35),
              const Text(
                'Update your username?',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 35),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Enter your new username....',
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
                  minimumSize: const Size(70, 30),
                ),
                child: const Text('Submit'),
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
