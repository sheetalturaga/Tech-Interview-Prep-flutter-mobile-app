import 'package:blindspot_app/screens/notebook_explain.dart';
import 'package:blindspot_app/screens/profile_screen.dart';
import 'package:blindspot_app/ui/shared/color.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../custom_widgets/custom_appbar.dart';
import 'package:blindspot_app/model/notebook_model.dart';
import 'home_screen.dart';

class NotebookScreen extends StatefulWidget {
  const NotebookScreen({super.key});
  static const String routeName = '/notebookscreen';

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
        FirebaseFirestore.instance.collection('notebook');
    notebookSnapshot =
        notebookRef.where('userId', isEqualTo: userId).snapshots();
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
                    "MY NOTEBOOK",
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
      body: StreamBuilder<QuerySnapshot>(
        stream: notebookSnapshot,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No data found'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (BuildContext context, int index) {
                DocumentSnapshot question = snapshot.data!.docs[index];
                NoteBookModel notebookModel =
                    NoteBookModel.fromFirestore(question);
                return Container(
                  margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                  child: Column(children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            colors: [Color(0XFF69AFF1), Color(0XFFDDC6FA)]),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: SizedBox(
                        height: 80,
                        width: MediaQuery.of(context).size.width * 0.85,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NoteExplainScreen(
                                    questionId: notebookModel.questionId!,
                                  ),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.white10.withOpacity(0.1)),
                            child: Text(
                              'Question${index + 1}',
                              style: const TextStyle(
                                  fontSize: 20, color: stdHeaderTextColor),
                            )),
                      ),
                    ),
                  ]),
                );
              },
            );
          }
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
