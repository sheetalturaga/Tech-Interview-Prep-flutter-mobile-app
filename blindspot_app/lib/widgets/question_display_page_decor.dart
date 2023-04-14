import 'package:blindspot_app/ui/shared/color.dart';
import 'package:flutter/material.dart';
// import 'package:shimmer/shimmer.dart';

class QuestionDisplayPageDecor extends StatelessWidget {
  final Widget child;
  const QuestionDisplayPageDecor({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0XFF0C63E7),
              //   gradient: LinearGradient(
              // colors: [Color(0xFF07C8F9), Color(0XFF0C63E7), Color(0xFF07C8F9)],
            ),
            child: CustomPaint(
              painter: CustomPageDecor(),
            ),
          ),
        ),
        Positioned(child: child)
      ],
    );
  }
}

class CustomPageDecor extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Creating a paint object and extracting the color type and assigning
    // a color to it -- shortcut method
    Paint paint = Paint()..color = Colors.white.withOpacity(0.1);
    final path1 = Path();
    path1.moveTo(0, 0);
    path1.lineTo(size.width * 0.2, 0);
    path1.lineTo(0, size.height * 0.4);
    path1.close();

    final path2 = Path();
    path2.moveTo(size.width, 0);
    path2.lineTo(size.width * 0.8, 0);
    path2.lineTo(size.width * 0.2, size.height);
    path2.lineTo(size.width, size.height);
    path2.close();

    canvas.drawPath(path1, paint);
    canvas.drawPath(path2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    throw UnimplementedError();
  }
}
