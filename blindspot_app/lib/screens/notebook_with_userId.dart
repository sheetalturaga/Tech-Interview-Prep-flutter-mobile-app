import 'package:blindspot_app/model/notebook_model.dart';
import 'package:blindspot_app/screens/home_screen.dart';
import 'package:blindspot_app/screens/landing_screen.dart';
import 'package:blindspot_app/screens/note_explain.dart';
import 'package:blindspot_app/screens/profile_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../custom_widgets/custom_appbar.dart';

class NotebookScreen extends StatefulWidget {
  const NotebookScreen({Key? key}) : super(key: key);

  @override
  _NotebookScreenState createState() => _NotebookScreenState();
}

class _NotebookScreenState extends State<NotebookScreen> {
  late Stream<QuerySnapshot> notebookSnapshot;
  late String userId;

  @override
  void initState() {
    super.initState();
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    userId = user!.uid;
    CollectionReference notebookRef =
        FirebaseFirestore.instance.collection('Notebook');
    notebookSnapshot =
        notebookRef.where('userId', isEqualTo: userId).snapshots();
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
      body: StreamBuilder<QuerySnapshot>(
        stream: notebookSnapshot,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Text('Loading...');
          } else if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
            return Text('No data found');
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (BuildContext context, int index) {
                DocumentSnapshot question = snapshot.data!.docs[index];
                NotebookModel notebookModel =
                    NotebookModel.fromFirestore(question);
                return ElevatedButton(
                  child: Text('P${index + 1}'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NoteExplainScreen(
                            questionId: notebookModel.questionId!),
                      ),
                    );
                  },
                );
              },
            );
          }
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
                MaterialPageRoute(builder: (context) => const LandingScreen()),
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
