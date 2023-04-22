import 'package:flutter/material.dart';
import '../../ui/shared/color.dart';

// The Welcome Screen displaying the Logo of the App
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
          width: 650,
          height: 650,
        ),
      ),
    );
  }
}
