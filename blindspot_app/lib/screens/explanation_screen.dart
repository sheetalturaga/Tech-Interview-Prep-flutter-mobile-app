import 'package:blindspot_app/screens/quizz_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:blindspot_app/screens/main_menu.dart';
import 'package:blindspot_app/ui/shared/color.dart';

class ExplanationScreen extends StatefulWidget {
  @override
  _ExplanationScreenState createState() => _ExplanationScreenState();
}

class _ExplanationScreenState extends State<ExplanationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.pripmaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              "THAT'S CORRECT!",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 60.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 45.0,
          ),
          Text(
            "Explanation",
            style: TextStyle(color: Colors.white, fontSize: 25.0),
          ),
          Divider(
            color: Colors.white,
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            margin: const EdgeInsets.all(20),
          ),
          Text(
            "Abstract: Abstract is a keyword that is used with a class or a method. An abstract class or abstract method is used for further modification. If a class is declared as ‘abstract’, the class cannot be instantiated.",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25.0,
            ),
          ),
          SizedBox(
            height: 100.0,
          ),
          RawMaterialButton(
            onPressed: () {
              Navigator.pop(
                context,
              );
            },
            // shape: StadiumBorder(),
            // color: AppColor.secondaryColor,
            // padding: EdgeInsets.all(18.0),
            child: Text(
              "Next Question",
              style: TextStyle(color: Colors.white),
            ),
            shape: StadiumBorder(),
            fillColor: Colors.blue,
            padding: EdgeInsets.all(18.0),
            elevation: 0.0,
          ),
        ],
      ),
    );
  }
}
