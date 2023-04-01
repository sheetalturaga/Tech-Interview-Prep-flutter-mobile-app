import 'package:flutter/material.dart';
import 'package:blindspot_app/services/database_service.dart';

import '../custom_widgets/custom_appbar.dart';

class QuestionDisplayPage extends StatefulWidget {
  @override
  _QuestionDisplayPageState createState() => _QuestionDisplayPageState();
}

class _QuestionDisplayPageState extends State<QuestionDisplayPage> {
  DatabaseService _databaseService = new DatabaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      title: const Align(
        alignment: Alignment.topRight,
        child: Text(
          "Question 1 / 10",
          style: TextStyle(fontSize: 20, color: Colors.brown),
        ),
      ),
      appBar: AppBar(
        toolbarHeight: 500,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        flexibleSpace: ClipPath(
          clipper: ReviseSize(),
          child: Container(
            height: 250,
            width: MediaQuery.of(context).size.width,
            color: Colors.blue,
            child: const Center(
                child: Text(
              "Question displayed here",
              style: TextStyle(fontSize: 20, color: Colors.white),
            )),
          ),
        ),
      ),
      // body: Container(
      //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.end,
      //     children: const [
      //       SizedBox(height: 30),
      //       // Text("Question 1 / 10"),
      //     ],
      //   ),
      // ),
    );
  }
}
