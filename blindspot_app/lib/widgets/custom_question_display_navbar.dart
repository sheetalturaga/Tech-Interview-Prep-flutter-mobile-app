import 'package:blindspot_app/screens/home_screen.dart';
import 'package:blindspot_app/screens/landing_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../firestore_references/collection_refs.dart';

class CustomQuestionDisplayNavbar extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final Widget? leadTitleWidget;
  final bool displayActionIcon;
  final VoidCallback? onTapAction;
  final Widget? secondaryWidget;

  const CustomQuestionDisplayNavbar({
    super.key,
    this.title = "",
    this.leadTitleWidget,
    this.displayActionIcon = false,
    this.secondaryWidget,
    this.onTapAction,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 25.0 / 1.2,
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: leadTitleWidget == null
                  ? Center(
                      child: Text(
                        title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white),
                      ),
                    )
                  : Center(
                      child: leadTitleWidget,
                    ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Transform.translate(
                  offset: const Offset(-14, 0),
                  child: ArrowButton(
                    childWidget: Icon(
                        isClick ? Icons.star : Icons.star_border_outlined,
                        color: Colors.white),
                    onTap: () {
                      isClick = true;
                    },
                  ),
                ),
                if (displayActionIcon)
                  Transform.translate(
                    offset: const Offset(10, 0),
                    child: ArrowButton(
                        childWidget: const Icon(
                          Icons.home,
                          color: Colors.white,
                        ),
                        onTap: onTapAction ??
                            () {
                              Get.toNamed(HomeScreen.routeName);
                            }),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.maxFinite, 80);
}
