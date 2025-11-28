import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:save_me/app/router/router_names.dart';
import 'package:save_me/app/styles/app_color_style.dart';

class OnBoardingNextButtonWidget extends StatelessWidget {
  final PageController controller;
  final int lastPageIndex; // Pass last page index dynamically

  const OnBoardingNextButtonWidget({
    super.key,
    required this.controller,
    this.lastPageIndex = 2, // Default last page index
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: kBottomNavigationBarHeight - 15,
      right: 16,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: AppColorStyle.backgroundPrimary,
        ),
        onPressed: () {
          // If on last page -> navigate
          if ((controller.page ?? 0).round() >= lastPageIndex) {
            context.pushReplacementNamed(RouterNames.signIn);
          } else {
            // Otherwise go to next page
            controller.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          }
        },
        child: const Icon(
          Icons.arrow_forward_ios_rounded,
          color: AppColorStyle.darkNavy,
          size: 30,
        ),
      ),
    );
  }
}
