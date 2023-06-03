import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/bottom_navigation/di/bottom_navigation_factory.dart';
import '../features/home/home_view_controller.dart';
import '../features/movie_details/details_view_controller.dart';
import '../features/movie_details/di/details_factory.dart';
import '../features/search/di/search_factory.dart';
import '../features/search/search_view_controller.dart';

class MobileRouter {
  static final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> _sectionANavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: HomeViewController.route,
    routes: <RouteBase>[
      StatefulShellRoute.indexedStack(
        builder: (BuildContext context, GoRouterState state, StatefulNavigationShell navigationShell) {
          return BottomNavigationFactory.bottomNavigation(navigationShell);
        },
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            navigatorKey: _sectionANavigatorKey,
            routes: <RouteBase>[
              GoRoute(
                parentNavigatorKey: _sectionANavigatorKey,
                name: HomeViewController.route,
                path: HomeViewController.route,
                builder: (BuildContext context, GoRouterState state) => const HomeViewController(),
                routes: <RouteBase>[
                  GoRoute(
                    parentNavigatorKey: _sectionANavigatorKey,
                    name: DetailsViewController.route,
                    path: DetailsViewController.routePath,
                    builder: (BuildContext context, GoRouterState state) {
                      final id = state.extra as int;
                      return MovieDetailsFactory.details(id);
                    },
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                name: SearchViewController.route,
                path: SearchViewController.route,
                builder: (BuildContext context, GoRouterState state) => SearchFactory.search(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
