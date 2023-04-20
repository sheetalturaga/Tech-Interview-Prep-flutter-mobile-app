import 'package:blindspot_app/screens/home_screen.dart';
import 'package:blindspot_app/screens/profile_screen.dart';
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
        toolbarHeight: 200,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        flexibleSpace: ClipPath(
          clipper: ReviseSize(),
          child: Container(
              height: 250,
              width: MediaQuery.of(context).size.width,
              color: const Color(0xFF1683E9),
              child: Column(
                children: [
                  Row(
                    children: const [
                      Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                          )),
                      Spacer(),
                      Align(
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

          return Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                color: const Color(0xFF1683E9),
                margin: const EdgeInsets.fromLTRB(50, 5, 50, 5),
                padding: const EdgeInsets.symmetric(
                    vertical: 10), // increased vertical padding
                child: Center(
                  child: Text(
                    '${data['question']}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                // alignment: Alignment.topLeft,
                color: const Color(0xFF1683E9),
                margin: const EdgeInsets.fromLTRB(150, 5, 150, 5),
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Center(
                  child: Text(
                    'Correct Option: ${data['correctOption']}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                // alignment: Alignment.topLeft,
                color: const Color(0xFF1683E9),
                margin: const EdgeInsets.fromLTRB(50, 5, 50, 5),
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Center(
                  child: Text(
                    'Explanation: ${data['explanation']}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 60),
            ],
          );
        },
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
