// lib/app/styles/app_color_style.dart
import 'package:flutter/material.dart';

class AppColorStyle {
  // Primary Colors
  static const Color primaryBlue = Color(0xFF2563EB);
  static const Color darkNavy = Color(0xFF0F172A);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  // Semantic Colors
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);
  static const Color info = Color(0xFF3B82F6);

  // Grey Scale
  static const Color grey50 = Color(0xFFF9FAFB);
  static const Color grey100 = Color(0xFFF3F4F6);
  static const Color grey200 = Color(0xFFE5E7EB);
  static const Color grey300 = Color(0xFFD1D5DB);
  static const Color grey400 = Color(0xFF9CA3AF);
  static const Color grey500 = Color(0xFF6B7280);
  static const Color grey600 = Color(0xFF4B5563);
  static const Color grey700 = Color(0xFF374151);
  static const Color grey800 = Color(0xFF1E293B);
  static const Color grey900 = Color(0xFF111827);

  // Custom Colors for specific components
  static const Color bottomNavSelected = primaryBlue;
  static const Color bottomNavBackground = darkNavy;
  static const Color bottomNavUnselected = grey500;

  // Text Colors
  static const Color textPrimary = grey900;
  static const Color textSecondary = grey600;
  static const Color textDisabled = grey400;

  // Background Colors
  static const Color backgroundPrimary = white;
  static const Color backgroundSecondary = grey50;

  // Border Colors
  static const Color borderLight = grey200;
  static const Color borderDefault = grey300;

  // Specific component colors
  static const Color searchBackground = Color(0xFFFAFAFA);
  static const Color badgeRed = Color(0xFFFF4D5E);
  static const Color searchIcon = Color(0xFF070C18);

  // Call Page Specific Color
  static const Color callBackground = Color(0xFF325E8F);

  // Conversation Page Specific Colors
  static const Color conversationHeaderBackground = white;
  static const Color conversationHeaderShadow = Color.fromRGBO(0, 0, 0, 0.1);
  static const Color conversationIconColor = Color(0xFF070C18);
  static const Color conversationOnlineStatus = Color(0xFF727A83);
  static const Color messageInputBackground = Color(0xFFFAFAFA);

  // Auth Page Specific Colors
  static const Color authButtonBlue = Color(0xFF0080FF);
  static const Color authFieldBackground = grey800;

  // Get unselected color with shade
  static Color get unselectedColor => grey500;

  // Alternative way to get colors with context (for theme awareness)
  static Color getScaffoldBackground(BuildContext context) {
    return Theme.of(context).scaffoldBackgroundColor;
  }

  static Color getPrimaryColor(BuildContext context) {
    return Theme.of(context).primaryColor;
  }
}
