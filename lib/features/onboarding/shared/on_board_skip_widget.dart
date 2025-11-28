import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:save_me/app/router/router_names.dart';
import 'package:save_me/app/styles/app_color_style.dart';

class OnBoardSkipWidget extends StatelessWidget {
  const OnBoardSkipWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: kToolbarHeight,
      right: 16,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColorStyle.backgroundPrimary,
        ),
        onPressed: () {
          // Skip -> Directly go to Sign In
          context.pushReplacementNamed(RouterNames.signIn);
        },
        child: const Text(
          "Skip",
          style: TextStyle(color: AppColorStyle.darkNavy),
        ),
      ),
    );
  }
}
