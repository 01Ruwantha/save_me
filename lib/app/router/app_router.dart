import 'package:go_router/go_router.dart';
import 'package:save_me/app/router/router_names.dart';
import 'package:save_me/core/widgets/custom_bottom_nav_scaffold.dart';
import 'package:save_me/features/alert/alert_page.dart';
import 'package:save_me/features/auth/sign_in_page.dart';
import 'package:save_me/features/auth/sign_up_page.dart';
import 'package:save_me/features/map/map_page.dart';
import 'package:save_me/features/onboarding/onboarding.dart';
import 'package:save_me/features/splash/splash_screen_page.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: RouterNames.splash,
      builder: (context, state) => SplashScreenPage(),
    ),
    GoRoute(
      path: "/on_boarding",
      name: RouterNames.onBoarding,
      builder: (context, state) => Onboarding(),
    ),
    GoRoute(
      path: "/sign_in",
      name: RouterNames.signIn,
      builder: (context, state) => SignInPage(),
    ),
    GoRoute(
      path: "/sign_up",
      name: RouterNames.signUp,
      builder: (context, state) => SignUpPage(),
    ),
    GoRoute(
      name: RouterNames.navigation,
      path: '/navigation',
      builder: (context, state) => CustomBottomNavScaffold(),
    ),

    GoRoute(
      name: RouterNames.map,
      path: '/map',
      builder: (context, state) => MapPage(),
    ),
    GoRoute(
      name: RouterNames.alert,
      path: '/alert',
      builder: (context, state) => AlertPage(),
    ),
  ],
);
