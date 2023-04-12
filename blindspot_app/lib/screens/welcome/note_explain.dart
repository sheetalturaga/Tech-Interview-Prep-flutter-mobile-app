import 'package:blindspot_app/screens/main_menu.dart';
import 'package:blindspot_app/screens/welcome/about_screen.dart';
import 'package:blindspot_app/screens/welcome/login_screen.dart';
import 'package:blindspot_app/screens/welcome/profile_screen.dart';
import 'package:blindspot_app/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import '../../custom_widgets/custom_appbar.dart';
import 'notebook_screen.dart';

class NoteExplainScreen extends StatefulWidget {
  @override
  @override
  _NoteExplainScreenState createState() => _NoteExplainScreenState();
}

class _NoteExplainScreenState extends State<NoteExplainScreen> {
  bool _showText = true;

  void _deleteText() {
    setState(() {
      _showText = false;
    });
  }

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
      body: Column(
        children: [
          if (_showText)
            Container(
              alignment: Alignment.topLeft,
              color: Colors.lightBlue,
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 16),
              child: Text(
                "P1. which of the following is not a valid access of Java",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          SizedBox(height: 16),
          if (_showText)
            Container(
              alignment: Alignment.topLeft,
              color: Colors.lightBlue,
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 16),
              child: Text(
                "Explanation: Access modifier in Java are keywords that determine the accessibility of a classs, method or varibles",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          IconButton(
            onPressed: _deleteText,
            icon: Icon(
              Icons.delete,
              color: Colors.lightBlue,
            ),
          ),
          SizedBox(height: 60), // Add spacing below the buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.lightBlue, size: 30),
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
