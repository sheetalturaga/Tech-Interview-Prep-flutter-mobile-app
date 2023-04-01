import 'dart:ui';

import 'package:blindspot_app/models/question_schema.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReviseSize extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;
    var path = Path();
    path.lineTo(0, height - 50);
    path.quadraticBezierTo(width / 2, height, width, height - 50);
    path.lineTo(width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}

class OptionsWidget extends StatelessWidget {
  late QuestionSchema question;

  OptionsWidget(Text text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text(
          "Option1",
          style: TextStyle(fontSize: 20),
        ),
        Text(
          "Option2",
          style: TextStyle(fontSize: 20),
        ),
        Text(
          "Option3",
          style: TextStyle(fontSize: 20),
        ),
        Text(
          "Option4",
          style: TextStyle(fontSize: 20),
        )
      ],
    );
  }
}
