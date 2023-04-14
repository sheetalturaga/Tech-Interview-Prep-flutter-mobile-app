import 'package:flutter/material.dart';
import '../../ui/shared/color.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(gradient: mainBackgroundGradient),
        child: Image.asset(
          'assets/images/BLINDSPOT.jpeg',
          width: 500,
          height: 500,
        ),
      ),
    );
  }
}
