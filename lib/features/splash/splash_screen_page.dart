import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:save_me/app/router/router_names.dart';
import 'package:save_me/app/styles/app_text_styles.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;
      context.goNamed(RouterNames.onBoarding);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const Spacer(),
            // App Title
            Text(
              "SaveMe",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w800,
                fontSize: AppTextStyles(context).title,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 16),

            // Updated tagline for new concept
            Text(
              'Real-time danger map with instant community alerts',
              style: TextStyle(
                fontSize: AppTextStyles(context).body,
                color: Colors.white70,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),

            const Spacer(),

            Text(
              '© ${DateTime.now().year} Ceynext. All rights reserved.',
              style: TextStyle(
                fontSize: AppTextStyles(context).body,
                color: Colors.white60,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
