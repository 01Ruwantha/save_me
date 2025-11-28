import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:save_me/app/router/router_names.dart';
import 'package:save_me/features/onboarding/shared/on_board_skip_widget.dart';
import 'package:save_me/features/onboarding/shared/on_boarding_dot_navigation_widget';
import 'package:save_me/features/onboarding/shared/on_boarding_next_button_widget.dart';
import 'package:save_me/features/onboarding/shared/on_boarding_page_widget.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _controller = PageController();
  final int _lastPageIndex = 2;
  bool _hasNavigated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (_hasNavigated) return true;

          if (scrollNotification is OverscrollNotification) {
            // Only detect forward overscroll on last page
            if (_controller.page == _lastPageIndex &&
                scrollNotification.overscroll > 0) {
              _hasNavigated = true;
              context.pushReplacementNamed(RouterNames.signIn);
            }
          }

          return true;
        },
        child: Stack(
          children: [
            PageView(
              controller: _controller,
              children: const [
                OnBoardingPageWidget(
                  image: 'assets/animations/Bedroom.json',
                  title: "Find Your Ideal Rental",
                  subTitle:
                      "Browse thousands of verified rental properties across Sri Lanka. From cozy rooms in Colombo to spacious villas in Kandy, your next home is just a tap away.",
                ),
                OnBoardingPageWidget(
                  image: 'assets/animations/GPS_navigation.json',
                  title: "Explore on a Map",
                  subTitle:
                      "Use our interactive map to find rentals in your preferred neighborhoods. See exactly where your next home is located and what's around it.",
                ),
                OnBoardingPageWidget(
                  image: 'assets/animations/Online_chat.json',
                  title: "Chat with Ease",
                  subTitle:
                      "Have a question? Message landlords and agents directly through the app. Schedule viewings and get your answers instantly, all in one place.",
                ),
              ],
            ),

            /// Skip Button
            OnBoardSkipWidget(),

            /// Page Indicator
            OnBoardingDotNavigationWidget(controller: _controller),

            /// Circular Next Button
            OnBoardingNextButtonWidget(controller: _controller),
          ],
        ),
      ),
    );
  }
}
