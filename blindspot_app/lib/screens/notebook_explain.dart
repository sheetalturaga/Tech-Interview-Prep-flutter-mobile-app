import 'package:blindspot_app/screens/home_screen.dart';
import 'package:blindspot_app/screens/profile_screen.dart';
import 'package:blindspot_app/ui/shared/color.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../custom_widgets/custom_appbar.dart';
import 'notebook_screen.dart';

class NoteExplainScreen extends StatefulWidget {
  const NoteExplainScreen({
    Key? key,
    required this.questionId,
  }) : super(key: key);
  final String questionId;

  @override
  _NoteExplainScreenState createState() => _NoteExplainScreenState();
}

class _NoteExplainScreenState extends State<NoteExplainScreen> {
  late Stream<DocumentSnapshot<Map<String, dynamic>>> _noteStream;
  @override
  void initState() {
    super.initState();
    _noteStream = FirebaseFirestore.instance
        .collection('notebook')
        .doc(widget.questionId)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 150,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        flexibleSpace: ClipPath(
          clipper: ReviseSize(),
          child: Container(
            height: 300,
            width: MediaQuery.of(context).size.width,
            color: mainAppColor,
            child: Column(
              children: const [
                Padding(
                  padding: EdgeInsets.only(top: 60.0, bottom: 5.0),
                  child: Text(
                    'MY NOTEBOOK',
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
      body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: _noteStream,
        builder: (BuildContext context,
            AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData) {
            return const Center(child: Text('No data found.'));
          }

          final data = snapshot.data!.data()!;

          return Container(
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${data['question']}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: stdHeaderTextColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontFamily: "AppIcons",
                  ),
                ),
                const SizedBox(height: 20),
                const Center(
                  child: Text(
                    // 'Correct Option: ${data['correctOption']}',
                    "Explanation",
                    textAlign: TextAlign.center,

                    style: TextStyle(
                        color: stdHeaderTextColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: "AppIcons",
                        decoration: TextDecoration.underline),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  '${data['explanation']}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: stdHeaderTextColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: "AppIcons"),
                ),
              ],
            ),
          );
        },
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
