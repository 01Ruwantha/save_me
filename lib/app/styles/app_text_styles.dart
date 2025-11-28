import 'package:flutter/material.dart';

class AppTextStyles {
  final BuildContext context;
  late double screenWidth;
  late double screenHeight;

  AppTextStyles(this.context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
  }

  // Example responsive font sizes
  double get large => screenWidth * 0.07; // ~7% of screen width
  double get title => screenWidth * 0.06; // ~6% of screen width
  double get subtitle => screenWidth * 0.045; // ~4.5%
  double get body => screenWidth * 0.04; // ~4%
  double get small => screenWidth * 0.035; // ~3.5%
  double get smaller => screenWidth * 0.03; // ~3%
}
