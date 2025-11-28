import 'package:go_router/go_router.dart';
import 'package:save_me/app/router/router_names.dart';
import 'package:save_me/core/widgets/custom_bottom_nav_scaffold.dart';
import 'package:save_me/features/alert/alert_page.dart';
import 'package:save_me/features/map/map_page.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: RouterNames.navigation,
      path: '/',
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
