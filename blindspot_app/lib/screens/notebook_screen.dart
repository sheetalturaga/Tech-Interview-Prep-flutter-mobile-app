import 'package:blindspot_app/screens/home_screen.dart';
import 'package:blindspot_app/screens/landing_screen.dart';
import 'package:blindspot_app/screens/note_explain.dart';
import 'package:blindspot_app/screens/profile_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../custom_widgets/custom_appbar.dart';

class NotebookScreen extends StatefulWidget {
  const NotebookScreen({super.key});
  static const String routeName = '/notebookscreen';

  @override
  _NotebookScreenState createState() => _NotebookScreenState();
}

class _NotebookScreenState extends State<NotebookScreen> {
  late Stream<QuerySnapshot> notebookSnapshot;

  @override
  void initState() {
    super.initState();
    CollectionReference notebookRef =
        FirebaseFirestore.instance.collection('notebook');
    notebookSnapshot = notebookRef.snapshots();
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
          }
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Text('Loading...');
            default:
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  DocumentSnapshot question = snapshot.data!.docs[index];
                  return ElevatedButton(
                    child: Text('P${index + 1}'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              NoteExplainScreen(questionId: question.id),
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
