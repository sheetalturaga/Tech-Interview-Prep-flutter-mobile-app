import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const background1 = Color.fromARGB(1, 235, 244, 245);
const background2 = Color.fromARGB(1, 181, 198, 224);

const cardbackground1 = Color.fromARGB(1, 64, 201, 255);
const cardbackground2 = Color.fromARGB(1, 232, 28, 255);

class AppColor {
  static final pripmaryColor = Color.fromRGBO(22, 131, 233, 100);
  static final secondaryColor = Color.fromARGB(255, 16, 101, 180);
  static final thirdColor = Color.fromARGB(255, 191, 193, 195);
}

const mainBackgroundGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      background1,
      background2,
    ]);

var CardBackgroundGradient = LinearGradient(
    colors: [
      cardbackground1,
      cardbackground2,
    ]);
