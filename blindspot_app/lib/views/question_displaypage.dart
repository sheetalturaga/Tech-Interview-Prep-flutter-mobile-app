import 'package:flutter/material.dart';
// import 'package:blindspot_app/services/database_service.dart';

import '../custom_widgets/custom_appbar.dart';

class QuestionDisplayPage extends StatefulWidget {
  const QuestionDisplayPage({super.key});

  @override
  _QuestionDisplayPageState createState() => _QuestionDisplayPageState();
}

class _QuestionDisplayPageState extends State<QuestionDisplayPage> {
  // DatabaseService _databaseService = new DatabaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // title: const Align(
      //   alignment: Alignment.topRight,
      //   child: Text(
      //     "Question 1 / 10",
      //     style: TextStyle(fontSize: 20, color: Colors.brown),
      //   ),
      // ),
      appBar: AppBar(
        toolbarHeight: 300,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        flexibleSpace: ClipPath(
          clipper: ReviseSize(),
          child: Container(
              height: 400,
              width: MediaQuery.of(context).size.width,
              color: Colors.blue,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: IconButton(
                              icon: const Icon(Icons.star),
                              onPressed: () {},
                              color: Colors.amber,
                            ),
                          )),
                      const Spacer(),
                      const Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "1 / 10",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Center(
                      heightFactor: 5,
                      child: Text(
                        "Question displayed here",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )),
                ],
              )),
        ),
      ),
      body: Container(
          // padding: const EdgeInsets.symmetric(horizontal: 16.0),
          // child: Column(
          //   crossAxisAlignment: CrossAxisAlignment.end,
          //   children: const [
          //     SizedBox(height: 30),
          //     Expanded(
          //       child: OptionsWidget(
          //         Text("Question"),

          //     ))
          //   ],
          ),
    );
  }
}
