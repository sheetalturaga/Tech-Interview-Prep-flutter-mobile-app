import 'package:flutter/material.dart';
import 'package:blindspot_app/data/questions_example.dart';
import 'package:blindspot_app/screens/result_screen.dart';
import 'package:blindspot_app/ui/shared/color.dart';
import 'package:blindspot_app/widgets/quizz_widget.dart';
import 'package:blindspot_app/model/question_model.dart';
import 'package:blindspot_app/screens/explanation_screen.dart';

class QuizzScreen extends StatefulWidget {
  const QuizzScreen({Key? key}) : super(key: key);

  @override
  _QuizzScreenState createState() => _QuizzScreenState();
}

class _QuizzScreenState extends State<QuizzScreen> {
  int question_pos = 0;
  int score = 0;
  List<bool> btnPressed = [false, false, false, false];
  PageController? _controller;
  String btnText = "Submit";

  bool answered = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.pripmaryColor,
      body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: PageView.builder(
            controller: _controller!,
            onPageChanged: (page) {
              if (page == questions.length - 1) {
                setState(() {
                  btnText = "See Results";
                });
              }
              setState(() {
                answered = false;
              });
            },
            physics: new NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      "${index + 1}/10",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color.fromARGB(255, 196, 122, 122),
                        fontSize: 12.0,
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 200.0,
                    child: Text(
                      "${questions[index].question}",
                      style: TextStyle(
                        color: Color.fromARGB(255, 171, 173, 43),
                        fontSize: 22.0,
                      ),
                    ),
                  ),
                  for (int i = 0; i < questions[index].answers!.length; i++)
                    Container(
                      width: 300.0,
                      height: 50.0,
                      margin: EdgeInsets.only(
                          bottom: 20.0, left: 12.0, right: 12.0),
                      child: RawMaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        fillColor: btnPressed[i]
                            ? Color.fromARGB(255, 40, 93, 193)
                            : AppColor.thirdColor,
                        onPressed: !answered
                            ? () {
                                if (questions[index]
                                    .answers!
                                    .values
                                    .toList()[i]) {
                                  score++;
                                  print("yes");
                                } else {
                                  print("no");
                                }
                                setState(() {
                                  btnPressed[i] = true;
                                  answered = true;
                                });
                              }
                            : null,
                        child: Text(questions[index].answers!.keys.toList()[i],
                            style: TextStyle(
                              color: Color.fromARGB(255, 17, 16, 16),
                              fontSize: 18.0,
                            )),
                      ),
                    ),
                  SizedBox(
                    height: 40.0,
                  ),

//button1: see answer

                  // ListTile(
                  //     title: Row(
                  //   children: <Widget>[
                  //     RawMaterialButton(
                  //       onPressed: () {
                  //         //Navigating the the Quizz Screen
                  //         Navigator.push(
                  //             context,
                  //             MaterialPageRoute(
                  //               builder: (context) => QuizzScreen(),
                  //             ));
                  //       },
                  RawMaterialButton(
                    onPressed: () {
                      if (_controller!.page?.toInt() == questions.length - 1) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ResultScreen(score)));
                      } else {
                        _controller!.nextPage(
                            duration: Duration(milliseconds: 250),
                            curve: Curves.easeInExpo);

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ExplanationScreen()));

                        setState(() {
                          btnPressed = [false, false, false, false];
                        });
                      }
                    },
                    shape: StadiumBorder(),
                    fillColor: Color.fromARGB(255, 84, 193, 99),
                    padding: EdgeInsets.all(18.0),
                    elevation: 0.0,
                    child: Text(
                      btnText,
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              );
            },
            itemCount: questions.length,
          )),
    );
  }
}
