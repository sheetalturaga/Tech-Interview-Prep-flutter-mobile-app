import 'package:blindspot_app/screens/home_screen.dart';
import 'package:blindspot_app/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../custom_widgets/custom_appbar.dart';
import '../ui/shared/color.dart';
import 'notebook_screen.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key});

  static const String routeName = '/progressscreen';

  @override
  _ProgressScreenState createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  @override
  Widget build(BuildContext context) {
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
            color: Colors.blue,
            child: Column(
              children: const [
                Padding(
                  padding: EdgeInsets.only(top: 60, bottom: 5.0),
                  child: Text(
                    "PROGRESS",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'AppIcons',
                    ),
                  ),
                ),
              ],
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
                  Colors.white.withOpacity(0.1), BlendMode.dstATop)),
        ),
        child: Center(
          child: ListView(
            padding: const EdgeInsets.all(5),
            children: <Widget>[
              const Text(
                "Completed Questions",
                style: TextStyle(
                    color: stdHeaderTextColor,
                    fontSize: 20.0,
                    fontFamily: "AppIcons"),
                textAlign: TextAlign.center,
              ),
              const Divider(
                color: stdHeaderTextColor,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                CircularPercentIndicator(
                  radius: 52.0,
                  lineWidth: 13.0,
                  animation: true,
                  animationDuration: 5000,
                  percent: 0.6,
                  animateFromLastPercent: true,
                  center: const Text(
                    "30/50",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                  footer: const Text(
                    "PYTHON",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: const Color(0xFFB268BA),
                ),
                CircularPercentIndicator(
                  radius: 52.0,
                  lineWidth: 13.0,
                  animation: true,
                  animationDuration: 5000,
                  percent: 0.34,
                  animateFromLastPercent: true,
                  center: const Text(
                    "17/50",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                  footer: const Text(
                    "JAVA",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: tabPurpleColor,
                ),
                CircularPercentIndicator(
                  radius: 52.0,
                  lineWidth: 13.0,
                  animation: true,
                  animationDuration: 5000,
                  percent: 0.68,
                  animateFromLastPercent: true,
                  center: const Text(
                    "34/50",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                  footer: const Text(
                    "OOD",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: const Color(0xFF6873BA),
                ),
              ]),
              const SizedBox(
                height: 45.0,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                CircularPercentIndicator(
                  radius: 52.0,
                  lineWidth: 13.0,
                  animation: true,
                  animationDuration: 5000,
                  percent: 0.2,
                  animateFromLastPercent: true,
                  center: const Text(
                    "10/50",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                  footer: const Text(
                    "DATA",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: const Color(0xFFBA7068),
                ),
                CircularPercentIndicator(
                  radius: 52.0,
                  lineWidth: 13.0,
                  animation: true,
                  animationDuration: 5000,
                  percent: 0.6,
                  animateFromLastPercent: true,
                  center: const Text(
                    "30/50",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                  footer: const Text(
                    "BEHAVIORAL",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: const Color(0xFF69BAB2),
                ),
                CircularPercentIndicator(
                  radius: 52.0,
                  lineWidth: 13.0,
                  animation: true,
                  animationDuration: 5000,
                  percent: 0.484,
                  animateFromLastPercent: true,
                  center: const Text(
                    "121/250",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                  footer: const Text(
                    "TOTAL",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: const Color(0xFFBAB269),
                ),
              ]),
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NotebookScreen()),
              );
              // Handle navigation to Notebook screen
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
              // Handle navigation to User screen
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
