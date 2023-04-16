import 'package:blindspot_app/ui/shared/color.dart';
import 'package:flutter/material.dart';

class ContentAreaSize extends StatelessWidget {
  final Widget child;
  final bool additionalPadding;

  const ContentAreaSize(
      {super.key, required this.child, this.additionalPadding = true});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
      clipBehavior: Clip.hardEdge,
      type: MaterialType.transparency,
      child: Ink(
        decoration: BoxDecoration(
          color: customAnswerCardColor(context),
        ),
        padding: additionalPadding
            ? const EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0)
            : EdgeInsets.zero,
        child: child,
      ),
    );
  }
}
