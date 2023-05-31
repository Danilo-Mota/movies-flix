import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/bottom_navigation/di/bottom_navigation_factory.dart';
import '../features/home/di/home_factory.dart';
import '../features/movie_details/di/details_factory.dart';
import '../features/search/di/search_factory.dart';

class MobileRouter {
  static final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
  static final GlobalKey<NavigatorState> _sectionANavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'sectionANav');

  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/a',
    routes: <RouteBase>[
      StatefulShellRoute.indexedStack(
        builder: (BuildContext context, GoRouterState state, StatefulNavigationShell navigationShell) {
          return BottomNavigationFactory.bottomNavigation(navigationShell);
        },
        branches: <StatefulShellBranch>[
          // The route branch for the first tab of the bottom navigation bar.
          StatefulShellBranch(
            navigatorKey: _sectionANavigatorKey,
            routes: <RouteBase>[
              GoRoute(
                // The screen to display as the root in the first tab of the
                // bottom navigation bar.
                path: '/a',
                builder: (BuildContext context, GoRouterState state) => HomeFactory.home(),
                routes: <RouteBase>[
                  
                  // The details screen to display stacked on navigator of the
                  // first tab. This will cover screen A but not the application
                  // shell (bottom navigation bar).
                  GoRoute(
                      path: 'details',
                      builder: (BuildContext context, GoRouterState state) {
                        final id = state.extra as int;
                        return MovieDetailsFactory.details(id);
                      }),
                ],
              ),
            ],
          ),

          // The route branch for the second tab of the bottom navigation bar.
          StatefulShellBranch(
            // It's not necessary to provide a navigatorKey if it isn't also
            // needed elsewhere. If not provided, a default key will be used.
            routes: <RouteBase>[
              GoRoute(
                // The screen to display as the root in the second tab of the
                // bottom navigation bar.
                path: '/b',
                builder: (BuildContext context, GoRouterState state) => SearchFactory.search(),
                routes: <RouteBase>[],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
