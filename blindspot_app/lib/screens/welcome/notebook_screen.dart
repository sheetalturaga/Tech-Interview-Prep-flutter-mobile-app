import 'package:blindspot_app/screens/welcome/about_screen.dart';
import 'package:blindspot_app/screens/welcome/login_screen.dart';
import 'package:blindspot_app/screens/welcome/profile_screen.dart';
import 'package:flutter/material.dart';
import '../../custom_widgets/custom_appbar.dart';
import '../main_menu.dart';

class NoteBookScreen extends StatelessWidget {
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
                              icon: const Icon(Icons.book),
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
                        "My Notebook",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      )),
                ],
              )),
        ),
      ),
      body: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (int i = 1; i <= 3; i++) // Loop from 1 to 3 to create 3 buttons
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Dismissible(
                      key: Key('p$i'),
                      onDismissed: (_) {
                        // Handle button deletion
                      },
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle button press
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 64),
                          primary: Colors.lightBlueAccent,
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.delete,
                                size: 16), // Add delete icon here
                            SizedBox(width: 8),
                            Text(
                              'p$i',
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      background: Container(
                        color:
                            Colors.red, // Customize the delete background color
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16), // Add some spacing between the buttons
                ],
              ),
            SizedBox(height: 60), // Add spacing below the buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon:
                      Icon(Icons.arrow_back, color: Colors.lightBlue, size: 30),
                  onPressed: () {
                    // Handle back button press
                  },
                ),
                SizedBox(width: 16), // Add some spacing between the buttons
                IconButton(
                  icon: Icon(Icons.arrow_forward,
                      color: Colors.lightBlue, size: 30),
                  onPressed: () {
                    // Handle forward button press
                  },
                ),
              ],
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MainMenu()),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NoteBookScreen()),
              );
              // Handle navigation to Notebook screen
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
              // Handle navigation to User screen
              break;
          }
        },
        items: [
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
