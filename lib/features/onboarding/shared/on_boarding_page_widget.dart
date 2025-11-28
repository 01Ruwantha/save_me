// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:save_me/app/styles/app_text_styles.dart';

class OnBoardingPageWidget extends StatelessWidget {
  final String image;
  final String title;
  final String subTitle;
  const OnBoardingPageWidget({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Lottie.asset(
            image,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.6,
            fit: BoxFit.contain,
          ),

          SizedBox(height: 16),
          Text(
            title,
            style: TextStyle(
              fontSize: AppTextStyles(context).title,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              subTitle,
              style: TextStyle(fontSize: AppTextStyles(context).subtitle),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
