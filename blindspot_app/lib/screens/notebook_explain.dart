
import 'package:blindspot_app/screens/main_menu.dart';
import 'package:blindspot_app/screens/profile_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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

    // Set up a Firestore stream for the selected question
    _noteStream = FirebaseFirestore.instance
        .collection('notebook')
        .doc(widget.questionId)
        .snapshots();
  }

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
                alignment: Alignment.topLeft,
                color: Colors.lightBlue,
                padding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
                child: Text(
                  '${data['questionId']}. ${data['question']}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                alignment: Alignment.topLeft,
                color: Colors.lightBlue,
                padding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
                child: Text(
                  'Correct Option: ${data['correctOption']}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                alignment: Alignment.topLeft,
                color: Colors.lightBlue,
                padding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
                child: Text(
                  'Explanation: ${data['explanation']}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MainMenu()),
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
